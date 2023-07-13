Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58153752669
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 17:15:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73363A4A;
	Thu, 13 Jul 2023 17:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73363A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689261334;
	bh=V7SDpIwueeOJXXRkfTlB8mqziBQA4THD2G6R8bWOVeM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JgwOvJwrGrDv00saA1EFcuDqgxkjPI3q5Of90JuBlSfVkMxGOwm+XV8JPeWbT+Cfo
	 R7LIHPPh3fXZmmVHmDD+imvl2HDkweHI3oYjasTc53gw3DnbQ5/ZdyRaMiTgJLWFY+
	 bQOVysEAKKEWfrnyi4eIlf39/hhWGsFPFHJ/9ylA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58401F80535; Thu, 13 Jul 2023 17:14:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4859F80236;
	Thu, 13 Jul 2023 17:14:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D1F3F80249; Thu, 13 Jul 2023 11:53:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74C1DF80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 11:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C1DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=streamunlimited.com header.i=@streamunlimited.com
 header.a=rsa-sha256 header.s=google header.b=xyHCc+a/
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so676552f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1689241998; x=1691833998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPqBHwbjNM+xoM+NHlMenvzhZG8Km0jadyqZX+XYIaI=;
        b=xyHCc+a/9Ay9QUMg/ti18Teyz1YDlkma1brdD/5tCneK+zBr7RWvV9iYJvA3kIo729
         cRFl0g3AxqJFmVR6gFcMTIoyPWN46XGmSyJ2loXuywmlQHQOm8yQoS5ivn1XDEWVpxwq
         nYsBPgLRiSaA1sapaVk9T5BQDmKkAtiuEmVrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689241998; x=1691833998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPqBHwbjNM+xoM+NHlMenvzhZG8Km0jadyqZX+XYIaI=;
        b=i9MfObLWS7/ZjwtHKJhkItuJV+Ps+u3vSGNUzW7pkIHi8tkIGSqCrtrIAJVsXFLVqQ
         1Z98dD5U1qSBcQFSC2iGGNfTgo94OnSlBSPnqUeOwcSIfi9OwVnOJPeNt/16kobNmInO
         ZePxFXEa7VYy129ch2p4BLSp50HVn3wJx/218y70P8TTeHiIWqe+DCB7xQwvOnn8TOHy
         cfG4AU3C7Zpz0+l6owJRhKemsQj3CLy83kSeCXzXtd6Ao2iL6kVo4924FSm+TCpoE/Uw
         qXKAlxq+qORTOQ2lb4afj56AbvcPhl1YV0CxHp3rKLH2C4C2jquG61nlfxNDwNhBXcdl
         KYjQ==
X-Gm-Message-State: ABy/qLYsK1lFBfBNI8GOCqGTk35LvYDV+SC0cfqCerONLufjy42DVr7L
	lMW85lI77aABVLI7o0AJHkrBJQ==
X-Google-Smtp-Source: 
 APBJJlHDC754TqcSXUGOL4NL4luC6Yj1LmPPfypP9S0FYc6rjykqiOqSBSAptcJzNQ9PfyZ31y8Yew==
X-Received: by 2002:adf:cd87:0:b0:313:fa0f:3a05 with SMTP id
 q7-20020adfcd87000000b00313fa0f3a05mr1081570wrj.14.1689241998235;
        Thu, 13 Jul 2023 02:53:18 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a5d6a4c000000b00314329f7d8asm7439711wrw.29.2023.07.13.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 02:53:17 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: pierre-louis.bossart@linux.intel.com,
	Peter Suti <peter.suti@streamunlimited.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ASoC: soc-dai: don't call PCM audio ops if the stream is
 not supported
Date: Thu, 13 Jul 2023 11:52:58 +0200
Message-Id: <20230713095258.3393827-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: peter.suti@streamunlimited.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CBCTVRRB4KXKLGIUCTH4Q3W4UVHLRUAT
X-Message-ID-Hash: CBCTVRRB4KXKLGIUCTH4Q3W4UVHLRUAT
X-Mailman-Approved-At: Thu, 13 Jul 2023 15:14:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBCTVRRB4KXKLGIUCTH4Q3W4UVHLRUAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PCM audio ops may be called when the stream is not supported.
We should not call the ops in that case to avoid unexpected behavior.

hw_params is handled already in soc-pcm.c

[0] https://lore.kernel.org/alsa-devel/ae06b00a-f3f7-f9d1-0b58-4d71f3394416@linux.intel.com/T/#t

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
Tested on 6.1 Compile tested on next/master
 sound/soc/soc-dai.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 02dd64dea179..73a97ac6ccb8 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -424,6 +424,9 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 {
 	int ret = 0;
 
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return 0;
+
 	if (dai->driver->ops &&
 	    dai->driver->ops->startup)
 		ret = dai->driver->ops->startup(substream, dai);
@@ -439,6 +442,9 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream,
 			  int rollback)
 {
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return;
+
 	if (rollback && !soc_dai_mark_match(dai, substream, startup))
 		return;
 
@@ -603,6 +609,8 @@ int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 	int i, ret;
 
 	for_each_rtd_dais(rtd, i, dai) {
+		if (!snd_soc_dai_stream_valid(dai, substream->stream))
+			continue;
 		if (dai->driver->ops &&
 		    dai->driver->ops->prepare) {
 			ret = dai->driver->ops->prepare(substream, dai);
@@ -619,6 +627,9 @@ static int soc_dai_trigger(struct snd_soc_dai *dai,
 {
 	int ret = 0;
 
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return 0;
+
 	if (dai->driver->ops &&
 	    dai->driver->ops->trigger)
 		ret = dai->driver->ops->trigger(substream, cmd, dai);
-- 
2.34.1

