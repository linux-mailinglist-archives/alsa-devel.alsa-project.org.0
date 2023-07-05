Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B9749700
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 10:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A321844;
	Thu,  6 Jul 2023 10:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A321844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688630559;
	bh=9DKcSFhX5xU8Z3QE29ISYIZK/HYP0q2desnOoM14v9w=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZHuIWEff7onLhDdljNG/QqSmzx9j/UM3gRUast0j02aNxapv7YRkS1i86aQJ2bghy
	 zULb90rbU5pWjEBxXioc+iF42BEKt2RXNP4v5MQW6/NWqtIYQvFSorTiGdGIi8wRvj
	 jj+DuFdBcZmZClQmiK+rmtU2uIqjkE6MAkGIbLgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54929F80548; Thu,  6 Jul 2023 10:01:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6AEF80548;
	Thu,  6 Jul 2023 10:00:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3C6DF80125; Wed,  5 Jul 2023 21:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A88EF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A88EF80100
Received: from p200300ccff0adc001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:dc00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mi-0017Xs-Te; Wed, 05 Jul 2023 21:03:28 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mi-001UQp-1o;
	Wed, 05 Jul 2023 21:03:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: bcousson@baylibre.com,
	tony@atomide.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	peter.ujfalusi@gmail.com,
	jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com,
	andreas@kemnade.info,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: tlv320aic3x: use BCLK instead of MCLK if not in
 master mode
Date: Wed,  5 Jul 2023 21:03:23 +0200
Message-Id: <20230705190324.355282-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705190324.355282-1-andreas@kemnade.info>
References: <20230705190324.355282-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EPRR36FLVUKF6MSTYXPTXNWJCMSRFYMQ
X-Message-ID-Hash: EPRR36FLVUKF6MSTYXPTXNWJCMSRFYMQ
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:00:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPRR36FLVUKF6MSTYXPTXNWJCMSRFYMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Required to have audio output on Epson Moverio BT-200.
Audio chip there is marked with AC31051. Audio output is silent there
without that clock register set.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 sound/soc/codecs/tlv320aic3x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 56e795a00e22f..87929e210b55e 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1234,6 +1234,10 @@ static int aic3x_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
 
+	/* probably no mclk if not master, so rely on bitclk */
+	if (!aic3x->master)
+		clk_id = 2;
+
 	/* set clock on MCLK or GPIO2 or BCLK */
 	snd_soc_component_update_bits(component, AIC3X_CLKGEN_CTRL_REG, PLLCLK_IN_MASK,
 				clk_id << PLLCLK_IN_SHIFT);
-- 
2.39.2

