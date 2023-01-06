Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24514663B3D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B422FFE;
	Tue, 10 Jan 2023 09:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B422FFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673339771;
	bh=3mXvG6mUcAAdD4oUmzIdmWBu0Oq6g+DemhrrzNU50dg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YdGIHrKYIte5T+g4T7oELdm2McT7lbec/sDMoSvyWK8bESVBOXY/uE83lK3eD+Ift
	 tkl1wD+ien6puWX6wwbqzxWUjXF2eZXLoYRVeRMDSlu4lNa/9u/LpCZcYvercCcpsT
	 r8dhgGLiBDm+3rmyMVNMVl3JYChSLRFfZqp4laH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25EADF8057E;
	Tue, 10 Jan 2023 09:32:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ED02F8024E; Fri,  6 Jan 2023 14:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D70BFF8025A
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 14:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D70BFF8025A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b0dHQa8b
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0B7FA40013;
 Fri,  6 Jan 2023 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673011821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eK6oGrS+FDqpNet/evYs5HPdbphuxm6/AcWmEWOiZU=;
 b=b0dHQa8bN2xD7KZzE+ZqmqXh8zGUDunlqyEPXYuvDiAoKKIQwe52yyzTH5mwv5zIKxpsou
 9arT+3e6kKoXMfpFT/yroH4nOba5iRrwJ7iTWF5Jg6OXoKHDAfUstnZ7x9uqTlrtDOBECI
 kSBXdMMyuH9Hv2zji/cWlIUDvtH7wU9ulegr1mImRg8wOLuFA4vRtNI7GjluL1aBkZSA2o
 4nFSvYVr37qZmzz2x+CuUw8hgHZ/pupyI66PIsf0m2Q9bgQpuBE1Ay4lV/8vHjAXccOzIE
 7bh58d9n5JnKPjZnUWxn73Csls0Q8dLg3gchxcLOLLueBJJ6lFomKeSXzbofBA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 07/10] MAINTAINERS: add the Freescale QMC controller entry
Date: Fri,  6 Jan 2023 14:29:48 +0100
Message-Id: <20230106132951.392271-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106132951.392271-1-herve.codina@bootlin.com>
References: <20230106132951.392271-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 09:32:35 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

After contributing the driver, add myself as the maintainer
for the Freescale QMC controller.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b4f5fe7ebad..480f90db699d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8372,6 +8372,14 @@ S:	Maintained
 F:	drivers/soc/fsl/qe/
 F:	include/soc/fsl/qe/
 
+FREESCALE QUICC ENGINE QMC DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
+F:	drivers/soc/fsl/qe/qmc.c
+F:	include/soc/fsl/qe/qmc.h
+
 FREESCALE QUICC ENGINE TSA DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.38.1

