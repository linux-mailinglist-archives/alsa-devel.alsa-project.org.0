Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A66AC798
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 17:20:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 134EE113B;
	Mon,  6 Mar 2023 17:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 134EE113B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678119622;
	bh=/lFnq9XJJHwd4Vyizfjv11cSrh9h/fStD+BPymKW20I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BQ5WRPuqo/PjkkNuslSUHPsa+xeJw0F5RQK8ya8jvhO5WuP3BlHq+oLhAeXPE8c7N
	 r4i2aPOUp25uz6I2EWeg5pSt65DiWpKV+0gyc03J76hrs+EJtB/7oopEM1vVtatxQW
	 aJ2F+peesED8vTltzN/VHSvzj4eJH8Ema81MURB0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59816F80548;
	Mon,  6 Mar 2023 17:18:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F068F80542; Mon,  6 Mar 2023 17:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECB3BF8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 17:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB3BF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G2JdotJQ
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 4C21124000B;
	Mon,  6 Mar 2023 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678119495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpcMTwIcNGPWfE0OgRnCskxPpdMJ2fO26HGcMpuRmss=;
	b=G2JdotJQTK94cSPUf/dJEOTVzYatQg5du+pGEm+aHOTsGFWWU3hyayoKhML5J+tnEWf87p
	xEB27rTIJHwYlCkpwkHR4uq3kJqnwHYyVNeKwihepNQliyLs3ZLYuYAPfoE0BN1UBE4D7D
	nSYThunQYemLcmZ/FtSdPran0YWU7johV+YtkVoWESYja9YtB0eFvLGUZdvGW4YP5niR+b
	SaW6lWEktSpD1ZuOn2lIordXFVn40WeL6770qFA3ZsyOlzI/IcMJJ70dIcQsvOBN/v2m/Q
	xCk88IUWAo0XgjJ5axw7N/NzSjF4Rssldguzz8M71kiIUNAoqhk19O0iSQWYxQ==
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
Subject: [PATCH v7 03/10] MAINTAINERS: add the Freescale TSA controller entry
Date: Mon,  6 Mar 2023 17:17:47 +0100
Message-Id: <20230306161754.89146-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306161754.89146-1-herve.codina@bootlin.com>
References: <20230306161754.89146-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CEZOSN735H6Q7GMNS7PQVFEQ222RMF3X
X-Message-ID-Hash: CEZOSN735H6Q7GMNS7PQVFEQ222RMF3X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEZOSN735H6Q7GMNS7PQVFEQ222RMF3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After contributing the driver, add myself as the maintainer for the
Freescale TSA controller.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d5bc223f305..fea9ee7ade8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8247,6 +8247,15 @@ S:	Maintained
 F:	drivers/soc/fsl/qe/
 F:	include/soc/fsl/qe/
 
+FREESCALE QUICC ENGINE TSA DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
+F:	drivers/soc/fsl/qe/tsa.c
+F:	drivers/soc/fsl/qe/tsa.h
+F:	include/dt-bindings/soc/cpm1-fsl,tsa.h
+
 FREESCALE QUICC ENGINE UCC ETHERNET DRIVER
 M:	Li Yang <leoyang.li@nxp.com>
 L:	netdev@vger.kernel.org
-- 
2.39.2

