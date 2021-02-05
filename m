Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D241831096D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 11:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35EA167F;
	Fri,  5 Feb 2021 11:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35EA167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612522022;
	bh=acw9w7j2IrewCSWWG6l0uVDDcf1Vt9hX8Pa2Qus98A4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvwncncMl7LCMes1dzzYSnN/To1ufjDrXuQx9gk3MdjD8lk5fkiX6sP/lt5ZVeYeG
	 HdtiOl8VRcqAGRxNjRKcAykmxPaxVsOrZrinytyxa4Yczy0u9FHdqyJqhkcaFAolFP
	 AR7WcQVQgGbNfThBjqiqtCzIyto4Gmg4egcGcemo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43440F802A0;
	Fri,  5 Feb 2021 11:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 483A6F80290; Fri,  5 Feb 2021 11:45:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C40BF80277
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 11:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C40BF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="Bil8WcOE"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115AeiHv023391; Fri, 5 Feb 2021 11:45:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vn7AJEws6oioE8XLmvySJJ+6r15eUGv/1k+XuTuQR34=;
 b=Bil8WcOE5ccWIc4Ew3ISYKO9otzAk0J9XJUraBgIiGCqq9R5RG73pR6r2Twh9e4/DxnZ
 fJJSiwQCwVblfVB3IMrsslLyVT7Lx/x7Gatd9jUMSrU7dpiR/r7lyuUQIHVRxALZ11ss
 A9XlWWGiv+Pw1y/j35g7159v+O6n8hiPU+fT5QDxhi3okGYL5sdCavR0HRlL3g0DG7/4
 1mMxJnLqTSl9EWQkYZWMBOCPxlh41RCDSZWRJdOfnhSrepiRjJeC96FpyuPIb4ZODGD7
 x4alRXIv5sxKgGKyhABDKsD0BM+ss3w3MTo/kchE8qghQMeA8TciMTbycTvELYr4oqZV bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hfpb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 11:45:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D43A210002A;
 Fri,  5 Feb 2021 11:45:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD22E2298CD;
 Fri,  5 Feb 2021 11:45:03 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 11:45:03
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@st.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@st.com>, "Rob
 Herring" <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [RESEND PATCH 2/2] ASoC: stm32: i2s: add master clock provider
Date: Fri, 5 Feb 2021 11:44:04 +0100
Message-ID: <20210205104404.18786-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205104404.18786-1-olivier.moysan@foss.st.com>
References: <20210205104404.18786-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Olivier Moysan <olivier.moysan@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Olivier Moysan <olivier.moysan@st.com>

Add master clock generation support in STM32 I2S driver.
The master clock provided by I2S can be used to feed a codec.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_i2s.c | 310 ++++++++++++++++++++++++++++++++------
 1 file changed, 266 insertions(+), 44 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 7c4d63c33f15..7d1672cf78cc 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
