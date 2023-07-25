Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CECA760F35
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97EAF1549;
	Tue, 25 Jul 2023 11:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97EAF1549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277489;
	bh=rw36epAe3l/WLQjLsb62uFqz3pzX4hSbPjdVGh0MGf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s+w9E6siW87z7/h9DVIF7ItbGuB9V24yRowOzd9I0yraRA3fi8dQ0KlucPhpJSIqc
	 DDSFO0blpfxu10NqAWMmzUCF6ISK1j2iv0lidglkMby5iLdrGaFGcRTGpR/tdyjLIq
	 WbNACLAm6P2Kc3y4+YpvmdGVM8HrcVVWQLGmTzq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE2DCF80677; Tue, 25 Jul 2023 11:26:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16DC8F80659;
	Tue, 25 Jul 2023 11:26:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FCAEF8055C; Tue, 25 Jul 2023 11:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6C35F8063A
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C35F8063A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ETztwDNV
Received: by mail.gandi.net (Postfix) with ESMTPA id 74C2240017;
	Tue, 25 Jul 2023 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690277157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BA3F2u1SZiCY48MSiDxa+5DDfOyOk5GnyA6qyBP7qGk=;
	b=ETztwDNVNWzC0A8WFTCHSRKyLMdOlQ0HjdCnGGYj5JVoYhka7dJKt3y4I+7DjKOxEyqtWs
	2qz59A6biwr+XMi4BUaGRn/TAUATTeoT9OIjhR5pxeor95w0LeN7DjrW0GwhCewQhHVdJz
	AOzK2r6Wf7fEexNajgEhRQDT8F09tIn8LQPa3NMpFcvqB8nIw7rwgwOWUjNvMJHji0jMR/
	1/M/Nj5acIEO+Gasx98yDdn8y6RymCwdCOw4f8mkT90PZHpmtGvmTf0mNjy7q4Kes9DzAP
	Z7zjSNsbb5ks6GpGE1W48LUhf2cfMXjciVRRDVJvWMTut9eyxClCG5wuXUlAFQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 23/26] MAINTAINERS: Add the Lantiq PEF2256 driver entry
Date: Tue, 25 Jul 2023 11:23:59 +0200
Message-ID: <20230725092417.43706-24-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725092417.43706-1-herve.codina@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: M6QO6HNOG5EKSL6RQCMKRFFU7VLWDLUZ
X-Message-ID-Hash: M6QO6HNOG5EKSL6RQCMKRFFU7VLWDLUZ
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6QO6HNOG5EKSL6RQCMKRFFU7VLWDLUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After contributing the driver, add myself as the maintainer for the
Lantiq PEF2256 driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14041d90f9c8..07a7d9fca3c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11776,6 +11776,15 @@ S:	Maintained
 F:	arch/mips/lantiq
 F:	drivers/soc/lantiq
 
+LANTIQ PEF2256 DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
+F:	drivers/net/wan/framer/pef2256/
+F:	drivers/pinctrl/pinctrl-pef2256-regs.h
+F:	drivers/pinctrl/pinctrl-pef2256.c
+F:	include/linux/framer/pef2256.h
+
 LASI 53c700 driver for PARISC
 M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
 L:	linux-scsi@vger.kernel.org
-- 
2.41.0

