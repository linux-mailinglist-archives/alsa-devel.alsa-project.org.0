Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 331A8118A64
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A9A165F;
	Tue, 10 Dec 2019 15:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A9A165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986774;
	bh=80SSku3GJENAe3dRElQn39MRRELEAWPskitr0kd70sw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjXmIMTKMc8qMT5ye2rE1E+WVZco6GyAS6SNVF9abkFcTeSUGmIE2JSf4ssAkyFq5
	 GA44Wo0rK6lac1fwD/r/Qb3b43GIk7svp8Z+E6T6VINTxiWaI2AIpdyEbum4pZ3QPv
	 GPNVMpwJ9dvDkkaiJnZj0n80CvAxbfH2bcqwT2yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E51F802BD;
	Tue, 10 Dec 2019 14:59:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 685C3F80279; Tue, 10 Dec 2019 14:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3836DF8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3836DF8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29E7AB19C;
 Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:46 +0100
Message-Id: <20191210135849.15607-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [alsa-devel] [PATCH for-5.6 11/14] media: cobalt: Drop superfluous
	ioctl PCM ops
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

snd_cobalt_pcm_ioctl() does nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cobalt/cobalt-alsa-pcm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-alsa-pcm.c b/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
index 77570a1127c9..9e7504e3cfd8 100644
--- a/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
+++ b/drivers/media/pci/cobalt/cobalt-alsa-pcm.c
@@ -237,12 +237,6 @@ static int snd_cobalt_pcm_capture_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_cobalt_pcm_ioctl(struct snd_pcm_substream *substream,
-		     unsigned int cmd, void *arg)
-{
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 static int snd_cobalt_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_cobalt_card *cobsc = snd_pcm_substream_chip(substream);
@@ -450,7 +444,6 @@ snd_pcm_uframes_t snd_cobalt_pcm_pb_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cobalt_pcm_capture_ops = {
 	.open		= snd_cobalt_pcm_capture_open,
 	.close		= snd_cobalt_pcm_capture_close,
-	.ioctl		= snd_cobalt_pcm_ioctl,
 	.prepare	= snd_cobalt_pcm_prepare,
 	.trigger	= snd_cobalt_pcm_trigger,
 	.pointer	= snd_cobalt_pcm_pointer,
@@ -459,7 +452,6 @@ static const struct snd_pcm_ops snd_cobalt_pcm_capture_ops = {
 static const struct snd_pcm_ops snd_cobalt_pcm_playback_ops = {
 	.open		= snd_cobalt_pcm_playback_open,
 	.close		= snd_cobalt_pcm_playback_close,
-	.ioctl		= snd_cobalt_pcm_ioctl,
 	.prepare	= snd_cobalt_pcm_pb_prepare,
 	.trigger	= snd_cobalt_pcm_pb_trigger,
 	.pointer	= snd_cobalt_pcm_pb_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
