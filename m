Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1286E4F0F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 19:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB1DE71;
	Mon, 17 Apr 2023 19:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB1DE71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681751954;
	bh=jXR+42m9xe/eUhRTi5Sho2KfjSe7enWLaA94YrEQwtg=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=l3n+Fr/UMTve9ovNmHPi6hPqiv46U9ByMV3lEn4xfuBkVyJeJgFGetr4u8sruuF1+
	 1/L4H6LMEmUTO0NxxkuzQnHzl31zqe8DjYqj7qL1/8mtnnW8n0JFQMlqgNibtlQrBd
	 EtJ8vYVoW/9yqhd8dHpXiMZvfXfaBLBTKS7LiSCQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F058CF80568;
	Mon, 17 Apr 2023 19:16:37 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 5/7] pinctrl: Add support for the Lantic PEF2256 pinmux
Date: Mon, 17 Apr 2023 19:15:59 +0200
In-Reply-To: <20230417171601.74656-1-herve.codina@bootlin.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRHNX5RNZ72KL7MKZDFPVLT3WN4LDZUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168175179648.26.5313609199013580875@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E842F80564; Mon, 17 Apr 2023 19:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFD42F80524
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 19:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD42F80524
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JyFCeCmw
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 91550C000A;
	Mon, 17 Apr 2023 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681751776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmzG/Z2mTAvEGVHm8sxwLgRxxYRlwVVbnHXTPzS0fHs=;
	b=JyFCeCmwYh8Tq+Y3A8OQmT8F2H1sRglo88jBquUXm3Ynpb2dmzGfZABj1SqUNrR/hKAThn
	Q6IEJimBdwqwUod4gYIUNRJjcBV0TMoT/gtIhygIk9I5TU4+wFtk4MXL+ctG5+AKdSMtpG
	xMW9k9sUq1OsSW5sXvGXieVz8pKoK47NJMHgKDOjoKNfbZrlryCvf60tzmOruxaD2b3pVI
	U2xarhDmPYTb3UYjE19nKlllpZZz3Mngr9FX/Rn6kXF5TBlFjLQOg0IunjTzbNaevOKJRL
	Lys1hqw8fFtGjArnDqclTDxgOgJ8L+AGtQXOL/DXKQ5T92LTtVanvxpvr8E4EA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 5/7] pinctrl: Add support for the Lantic PEF2256 pinmux
Date: Mon, 17 Apr 2023 19:15:59 +0200
Message-Id: <20230417171601.74656-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417171601.74656-1-herve.codina@bootlin.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QRHNX5RNZ72KL7MKZDFPVLT3WN4LDZUJ
X-Message-ID-Hash: QRHNX5RNZ72KL7MKZDFPVLT3WN4LDZUJ
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRHNX5RNZ72KL7MKZDFPVLT3WN4LDZUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Lantiq PEF2256 is a framer and line interface component designed to
fulfill all required interfacing between an analog E1/T1/J1 line and the
digital PCM system highway/H.100 bus.

This pinmux support handles the pin muxing part (pins RP(A..D) and pins
XP(A..D)) of the PEF2256.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/pinctrl/Kconfig                |  14 ++
 drivers/pinctrl/Makefile               |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h |  65 ++++++
 drivers/pinctrl/pinctrl-pef2256.c      | 310 +++++++++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-pef2256-regs.h
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index dcb53c4a9584..0b4da9c38462 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -377,6 +377,20 @@ config PINCTRL_PALMAS
 	  open drain configuration for the Palmas series devices like
 	  TPS65913, TPS80036 etc.
 
+config PINCTRL_PEF2256
+	tristate "Lantiq PEF2256 (FALC56) pin controller driver"
+	depends on OF && MFD_PEF2256
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  This option enables the pin controller support for the Lantiq PEF2256
+	  framer, also known as FALC56.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called pinctrl-pef2256.
+
 config PINCTRL_PIC32
 	bool "Microchip PIC32 pin controller driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index d5939840bb2a..011da5b44d19 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_PINCTRL_MICROCHIP_SGPIO)	+= pinctrl-microchip-sgpio.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
 obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
+obj-$(CONFIG_PINCTRL_PEF2256)	+= pinctrl-pef2256.o
 obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
 obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
