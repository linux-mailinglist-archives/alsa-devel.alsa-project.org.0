Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BCF754102
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 19:48:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0440D84A;
	Fri, 14 Jul 2023 19:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0440D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689356900;
	bh=lddwotZ+kZKGJj9p6UIo+/3PuRWkqbyDwRI5qCE2u64=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R8frQkg86oSx7YObh/EWzl9cR7Y/e9v3kE6QBW6ZsOHm1KdFdL9r4Vw406lA0scun
	 OEwtZQKnPaYfr5+YjoKDVDpgdKc5Zclv2bl3lwjS7gT+AP/+dvU9xnet5M9f1QOI4U
	 zES9xTorfrSUPqBcsntmnl3TxnAZkipr+YrddXQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BCFBF8024E; Fri, 14 Jul 2023 19:47:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CE85F80236;
	Fri, 14 Jul 2023 19:47:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC23DF80249; Fri, 14 Jul 2023 19:47:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6055FF80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 19:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6055FF80153
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-783544a1c90so90669739f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jul 2023 10:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356832; x=1691948832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeiE+HnMouYzfyNd/68oi3j74UMDXi8ibPx8eeIgmvQ=;
        b=MqUeCzcUqkBv3nBYpaIAeQeYbxKkX9KhN/JKm0Q7S9v1lNStpko91IYAH6sdOfAwaB
         mCxWoy/KDQhp6w+g/iWGHUs4IxrIpGht5HX5n3VirxREBfMNnJ1IT4xX226Fri1wde2A
         NjBdZnvhoVSwEudV3Oglvr77Wy8HG7DFv5vSvRMqEwaGJiJe79yRTr3SUX+4q6Q8IUm5
         9IrVqo0rVUEG3khxZXzV5hd8yBZrP0g9BQ+NAUAQDsZrRpJktssm7I73OsZHE4dLu7bV
         Uxsp1iXI8nB4oJ1RMTJvxkL8hK4ov7o2lChCzRjPViiDNrSqJ+QtAKIxdo7HAUBqYAcA
         V+tQ==
X-Gm-Message-State: ABy/qLYAAt7niwc6t/hkZxzpES77HesCzRiq6ywNPC6YgI9jsQPPDRMm
	OjRQOsekVFAPgVckl5V1eg==
X-Google-Smtp-Source: 
 APBJJlHXZn+MEv7nNeSi3qT88gFKsbjEuS3B/1KXeEjspYv3anvorPWqBdLrFlgJP8t9t4ZuNyU9aA==
X-Received: by 2002:a5e:df4d:0:b0:786:4198:3c2d with SMTP id
 g13-20020a5edf4d000000b0078641983c2dmr5706464ioq.1.1689356832311;
        Fri, 14 Jul 2023 10:47:12 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 c5-20020a6b7d05000000b0077e24ace3edsm2632026ioq.52.2023.07.14.10.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:47:11 -0700 (PDT)
Received: (nullmailer pid 4058687 invoked by uid 1000);
	Fri, 14 Jul 2023 17:46:49 -0000
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH] irqchip: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:46:43 -0600
Message-Id: <20230714174645.4058547-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J62MMD6J4B5ASK6QZB5SSOPANBREASWL
X-Message-ID-Hash: J62MMD6J4B5ASK6QZB5SSOPANBREASWL
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J62MMD6J4B5ASK6QZB5SSOPANBREASWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/irqchip/irq-bcm6345-l1.c            | 1 -
 drivers/irqchip/irq-bcm7038-l1.c            | 1 -
 drivers/irqchip/irq-brcmstb-l2.c            | 1 -
 drivers/irqchip/irq-gic-pm.c                | 2 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 2 --
 drivers/irqchip/irq-imx-intmux.c            | 3 ++-
 drivers/irqchip/irq-imx-irqsteer.c          | 3 ++-
 drivers/irqchip/irq-keystone.c              | 2 +-
 drivers/irqchip/irq-loongson-htvec.c        | 1 -
 drivers/irqchip/irq-loongson-pch-pic.c      | 2 +-
 drivers/irqchip/irq-madera.c                | 4 +---
 drivers/irqchip/irq-pruss-intc.c            | 2 +-
 drivers/irqchip/irq-qcom-mpm.c              | 2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c   | 1 -
 drivers/irqchip/irq-st.c                    | 2 +-
 drivers/irqchip/irq-stm32-exti.c            | 3 ++-
 drivers/irqchip/irq-sunxi-nmi.c             | 1 -
 drivers/irqchip/irq-tb10x.c                 | 1 -
 drivers/irqchip/irq-ti-sci-inta.c           | 4 ++--
 drivers/irqchip/irq-ti-sci-intr.c           | 4 ++--
 drivers/irqchip/irq-uniphier-aidet.c        | 1 -
 drivers/irqchip/irqchip.c                   | 2 +-
 drivers/irqchip/qcom-pdc.c                  | 1 -
 23 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
