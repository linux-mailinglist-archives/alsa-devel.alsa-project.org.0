Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEC3FF899
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:59:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77102167B;
	Sun, 17 Nov 2019 09:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77102167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573981154;
	bh=7II1uUCPn+Dm/v/hBXAbE6Hu47MHHefXy+RxZ/VzTZ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ebek1w4xViZ6b7q+QqfSD+ATLSz7kfqvH2vZNF1XG5ULmFNxEwYgbaySYQfmAuc91
	 lRnrP6aRi0jY+cIoSflCiyH2UL/5xKw202QFHHPKC0G+igDC0JBqmVDfSvDwNBv+t5
	 +teTJWK99UCe7k7GNwY50UBk73Sa57oqQkz6r5UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA9E8F80160;
	Sun, 17 Nov 2019 09:53:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3486F800E6; Sun, 17 Nov 2019 09:53:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4895BF800E6
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4895BF800E6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EAA65B204
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:03 +0100
Message-Id: <20191117085308.23915-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/8] ALSA: pcm: Allow NULL ioctl ops
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently PCM ioctl ops is a mandatory field but almost all drivers
simply pass snd_pcm_lib_ioctl.  For simplicity, allow to set NULL in
the field and call snd_pcm_lib_ioctl() as default.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f1646735bde6..704ea75199e4 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -178,6 +178,16 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_pcm_stream_unlock_irqrestore);
 
+/* Run PCM ioctl ops */
+static int snd_pcm_ops_ioctl(struct snd_pcm_substream *substream,
+			     unsigned cmd, void *arg)
+{
+	if (substream->ops->ioctl)
+		return substream->ops->ioctl(substream, cmd, arg);
+	else
+		return snd_pcm_lib_ioctl(substream, cmd, arg);
+}
+
 int snd_pcm_info(struct snd_pcm_substream *substream, struct snd_pcm_info *info)
 {
 	struct snd_pcm *pcm = substream->pcm;
@@ -448,8 +458,9 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
 		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 		if (snd_mask_single(m) && snd_interval_single(i)) {
-			err = substream->ops->ioctl(substream,
-					SNDRV_PCM_IOCTL1_FIFO_SIZE, params);
+			err = snd_pcm_ops_ioctl(substream,
+						SNDRV_PCM_IOCTL1_FIFO_SIZE,
+						params);
 			if (err < 0)
 				return err;
 		}
@@ -971,7 +982,7 @@ static int snd_pcm_channel_info(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	memset(info, 0, sizeof(*info));
 	info->channel = channel;
-	return substream->ops->ioctl(substream, SNDRV_PCM_IOCTL1_CHANNEL_INFO, info);
+	return snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_CHANNEL_INFO, info);
 }
 
 static int snd_pcm_channel_info_user(struct snd_pcm_substream *substream,
@@ -1647,7 +1658,7 @@ static int snd_pcm_pre_reset(struct snd_pcm_substream *substream, int state)
 static int snd_pcm_do_reset(struct snd_pcm_substream *substream, int state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int err = substream->ops->ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
+	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	runtime->hw_ptr_base = 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
