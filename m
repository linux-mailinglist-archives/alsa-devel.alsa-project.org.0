Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A94141E7F
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 15:21:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999FB16B9;
	Sun, 19 Jan 2020 15:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999FB16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579443689;
	bh=/Wj87Wz7SBYwmgrZ57AUuOCGaV2WyeUjrhzaF04KhOc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N5g5r3ixSOJhbn9E28TX0NN4XKwtfQauwhr7CQqlhFJpf6H5WJOYFB1VV+OUxluwz
	 lzYGGcvmzNdGXwWlfTqFhvb2iJCj36z4g92wPR0vXwm7s5G6zXc50UED+5GZ9MdRcP
	 dy410vhuO+JENE3hEFPiqNh0byTO6wAjA6AKvkSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0047FF8013E;
	Sun, 19 Jan 2020 15:19:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E42F801D9; Sun, 19 Jan 2020 15:19:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DECFDF8013E
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 15:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DECFDF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="oEbadlBr"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2465690000>; Sun, 19 Jan 2020 06:19:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 19 Jan 2020 06:19:38 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 19 Jan 2020 06:19:38 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jan
 2020 14:19:35 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sun, 19 Jan 2020 14:19:35 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e2465750003>; Sun, 19 Jan 2020 06:19:35 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Date: Sun, 19 Jan 2020 19:49:23 +0530
Message-ID: <1579443563-12287-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579443563; bh=rFEFNNnjn/oFYBOvROmovtPy+XEjEPcolgI3hKuqxZc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=oEbadlBrApqADc6KOru0g7hQMweDuKGV5p6vnJcQBoYPz7HWZ0KmxehJkZrwcplk3
 lf4eP4FsFzZjikZc1bJDq5SPDF06GHAsHVCh1kH2IMIiLjVv747W8g8dueW9vTHAkz
 OGODQixeG+WcR4rtsNsNQ5oJxJOfOitpM7ztFP/8d/ckBRpeMx3GaBiDepeMWDF0Ev
 UbBBXhwioxobwN01uItg9XBtoftLT3zh6Xzrml33t02VXusaBXlF5BXdtMQrU/z8it
 Ac39PFowcO9ASFphoi5XDJWc+3gwGoSAJymE2AOlDsi8SB5mUAgRiYSny50GplDmQK
 lCvg37/W9FKvw==
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RFC] ASoC: soc-pcm: crash in snd_soc_dapm_new_dai
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

Crash happens in snd_soc_dapm_new_dai() when substream->private_data
access is made and substream is NULL here. This is seen for DAIs where
only playback or capture stream is defined. This seems to be happening
for codec2codec DAI link.

Both playback and capture are 0 during soc_new_pcm(). This is probably
happening because cpu_dai and codec_dai are both validated either for
SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE.

Shouldn't be playback = 1 when,
 - playback stream is available for codec_dai AND
 - capture stream is available for cpu_dai

and vice-versa for capture = 1?

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 74d340d..5aa9c0b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2855,10 +2855,10 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
 				playback = 1;
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
 				capture = 1;
 		}
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
