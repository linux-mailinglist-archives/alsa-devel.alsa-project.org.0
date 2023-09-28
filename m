Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE007B1445
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 09:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F75DDF6;
	Thu, 28 Sep 2023 09:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F75DDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695885171;
	bh=B2oaU4XYRMiLWt8pnWBbnPFrKahumzwTFZIHByDKHOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMqEDk0JxswUtGKRWB2hKHcCtDTVt8k+vXQJPRpOLJmadGMEgw+3QV9y8rNou8N0k
	 zJS0TGPAGCf7SGVFazHzXT3hPjyr9Ell6C2E9AVnyUHs4zj029E8KV1aepvSgJYnTd
	 aEUQhYHEbWwqwMo834fqHlkpWBCl8dKxdyRKsXW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D753BF805F6; Thu, 28 Sep 2023 09:09:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C20F805FA;
	Thu, 28 Sep 2023 09:09:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81A1AF8055B; Thu, 28 Sep 2023 09:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5106F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 09:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5106F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z9KiIZGL
Received: by mail.gandi.net (Postfix) with ESMTPA id AB7D220002;
	Thu, 28 Sep 2023 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1VpXEDiEEj03z0lZbsi0RjHlrslWbdm5Y0c+1pg5eg=;
	b=Z9KiIZGL5UeXp6AoHuaihnbW61btwM6RNBunlQxENJMMZJvCGetCye3XjFYeAS2FDsBGIM
	u6JwA5uQuFYkvp3r7RP4kX/eXauddu6v1KgKPSc/h9ji5j+FSf+9k9PF4XGfX9tUuuRsqK
	Ju3cS6UVxSGRMCuBRJo3x9AvESph//z6m5mQslcTC9tLY33CdwmgX53Wkfv7KIGvktONsd
	gZKeprvDpOSInXkwQl63B+aj/bZUmWZeDXh1spIC9O9OoFxKV6gg9A3r9x/oaOy9+llo7O
	DTBz76LET4jFdze7O6+ak0BfyKd/eiwUUEzbnkk7VCZ6aQgMl430ZSNxbz08pQ==
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 11/30] MAINTAINERS: Add the Freescale QMC HDLC driver entry
Date: Thu, 28 Sep 2023 09:06:29 +0200
Message-ID: <20230928070652.330429-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928070652.330429-1-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: LGZME3DUYJDBS5UFYVFHNUXY4YKAMNK7
X-Message-ID-Hash: LGZME3DUYJDBS5UFYVFHNUXY4YKAMNK7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGZME3DUYJDBS5UFYVFHNUXY4YKAMNK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After contributing the driver, add myself as the maintainer for the
Freescale QMC HDLC driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..8b987f2c8633 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8364,6 +8364,13 @@ F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
 F:	drivers/soc/fsl/qe/qmc.c
 F:	include/soc/fsl/qe/qmc.h
 
+FREESCALE QUICC ENGINE QMC HDLC DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	netdev@vger.kernel.org
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	drivers/net/wan/fsl_qmc_hdlc.c
+
 FREESCALE QUICC ENGINE TSA DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.41.0

