Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9776D65B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF28851;
	Wed,  2 Aug 2023 20:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF28851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999306;
	bh=IdYjNgK/7UyowL2xFaOKmaMAHMO46QKM081Tp6/Vvsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SDEAb9OFx+BC+IXnQMwDsy6IbZgUxOiN7Hr4zolz9IPwBzYqvujxNK/2EG6//4qDU
	 oKv1tqGTmv0NmPGOezyuOpac4k1X5FlzQrjiCiUP5G0Pu1MyLX0lpJR2EWHfSMiQOl
	 ZGIbNivZj9zoaCDy22TFjjWvRSHjo/ocUd0fWNgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D7A6F805F0; Wed,  2 Aug 2023 19:58:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2385F805E0;
	Wed,  2 Aug 2023 19:58:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31EE5F805AE; Wed,  2 Aug 2023 19:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 116F9F805A9
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 116F9F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dJ5Gi04e
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3175f17a7baso84821f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999098; x=1691603898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc2UgdWbHJ5viusggKKpR6m1qOzlwVd02m2G5RcJAR0=;
        b=dJ5Gi04eppj2dUkhfPz8D8RqWdOOT5hoWQ5OY2vAj+BLvpM77cvkoY5AMjs1eRUxYN
         55GNINLHC25EzlSTILqK/pu2F2bjK7sc1Hakw3uwzR5d3xO0MBPcEODAikE20D9AEPZb
         B0njqovpopmV0Sqas/6H4RC/M5r53gD+VCF5JKy+cMwc1xp4tIBoJWyZYM5gzd8iE/pL
         PoClu/bk7kVPEBhR4OXvEDLzQ44bsnTqBv1UnwiAHfzh70NnXlRWL4gbmUrq20E2EN99
         lu5XqsaB9QhfATElsum0yZhC/h7jSyBx4eW3/xieQPtWlTSwHjbitwz48CYmG3lHV6b+
         5VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999098; x=1691603898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc2UgdWbHJ5viusggKKpR6m1qOzlwVd02m2G5RcJAR0=;
        b=VeWAsXI7cUf+TQrag+99gBCW1W742rlNqLHSMJBJS3LD/n7ONXMqOECeamQMVda8bz
         HwLCNvHQXriV3ODPOTIsYE9ES9TTZOD3pqySOAwkI540G9Fjfn38DzsWBST53N422LbF
         3VuW68BMG87J4Cygt7Zd16azRQIQM3QxodCALRoffJ7Z8+zFCMjzJ2usqMogX8N+AP2d
         l86h6KMJySeRretdA2OUh4V3qvnknlkTrxKuedLToe00epSHTJ9VMe6stfvscJeX4892
         YG7TynufHlkH3ayL/gtc2LMfxiBHEWAwwv6OACoDe2Az4fFv1yRzdU2Qab+weqHuGGnJ
         tweg==
X-Gm-Message-State: ABy/qLY5LzE/VP1ll0SadUH3Niiyd8Kfyah+UG5oK9l36qGmGQitjgnl
	JZzS334j29852WNWdxcaENeRzqPxASM=
X-Google-Smtp-Source: 
 APBJJlHAdL8nWYIDgUatLGt39dyqvop2OVrN7cratpwvF9SdHkc4NtoZ/M6UlWguYo9yfvrFKJTZGA==
X-Received: by 2002:a05:6000:1004:b0:317:5948:1fe0 with SMTP id
 a4-20020a056000100400b0031759481fe0mr5039599wrx.45.1690999098210;
        Wed, 02 Aug 2023 10:58:18 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:17 -0700 (PDT)
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
Subject: [PATCH 12/27] ASoC: mediatek: mt8173-max98090: Configure jack as a
 Headset jack
Date: Wed,  2 Aug 2023 20:57:22 +0300
Message-Id: <20230802175737.263412-13-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7QA7ER6W57K5DPBEGDMW3SQMZC6R2HC
X-Message-ID-Hash: U7QA7ER6W57K5DPBEGDMW3SQMZC6R2HC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7QA7ER6W57K5DPBEGDMW3SQMZC6R2HC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver has correctly mapped jack kcontrols for Headphone and
Headset Mic. However, it is configuring the jack to only care about
Headphone events. The MAX98090 codec used here can detect both
connections, so configure the jack as such.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
It also appears to support SND_JACK_BTN_0. Not sure if that should be
part of this patch.

 sound/soc/mediatek/mt8173/mt8173-max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index c2b0619b6158..bfb2094758ff 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -70,7 +70,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 
 	/* enable jack detection */
-	ret = snd_soc_card_jack_new_pins(card, "Headphone", SND_JACK_HEADPHONE,
+	ret = snd_soc_card_jack_new_pins(card, "Headphone", SND_JACK_HEADSET,
 					 &mt8173_max98090_jack,
 					 mt8173_max98090_jack_pins,
 					 ARRAY_SIZE(mt8173_max98090_jack_pins));
-- 
2.40.1

