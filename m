Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B2668CB6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 07:27:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D27A2FD;
	Fri, 13 Jan 2023 07:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D27A2FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673591225;
	bh=cnZCJB62nMemLatQZiGGQUbp2kRGibW6K/67pWhYgDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mjMdHZMTVl+mtWy79YWVCBd41YwKVb6y7NkQqiMoS7GPJoAcJ1oZxUJRQgeFDjr1U
	 EDb77a6Q/BBgtKY/HokDwbaCupkaJtFk9GKmiznhSZevcmfw1B2jxeJTPfWFT1lAJT
	 1Yb9OryXtRXQ3k6XnfEK6OSsFDt5BD5LLtbD3FtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D704BF8059F;
	Fri, 13 Jan 2023 07:24:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB252F8057D; Fri, 13 Jan 2023 07:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80D5EF8056F
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 07:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80D5EF8056F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=bFRj3MYF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iaAi+zESrNMNvvfEXFwVvV/C96H0o/Wg4Lh/ijTH/Rs=; b=bFRj3MYFOTjA0PSj1DEyvNksix
 /txq5zuehZaq1Obp5gHKz5id8DzeGGV7lKL1AlhZOUgWtvxuhMVAbMwGri/ic3+f0enD9lYjxMQxR
 Gf9Y2f2aOQpWUPFvfhpJhFzN7A8d5hLtjyalZeqPDUM7QjO4XAjWCeiOpKaBwU207o9TIBRxH7mXv
 9vW0R9Uv9WQi52i2Oie2Pb8ur8xtcT8EDzxlRsm/eP88LuKtf9xnY5QQhes6Rk2Hh9F25LQMh2HOL
 FXdK9tEz8XfVNXQMf+wriv4ySdq3dT2hm7Zg5AxsfkPpD1KGm+e/o6nTrxQgdrQp+txMqv4euPuCk
 mWxG2tow==;
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pGDU1-000lXq-5b; Fri, 13 Jan 2023 06:24:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/22] cpufreq: remove the sh-cpufreq driver
Date: Fri, 13 Jan 2023 07:23:24 +0100
Message-Id: <20230113062339.1909087-8-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-sh@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arch@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Now that arch/sh is removed this driver is dead code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/cpufreq/Kconfig      |  14 ---
 drivers/cpufreq/Makefile     |   1 -
 drivers/cpufreq/sh-cpufreq.c | 175 -----------------------------------
 3 files changed, 190 deletions(-)
 delete mode 100644 drivers/cpufreq/sh-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 2a84fc63371e2e..75a7a486308d8c 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -298,20 +298,6 @@ config SPARC_US2E_CPUFREQ
 	  If in doubt, say N.
 endif
 
-if SUPERH
-config SH_CPU_FREQ
-	tristate "SuperH CPU Frequency driver"
-	help
-	  This adds the cpufreq driver for SuperH. Any CPU that supports
-	  clock rate rounding through the clock framework can use this
-	  driver. While it will make the kernel slightly larger, this is
-	  harmless for CPUs that don't support rate rounding. The driver
-	  will also generate a notice in the boot log before disabling
-	  itself if the CPU in question is not capable of rate rounding.
-
-	  If unsure, say N.
-endif
-
 config QORIQ_CPUFREQ
 	tristate "CPU frequency scaling driver for Freescale QorIQ SoCs"
 	depends on OF && COMMON_CLK
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 32a7029e25ed81..9c16e77e3e87c0 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -112,6 +112,5 @@ obj-$(CONFIG_BMIPS_CPUFREQ)		+= bmips-cpufreq.o
 obj-$(CONFIG_IA64_ACPI_CPUFREQ)		+= ia64-acpi-cpufreq.o
 obj-$(CONFIG_LOONGSON2_CPUFREQ)		+= loongson2_cpufreq.o
 obj-$(CONFIG_LOONGSON1_CPUFREQ)		+= loongson1-cpufreq.o
-obj-$(CONFIG_SH_CPU_FREQ)		+= sh-cpufreq.o
 obj-$(CONFIG_SPARC_US2E_CPUFREQ)	+= sparc-us2e-cpufreq.o
 obj-$(CONFIG_SPARC_US3_CPUFREQ)		+= sparc-us3-cpufreq.o
