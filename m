Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAB1A9B70
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 12:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958931666;
	Wed, 15 Apr 2020 12:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958931666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586948019;
	bh=DxkYZ9nz+Ih74whTbkyHi3u5c0U9lp7Qr9ftKdAwbLU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cblJFUpYRz9bSBk3TGBWc+66HLnhoHIuACDu1M9a+oJOn6lzjt9cFOKOJpOCX9Trb
	 tqBAA957CQKZY3Y6PbAaoVDecKRxn/BxUjWKUaBaeCFqoGDEWP4kbFDlEHLfCpibab
	 ChVNTW3x5yL7qv4DMBE7NmO8uVkVLp1StB2hHeyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF5FF80115;
	Wed, 15 Apr 2020 12:51:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF8BF80245; Wed, 15 Apr 2020 12:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83939F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 12:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83939F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Od8AfhV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586947907;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=cVq/7MP0xAmdxa2v69WcJUbaw9HnEQAsVNq/kWIpl5w=;
 b=Od8AfhV1Mly3cVBLojm81lP1/2cOwYj+LsUJl2xA+X8MtTVm+Jm98IX5e9md+fb1ZV
 PsxfaC30X6uPawCPoz3matWyNGxsfRmurnDNScONw3DKDI4RxTiWYi6O3A0PN4/0dCuN
 Ps+lNmJsLi++lDEpfRI9Y7exhAkfvJYuhij8Kp7ifDVfXtkRvdgjPgPmfhA5A+e1QDxU
 IR4E6B0CVO7nkOsmbfEq/070hKxmCjIGTVgdBOLeJgwKY4g9y+KZQTTUrGh4Ra4GdMDn
 sRrZWJ3Io6T2RVo4S+nFHO9NHZGChX2H1t23660kNmhzlhytdTJVCXW2ROLW4STqNbkW
 YtRw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NccuO"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id k074e0w3FApg1NW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 12:51:42 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
Date: Wed, 15 Apr 2020 12:49:28 +0200
Message-Id: <20200415104928.86091-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Stephan Gerhold <stephan@gerhold.net>,
 ~postmarketos/upstreaming@lists.sr.ht
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

At the moment, PCM devices for DPCM are only created based on the
dpcm_playback/capture parameters of the DAI link, without considering
if the CPU/FE DAI is actually capable of playback/capture.

Normally the dpcm_playback/capture parameter should match the
capabilities of the CPU DAI. However, there is no way to set that
parameter from the device tree (e.g. with simple-audio-card or
qcom sound cards). dpcm_playback/capture are always both set to 1.

This causes problems when the CPU DAI does only support playback
or capture. Attemting to open that PCM device with an unsupported
stream type then results in a null pointer dereference:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000128
    Internal error: Oops: 96000044 [#1] PREEMPT SMP
    CPU: 3 PID: 1582 Comm: arecord Not tainted 5.7.0-rc1
    pc : invalidate_paths_ep+0x30/0xe0
    lr : snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
    Call trace:
     invalidate_paths_ep+0x30/0xe0
     snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
     dpcm_path_get+0x38/0xd0
     dpcm_fe_dai_open+0x70/0x920
     snd_pcm_open_substream+0x564/0x840
     snd_pcm_open+0xfc/0x228
     snd_pcm_capture_open+0x4c/0x78
     snd_open+0xac/0x1a8
     ...

... because the DAI playback/capture_widget is not set in that case.

We could add checks there to fix the problem (maybe we should
anyway), but much easier is to not expose the device as
playback/capture in the first place. Attemting to use that
device would always fail later anyway.

Add checks for snd_soc_dai_stream_valid() to the DPCM case
to avoid exposing playback/capture if it is not supported.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
This can be reproduced with q6asm-dai with a device tree
configuration like:

&q6asmdai {
	dai@0 {
		reg = <0>;
		direction = <Q6ASM_DAI_RX>;
	};
};

Then a simple "arecord output.wav" will result in the crash
above, since it attempts to use that FE DAI for capture
(even though it is limited to playback).
---
 sound/soc/soc-pcm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 454735f8fa92..77a680da366f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2911,8 +2911,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	int i;
 
 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
-		playback = rtd->dai_link->dpcm_playback;
-		capture = rtd->dai_link->dpcm_capture;
+		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+		if (rtd->num_cpus > 1) {
+			dev_err(rtd->dev,
+				"DPCM doesn't support Multi CPU yet\n");
+			return -EINVAL;
+		}
+
+		playback = rtd->dai_link->dpcm_playback &&
+			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
+		capture = rtd->dai_link->dpcm_capture &&
+			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);
 	} else {
 		/* Adapt stream for codec2codec links */
 		int cpu_capture = rtd->dai_link->params ?
-- 
2.26.1

