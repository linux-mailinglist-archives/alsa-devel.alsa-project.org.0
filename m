Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66069AED7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 16:01:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED3A2EBD;
	Fri, 17 Feb 2023 16:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED3A2EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676646076;
	bh=U1pP+Sug2DvIRjxbWORhEYOJ/l4n9Ww2MyPnebMrXo8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f9beao/eqfUll3QvhGWhAlC0AUxPMgpEDwH85TeTnjIKbWlQ54C1vWjrYXOSsPIef
	 HNz4X5LNz54rqE0ydDbkhdrdaaPwJ2YCoHCD5sIres0/wfro959+/7UiutWNBDQs42
	 x9hPK3/I9J1xu3lNrM0QF2Ib0Jkq65mUW1ZcBmHg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76999F805AB;
	Fri, 17 Feb 2023 15:57:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26B4CF8057C; Fri, 17 Feb 2023 15:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62D03F8055C
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 15:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D03F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XwQIaXcr
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 209B91BF20A;
	Fri, 17 Feb 2023 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676645848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=681RqdXqkB7I0BektlUsTSTMOLtnz60rIPybWhesz7E=;
	b=XwQIaXcrl7Cc+b4H/eUP8uxDQHDWAyL+q37Xw0O4mAEva7oQtImwoY3RKeP/oZvc8O0OhO
	QYfoZnbuMMwmCFSFkQAWWV/RXZPRP2A1FFYmBRccpoMJ2T33PmGDEkK2+SEbpw5pZfoRvM
	TrdKXNzx5Uj2z5MYe5lmFCKIyyiGLsyDOyimdCR6ZVMdlk+TozH0HZxmCp4rwOS/a2BGCS
	O7sB1p+GljyLbQBl5XsJ3OeYxYLxvASIJqVI8RbhLhhjmf9ON7qCul06RkklZoMo8RQrNf
	q4o31DxEADMPhFf/9aSChDWlT8IOtmhXI1nFQaAJO+OJSljkNAoIrJJJwos8yg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v6 10/10] MAINTAINERS: add the Freescale QMC audio entry
Date: Fri, 17 Feb 2023 15:56:45 +0100
Message-Id: <20230217145645.1768659-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217145645.1768659-1-herve.codina@bootlin.com>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLOEIKNJCFKIDM4NT744ZP5UKKPWFR3P
X-Message-ID-Hash: GLOEIKNJCFKIDM4NT744ZP5UKKPWFR3P
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLOEIKNJCFKIDM4NT744ZP5UKKPWFR3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After contributing the component, add myself as the maintainer
for the Freescale QMC audio ASoC component.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47eca5b06cce..4553e5a30e9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8440,6 +8440,14 @@ F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 F:	sound/soc/fsl/mpc8610_hpcd.c
 
+FREESCALE SOC SOUND QMC DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
+F:	sound/soc/fsl/fsl_qmc_audio.c
+
 FREESCALE USB PERIPHERAL DRIVERS
 M:	Li Yang <leoyang.li@nxp.com>
 L:	linux-usb@vger.kernel.org
-- 
2.39.1

