Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D24660482
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 17:40:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64C614843;
	Fri,  6 Jan 2023 17:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64C614843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673023217;
	bh=lls84LM371cdh4FygjaCFDa2m9y3IXSEiWXwDtlbpXo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rrDtyDI7fSquzfumcP1nNrepLh6Jj7pHPHzPnnwMkN5fXPZju97zf3mcmXkwlzcIb
	 g36RWjMyZQvGAocpPjaO3hGGD9xxamIpGJQwZ0W0KAU56LbJ0lVmpAbUwxHThy+1nZ
	 UG0MsonwG3L+Y8LsmJBAQVkQqVS9A1iSvZ09kJRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC5FF8055C;
	Fri,  6 Jan 2023 17:38:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E4F5F80549; Fri,  6 Jan 2023 17:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAFD3F8047B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 17:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAFD3F8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e08kFeuO
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 305D6100010;
 Fri,  6 Jan 2023 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673023085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nc6bvDcTrl1Ymn4a/GwwKE3r38ifE4VzNy4POuRlNdA=;
 b=e08kFeuOoIrfa8pp03v2ZP17nI3GQGrokJ2WQC/1gfLVSllkJQDBuhkih2i67AOctByui+
 NorAiKRbtp9uo/ynpOUhKhk8+8Ko/deVj4+qFCV9G7+azGR+SkmFjt+/gHrnHKOQRYFRkD
 qpRr7LVPf4oKHJfOgUBRnly1O94o4Q9eSBGDp/PH9WlwQRsuI4ePc6RKq6oHUUbsH6sm1x
 1C3ejG6kzNw9IYM/dH/jc+E89ZpdTnbcF8LCBVjKj6aegeJhU4fUM0I0CDM+egTUQiS1XI
 L2Ji9nI2SLIZDQwDEGKvpa9ZRTm3zjlwj9C7CAU5CiiRAzZzzZe5OCNHdpxiXA==
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
Subject: [PATCH v2 03/10] MAINTAINERS: add the Freescale TSA controller entry
Date: Fri,  6 Jan 2023 17:37:39 +0100
Message-Id: <20230106163746.439717-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106163746.439717-1-herve.codina@bootlin.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
for the Freescale TSA controller.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f86d02cb427..2b4f5fe7ebad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8372,6 +8372,15 @@ S:	Maintained
 F:	drivers/soc/fsl/qe/
 F:	include/soc/fsl/qe/
 
+FREESCALE QUICC ENGINE TSA DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
+F:	drivers/soc/fsl/qe/tsa.c
+F:	drivers/soc/fsl/qe/tsa.h
+F:	include/dt-bindings/soc/fsl-tsa.h
+
 FREESCALE QUICC ENGINE UCC ETHERNET DRIVER
 M:	Li Yang <leoyang.li@nxp.com>
 L:	netdev@vger.kernel.org
-- 
2.38.1