@@ -196,6 +197,9 @@ enum i2s_datlen {
 #define STM32_I2S_IS_MASTER(x)		((x)->ms_flg == I2S_MS_MASTER)
 #define STM32_I2S_IS_SLAVE(x)		((x)->ms_flg == I2S_MS_SLAVE)
 
+#define STM32_I2S_NAME_LEN		32
+#define STM32_I2S_RATE_11K		11025
+
 /**
  * struct stm32_i2s_data - private data of I2S
  * @regmap_conf: I2S register map configuration pointer
@@ -206,6 +210,7 @@ enum i2s_datlen {
  * @dma_data_rx: dma configuration data for tx channel
  * @substream: PCM substream data pointer
  * @i2sclk: kernel clock feeding the I2S clock generator
+ * @i2smclk: master clock from I2S mclk provider
  * @pclk: peripheral clock driving bus interface
  * @x8kclk: I2S parent clock for sampling frequencies multiple of 8kHz
  * @x11kclk: I2S parent clock for sampling frequencies multiple of 11kHz
@@ -215,6 +220,9 @@ enum i2s_datlen {
  * @irq_lock: prevent race condition with IRQ
  * @mclk_rate: master clock frequency (Hz)
  * @fmt: DAI protocol
+ * @divider: prescaler division ratio
+ * @div: prescaler div field
+ * @odd: prescaler odd field
  * @refcount: keep count of opened streams on I2S
  * @ms_flg: master mode flag.
  */
@@ -227,6 +235,7 @@ struct stm32_i2s_data {
 	struct snd_dmaengine_dai_dma_data dma_data_rx;
 	struct snd_pcm_substream *substream;
 	struct clk *i2sclk;
+	struct clk *i2smclk;
 	struct clk *pclk;
 	struct clk *x8kclk;
 	struct clk *x11kclk;
@@ -236,10 +245,210 @@ struct stm32_i2s_data {
 	spinlock_t irq_lock; /* used to prevent race condition with IRQ */
 	unsigned int mclk_rate;
 	unsigned int fmt;
+	unsigned int divider;
+	unsigned int div;
+	bool odd;
 	int refcount;
 	int ms_flg;
 };
 
+struct stm32_i2smclk_data {
+	struct clk_hw hw;
+	unsigned long freq;
+	struct stm32_i2s_data *i2s_data;
+};
+
+#define to_mclk_data(_hw) container_of(_hw, struct stm32_i2smclk_data, hw)
+
+static int stm32_i2s_calc_clk_div(struct stm32_i2s_data *i2s,
+				  unsigned long input_rate,
+				  unsigned long output_rate)
+{
+	unsigned int ratio, div, divider = 1;
+	bool odd;
+
+	ratio = DIV_ROUND_CLOSEST(input_rate, output_rate);
+
+	/* Check the parity of the divider */
+	odd = ratio & 0x1;
+
+	/* Compute the div prescaler */
+	div = ratio >> 1;
+
+	/* If div is 0 actual divider is 1 */
+	if (div) {
+		divider = ((2 * div) + odd);
+		dev_dbg(&i2s->pdev->dev, "Divider: 2*%d(div)+%d(odd) = %d\n",
+			div, odd, divider);
+	}
+
+	/* Division by three is not allowed by I2S prescaler */
+	if ((div == 1 && odd) || div > I2S_CGFR_I2SDIV_MAX) {
+		dev_err(&i2s->pdev->dev, "Wrong divider setting\n");
+		return -EINVAL;
+	}
+
+	if (input_rate % divider)
+		dev_dbg(&i2s->pdev->dev,
+			"Rate not accurate. requested (%ld), actual (%ld)\n",
+			output_rate, input_rate / divider);
+
+	i2s->div = div;
+	i2s->odd = odd;
+	i2s->divider = divider;
+
+	return 0;
+}
+
+static int stm32_i2s_set_clk_div(struct stm32_i2s_data *i2s)
+{
+	u32 cgfr, cgfr_mask;
+
+	cgfr = I2S_CGFR_I2SDIV_SET(i2s->div) | (i2s->odd << I2S_CGFR_ODD_SHIFT);
+	cgfr_mask = I2S_CGFR_I2SDIV_MASK | I2S_CGFR_ODD;
+
+	return regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
+				  cgfr_mask, cgfr);
+}
+
+static int stm32_i2s_set_parent_clock(struct stm32_i2s_data *i2s,
+				      unsigned int rate)
+{
+	struct platform_device *pdev = i2s->pdev;
+	struct clk *parent_clk;
+	int ret;
+
+	if (!(rate % STM32_I2S_RATE_11K))
+		parent_clk = i2s->x11kclk;
+	else
+		parent_clk = i2s->x8kclk;
+
+	ret = clk_set_parent(i2s->i2sclk, parent_clk);
+	if (ret)
+		dev_err(&pdev->dev,
+			"Error %d setting i2sclk parent clock\n", ret);
+
+	return ret;
+}
+
+static long stm32_i2smclk_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
+{
+	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
+	struct stm32_i2s_data *i2s = mclk->i2s_data;
+	int ret;
+
+	ret = stm32_i2s_calc_clk_div(i2s, *prate, rate);
+	if (ret)
+		return ret;
+
+	mclk->freq = *prate / i2s->divider;
+
+	return mclk->freq;
+}
+
+static unsigned long stm32_i2smclk_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
+
+	return mclk->freq;
+}
+
+static int stm32_i2smclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
+	struct stm32_i2s_data *i2s = mclk->i2s_data;
+	int ret;
+
+	ret = stm32_i2s_calc_clk_div(i2s, parent_rate, rate);
+	if (ret)
+		return ret;
+
+	ret = stm32_i2s_set_clk_div(i2s);
+	if (ret)
+		return ret;
+
+	mclk->freq = rate;
+
+	return 0;
+}
+
+static int stm32_i2smclk_enable(struct clk_hw *hw)
+{
+	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
+	struct stm32_i2s_data *i2s = mclk->i2s_data;
+
+	dev_dbg(&i2s->pdev->dev, "Enable master clock\n");
+
+	return regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
+				    I2S_CGFR_MCKOE, I2S_CGFR_MCKOE);
+}
+
+static void stm32_i2smclk_disable(struct clk_hw *hw)
+{
+	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
+	struct stm32_i2s_data *i2s = mclk->i2s_data;
+
+	dev_dbg(&i2s->pdev->dev, "Disable master clock\n");
+
+	regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG, I2S_CGFR_MCKOE, 0);
+}
+
+static const struct clk_ops mclk_ops = {
+	.enable = stm32_i2smclk_enable,
+	.disable = stm32_i2smclk_disable,
+	.recalc_rate = stm32_i2smclk_recalc_rate,
+	.round_rate = stm32_i2smclk_round_rate,
+	.set_rate = stm32_i2smclk_set_rate,
+};
+
+static int stm32_i2s_add_mclk_provider(struct stm32_i2s_data *i2s)
+{
+	struct clk_hw *hw;
+	struct stm32_i2smclk_data *mclk;
+	struct device *dev = &i2s->pdev->dev;
+	const char *pname = __clk_get_name(i2s->i2sclk);
+	char *mclk_name, *p, *s = (char *)pname;
+	int ret, i = 0;
+
+	mclk = devm_kzalloc(dev, sizeof(*mclk), GFP_KERNEL);
+	if (!mclk)
+		return -ENOMEM;
+
+	mclk_name = devm_kcalloc(dev, sizeof(char),
+				 STM32_I2S_NAME_LEN, GFP_KERNEL);
+	if (!mclk_name)
+		return -ENOMEM;
+
+	/*
+	 * Forge mclk clock name from parent clock name and suffix.
+	 * String after "_" char is stripped in parent name.
+	 */
+	p = mclk_name;
+	while (*s && *s != '_' && (i < (STM32_I2S_NAME_LEN - 7))) {
+		*p++ = *s++;
+		i++;
+	}
+	strcat(p, "_mclk");
+
+	mclk->hw.init = CLK_HW_INIT(mclk_name, pname, &mclk_ops, 0);
+	mclk->i2s_data = i2s;
+	hw = &mclk->hw;
+
+	dev_dbg(dev, "Register master clock %s\n", mclk_name);
+	ret = devm_clk_hw_register(&i2s->pdev->dev, hw);
+	if (ret) {
+		dev_err(dev, "mclk register fails with error %d\n", ret);
+		return ret;
+	}
+	i2s->i2smclk = hw->clk;
+
+	/* register mclk provider */
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+}
+
 static irqreturn_t stm32_i2s_isr(int irq, void *devid)
 {
 	struct stm32_i2s_data *i2s = (struct stm32_i2s_data *)devid;
@@ -405,18 +614,46 @@ static int stm32_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
 				int clk_id, unsigned int freq, int dir)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
