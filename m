Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8396DB72
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF89F950;
	Thu,  5 Sep 2024 16:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF89F950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545800;
	bh=x86FNaEpjnIyR5OAZHCSCK5+o+umgxvyBNNfEVUoPH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bosxxgj0ttTN4jiB5CC1kWgp0zsk6t+PJBoEakeahUkvTSJhxBolihOIlYR2NzWOh
	 XKE59BgwMnPn3edkKtaG+rx8MS9zyhLc9SMzx+wx4kBG2LEFXG536sXh+hfcdBn4LX
	 ppzhThWPzxqYkTQFQRAIkP9EuW6beDsZCB+nXfSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBBEEF8070C; Thu,  5 Sep 2024 16:14:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 479BDF80720;
	Thu,  5 Sep 2024 16:14:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6D7CF80609; Thu,  5 Sep 2024 16:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A35F805D6
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A35F805D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ma4dxFqH
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-374bfc395a5so529057f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545621;
 x=1726150421; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sxrac1nWcSLd8cTfx3t0NuLkVpF4P7zBU6WUMa4X7WI=;
        b=Ma4dxFqHIoHhBjAl4quqItOGSFYS3xlYX6SWZDgFqUbaX1zed9b13RsGAbQ70NMplK
         DC/iJD4rOCvkQM3xsU1P3OrRD5A7DL5cvxJ342TfDk3OmE0DcjMBPWS+xuYeEW7rzuF6
         LzUgVscgMGWKP9S8OTidAIGh5EM1xAvmCEk3qx6pziOVWQvc7lyKeU5HYXN7T6m5+nFT
         ftjZq919JDa64bLGOBwj7MpRJDMTUb28FFAosZTUtiec962Kk4VKe6N3tv94vnElyF0E
         6m/GNUo32U6AV86EgUZMXTfJkjNwiEagoOp3ziV9wTvUwxB2aEsCkPztCE1A435JkngP
         kgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545621; x=1726150421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxrac1nWcSLd8cTfx3t0NuLkVpF4P7zBU6WUMa4X7WI=;
        b=b9lbc8DFXcnBDamDI1l6w3PnEFKffITQEb6Nah5ygZ2JhuVJhZ/P1zaOkOHe2ulWdG
         Ujgb7kLYtILcGy8kAca53/MuJxqxw521fnotLFARYiGRyUmiKfHR73NrO8NS0iXaaERp
         wxEOKAYgy+oBth8UV/YU1Szk0EHF7virMbhcLFrpgM5HtUv4gzH3hcSnHSc08pTweOZC
         xax8/j76vOVLnEdzavODMKCVc48kmKveZgRnAi9so+zUBfMGoStCLnde89zos8IerdH5
         aCy1PPC5JcpZW1XZLRjcDbKFMWhCsWRCRZ50BaznZCM+wuvj79rawkdENecLjILAtpVm
         mE2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXszK6zMmmttlDtDnMJzqkH2znyYa1wyAQUQBvOcyiJduOQac7pbWHvi8K1Dsm3dLDg29JNM/csx/ZZ@alsa-project.org
X-Gm-Message-State: AOJu0Yx3XSwIhwdAIKXO05BWamTDX23MvyFO1zlZrcxGN5jNN728rUFJ
	lpUVfQz99seG70lhNyc6yG4g7nA+JEg26turnmMJxCmzH2UYQElfvKKyxyfFQWs=
X-Google-Smtp-Source: 
 AGHT+IH+jM4E6XFtH4yV7dt/MuKKbSnx0kbRDSQ+9W6MalNelsQvYVX6PPe8E18bCCVxO02rcsQe3A==
X-Received: by 2002:adf:e709:0:b0:374:c57e:1ea9 with SMTP id
 ffacd0b85a97d-3779b847aaamr3814838f8f.18.1725545620447;
        Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:59 +0200
Subject: [PATCH 08/13] ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-8-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=x86FNaEpjnIyR5OAZHCSCK5+o+umgxvyBNNfEVUoPH4=;
 b=kA0DAAoB5vwPHDfy2oUByyZiAGbZvISh5e9yuIZ6fhegOdIwe1HpWFPSz5lzuBx/Xh1lYE/Go
 IkCMwQAAQoAHRYhBPThWa4Y8/VtXxu3G+b8Dxw38tqFBQJm2byEAAoJEOb8Dxw38tqFxS8P/Auz
 glLnhOinsM4qpstMYih0MgMyBfS5BkRGvvQv78UV/Mi4Y8Aa/TZLWyjY5DtZ/ifYi+CQ1mTVKlM
 fcvpqaydV1yQs26SZX4WwftbI6yvH2ep63gu1gDMjNg19JM3CN5m+K17jL0N/nz9WJm1MifPHX0
 CNs9yhK3TaHhbDqsTKS1R3GGdjmRhYzEOFOECZI16OAgDUyHSyCrNW9moGzFE90b+luipqUKZYv
 CgEEa8t5PtgYBbB5DBVfQ9eMRMIMSffn7PBsaFLmvekhISH5e9iTm53/pGNBxXez7iYdm0BkOau
 vxSImcNyZd3McfPzz+NcUN4krQat144fofS0bz2ZDjZChOqX/TXst/bxAf9hnPBQM3b4HX9sOeA
 GX3y0BOPb71vdZWkk6q9tslY+DdFju7R1b1+At5rH+AwFH6L1ClGTEQ+hIwr5rLQ9WZMjtMe3Q4
 LbTkhY3khwyp9PYpDApAnR/o+LCtt4LyWOVy2A8cLmtmKHIulIL6Oqw3zqLeAWzKZvlGW+8WGrI
 jgeK+AU37YkFNpFF3YeM20MIXa6aDJ3PywF0zLVWsQ4sfVMUuHsWUNLAfsFSKbDjt7pF7tT6x/m
 qX3KDTzkCWSW6GZbgBS9jXRx00jM91w75beWJJ/mZ4V9YR1pAhuPwwo/oVQiZGMZQkmMR/MaAbj
 NaY1l
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: PQQVCZZZK5QA4FUYRUE35VHKMYXOKYYM
X-Message-ID-Hash: PQQVCZZZK5QA4FUYRUE35VHKMYXOKYYM
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQQVCZZZK5QA4FUYRUE35VHKMYXOKYYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs53l30.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index bcbaf28a0b2d..28f4be37dec1 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -739,24 +739,6 @@ static int cs53l30_set_tristate(struct snd_soc_dai *dai, int tristate)
 				  CS53L30_ASP_3ST_MASK, val);
 }
 
-static unsigned int const cs53l30_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list src_constraints = {
-	.count = ARRAY_SIZE(cs53l30_src_rates),
-	.list = cs53l30_src_rates,
-};
-
-static int cs53l30_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE, &src_constraints);
-
-	return 0;
-}
-
 /*
  * Note: CS53L30 counts the slot number per byte while ASoC counts the slot
  * number per slot_width. So there is a difference between the slots of ASoC
@@ -843,14 +825,14 @@ static int cs53l30_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
-/* SNDRV_PCM_RATE_KNOT -> 12000, 24000 Hz, limit with constraint list */
-#define CS53L30_RATES (SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT)
+#define CS53L30_RATES (SNDRV_PCM_RATE_8000_48000 |	\
+		       SNDRV_PCM_RATE_12000 |		\
+		       SNDRV_PCM_RATE_24000)
 
 #define CS53L30_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
 static const struct snd_soc_dai_ops cs53l30_ops = {
-	.startup = cs53l30_pcm_startup,
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
 	.set_sysclk = cs53l30_set_sysclk,

-- 
2.45.2