diff --git a/drivers/pinctrl/pinctrl-pef2256-regs.h b/drivers/pinctrl/pinctrl-pef2256-regs.h
new file mode 100644
index 000000000000..586d94007e24
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-pef2256-regs.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PEF2256 pinctrl registers definition
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+#ifndef __PEF2256_PINCTRL_REGS_H__
+#define __PEF2256_PINCTRL_REGS_H__
+
+#include "linux/bitfield.h"
+
+/* Port Configuration 1..4 */
+#define PEF2256_PC1		  0x80
+#define PEF2256_PC2		  0x81
+#define PEF2256_PC3		  0x82
+#define PEF2256_PC4		  0x83
+#define PEF2256_12_PC_RPC_MASK	  GENMASK(6, 4)
+#define PEF2256_12_PC_RPC_SYPR	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x0)
+#define PEF2256_12_PC_RPC_RFM	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x1)
+#define PEF2256_12_PC_RPC_RFMB	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x2)
+#define PEF2256_12_PC_RPC_RSIGM	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x3)
+#define PEF2256_12_PC_RPC_RSIG	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x4)
+#define PEF2256_12_PC_RPC_DLR	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x5)
+#define PEF2256_12_PC_RPC_FREEZE  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x6)
+#define PEF2256_12_PC_RPC_RFSP	  FIELD_PREP_CONST(PEF2256_12_PC_RPC_MASK, 0x7)
+#define PEF2256_12_PC_XPC_MASK    GENMASK(4, 0)
+#define PEF2256_12_PC_XPC_SYPX	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x0)
+#define PEF2256_12_PC_XPC_XFMS	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x1)
+#define PEF2256_12_PC_XPC_XSIG	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x2)
+#define PEF2256_12_PC_XPC_TCLK	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x3)
+#define PEF2256_12_PC_XPC_XMFB	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x4)
+#define PEF2256_12_PC_XPC_XSIGM	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x5)
+#define PEF2256_12_PC_XPC_DLX	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x6)
+#define PEF2256_12_PC_XPC_XCLK	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x7)
+#define PEF2256_12_PC_XPC_XLT	  FIELD_PREP_CONST(PEF2256_12_PC_XPC_MASK, 0x8)
+#define PEF2256_2X_PC_RPC_MASK	  GENMASK(7, 4)
+#define PEF2256_2X_PC_RPC_SYPR	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x0)
+#define PEF2256_2X_PC_RPC_RFM	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x1)
+#define PEF2256_2X_PC_RPC_RFMB	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x2)
+#define PEF2256_2X_PC_RPC_RSIGM	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x3)
+#define PEF2256_2X_PC_RPC_RSIG	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x4)
+#define PEF2256_2X_PC_RPC_DLR	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x5)
+#define PEF2256_2X_PC_RPC_FREEZE  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x6)
+#define PEF2256_2X_PC_RPC_RFSP	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x7)
+#define PEF2256_2X_PC_RPC_GPI	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0x9)
+#define PEF2256_2X_PC_RPC_GPOH	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0xa)
+#define PEF2256_2X_PC_RPC_GPOL	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0xb)
+#define PEF2256_2X_PC_RPC_LOS	  FIELD_PREP_CONST(PEF2256_2X_PC_RPC_MASK, 0xc)
+#define PEF2256_2X_PC_XPC_MASK	  GENMASK(3, 0)
+#define PEF2256_2X_PC_XPC_SYPX	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x0)
+#define PEF2256_2X_PC_XPC_XFMS	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x1)
+#define PEF2256_2X_PC_XPC_XSIG	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x2)
+#define PEF2256_2X_PC_XPC_TCLK	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x3)
+#define PEF2256_2X_PC_XPC_XMFB	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x4)
+#define PEF2256_2X_PC_XPC_XSIGM	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x5)
+#define PEF2256_2X_PC_XPC_DLX	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x6)
+#define PEF2256_2X_PC_XPC_XCLK	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x7)
+#define PEF2256_2X_PC_XPC_XLT	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x8)
+#define PEF2256_2X_PC_XPC_GPI	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0x9)
+#define PEF2256_2X_PC_XPC_GPOH	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0xa)
+#define PEF2256_2X_PC_XPC_GPOL	  FIELD_PREP_CONST(PEF2256_2X_PC_XPC_MASK, 0xb)
+
+#endif /* __PEF2256_PINCTRL_REGS_H__ */
diff --git a/drivers/pinctrl/pinctrl-pef2256.c b/drivers/pinctrl/pinctrl-pef2256.c
new file mode 100644
index 000000000000..65096da13f98
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-pef2256.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PEF2256 also known as FALC56 driver
+ *
+ * Copyright 2023 CS GROUP France
+ *
+ * Author: Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/mfd/pef2256.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include "pinctrl-pef2256-regs.h"
+
+struct pef2256_pinreg_desc {
+	int offset;
+	u8 mask;
+};
+
+struct pef2256_function_desc {
+	const char *name;
+	const char * const*groups;
+	unsigned int ngroups;
+	u8 func_val;
+};
+
+struct pef2256_pinctrl {
+	struct device *dev;
+	struct regmap *regmap;
+	enum pef2256_version version;
+	struct {
+		struct pinctrl_desc pctrl_desc;
+		const struct pef2256_function_desc *functions;
+		unsigned int nfunctions;
+	} pinctrl;
+};
+
+static int pef2256_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We map 1 group <-> 1 pin */
+	return pef2256->pinctrl.pctrl_desc.npins;
+}
+
+static const char *pef2256_get_group_name(struct pinctrl_dev *pctldev,
+					  unsigned int selector)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We map 1 group <-> 1 pin */
+	return pef2256->pinctrl.pctrl_desc.pins[selector].name;
+}
+
+static int pef2256_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+				  const unsigned int **pins,
+				  unsigned int *num_pins)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We map 1 group <-> 1 pin */
+	*pins = &pef2256->pinctrl.pctrl_desc.pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops pef2256_pctlops = {
+	.get_groups_count	= pef2256_get_groups_count,
+	.get_group_name		= pef2256_get_group_name,
+	.get_group_pins		= pef2256_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+};
+
+static int pef2256_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	return pef2256->pinctrl.nfunctions;
+}
+
+static const char *pef2256_get_function_name(struct pinctrl_dev *pctldev,
+					     unsigned int selector)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	return pef2256->pinctrl.functions[selector].name;
+}
+
+static int pef2256_get_function_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+				       const char * const **groups,
+				       unsigned * const num_groups)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pef2256->pinctrl.functions[selector].groups;
+	*num_groups = pef2256->pinctrl.functions[selector].ngroups;
+	return 0;
+}
+
+static int pef2256_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+			   unsigned int group_selector)
+{
+	struct pef2256_pinctrl *pef2256 = pinctrl_dev_get_drvdata(pctldev);
+	const struct pef2256_pinreg_desc *pinreg_desc;
+	u8 func_val;
+
+	/* We map 1 group <-> 1 pin */
+	pinreg_desc = pef2256->pinctrl.pctrl_desc.pins[group_selector].drv_data;
+	func_val = pef2256->pinctrl.functions[func_selector].func_val;
+
+	return regmap_update_bits(pef2256->regmap, pinreg_desc->offset,
+				  pinreg_desc->mask, func_val);
+}
+
+static const struct pinmux_ops pef2256_pmxops = {
+	.get_functions_count	= pef2256_get_functions_count,
+	.get_function_name	= pef2256_get_function_name,
+	.get_function_groups	= pef2256_get_function_groups,
+	.set_mux		= pef2256_set_mux,
+};
+
+#define PEF2256_PINCTRL_PIN(_number, _name, _offset, _mask) { \
+	.number = _number, \
+	.name = _name, \
+	.drv_data = &(struct pef2256_pinreg_desc) { \
+		.offset = _offset, \
+		.mask = _mask, \
+	}, \
+}
+
+static const struct pinctrl_pin_desc pef2256_v12_pins[] = {
+	PEF2256_PINCTRL_PIN(0, "RPA", PEF2256_PC1, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(1, "RPB", PEF2256_PC2, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(2, "RPC", PEF2256_PC3, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(3, "RPD", PEF2256_PC4, PEF2256_12_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(4, "XPA", PEF2256_PC1, PEF2256_12_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(5, "XPB", PEF2256_PC2, PEF2256_12_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(6, "XPC", PEF2256_PC3, PEF2256_12_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(7, "XPD", PEF2256_PC4, PEF2256_12_PC_XPC_MASK),
+};
+
+static const struct pinctrl_pin_desc pef2256_v2x_pins[] = {
+	PEF2256_PINCTRL_PIN(0, "RPA", PEF2256_PC1, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(1, "RPB", PEF2256_PC2, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(2, "RPC", PEF2256_PC3, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(3, "RPD", PEF2256_PC4, PEF2256_2X_PC_RPC_MASK),
+	PEF2256_PINCTRL_PIN(4, "XPA", PEF2256_PC1, PEF2256_2X_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(5, "XPB", PEF2256_PC2, PEF2256_2X_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(6, "XPC", PEF2256_PC3, PEF2256_2X_PC_XPC_MASK),
+	PEF2256_PINCTRL_PIN(7, "XPD", PEF2256_PC4, PEF2256_2X_PC_XPC_MASK),
+};
+
+static const char *const pef2256_rp_groups[] = { "RPA", "RPB", "RPC", "RPD" };
+static const char *const pef2256_xp_groups[] = { "XPA", "XPB", "XPC", "XPD" };
+static const char *const pef2256_all_groups[] = { "RPA", "RPB", "RPC", "RPD",
+						  "XPA", "XPB", "XPC", "XPD" };
+
+#define PEF2256_FUNCTION(_name, _func_val, _groups) { \
+	.name = _name, \
+	.groups = _groups, \
+	.ngroups = ARRAY_SIZE(_groups), \
+	.func_val = _func_val, \
+}
+
+static const struct pef2256_function_desc pef2256_v2x_functions[] = {
+	PEF2256_FUNCTION("SYPR",   PEF2256_2X_PC_RPC_SYPR,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RFM",    PEF2256_2X_PC_RPC_RFM,    pef2256_rp_groups),
+	PEF2256_FUNCTION("RFMB",   PEF2256_2X_PC_RPC_RFMB,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIGM",  PEF2256_2X_PC_RPC_RSIGM,  pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIG",   PEF2256_2X_PC_RPC_RSIG,   pef2256_rp_groups),
+	PEF2256_FUNCTION("DLR",    PEF2256_2X_PC_RPC_DLR,    pef2256_rp_groups),
+	PEF2256_FUNCTION("FREEZE", PEF2256_2X_PC_RPC_FREEZE, pef2256_rp_groups),
+	PEF2256_FUNCTION("RFSP",   PEF2256_2X_PC_RPC_RFSP,   pef2256_rp_groups),
+	PEF2256_FUNCTION("LOS",    PEF2256_2X_PC_RPC_LOS,    pef2256_rp_groups),
+
+	PEF2256_FUNCTION("SYPX",  PEF2256_2X_PC_XPC_SYPX,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XFMS",  PEF2256_2X_PC_XPC_XFMS,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIG",  PEF2256_2X_PC_XPC_XSIG,  pef2256_xp_groups),
+	PEF2256_FUNCTION("TCLK",  PEF2256_2X_PC_XPC_TCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XMFB",  PEF2256_2X_PC_XPC_XMFB,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIGM", PEF2256_2X_PC_XPC_XSIGM, pef2256_xp_groups),
+	PEF2256_FUNCTION("DLX",   PEF2256_2X_PC_XPC_DLX,   pef2256_xp_groups),
+	PEF2256_FUNCTION("XCLK",  PEF2256_2X_PC_XPC_XCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XLT",   PEF2256_2X_PC_XPC_XLT,   pef2256_xp_groups),
+
+	PEF2256_FUNCTION("GPI",  PEF2256_2X_PC_RPC_GPI | PEF2256_2X_PC_XPC_GPI,
+			 pef2256_all_groups),
+	PEF2256_FUNCTION("GPOH", PEF2256_2X_PC_RPC_GPOH | PEF2256_2X_PC_XPC_GPOH,
+			 pef2256_all_groups),
+	PEF2256_FUNCTION("GPOL", PEF2256_2X_PC_RPC_GPOL | PEF2256_2X_PC_XPC_GPOL,
+			 pef2256_all_groups),
+};
+
+static const struct pef2256_function_desc pef2256_v12_functions[] = {
+	PEF2256_FUNCTION("SYPR",   PEF2256_12_PC_RPC_SYPR,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RFM",    PEF2256_12_PC_RPC_RFM,    pef2256_rp_groups),
+	PEF2256_FUNCTION("RFMB",   PEF2256_12_PC_RPC_RFMB,   pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIGM",  PEF2256_12_PC_RPC_RSIGM,  pef2256_rp_groups),
+	PEF2256_FUNCTION("RSIG",   PEF2256_12_PC_RPC_RSIG,   pef2256_rp_groups),
+	PEF2256_FUNCTION("DLR",    PEF2256_12_PC_RPC_DLR,    pef2256_rp_groups),
+	PEF2256_FUNCTION("FREEZE", PEF2256_12_PC_RPC_FREEZE, pef2256_rp_groups),
+	PEF2256_FUNCTION("RFSP",   PEF2256_12_PC_RPC_RFSP,   pef2256_rp_groups),
+
+	PEF2256_FUNCTION("SYPX",  PEF2256_12_PC_XPC_SYPX,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XFMS",  PEF2256_12_PC_XPC_XFMS,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIG",  PEF2256_12_PC_XPC_XSIG,  pef2256_xp_groups),
+	PEF2256_FUNCTION("TCLK",  PEF2256_12_PC_XPC_TCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XMFB",  PEF2256_12_PC_XPC_XMFB,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XSIGM", PEF2256_12_PC_XPC_XSIGM, pef2256_xp_groups),
+	PEF2256_FUNCTION("DLX",   PEF2256_12_PC_XPC_DLX,   pef2256_xp_groups),
+	PEF2256_FUNCTION("XCLK",  PEF2256_12_PC_XPC_XCLK,  pef2256_xp_groups),
+	PEF2256_FUNCTION("XLT",   PEF2256_12_PC_XPC_XLT,   pef2256_xp_groups),
+};
+
+static int pef2256_register_pinctrl(struct pef2256_pinctrl *pef2256)
+{
+	struct pinctrl_dev	*pctrl;
+
+	pef2256->pinctrl.pctrl_desc.name    = dev_name(pef2256->dev);
+	pef2256->pinctrl.pctrl_desc.owner   = THIS_MODULE;
+	pef2256->pinctrl.pctrl_desc.pctlops = &pef2256_pctlops;
+	pef2256->pinctrl.pctrl_desc.pmxops  = &pef2256_pmxops;
+	if (pef2256->version == PEF2256_VERSION_1_2) {
+		pef2256->pinctrl.pctrl_desc.pins  = pef2256_v12_pins;
+		pef2256->pinctrl.pctrl_desc.npins = ARRAY_SIZE(pef2256_v12_pins);
+		pef2256->pinctrl.functions  = pef2256_v12_functions;
+		pef2256->pinctrl.nfunctions = ARRAY_SIZE(pef2256_v12_functions);
+	} else {
+		pef2256->pinctrl.pctrl_desc.pins  = pef2256_v2x_pins;
+		pef2256->pinctrl.pctrl_desc.npins = ARRAY_SIZE(pef2256_v2x_pins);
+		pef2256->pinctrl.functions  = pef2256_v2x_functions;
+		pef2256->pinctrl.nfunctions = ARRAY_SIZE(pef2256_v2x_functions);
+	}
+
+	pctrl = devm_pinctrl_register(pef2256->dev, &pef2256->pinctrl.pctrl_desc, pef2256);
+	if (IS_ERR(pctrl)) {
+		dev_err(pef2256->dev, "pinctrl driver registration failed\n");
+		return PTR_ERR(pctrl);
+	}
+
+	return 0;
+}
+
+static void pef2256_reset_pinmux(struct pef2256_pinctrl *pef2256)
+{
+	u8 val;
+	/*
+	 * Reset values cannot be used.
+	 * They define the SYPR/SYPX pin mux for all the RPx and XPx pins and
+	 * Only one pin can be muxed to SYPR and one pin can be muxed to SYPX.
+	 * Choose here an other reset value.
+	 */
+	if (pef2256->version == PEF2256_VERSION_1_2)
+		val = PEF2256_12_PC_XPC_XCLK | PEF2256_12_PC_RPC_RFSP;
+	else
+		val = PEF2256_2X_PC_XPC_GPI | PEF2256_2X_PC_RPC_GPI;
+
+	regmap_write(pef2256->regmap, PEF2256_PC1, val);
+	regmap_write(pef2256->regmap, PEF2256_PC2, val);
+	regmap_write(pef2256->regmap, PEF2256_PC3, val);
+	regmap_write(pef2256->regmap, PEF2256_PC4, val);
+}
+
+static int pef2256_pinctrl_probe(struct platform_device *pdev)
+{
+	struct pef2256_pinctrl *pef2256_pinctrl;
+	struct pef2256 *pef2256;
+	int ret;
+
+	pef2256_pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pef2256_pinctrl), GFP_KERNEL);
+	if (!pef2256_pinctrl)
+		return -ENOMEM;
+
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
+	pef2256 = dev_get_drvdata(pdev->dev.parent);
+
+	pef2256_pinctrl->dev = &pdev->dev;
+	pef2256_pinctrl->regmap = pef2256_get_regmap(pef2256);
+	pef2256_pinctrl->version = pef2256_get_version(pef2256);
+
+	platform_set_drvdata(pdev, pef2256_pinctrl);
+
+	pef2256_reset_pinmux(pef2256_pinctrl);
+	ret = pef2256_register_pinctrl(pef2256_pinctrl);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct platform_driver pef2256_pinctrl_driver = {
+	.driver = {
+		.name = "lantiq-pef2256-pinctrl",
+	},
+	.probe = pef2256_pinctrl_probe,
+};
+module_platform_driver(pef2256_pinctrl_driver);
+
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("PEF2256 pin controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

