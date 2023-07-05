Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65555749702
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 10:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6232950;
	Thu,  6 Jul 2023 10:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6232950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688630581;
	bh=qStIk3J6Z6wihOqFl8DSJNUL/Kuc/TFIBxAkI8a+/Tw=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fgY+HPPTNgFYXTJd6wLDQpB1UtxYHFuiMvlEehsQGzKXcetaK03hO4iv97iYNbIWJ
	 x5hhwHS41ZiPc0E04yS8IikGmDOlMAGu4mrqC/bXMwN/fku5uM3X+d75xJvv0n7w5v
	 8H5ZLkdHhMbqWAe2dhq3gqh3DT1ctP64Wy8PQODQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA5BF80580; Thu,  6 Jul 2023 10:01:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A9EF80579;
	Thu,  6 Jul 2023 10:01:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A9D8F80125; Wed,  5 Jul 2023 21:03:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A4B7DF80124
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B7DF80124
Received: from p200300ccff0adc001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:dc00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mh-0017Xc-MG; Wed, 05 Jul 2023 21:03:27 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1qH7mh-001UQf-09;
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
Subject: [PATCH 0/3] ARM: omap4: embt2ws: Add audio support
Date: Wed,  5 Jul 2023 21:03:21 +0200
Message-Id: <20230705190324.355282-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ILJNHRF3QBOAUWMAVLGZMITF52D5IPUF
X-Message-ID-Hash: ILJNHRF3QBOAUWMAVLGZMITF52D5IPUF
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:00:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILJNHRF3QBOAUWMAVLGZMITF52D5IPUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add audio support for Epson Moverio BT-200.
In the vendor kernel, the MCBSP side is used as master,
so do it here also that way.

Andreas Kemnade (3):
  ASoC: ti: omap-mcbsp: Ignore errors for getting fck_src
  ASoC: tlv320aic3x: use BCLK instead of MCLK if not in master mode
  ARM: dts: omap4: embt2ws: Add audio support

 arch/arm/boot/dts/omap4-epson-embt2ws.dts | 21 +++++++++++++++++++++
 sound/soc/codecs/tlv320aic3x.c            |  4 ++++
 sound/soc/ti/omap-mcbsp.c                 |  4 ++--
 3 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.39.2