+	int ret = 0;
 
-	dev_dbg(cpu_dai->dev, "I2S MCLK frequency is %uHz\n", freq);
+	dev_dbg(cpu_dai->dev, "I2S MCLK frequency is %uHz. mode: %s, dir: %s\n",
+		freq, STM32_I2S_IS_MASTER(i2s) ? "master" : "slave",
+		dir ? "output" : "input");
 
-	if ((dir == SND_SOC_CLOCK_OUT) && STM32_I2S_IS_MASTER(i2s)) {
-		i2s->mclk_rate = freq;
+	/* MCLK generation is available only in master mode */
+	if (dir == SND_SOC_CLOCK_OUT && STM32_I2S_IS_MASTER(i2s)) {
+		if (!i2s->i2smclk) {
+			dev_dbg(cpu_dai->dev, "No MCLK registered\n");
+			return 0;
+		}
 
-		/* Enable master clock if master mode and mclk-fs are set */
-		return regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-					  I2S_CGFR_MCKOE, I2S_CGFR_MCKOE);
+		/* Assume shutdown if requested frequency is 0Hz */
+		if (!freq) {
+			/* Release mclk rate only if rate was actually set */
+			if (i2s->mclk_rate) {
+				clk_rate_exclusive_put(i2s->i2smclk);
+				i2s->mclk_rate = 0;
+			}
+			return regmap_update_bits(i2s->regmap,
+						  STM32_I2S_CGFR_REG,
+						  I2S_CGFR_MCKOE, 0);
+		}
+		/* If master clock is used, set parent clock now */
+		ret = stm32_i2s_set_parent_clock(i2s, freq);
+		if (ret)
+			return ret;
+		ret = clk_set_rate_exclusive(i2s->i2smclk, freq);
+		if (ret) {
+			dev_err(cpu_dai->dev, "Could not set mclk rate\n");
+			return ret;
+		}
+		ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
+					 I2S_CGFR_MCKOE, I2S_CGFR_MCKOE);
+		if (!ret)
+			i2s->mclk_rate = freq;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int stm32_i2s_configure_clock(struct snd_soc_dai *cpu_dai,
@@ -424,11 +661,10 @@ static int stm32_i2s_configure_clock(struct snd_soc_dai *cpu_dai,
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned long i2s_clock_rate;
-	unsigned int tmp, div, real_div, nb_bits, frame_len;
+	unsigned int nb_bits, frame_len;
 	unsigned int rate = params_rate(params);
+	u32 cgfr;
 	int ret;
-	u32 cgfr, cgfr_mask;
-	bool odd;
 
 	if (!(rate % 11025))
 		clk_set_parent(i2s->i2sclk, i2s->x11kclk);
@@ -449,7 +685,10 @@ static int stm32_i2s_configure_clock(struct snd_soc_dai *cpu_dai,
 	 *   dsp mode : div = i2s_clk / (nb_bits x ws)
 	 */
 	if (i2s->mclk_rate) {
-		tmp = DIV_ROUND_CLOSEST(i2s_clock_rate, i2s->mclk_rate);
+		ret = stm32_i2s_calc_clk_div(i2s, i2s_clock_rate,
+					     i2s->mclk_rate);
+		if (ret)
+			return ret;
 	} else {
 		frame_len = 32;
 		if ((i2s->fmt & SND_SOC_DAIFMT_FORMAT_MASK) ==
@@ -462,34 +701,13 @@ static int stm32_i2s_configure_clock(struct snd_soc_dai *cpu_dai,
 			return ret;
 
 		nb_bits = frame_len * ((cgfr & I2S_CGFR_CHLEN) + 1);
-		tmp = DIV_ROUND_CLOSEST(i2s_clock_rate, (nb_bits * rate));
-	}
-
-	/* Check the parity of the divider */
-	odd = tmp & 0x1;
-
-	/* Compute the div prescaler */
-	div = tmp >> 1;
-
-	cgfr = I2S_CGFR_I2SDIV_SET(div) | (odd << I2S_CGFR_ODD_SHIFT);
-	cgfr_mask = I2S_CGFR_I2SDIV_MASK | I2S_CGFR_ODD;
-
-	real_div = ((2 * div) + odd);
-	dev_dbg(cpu_dai->dev, "I2S clk: %ld, SCLK: %d\n",
-		i2s_clock_rate, rate);
-	dev_dbg(cpu_dai->dev, "Divider: 2*%d(div)+%d(odd) = %d\n",
-		div, odd, real_div);
-
-	if (((div == 1) && odd) || (div > I2S_CGFR_I2SDIV_MAX)) {
-		dev_err(cpu_dai->dev, "Wrong divider setting\n");
-		return -EINVAL;
+		ret = stm32_i2s_calc_clk_div(i2s, i2s_clock_rate,
+					     (nb_bits * rate));
+		if (ret)
+			return ret;
 	}
 
-	if (!div && !odd)
-		dev_warn(cpu_dai->dev, "real divider forced to 1\n");
-
-	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-				 cgfr_mask, cgfr);
+	ret = stm32_i2s_set_clk_div(i2s);
 	if (ret < 0)
 		return ret;
 
@@ -694,9 +912,6 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned long flags;
 
-	regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-			   I2S_CGFR_MCKOE, (unsigned int)~I2S_CGFR_MCKOE);
-
 	clk_disable_unprepare(i2s->i2sclk);
 
 	spin_lock_irqsave(&i2s->irq_lock, flags);
@@ -861,6 +1076,13 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 		return PTR_ERR(i2s->x11kclk);
 	}
 
+	/* Register mclk provider if requested */
+	if (of_find_property(np, "#clock-cells", NULL)) {
+		ret = stm32_i2s_add_mclk_provider(i2s);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Get irqs */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -906,16 +1128,16 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	if (!i2s)
 		return -ENOMEM;
 
-	ret = stm32_i2s_parse_dt(pdev, i2s);
-	if (ret)
-		return ret;
-
 	i2s->pdev = pdev;
 	i2s->ms_flg = I2S_MS_NOT_SET;
 	spin_lock_init(&i2s->lock_fd);
 	spin_lock_init(&i2s->irq_lock);
 	platform_set_drvdata(pdev, i2s);
 
+	ret = stm32_i2s_parse_dt(pdev, i2s);
+	if (ret)
+		return ret;
+
 	ret = stm32_i2s_dais_init(pdev, i2s);
 	if (ret)
 		return ret;
-- 
2.17.1