diff --git a/drivers/cpufreq/sh-cpufreq.c b/drivers/cpufreq/sh-cpufreq.c
deleted file mode 100644
index b8704232c27b24..00000000000000
--- a/drivers/cpufreq/sh-cpufreq.c
+++ /dev/null
@@ -1,175 +0,0 @@
-/*
- * cpufreq driver for the SuperH processors.
- *
- * Copyright (C) 2002 - 2012 Paul Mundt
- * Copyright (C) 2002 M. R. Brown
- *
- * Clock framework bits from arch/avr32/mach-at32ap/cpufreq.c
- *
- *   Copyright (C) 2004-2007 Atmel Corporation
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- */
-#define pr_fmt(fmt) "cpufreq: " fmt
-
-#include <linux/types.h>
-#include <linux/cpufreq.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/err.h>
-#include <linux/cpumask.h>
-#include <linux/cpu.h>
-#include <linux/smp.h>
-#include <linux/clk.h>
-#include <linux/percpu.h>
-#include <linux/sh_clk.h>
-
-static DEFINE_PER_CPU(struct clk, sh_cpuclk);
-
-struct cpufreq_target {
-	struct cpufreq_policy	*policy;
-	unsigned int		freq;
-};
-
-static unsigned int sh_cpufreq_get(unsigned int cpu)
-{
-	return (clk_get_rate(&per_cpu(sh_cpuclk, cpu)) + 500) / 1000;
-}
-
-static long __sh_cpufreq_target(void *arg)
-{
-	struct cpufreq_target *target = arg;
-	struct cpufreq_policy *policy = target->policy;
-	int cpu = policy->cpu;
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
-	struct cpufreq_freqs freqs;
-	struct device *dev;
-	long freq;
-
-	if (smp_processor_id() != cpu)
-		return -ENODEV;
-
-	dev = get_cpu_device(cpu);
-
-	/* Convert target_freq from kHz to Hz */
-	freq = clk_round_rate(cpuclk, target->freq * 1000);
-
-	if (freq < (policy->min * 1000) || freq > (policy->max * 1000))
-		return -EINVAL;
-
-	dev_dbg(dev, "requested frequency %u Hz\n", target->freq * 1000);
-
-	freqs.old	= sh_cpufreq_get(cpu);
-	freqs.new	= (freq + 500) / 1000;
-	freqs.flags	= 0;
-
-	cpufreq_freq_transition_begin(target->policy, &freqs);
-	clk_set_rate(cpuclk, freq);
-	cpufreq_freq_transition_end(target->policy, &freqs, 0);
-
-	dev_dbg(dev, "set frequency %lu Hz\n", freq);
-	return 0;
-}
-
-/*
- * Here we notify other drivers of the proposed change and the final change.
- */
-static int sh_cpufreq_target(struct cpufreq_policy *policy,
-			     unsigned int target_freq,
-			     unsigned int relation)
-{
-	struct cpufreq_target data = { .policy = policy, .freq = target_freq };
-
-	return work_on_cpu(policy->cpu, __sh_cpufreq_target, &data);
-}
-
-static int sh_cpufreq_verify(struct cpufreq_policy_data *policy)
-{
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, policy->cpu);
-	struct cpufreq_frequency_table *freq_table;
-
-	freq_table = cpuclk->nr_freqs ? cpuclk->freq_table : NULL;
-	if (freq_table)
-		return cpufreq_frequency_table_verify(policy, freq_table);
-
-	cpufreq_verify_within_cpu_limits(policy);
-
-	policy->min = (clk_round_rate(cpuclk, 1) + 500) / 1000;
-	policy->max = (clk_round_rate(cpuclk, ~0UL) + 500) / 1000;
-
-	cpufreq_verify_within_cpu_limits(policy);
-	return 0;
-}
-
-static int sh_cpufreq_cpu_init(struct cpufreq_policy *policy)
-{
-	unsigned int cpu = policy->cpu;
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
-	struct cpufreq_frequency_table *freq_table;
-	struct device *dev;
-
-	dev = get_cpu_device(cpu);
-
-	cpuclk = clk_get(dev, "cpu_clk");
-	if (IS_ERR(cpuclk)) {
-		dev_err(dev, "couldn't get CPU clk\n");
-		return PTR_ERR(cpuclk);
-	}
-
-	freq_table = cpuclk->nr_freqs ? cpuclk->freq_table : NULL;
-	if (freq_table) {
-		policy->freq_table = freq_table;
-	} else {
-		dev_notice(dev, "no frequency table found, falling back "
-			   "to rate rounding.\n");
-
-		policy->min = policy->cpuinfo.min_freq =
-			(clk_round_rate(cpuclk, 1) + 500) / 1000;
-		policy->max = policy->cpuinfo.max_freq =
-			(clk_round_rate(cpuclk, ~0UL) + 500) / 1000;
-	}
-
-	return 0;
-}
-
-static int sh_cpufreq_cpu_exit(struct cpufreq_policy *policy)
-{
-	unsigned int cpu = policy->cpu;
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
-
-	clk_put(cpuclk);
-
-	return 0;
-}
-
-static struct cpufreq_driver sh_cpufreq_driver = {
-	.name		= "sh",
-	.flags		= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
-	.get		= sh_cpufreq_get,
-	.target		= sh_cpufreq_target,
-	.verify		= sh_cpufreq_verify,
-	.init		= sh_cpufreq_cpu_init,
-	.exit		= sh_cpufreq_cpu_exit,
-	.attr		= cpufreq_generic_attr,
-};
-
-static int __init sh_cpufreq_module_init(void)
-{
-	pr_notice("SuperH CPU frequency driver.\n");
-	return cpufreq_register_driver(&sh_cpufreq_driver);
-}
-
-static void __exit sh_cpufreq_module_exit(void)
-{
-	cpufreq_unregister_driver(&sh_cpufreq_driver);
-}
-
-module_init(sh_cpufreq_module_init);
-module_exit(sh_cpufreq_module_exit);
-
-MODULE_AUTHOR("Paul Mundt <lethal@linux-sh.org>");
-MODULE_DESCRIPTION("cpufreq driver for SuperH");
-MODULE_LICENSE("GPL");
-- 
2.39.0

