Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223428CC4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 23:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B72E1672;
	Thu, 23 May 2019 23:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B72E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558648730;
	bh=PgeHk9R/VQCz+ue5PaCp32ToRRCv8GxmGRDIleGACFk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oPtiGq9Y3x5k/kKECDKrVLVHXJTty5LNgjmoJf4ff9krxZnrYicA2bE6zxaYGybd0
	 Y0gPtrlBky9XIQdsQWi+TobIRUALOjfsvNvISizD42UHXtt9lzxP0Hoa7uDousFGQ1
	 Mb06Z4TYcJSHD3PasfNeg54ZL6GMPsEW3I3lmQ4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC991F89707;
	Thu, 23 May 2019 23:57:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7409F89674; Thu, 23 May 2019 23:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from com-out001.mailprotect.be (com-out001.mailprotect.be
 [83.217.72.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3313BF80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 23:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3313BF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailprotect.be header.i=@mailprotect.be
 header.b="BVs1lHTM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mailprotect.be; s=mail; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
 To:From:Date:reply-to:sender:bcc:in-reply-to:references:
 content-transfer-encoding; bh=WUBuMYlZvJbfHo1peBRkg/1dq3WKAHQOLhJtpksaT2k=;
 b=BVs1lHTMtoV0JDleWo6pjvZ6mse2MGjMwKTHqxTtzfP9zUTn44PxN0TlVVdWapFyXn9oOrKhs/
 M3WDwW4XNHBJRD/YFTkvRK9ZKg8nFD4HVFNG5jbAohV+4uoTVXyI+vxuf/P3cfqtpiKswAI44rxCa
 ydmEJQpsMCmtlbZv1+tqkYnZDRSBZsWvHSRYQtiEXp/njngzxMnLMKcX2dDcYOo6Qbl4CL4CVlJcS
 QowGlPcqebjpj3j62/uZLkudM5TbMbuaaVUD9rFw+Y4plCQYl0Vkey/bHrQuRwuToaVFy3rMXUNXX
 3MGCq241s2x5MHT0pYgfRzU3gEMDxbBmklDGg==;
Received: from smtp-auth.mailprotect.be ([178.208.39.159])
 by com-mpt-out001.mailprotect.be with esmtp (Exim 4.89)
 (envelope-from <Philippe.Bekaert@panokkel.be>)
 id 1hTvhr-0007wF-B5; Thu, 23 May 2019 23:56:59 +0200
Received: from bladje (93.178-242-81.adsl-dyn.isp.belgacom.be [81.242.178.93])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id 70FAAC0906;
 Thu, 23 May 2019 23:56:57 +0200 (CEST)
Date: Thu, 23 May 2019 23:56:49 +0200
From: Philippe Bekaert <Philippe.Bekaert@panokkel.be>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <20190523215649.GA17263@bladje>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: 178.208.39.159
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be;
 auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fbJ1LThpDP3PaEa+mzHFASpSDasLI4SayDByyq9LIhVmxCtIfeMXibC
 bSafnqlkCUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KA3cw1J65cwSoj5qE1x3r4xzv
 L33JtnMaEpy1xmt900a3kFTdy1wofKhXQ1giRMNpJYhNqyKjbQ4XYAlF2zJAfQQZRID8aOKct6/N
 oJtZgsQJDY9Bax7c7PKoO/2KWyLWUN1nTFFTDDnFCQH55QMpc8dYZbE1DJ9AC6ZiLNlmSIra6yqy
 QF+H2As0G8RVWSCOoCQuOnjq5iQvkChmvr96D2h8CdnhEq1KdCMP4Eidx6jLketND/XkN76HbqTd
 +jK5MxkGUtOvHtxGE4DQAY2ZA/E8zxeHhutaPnMRWa1CF6MH1yaLDF+WUEpWElZQg7tpt2OUyP6g
 GINP2fvhTm5wEckssaSpIShFjz8azm/4UTlIAau/K2WeCJARDuRzNwid88XcZRX4p0EGqucJfyPQ
 aLwqyT5p50x81ZKcmzCu2U0wkt0J02fapU4DprHxOwRNc/DXtHJOj+IrynVpkScfoEGM52tE1D8a
 eBT0LLElh4+0dSKMlXKQF8X1HlycPD0imcsYv2hW6E1AGgNPXZJT/2iH1Wgh6RAenBR+licROGbl
 0BBajNb3HDsz3DxbD8HyvFHFZOoY0cUJgw4+hP7g/v1OT+kMNy4DhJTuMXPpBUffPTlYRiM+FzSD
 6NZPzoLGNMLu4bINCik6deJUoYZbSPy5C1unoq8kI8FTrRsLdkCLBDMrD7q/cJogwbqzsuokhum/
 34LZRw5F9fGfTdejMmBAZK4YQkhN5foaj4VYDiQnZu0RVqSYz4lIPSRY0sspcNfB4FNkCBHgXKAu
 7iG6j2bjO41FyBEqIaDudcVplPHMwhDsc/9AXjpfUbb6UEDSAGPBhs7xLkP1G24p6EtomvXFhuU/
 olLi4jxJAqT+J3oZqJNdbvPaUyoCdu6Y7CHSXZ0gOk0kTJlBXU4P7nJ7zaNBO1Dlrhp9p3v4KCqf
 UjSGpS+C6BPAIEs8PiiVo3EbkXDXfbYmi72x8iurzT+xSy0YornjwvS2lqn0kn7w5TAlczef3Vu2
 3jabSUkzo92J
X-Report-Abuse-To: spam@com-mpt-mgt001.mailprotect.be
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] Fix single speed ADAT capture and playback
	with RME HDSPe AIO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

By taking into account the mapping from logical to DMA channels when
enabling or disabling audio channels, ADAT channels 3 to 8 on the RME
HDSPe AIO card are now correctly captured and played back in single speed
mode.

Since the mapping is an identity mapping for all cards except AIO and
RayDAT, only those cards should be affected by this patch. It was tested on
an AIO card. The patch needs testing on other cards, in particular RayDAT.

Note: this patch does not solve ADAT capture and playback issues in double
or triple speed mode. That seems to be another problem.

Signed-off-by: Philippe Bekaert <Philippe.Bekaert@panokkel.be>
---
 sound/pci/rme9652/hdspm.c | 61 +++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 1209cf0b05e0..982b297b3d0a 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -23,6 +23,9 @@
  *
  *	Modified 2011-01-25 variable period sizes on RayDAT/AIO by Adrian Knoth
  *
+ *      Modified 2019-05-23 fix AIO single speed ADAT capture and playback
+ *      by Philippe.Bekaert@uhasselt.be
+ *
  *   This program is free software; you can redistribute it and/or modify
  *   it under the terms of the GNU General Public License as published by
  *   the Free Software Foundation; either version 2 of the License, or
@@ -1105,9 +1108,9 @@ static int hdspm_autosync_ref(struct hdspm *hdspm);
 static int hdspm_set_toggle_setting(struct hdspm *hdspm, u32 regmask, int out);
 static int snd_hdspm_set_defaults(struct hdspm *hdspm);
 static int hdspm_system_clock_mode(struct hdspm *hdspm);
-static void hdspm_set_sgbuf(struct hdspm *hdspm,
-			    struct snd_pcm_substream *substream,
-			     unsigned int reg, int channels);
+static void hdspm_set_channel_dma_addr(struct hdspm *hdspm,
+				       struct snd_pcm_substream *substream,
+				       unsigned int reg, int channels);
 
 static int hdspm_aes_sync_check(struct hdspm *hdspm, int idx);
 static int hdspm_wc_sync_check(struct hdspm *hdspm);
@@ -5588,11 +5591,16 @@ static int snd_hdspm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 
-		hdspm_set_sgbuf(hdspm, substream, HDSPM_pageAddressBufferOut,
-				params_channels(params));
+		for (i = 0; i < params_channels(params); ++i) {
+			int c = hdspm->channel_map_out[i];
 
-		for (i = 0; i < params_channels(params); ++i)
-			snd_hdspm_enable_out(hdspm, i, 1);
+			if (c < 0)
+				continue;      /* just make sure */
+			hdspm_set_channel_dma_addr(hdspm, substream,
+						   HDSPM_pageAddressBufferOut,
+						   c);
+			snd_hdspm_enable_out(hdspm, c, 1);
+		}
 
 		hdspm->playback_buffer =
 			(unsigned char *) substream->runtime->dma_area;
@@ -5600,11 +5608,16 @@ static int snd_hdspm_hw_params(struct snd_pcm_substream *substream,
 			"Allocated sample buffer for playback at %p\n",
 				hdspm->playback_buffer);
 	} else {
-		hdspm_set_sgbuf(hdspm, substream, HDSPM_pageAddressBufferIn,
-				params_channels(params));
-
-		for (i = 0; i < params_channels(params); ++i)
-			snd_hdspm_enable_in(hdspm, i, 1);
+		for (i = 0; i < params_channels(params); ++i) {
+			int c = hdspm->channel_map_in[i];
+
+			if (c < 0)
+				continue;
+			hdspm_set_channel_dma_addr(hdspm, substream,
+						   HDSPM_pageAddressBufferIn,
+						   c);
+			snd_hdspm_enable_in(hdspm, c, 1);
+		}
 
 		hdspm->capture_buffer =
 			(unsigned char *) substream->runtime->dma_area;
@@ -5665,19 +5678,17 @@ static int snd_hdspm_hw_free(struct snd_pcm_substream *substream)
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-
-		/* params_channels(params) should be enough,
-		   but to get sure in case of error */
-		for (i = 0; i < hdspm->max_channels_out; ++i)
+		/* Just disable all channels. The saving when disabling a */
+		/* smaller set is not worth the trouble. */
+		for (i = 0; i < HDSPM_MAX_CHANNELS; ++i)
 			snd_hdspm_enable_out(hdspm, i, 0);
 
 		hdspm->playback_buffer = NULL;
 	} else {
-		for (i = 0; i < hdspm->max_channels_in; ++i)
+		for (i = 0; i < HDSPM_MAX_CHANNELS; ++i)
 			snd_hdspm_enable_in(hdspm, i, 0);
 
 		hdspm->capture_buffer = NULL;
-
 	}
 
 	snd_pcm_lib_free_pages(substream);
@@ -6416,17 +6427,17 @@ static int snd_hdspm_preallocate_memory(struct hdspm *hdspm)
 	return 0;
 }
 
-
-static void hdspm_set_sgbuf(struct hdspm *hdspm,
-			    struct snd_pcm_substream *substream,
-			     unsigned int reg, int channels)
+/* Inform the card what DMA addresses to use for the indicated channel. */
+/* Each channel got 16 4K pages allocated for DMA transfers. */
+static void hdspm_set_channel_dma_addr(struct hdspm *hdspm,
+				       struct snd_pcm_substream *substream,
+				       unsigned int reg, int channel)
 {
 	int i;
 
-	/* continuous memory segment */
-	for (i = 0; i < (channels * 16); i++)
+	for (i = channel * 16; i < channel * 16 + 16; i++)
 		hdspm_write(hdspm, reg + 4 * i,
-				snd_pcm_sgbuf_get_addr(substream, 4096 * i));
+			    snd_pcm_sgbuf_get_addr(substream, 4096 * i));
 }
 
 
-- 
2.19.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
