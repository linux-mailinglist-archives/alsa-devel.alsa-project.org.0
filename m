Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F07496F9
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 10:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5097E74C;
	Thu,  6 Jul 2023 10:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5097E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688630509;
	bh=RcacutE7xxZJJ2H4X1H5T96DQVDwRWxueVioNssujMg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=f2QrI8b4ZTUDb5S+2U6ArqgdiYzE7T75ZcjKQbqkfZxyJjdxVkGiSfwbHibzYlvRa
	 +bJpcvawrx3C3xAtWQRr7+U6uNUaDD+pJcZSXdbnQBQfAlZiGI4ZXtOXly4c5ZHm3/
	 0GvhVpOCG3Fg4sTqTsKFaVydwkYGeJds0CKKcDt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5646F8053B; Thu,  6 Jul 2023 10:00:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD5BF80124;
	Thu,  6 Jul 2023 10:00:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 716FBF8025F; Wed,  5 Jul 2023 21:03:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D5061F800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5061F800E4
Received: from p200300ccff0adc001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:dc00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mi-0017Xe-Bk; Wed, 05 Jul 2023 21:03:28 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mh-001UQk-36;
	Wed, 05 Jul 2023 21:03:27 +0200
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
Subject: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting fck_src
Date: Wed,  5 Jul 2023 21:03:22 +0200
Message-Id: <20230705190324.355282-2-andreas@kemnade.info>
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
Message-ID-Hash: JK6CVQV674FULFTK23WQSW65TYSD7NL7
X-Message-ID-Hash: JK6CVQV674FULFTK23WQSW65TYSD7NL7
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:00:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JK6CVQV674FULFTK23WQSW65TYSD7NL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp")
dropped prcm_fck for omap4, so the clk_src might not be available making the
clk_get(src) fail. In such cases, rely on the devicetree to assign
the correct parent.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 sound/soc/ti/omap-mcbsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 21fa7b9787997..f9fe96b61852b 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -70,8 +70,8 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 
 	fck_src = clk_get(mcbsp->dev, src);
 	if (IS_ERR(fck_src)) {
-		dev_err(mcbsp->dev, "CLKS: could not clk_get() %s\n", src);
-		return -EINVAL;
+		dev_info(mcbsp->dev, "CLKS: could not clk_get() %s\n", src);
+		return 0;
 	}
 
 	pm_runtime_put_sync(mcbsp->dev);
-- 
2.39.2

