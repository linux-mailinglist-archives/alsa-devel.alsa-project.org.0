Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40F76D65C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B2393A;
	Wed,  2 Aug 2023 20:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B2393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999325;
	bh=3APuaTCqjWAXUKvZWS9wSNgIOQvv/nDplfVsUZLzDQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIT5+pWO7/lPTfq2mH+7ak1DeYwmqe0DESQoK1d2g1TwbA4TwxRBTQY8D6FkO+xXT
	 nc/fGGuipziDDhbwJqxN7ZFFmSG7uHideGCr2aRhDMPhLhpV9LeK1AwGoRazJA/DLH
	 g6p6E6I5mNlcCXY60J3SpUlBJej/DVymP3ZTMsiY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3598CF805FE; Wed,  2 Aug 2023 19:58:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 813C8F805F5;
	Wed,  2 Aug 2023 19:58:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63357F805B4; Wed,  2 Aug 2023 19:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFC1CF805A1
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC1CF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=pQwSTdpi
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe2fb9b4d7so1392035e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999100; x=1691603900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDgex51QiOVczO4DJKkVoIxdj5w2CMw4f9nt7sgUgwU=;
        b=pQwSTdpiBct1ZkFKH+H1jKQOM71C568ZgrH2pqMuH26wTckRnDL3N40AhORENumltE
         zjwoFb1I1dDovAIy1cjl2Dr+ZFGic9XThduhC22I5MFk2XPlqivwWueGL+cCxM+AzFzy
         Vyx1Ymj/T07BBpAX/+KRco3eqLZDfqtRdt4+ZSm9x0ZK/TddmAFKO9q+X12HDOx/t+K6
         zAfhEJSzxqiynoCTVut8YPG/RVeB+upM18gUrWRunggDmtgcCHaw/vLyPclub5WyBd/e
         /T87a3L1YZ13oFytIh/urX2wIxLKRfTXzSuUpXb1yOILqJLYo9nBC++vfZxKCiQy9DC8
         Bm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999100; x=1691603900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDgex51QiOVczO4DJKkVoIxdj5w2CMw4f9nt7sgUgwU=;
        b=f/QdPjGEuBB+lOfbxSY3bLWm8LJAzmKBuwIj4Mi7ay9UJi20IJudFvq1yr+DDEktF9
         2B/uoK11Kk/lvyps7V0vMeix/SLN0mRR0NTkxzRcoZwnc2HLbgoYafWHsHfrjygfc+fk
         N4nuseCjMjoR5A6SrYKXglttWzppH1nl0EjLbCTxfQZ+wiPfVeIRUg3aCGUeI5YKJWAL
         R5WLYaWk+rQMc0s1DD7+DX8lvgFKXsergkrdCdvOkysEziOQnYJ1GOvoANiG6RcEuGLE
         sUxY0sWgoYHteLWMxQEZ7Qch7R1DMwGVnxc4PcB6NtP1ppI2Go+dB/BflSZNQubnnU4t
         h+EA==
X-Gm-Message-State: ABy/qLZ3z3NJQnlbjBEHe+CBsUao2jDfrkAKD0I9FzawoACYwWFtMmlc
	uXvxY4EhSJsz6TwP0i6qztfBgGPXFRI=
X-Google-Smtp-Source: 
 APBJJlH91r28l0IKr1hxqWGkEgaBxzgQ1myfYz6eME/NQQKzR9WlFFb9j5LckCL2VDUqkyoCxi0jpg==
X-Received: by 2002:a05:600c:cf:b0:3fe:1f2c:df2b with SMTP id
 u15-20020a05600c00cf00b003fe1f2cdf2bmr5488486wmm.11.1690999100142;
        Wed, 02 Aug 2023 10:58:20 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:19 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 13/27] ASoC: mediatek: mt8173-rt5650-rt5514: Map missing jack
 kcontrols
Date: Wed,  2 Aug 2023 20:57:23 +0300
Message-Id: <20230802175737.263412-14-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JYLPVYCCCKGRWQVG637FTVGI4SFDSA3Z
X-Message-ID-Hash: JYLPVYCCCKGRWQVG637FTVGI4SFDSA3Z
X-MailFrom: alpernebiyasak@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYLPVYCCCKGRWQVG637FTVGI4SFDSA3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5645 codec used
here can detect Headphone and Headset Mic connections. Expose each to
userspace as kcontrols.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index f803f121659d..e502cd1670ba 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -40,6 +40,17 @@ static const struct snd_kcontrol_new mt8173_rt5650_rt5514_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
+static struct snd_soc_jack_pin mt8173_rt5650_rt5514_jack_pins[] = {
+	{
+		.pin	= "Headphone",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
 static int mt8173_rt5650_rt5514_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
@@ -82,11 +93,13 @@ static int mt8173_rt5650_rt5514_init(struct snd_soc_pcm_runtime *runtime)
 				RT5645_CLK_SEL_I2S1_ASRC);
 
 	/* enable jack detection */
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &mt8173_rt5650_rt5514_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &mt8173_rt5650_rt5514_jack,
+					 mt8173_rt5650_rt5514_jack_pins,
+					 ARRAY_SIZE(mt8173_rt5650_rt5514_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "Can't new Headset Jack %d\n", ret);
 		return ret;
-- 
2.40.1