index fa113cb2529a..b521897277a8 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -60,7 +60,6 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index a62b96237b82..24ca1d656adc 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -20,7 +20,6 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index 091b0fe7e324..5559c943f03f 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/io.h>
diff --git a/drivers/irqchip/irq-gic-pm.c b/drivers/irqchip/irq-gic-pm.c
index 3989d16f997b..a275a8071a25 100644
--- a/drivers/irqchip/irq-gic-pm.c
+++ b/drivers/irqchip/irq-gic-pm.c
@@ -4,7 +4,7 @@
  */
 #include <linux/module.h>
 #include <linux/clk.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/irqchip/arm-gic.h>
 #include <linux/platform_device.h>
diff --git a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
index 634263dfd7b5..8e87fc35f8aa 100644
--- a/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
+++ b/drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
@@ -9,8 +9,6 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
 #include <linux/irq.h>
 #include <linux/msi.h>
 #include <linux/of.h>
diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 80aaea82468a..6d9a08238c9d 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -50,8 +50,9 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 96230a04ec23..bd9543314539 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,8 +10,9 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/irqchip/irq-keystone.c b/drivers/irqchip/irq-keystone.c
index ba9792e60329..a36396db4b08 100644
--- a/drivers/irqchip/irq-keystone.c
+++ b/drivers/irqchip/irq-keystone.c
@@ -15,7 +15,7 @@
 #include <linux/irqdomain.h>
 #include <linux/irqchip.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index fc8bf1f5d41b..0bff728b25e3 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -15,7 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/syscore_ops.h>
 
 /* Registers */
diff --git a/drivers/irqchip/irq-loongson-pch-pic.c b/drivers/irqchip/irq-loongson-pch-pic.c
index 93a71f66efeb..63db8e2172e0 100644
--- a/drivers/irqchip/irq-loongson-pch-pic.c
+++ b/drivers/irqchip/irq-loongson-pch-pic.c
@@ -12,9 +12,9 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/syscore_ops.h>
 
 /* Registers */
diff --git a/drivers/irqchip/irq-madera.c b/drivers/irqchip/irq-madera.c
index 8b81271c823c..3eb1f8cdf674 100644
--- a/drivers/irqchip/irq-madera.c
+++ b/drivers/irqchip/irq-madera.c
@@ -10,12 +10,10 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/irqchip/irq-madera.h>
 #include <linux/mfd/madera/core.h>
 #include <linux/mfd/madera/pdata.h>
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index fa8d89b02ec0..89e337ebc467 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -17,7 +17,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 /*
diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index d30614661eea..7124565234a5 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -14,7 +14,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 26e4c17a7bf2..fa19585f3dee 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -17,7 +17,6 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 
 #define INTC_IRQPIN_MAX 8 /* maximum 8 interrupts per driver instance */
diff --git a/drivers/irqchip/irq-st.c b/drivers/irqchip/irq-st.c
index 819a12297b58..de71bb350d57 100644
--- a/drivers/irqchip/irq-st.c
+++ b/drivers/irqchip/irq-st.c
@@ -10,7 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq-st.h>
 #include <linux/err.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index b5fa76ce5046..d8ba5fba7450 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -14,10 +14,11 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 21d49791f855..e760b1278143 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -19,7 +19,6 @@
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 
diff --git a/drivers/irqchip/irq-tb10x.c b/drivers/irqchip/irq-tb10x.c
index 8a0e69298e83..680586354d12 100644
--- a/drivers/irqchip/irq-tb10x.c
+++ b/drivers/irqchip/irq-tb10x.c
@@ -13,7 +13,6 @@
 #include <linux/irqchip.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index 7133f9fa6fd9..b83f5cbab123 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -15,9 +15,9 @@
 #include <linux/msi.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/soc/ti/ti_sci_inta_msi.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 1186f1e431a3..c027cd9e4a69 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -12,9 +12,9 @@
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
 /**
diff --git a/drivers/irqchip/irq-uniphier-aidet.c b/drivers/irqchip/irq-uniphier-aidet.c
index 716b1bb88bf2..601f9343d5b3 100644
--- a/drivers/irqchip/irq-uniphier-aidet.c
+++ b/drivers/irqchip/irq-uniphier-aidet.c
@@ -12,7 +12,6 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 7899607fbee8..1eeb0d0156ce 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -10,7 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/irqchip.h>
 #include <linux/platform_device.h>
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index d96916cf6a41..a32c0d28d038 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
-- 
2.40.1

