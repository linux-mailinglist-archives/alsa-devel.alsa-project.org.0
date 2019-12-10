Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE2118B08
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:36:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDAAE16C6;
	Tue, 10 Dec 2019 15:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDAAE16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988612;
	bh=Xa237+L5lHBcZazu9OPeAuSniAGpDpcdTnBUG9nheDc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mE94gTaJqIZmGpzJ6TOaz9Y7QITUSQ4sAreuzgqkcIPalKLpxDIPUxhLsFimcEx+O
	 ucjLchZ6tAr8fMsI2CWQU0ezNSBlQ6N7lXLSkQTgnWqbAUREdYxYs9RCiDirsUF0Bz
	 8ynVACDBFgs9U6ak2JCyTwbcO+3ea37OIDM2bEEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0FF7F802FE;
	Tue, 10 Dec 2019 15:27:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A91F8029A; Tue, 10 Dec 2019 15:26:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF509F8025E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF509F8025E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 771FFB209;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:06 +0100
Message-Id: <20191210142614.19405-16-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Michal Simek <michal.simek@xilinx.com>
Subject: [alsa-devel] [PATCH for-5.6 15/23] ASoC: xilinx: Use managed buffer
	allocation
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

Clean up the driver with the new managed buffer allocation API.
The hw_free callback became superfluous and got dropped.

Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 296c4caf96a0..f6e30090bdb0 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -426,7 +426,6 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 {
 	u32 low, high, active_ch, val, bytes_per_ch, bits_per_sample;
 	u32 aes_reg1_val, aes_reg2_val;
-	int status;
 	u64 size;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xlnx_pcm_stream_param *stream_data = runtime->private_data;
@@ -450,9 +449,6 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	}
 
 	size = params_buffer_bytes(params);
-	status = snd_pcm_lib_malloc_pages(substream, size);
-	if (status < 0)
-		return status;
 
 	stream_data->buffer_size = size;
 
@@ -495,12 +491,6 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int xlnx_formatter_pcm_hw_free(struct snd_soc_component *component,
-				      struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int xlnx_formatter_pcm_trigger(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream,
 				      int cmd)
@@ -532,7 +522,7 @@ static int xlnx_formatter_pcm_trigger(struct snd_soc_component *component,
 static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *rtd)
 {
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
+	snd_pcm_set_managed_buffer_all(rtd->pcm,
 			SNDRV_DMA_TYPE_DEV, component->dev,
 			xlnx_pcm_hardware.buffer_bytes_max,
 			xlnx_pcm_hardware.buffer_bytes_max);
@@ -545,7 +535,6 @@ static const struct snd_soc_component_driver xlnx_asoc_component = {
 	.close		= xlnx_formatter_pcm_close,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= xlnx_formatter_pcm_hw_params,
-	.hw_free	= xlnx_formatter_pcm_hw_free,
 	.trigger	= xlnx_formatter_pcm_trigger,
 	.pointer	= xlnx_formatter_pcm_pointer,
 	.pcm_construct	= xlnx_formatter_pcm_new,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
