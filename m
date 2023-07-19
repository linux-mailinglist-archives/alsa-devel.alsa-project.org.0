Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1397595EB
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 14:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00B3852;
	Wed, 19 Jul 2023 14:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00B3852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689770984;
	bh=VbGtW8BX8Fyh51DZc7NkTwd1J6fgwswDPGXxDSa1p8Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AzCSXb5KNjjsr5/Yxr+6ll58LdCrKPt3uyYSrdnuUs5FSVC/1EkG8Y7/hWsjGK5X5
	 UeL248TpvOxXonharNkKlO+cKXdNkWhpzcqMg7Bz3e04dcCAANY3s9mAh/owmOGidr
	 becJOjGVGSvgtsxVi7nvJ0rjymgQowr42CB02jgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4431AF8059F; Wed, 19 Jul 2023 14:48:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE261F805A1;
	Wed, 19 Jul 2023 14:48:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C50F8055C; Wed, 19 Jul 2023 14:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08280F8055A
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 14:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08280F8055A
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BE405206BC;
	Wed, 19 Jul 2023 14:47:56 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	CTLIN0@nuvoton.com
Subject: [PATCH v1 0/2] ASoC: dt-bindings: nau8822: minor updates
Date: Wed, 19 Jul 2023 14:47:50 +0200
Message-Id: <20230719124752.248898-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LEUBMSVN3RYLGUYCDFFU2LW6ZKCIE7ER
X-Message-ID-Hash: LEUBMSVN3RYLGUYCDFFU2LW6ZKCIE7ER
X-MailFrom: francesco@dolcini.it
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEUBMSVN3RYLGUYCDFFU2LW6ZKCIE7ER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Minor updates to NAU8822 DT bindings:
 - Add #sound-dai-cells
 - Add MCLK

Francesco Dolcini (2):
  ASoC: dt-bindings: nau8822: Add #sound-dai-cells
  ASoC: dt-bindings: nau8822: Add MCLK clock

 .../devicetree/bindings/sound/nuvoton,nau8822.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.25.1

