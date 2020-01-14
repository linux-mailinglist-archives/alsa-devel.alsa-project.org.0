Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43113AACE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:24:34 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F7421EE;
	Mon, 13 Jan 2020 17:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F7421EE
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42ACF80122;
	Mon, 13 Jan 2020 17:11:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B2E8F801F7; Mon, 13 Jan 2020 17:11:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DA8F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 17:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DA8F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="W/3bnFP4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uSpe8Sne2E1LyxLKUkYJnUKYcGvq5yi6SYFkMtU67uQ=; b=W/3bnFP41Kgb
 AfrFIlWdjqyZqTZQuozCGHRt0GekDRmmqvOmEONXGt62DWzz76ROjXftlUMQ6ednu0CZPXZQxSjEe
 ZsbuoHnjHLFn1OL2WFoQHyKcdE2bLXaZcKlHO/SRMGHm5Y5+n2krO000TGrN0gItx5+OXPM6TARB0
 34seM=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir2J6-0003g8-BH; Mon, 13 Jan 2020 16:11:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 0C7ACD01965; Mon, 13 Jan 2020 16:11:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Date: Mon, 13 Jan 2020 16:11:12 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: rt1308-sdw: add rt1308 SdW amplifier
	driver" to the asoc tree
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rt1308-sdw: add rt1308 SdW amplifier driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a87a6653a28c0d511b3fdf3d62302bed5f325e03 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Fri, 10 Jan 2020 09:46:06 +0800
Subject: [PATCH] ASoC: rt1308-sdw: add rt1308 SdW amplifier driver

This is the initial amplifier driver for rt1308-sdw.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20200110014606.17333-1-shumingf@realtek.com
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig      |   6 +
 sound/soc/codecs/Makefile     |   2 +
 sound/soc/codecs/rt1308-sdw.c | 736 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt1308-sdw.h | 169 ++++++++
 4 files changed, 913 insertions(+)
 create mode 100644 sound/soc/codecs/rt1308-sdw.c
 create mode 100644 sound/soc/codecs/rt1308-sdw.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index cdfd912d5f8f..2f52e4cac96a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -168,6 +168,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_RT700_SDW if SOUNDWIRE
 	select SND_SOC_RT711_SDW if SOUNDWIRE
 	select SND_SOC_RT715_SDW if SOUNDWIRE
+	select SND_SOC_RT1308_SDW if SOUNDWIRE
 	select SND_SOC_SGTL5000 if I2C
 	select SND_SOC_SI476X if MFD_SI476X_CORE
 	select SND_SOC_SIMPLE_AMPLIFIER
@@ -1005,6 +1006,11 @@ config SND_SOC_RT1305
 config SND_SOC_RT1308
 	tristate
 
+config SND_SOC_RT1308_SDW
+	tristate "Realtek RT1308 Codec - SDW"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+
 config SND_SOC_RT5514
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ce285b33a806..66aa452f5aa2 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -154,6 +154,7 @@ snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
 snd-soc-rt1305-objs := rt1305.o
 snd-soc-rt1308-objs := rt1308.o
+snd-soc-rt1308-sdw-objs := rt1308-sdw.o
 snd-soc-rt274-objs := rt274.o
 snd-soc-rt286-objs := rt286.o
 snd-soc-rt298-objs := rt298.o
@@ -448,6 +449,7 @@ obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
 obj-$(CONFIG_SND_SOC_RT1305)	+= snd-soc-rt1305.o
 obj-$(CONFIG_SND_SOC_RT1308)	+= snd-soc-rt1308.o
+obj-$(CONFIG_SND_SOC_RT1308_SDW)	+= snd-soc-rt1308-sdw.o
 obj-$(CONFIG_SND_SOC_RT274)	+= snd-soc-rt274.o
 obj-$(CONFIG_SND_SOC_RT286)	+= snd-soc-rt286.o
 obj-$(CONFIG_SND_SOC_RT298)	+= snd-soc-rt298.o
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
new file mode 100644
index 000000000000..8a03dbfe7906
--- /dev/null
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// rt1308-sdw.c -- rt1308 ALSA SoC audio driver
+//
+// Copyright(c) 2019 Realtek Semiconductor Corp.
+//
+//
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/pm_runtime.h>
+#include <linux/mod_devicetable.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+
+#include "rt1308.h"
+#include "rt1308-sdw.h"
+
+static bool rt1308_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00e0:
+	case 0x00f0:
+	case 0x2f01 ... 0x2f07:
+	case 0x3000 ... 0x3001:
+	case 0x3004 ... 0x3005:
+	case 0x3008:
+	case 0x300a:
+	case 0xc000 ... 0xcff3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x2f01 ... 0x2f07:
+	case 0x3000 ... 0x3001:
+	case 0x3004 ... 0x3005:
+	case 0x3008:
+	case 0x300a:
+	case 0xc000:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config rt1308_sdw_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.readable_reg = rt1308_readable_register,
+	.volatile_reg = rt1308_volatile_register,
+	.max_register = 0xcfff,
+	.reg_defaults = rt1308_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt1308_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+/* Bus clock frequency */
+#define RT1308_CLK_FREQ_9600000HZ 9600000
+#define RT1308_CLK_FREQ_12000000HZ 12000000
+#define RT1308_CLK_FREQ_6000000HZ 6000000
+#define RT1308_CLK_FREQ_4800000HZ 4800000
+#define RT1308_CLK_FREQ_2400000HZ 2400000
+#define RT1308_CLK_FREQ_12288000HZ 12288000
+
+static int rt1308_clock_config(struct device *dev)
+{
+	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
+	unsigned int clk_freq, value;
+
+	clk_freq = (rt1308->params.curr_dr_freq >> 1);
+
+	switch (clk_freq) {
+	case RT1308_CLK_FREQ_12000000HZ:
+		value = 0x0;
+		break;
+	case RT1308_CLK_FREQ_6000000HZ:
+		value = 0x1;
+		break;
+	case RT1308_CLK_FREQ_9600000HZ:
+		value = 0x2;
+		break;
+	case RT1308_CLK_FREQ_4800000HZ:
+		value = 0x3;
+		break;
+	case RT1308_CLK_FREQ_2400000HZ:
+		value = 0x4;
+		break;
+	case RT1308_CLK_FREQ_12288000HZ:
+		value = 0x5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(rt1308->regmap, 0xe0, value);
+	regmap_write(rt1308->regmap, 0xf0, value);
+
+	dev_dbg(dev, "%s complete, clk_freq=%d\n", __func__, clk_freq);
+
+	return 0;
+}
+
+static int rt1308_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval, i, num_of_ports = 1;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	prop->paging_support = true;
+
+	/* first we need to allocate memory for set bits in port lists */
+	prop->source_ports = 0x00; /* BITMAP: 00010100 (not enable yet) */
+	prop->sink_ports = 0x2; /* BITMAP:  00000010 */
+
+	/* for sink */
+	nval = hweight32(prop->sink_ports);
+	num_of_ports += nval;
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+						sizeof(*prop->sink_dpn_prop),
+						GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+
+	/* Allocate port_ready based on num_of_ports */
+	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
+					sizeof(*slave->port_ready),
+					GFP_KERNEL);
+	if (!slave->port_ready)
+		return -ENOMEM;
+
+	/* Initialize completion */
+	for (i = 0; i < num_of_ports; i++)
+		init_completion(&slave->port_ready[i]);
+
+	/* set the timeout values */
+	prop->clk_stop_timeout = 20;
+
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return 0;
+}
+
+static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
+	int ret = 0;
+	unsigned int efuse_m_btl_l, efuse_m_btl_r, tmp;
+	unsigned int efuse_c_btl_l, efuse_c_btl_r;
+
+	if (rt1308->hw_init)
+		return 0;
+
+	ret = rt1308_read_prop(slave);
+	if (ret < 0)
+		goto _io_init_err_;
+
+	if (rt1308->first_hw_init) {
+		regcache_cache_only(rt1308->regmap, false);
+		regcache_cache_bypass(rt1308->regmap, true);
+	}
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!rt1308->first_hw_init) {
+		/* set autosuspend parameters */
+		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
+		pm_runtime_use_autosuspend(&slave->dev);
+
+		/* update count of parent 'active' children */
+		pm_runtime_set_active(&slave->dev);
+
+		/* make sure the device does not suspend immediately */
+		pm_runtime_mark_last_busy(&slave->dev);
+
+		pm_runtime_enable(&slave->dev);
+	}
+
+	pm_runtime_get_noresume(&slave->dev);
+
+	/* sw reset */
+	regmap_write(rt1308->regmap, RT1308_SDW_RESET, 0);
+
+	/* read efuse */
+	regmap_write(rt1308->regmap, 0xc360, 0x01);
+	regmap_write(rt1308->regmap, 0xc361, 0x80);
+	regmap_write(rt1308->regmap, 0xc7f0, 0x04);
+	regmap_write(rt1308->regmap, 0xc7f1, 0xfe);
+	msleep(100);
+	regmap_write(rt1308->regmap, 0xc7f0, 0x44);
+	msleep(20);
+	regmap_write(rt1308->regmap, 0xc240, 0x10);
+
+	regmap_read(rt1308->regmap, 0xc861, &tmp);
+	efuse_m_btl_l = tmp;
+	regmap_read(rt1308->regmap, 0xc860, &tmp);
+	efuse_m_btl_l = efuse_m_btl_l | (tmp << 8);
+	regmap_read(rt1308->regmap, 0xc863, &tmp);
+	efuse_c_btl_l = tmp;
+	regmap_read(rt1308->regmap, 0xc862, &tmp);
+	efuse_c_btl_l = efuse_c_btl_l | (tmp << 8);
+	regmap_read(rt1308->regmap, 0xc871, &tmp);
+	efuse_m_btl_r = tmp;
+	regmap_read(rt1308->regmap, 0xc870, &tmp);
+	efuse_m_btl_r = efuse_m_btl_r | (tmp << 8);
+	regmap_read(rt1308->regmap, 0xc873, &tmp);
+	efuse_c_btl_r = tmp;
+	regmap_read(rt1308->regmap, 0xc872, &tmp);
+	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
+	dev_info(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
+		efuse_m_btl_l, efuse_m_btl_r);
+	dev_info(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
+		efuse_c_btl_l, efuse_c_btl_r);
+
+	/* initial settings */
+	regmap_write(rt1308->regmap, 0xc103, 0xc0);
+	regmap_write(rt1308->regmap, 0xc030, 0x17);
+	regmap_write(rt1308->regmap, 0xc031, 0x81);
+	regmap_write(rt1308->regmap, 0xc032, 0x26);
+	regmap_write(rt1308->regmap, 0xc040, 0x80);
+	regmap_write(rt1308->regmap, 0xc041, 0x80);
+	regmap_write(rt1308->regmap, 0xc042, 0x06);
+	regmap_write(rt1308->regmap, 0xc052, 0x0a);
+	regmap_write(rt1308->regmap, 0xc080, 0x0a);
+	regmap_write(rt1308->regmap, 0xc060, 0x02);
+	regmap_write(rt1308->regmap, 0xc061, 0x75);
+	regmap_write(rt1308->regmap, 0xc062, 0x05);
+	regmap_write(rt1308->regmap, 0xc171, 0x07);
+	regmap_write(rt1308->regmap, 0xc173, 0x0d);
+	regmap_write(rt1308->regmap, 0xc311, 0x7f);
+	regmap_write(rt1308->regmap, 0xc900, 0x90);
+	regmap_write(rt1308->regmap, 0xc1a0, 0x84);
+	regmap_write(rt1308->regmap, 0xc1a1, 0x01);
+	regmap_write(rt1308->regmap, 0xc360, 0x78);
+	regmap_write(rt1308->regmap, 0xc361, 0x87);
+	regmap_write(rt1308->regmap, 0xc0a1, 0x71);
+	regmap_write(rt1308->regmap, 0xc210, 0x00);
+	regmap_write(rt1308->regmap, 0xc070, 0x00);
+	regmap_write(rt1308->regmap, 0xc100, 0xd7);
+	regmap_write(rt1308->regmap, 0xc101, 0xd7);
+	regmap_write(rt1308->regmap, 0xc300, 0x09);
+
+	if (rt1308->first_hw_init) {
+		regcache_cache_bypass(rt1308->regmap, false);
+		regcache_mark_dirty(rt1308->regmap);
+	} else
+		rt1308->first_hw_init = true;
+
+	/* Mark Slave initialization complete */
+	rt1308->hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+
+_io_init_err_:
+	return ret;
+}
+
+static int rt1308_update_status(struct sdw_slave *slave,
+					enum sdw_slave_status status)
+{
+	struct  rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt1308->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		rt1308->hw_init = false;
+
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt1308->hw_init || rt1308->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt1308_io_init(&slave->dev, slave);
+}
+
+static int rt1308_bus_config(struct sdw_slave *slave,
+				struct sdw_bus_params *params)
+{
+	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
+	int ret;
+
+	memcpy(&rt1308->params, params, sizeof(*params));
+
+	ret = rt1308_clock_config(&slave->dev);
+	if (ret < 0)
+		dev_err(&slave->dev, "Invalid clk config");
+
+	return ret;
+}
+
+static int rt1308_interrupt_callback(struct sdw_slave *slave,
+					struct sdw_slave_intr_status *status)
+{
+	dev_dbg(&slave->dev,
+		"%s control_port_stat=%x", __func__, status->control_port);
+
+	return 0;
+}
+
+static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		msleep(30);
+		snd_soc_component_update_bits(component,
+			RT1308_SDW_OFFSET | (RT1308_POWER_STATUS << 4),
+			0x3,	0x3);
+		msleep(40);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(component,
+			RT1308_SDW_OFFSET | (RT1308_POWER_STATUS << 4),
+			0x3, 0);
+		usleep_range(150000, 200000);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const char * const rt1308_rx_data_ch_select[] = {
+	"LR",
+	"LL",
+	"RL",
+	"RR",
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1308_rx_data_ch_enum,
+	RT1308_SDW_OFFSET | (RT1308_DATA_PATH << 4), 0,
+	rt1308_rx_data_ch_select);
+
+static const struct snd_kcontrol_new rt1308_snd_controls[] = {
+
+	/* I2S Data Channel Selection */
+	SOC_ENUM("RX Channel Select", rt1308_rx_data_ch_enum),
+};
+
+static const struct snd_kcontrol_new rt1308_sto_dac_l =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch",
+		RT1308_SDW_OFFSET_BYTE3 | (RT1308_DAC_SET << 4),
+		RT1308_DVOL_MUTE_L_EN_SFT, 1, 1);
+
+static const struct snd_kcontrol_new rt1308_sto_dac_r =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch",
+		RT1308_SDW_OFFSET_BYTE3 | (RT1308_DAC_SET << 4),
+		RT1308_DVOL_MUTE_R_EN_SFT, 1, 1);
+
+static const struct snd_soc_dapm_widget rt1308_dapm_widgets[] = {
+	/* Audio Interface */
+	SND_SOC_DAPM_AIF_IN("AIF1RX", "DP1 Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	/* Supply Widgets */
+	SND_SOC_DAPM_SUPPLY("MBIAS20U",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ALDO",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	6, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DBG",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DACL",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CLK25M",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC_R",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC_L",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Power",
+		RT1308_SDW_OFFSET | (RT1308_POWER << 4),	3, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY("DLDO",
+		RT1308_SDW_OFFSET_BYTE1 | (RT1308_POWER << 4),	5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VREF",
+		RT1308_SDW_OFFSET_BYTE1 | (RT1308_POWER << 4),	4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIXER_R",
+		RT1308_SDW_OFFSET_BYTE1 | (RT1308_POWER << 4),	2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIXER_L",
+		RT1308_SDW_OFFSET_BYTE1 | (RT1308_POWER << 4),	1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MBIAS4U",
+		RT1308_SDW_OFFSET_BYTE1 | (RT1308_POWER << 4),	0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY("PLL2_LDO",
+		RT1308_SDW_OFFSET_BYTE2 | (RT1308_POWER << 4), 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2B",
+		RT1308_SDW_OFFSET_BYTE2 | (RT1308_POWER << 4), 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2F",
+		RT1308_SDW_OFFSET_BYTE2 | (RT1308_POWER << 4), 2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2F2",
+		RT1308_SDW_OFFSET_BYTE2 | (RT1308_POWER << 4), 1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2B2",
+		RT1308_SDW_OFFSET_BYTE2 | (RT1308_POWER << 4), 0, 0, NULL, 0),
+
+	/* Digital Interface */
+	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SWITCH("DAC L", SND_SOC_NOPM, 0, 0, &rt1308_sto_dac_l),
+	SND_SOC_DAPM_SWITCH("DAC R", SND_SOC_NOPM, 0, 0, &rt1308_sto_dac_r),
+
+	/* Output Lines */
+	SND_SOC_DAPM_PGA_E("CLASS D", SND_SOC_NOPM, 0, 0, NULL, 0,
+		rt1308_classd_event,
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_OUTPUT("SPOL"),
+	SND_SOC_DAPM_OUTPUT("SPOR"),
+};
+
+static const struct snd_soc_dapm_route rt1308_dapm_routes[] = {
+
+	{ "DAC", NULL, "AIF1RX" },
+
+	{ "DAC", NULL, "MBIAS20U" },
+	{ "DAC", NULL, "ALDO" },
+	{ "DAC", NULL, "DBG" },
+	{ "DAC", NULL, "DACL" },
+	{ "DAC", NULL, "CLK25M" },
+	{ "DAC", NULL, "ADC_R" },
+	{ "DAC", NULL, "ADC_L" },
+	{ "DAC", NULL, "DLDO" },
+	{ "DAC", NULL, "VREF" },
+	{ "DAC", NULL, "MIXER_R" },
+	{ "DAC", NULL, "MIXER_L" },
+	{ "DAC", NULL, "MBIAS4U" },
+	{ "DAC", NULL, "PLL2_LDO" },
+	{ "DAC", NULL, "PLL2B" },
+	{ "DAC", NULL, "PLL2F" },
+	{ "DAC", NULL, "PLL2F2" },
+	{ "DAC", NULL, "PLL2B2" },
+
+	{ "DAC L", "Switch", "DAC" },
+	{ "DAC R", "Switch", "DAC" },
+	{ "DAC L", NULL, "DAC Power" },
+	{ "DAC R", NULL, "DAC Power" },
+
+	{ "CLASS D", NULL, "DAC L" },
+	{ "CLASS D", NULL, "DAC R" },
+	{ "SPOL", NULL, "CLASS D" },
+	{ "SPOR", NULL, "CLASS D" },
+};
+
+static int rt1308_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				int direction)
+{
+	struct sdw_stream_data *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+
+	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_dma_data = stream;
+	else
+		dai->capture_dma_data = stream;
+
+	return 0;
+}
+
+static void rt1308_sdw_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1308_sdw_priv *rt1308 =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int retval, port, num_channels;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -EINVAL;
+
+	if (!rt1308->sdw_slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	/* port 1 for playback */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		port = 1;
+	} else {
+		return -EINVAL;
+	}
+
+	stream_config.frame_rate = params_rate(params);
+	stream_config.ch_count = params_channels(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+
+	num_channels = params_channels(params);
+	port_config.ch_mask = (1 << (num_channels)) - 1;
+	port_config.num = port;
+
+	retval = sdw_stream_add_slave(rt1308->sdw_slave, &stream_config,
+				&port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	return retval;
+}
+
+static int rt1308_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1308_sdw_priv *rt1308 =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt1308->sdw_slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt1308->sdw_slave, stream->sdw_stream);
+	return 0;
+}
+
+/*
+ * slave_ops: callbacks for get_clock_stop_mode, clock_stop and
+ * port_prep are not defined for now
+ */
+static struct sdw_slave_ops rt1308_slave_ops = {
+	.read_prop = rt1308_read_prop,
+	.interrupt_callback = rt1308_interrupt_callback,
+	.update_status = rt1308_update_status,
+	.bus_config = rt1308_bus_config,
+};
+
+static const struct snd_soc_component_driver soc_component_sdw_rt1308 = {
+	.controls = rt1308_snd_controls,
+	.num_controls = ARRAY_SIZE(rt1308_snd_controls),
+	.dapm_widgets = rt1308_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt1308_dapm_widgets),
+	.dapm_routes = rt1308_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rt1308_dapm_routes),
+};
+
+static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
+	.hw_params = rt1308_sdw_hw_params,
+	.hw_free	= rt1308_sdw_pcm_hw_free,
+	.set_sdw_stream	= rt1308_set_sdw_stream,
+	.shutdown	= rt1308_sdw_shutdown,
+};
+
+#define RT1308_STEREO_RATES SNDRV_PCM_RATE_48000
+#define RT1308_FORMATS (SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+static struct snd_soc_dai_driver rt1308_sdw_dai[] = {
+	{
+		.name = "rt1308-aif",
+		.playback = {
+			.stream_name = "DP1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT1308_STEREO_RATES,
+			.formats = RT1308_FORMATS,
+		},
+		.ops = &rt1308_aif_dai_ops,
+	},
+};
+
+static int rt1308_sdw_init(struct device *dev, struct regmap *regmap,
+				struct sdw_slave *slave)
+{
+	struct rt1308_sdw_priv *rt1308;
+	int ret;
+
+	rt1308 = devm_kzalloc(dev, sizeof(*rt1308), GFP_KERNEL);
+	if (!rt1308)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt1308);
+	rt1308->sdw_slave = slave;
+	rt1308->regmap = regmap;
+
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt1308->hw_init = false;
+	rt1308->first_hw_init = false;
+
+	ret =  devm_snd_soc_register_component(dev,
+				&soc_component_sdw_rt1308,
+				rt1308_sdw_dai,
+				ARRAY_SIZE(rt1308_sdw_dai));
+
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return ret;
+}
+
+static int rt1308_sdw_probe(struct sdw_slave *slave,
+				const struct sdw_device_id *id)
+{
+	struct regmap *regmap;
+
+	/* Assign ops */
+	slave->ops = &rt1308_slave_ops;
+
+	/* Regmap Initialization */
+	regmap = devm_regmap_init_sdw(slave, &rt1308_sdw_regmap);
+	if (!regmap)
+		return -EINVAL;
+
+	rt1308_sdw_init(&slave->dev, regmap, slave);
+
+	return 0;
+}
+
+static const struct sdw_device_id rt1308_id[] = {
+	SDW_SLAVE_ENTRY(0x025d, 0x1308, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt1308_id);
+
+static int rt1308_dev_suspend(struct device *dev)
+{
+	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
+
+	if (!rt1308->hw_init)
+		return 0;
+
+	regcache_cache_only(rt1308->regmap, true);
+
+	return 0;
+}
+
+#define RT1308_PROBE_TIMEOUT 2000
+
+static int rt1308_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!rt1308->hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(rt1308->regmap, false);
+	regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rt1308_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt1308_dev_suspend, rt1308_dev_resume)
+	SET_RUNTIME_PM_OPS(rt1308_dev_suspend, rt1308_dev_resume, NULL)
+};
+
+static struct sdw_driver rt1308_sdw_driver = {
+	.driver = {
+		.name = "rt1308",
+		.owner = THIS_MODULE,
+		.pm = &rt1308_pm,
+	},
+	.probe = rt1308_sdw_probe,
+	.ops = &rt1308_slave_ops,
+	.id_table = rt1308_id,
+};
+module_sdw_driver(rt1308_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT1308 driver SDW");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
new file mode 100644
index 000000000000..c9341e70d6cf
--- /dev/null
+++ b/sound/soc/codecs/rt1308-sdw.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rt1308-sdw.h -- RT1308 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT1308_SDW_H__
+#define __RT1308_SDW_H__
+
+static const struct reg_default rt1308_reg_defaults[] = {
+	{ 0x0000, 0x00 },
+	{ 0x0001, 0x00 },
+	{ 0x0002, 0x00 },
+	{ 0x0003, 0x00 },
+	{ 0x0004, 0x00 },
+	{ 0x0005, 0x01 },
+	{ 0x0020, 0x00 },
+	{ 0x0022, 0x00 },
+	{ 0x0023, 0x00 },
+	{ 0x0024, 0x00 },
+	{ 0x0025, 0x00 },
+	{ 0x0026, 0x00 },
+	{ 0x0030, 0x00 },
+	{ 0x0032, 0x00 },
+	{ 0x0033, 0x00 },
+	{ 0x0034, 0x00 },
+	{ 0x0035, 0x00 },
+	{ 0x0036, 0x00 },
+	{ 0x0040, 0x00 },
+	{ 0x0041, 0x00 },
+	{ 0x0042, 0x00 },
+	{ 0x0043, 0x00 },
+	{ 0x0044, 0x20 },
+	{ 0x0045, 0x01 },
+	{ 0x0046, 0x01 },
+	{ 0x0048, 0x00 },
+	{ 0x0049, 0x00 },
+	{ 0x0050, 0x20 },
+	{ 0x0051, 0x02 },
+	{ 0x0052, 0x5D },
+	{ 0x0053, 0x13 },
+	{ 0x0054, 0x08 },
+	{ 0x0055, 0x00 },
+	{ 0x0060, 0x00 },
+	{ 0x0070, 0x00 },
+	{ 0x00E0, 0x00 },
+	{ 0x00F0, 0x00 },
+	{ 0x0100, 0x00 },
+	{ 0x0101, 0x00 },
+	{ 0x0102, 0x20 },
+	{ 0x0103, 0x00 },
+	{ 0x0104, 0x00 },
+	{ 0x0105, 0x03 },
+	{ 0x0120, 0x00 },
+	{ 0x0122, 0x00 },
+	{ 0x0123, 0x00 },
+	{ 0x0124, 0x00 },
+	{ 0x0125, 0x00 },
+	{ 0x0126, 0x00 },
+	{ 0x0127, 0x00 },
+	{ 0x0130, 0x00 },
+	{ 0x0132, 0x00 },
+	{ 0x0133, 0x00 },
+	{ 0x0134, 0x00 },
+	{ 0x0135, 0x00 },
+	{ 0x0136, 0x00 },
+	{ 0x0137, 0x00 },
+	{ 0x0200, 0x00 },
+	{ 0x0201, 0x00 },
+	{ 0x0202, 0x00 },
+	{ 0x0203, 0x00 },
+	{ 0x0204, 0x00 },
+	{ 0x0205, 0x03 },
+	{ 0x0220, 0x00 },
+	{ 0x0222, 0x00 },
+	{ 0x0223, 0x00 },
+	{ 0x0224, 0x00 },
+	{ 0x0225, 0x00 },
+	{ 0x0226, 0x00 },
+	{ 0x0227, 0x00 },
+	{ 0x0230, 0x00 },
+	{ 0x0232, 0x00 },
+	{ 0x0233, 0x00 },
+	{ 0x0234, 0x00 },
+	{ 0x0235, 0x00 },
+	{ 0x0236, 0x00 },
+	{ 0x0237, 0x00 },
+	{ 0x0400, 0x00 },
+	{ 0x0401, 0x00 },
+	{ 0x0402, 0x00 },
+	{ 0x0403, 0x00 },
+	{ 0x0404, 0x00 },
+	{ 0x0405, 0x03 },
+	{ 0x0420, 0x00 },
+	{ 0x0422, 0x00 },
+	{ 0x0423, 0x00 },
+	{ 0x0424, 0x00 },
+	{ 0x0425, 0x00 },
+	{ 0x0426, 0x00 },
+	{ 0x0427, 0x00 },
+	{ 0x0430, 0x00 },
+	{ 0x0432, 0x00 },
+	{ 0x0433, 0x00 },
+	{ 0x0434, 0x00 },
+	{ 0x0435, 0x00 },
+	{ 0x0436, 0x00 },
+	{ 0x0437, 0x00 },
+	{ 0x0f00, 0x00 },
+	{ 0x0f01, 0x00 },
+	{ 0x0f02, 0x00 },
+	{ 0x0f03, 0x00 },
+	{ 0x0f04, 0x00 },
+	{ 0x0f05, 0x00 },
+	{ 0x0f20, 0x00 },
+	{ 0x0f22, 0x00 },
+	{ 0x0f23, 0x00 },
+	{ 0x0f24, 0x00 },
+	{ 0x0f25, 0x00 },
+	{ 0x0f26, 0x00 },
+	{ 0x0f27, 0x00 },
+	{ 0x0f30, 0x00 },
+	{ 0x0f32, 0x00 },
+	{ 0x0f33, 0x00 },
+	{ 0x0f34, 0x00 },
+	{ 0x0f35, 0x00 },
+	{ 0x0f36, 0x00 },
+	{ 0x0f37, 0x00 },
+	{ 0x2f01, 0x01 },
+	{ 0x2f02, 0x09 },
+	{ 0x2f03, 0x00 },
+	{ 0x2f04, 0x0f },
+	{ 0x2f05, 0x0b },
+	{ 0x2f06, 0x01 },
+	{ 0x2f07, 0x8e },
+	{ 0x3000, 0x00 },
+	{ 0x3001, 0x00 },
+	{ 0x3004, 0x01 },
+	{ 0x3005, 0x23 },
+	{ 0x3008, 0x02 },
+	{ 0x300a, 0x00 },
+	{ 0xc003 | (RT1308_DAC_SET << 4), 0x00 },
+	{ 0xc001 | (RT1308_POWER << 4), 0x00 },
+	{ 0xc002 | (RT1308_POWER << 4), 0x00 },
+};
+
+#define RT1308_SDW_OFFSET 0xc000
+#define RT1308_SDW_OFFSET_BYTE0 0xc000
+#define RT1308_SDW_OFFSET_BYTE1 0xc001
+#define RT1308_SDW_OFFSET_BYTE2 0xc002
+#define RT1308_SDW_OFFSET_BYTE3 0xc003
+
+#define RT1308_SDW_RESET (RT1308_SDW_OFFSET | (RT1308_RESET << 4))
+
+struct rt1308_sdw_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct sdw_slave *sdw_slave;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_hw_init;
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+#endif /* __RT1308_SDW_H__ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
