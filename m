Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964612A8DE
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 19:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3DFB16DF;
	Wed, 25 Dec 2019 19:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3DFB16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577298412;
	bh=VSbUJUyqd1LtshulYE02XRdzojQ9aViwUClM00ZGCy4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FsFHQSQJRrZJ/HJmzVQLyscPJOE8gzJTPLUknGK1x5b81cXdWSwMgkWLCtRjzzHdm
	 /Ii6KSaywnO/Zez/QhSMX3KJJlAOedxiB+AkEIWEazP2B0I53uIlz8R2XHEuJfAtNU
	 hqBMQG/a5qUhQHe5Yz7wAWTa/ikktsGI7qJxxKuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E086CF8028B;
	Wed, 25 Dec 2019 19:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD55F8026F; Wed, 25 Dec 2019 19:21:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1DA9F80145
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 19:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1DA9F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oG5p1Y2O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6iKx/OITC6JDNqiXA1044oHFDCO8iRAqkxW2vx+u3BA=; b=oG5p1Y2Oioto
 EB9Rc1Mux3nxPIYo3tuw5d9pPKZK9iuZhtoZVJk/t5MHkfqfzRAYUjjDsXoisC07Lnkt5cpT80i03
 5LD2oaWTrUJBnFVO61SOQy5CoQzCXjUOKrGeE2AP62cun2wV2+9hVYVAgofklY9xSRXeQbGyuQiOF
 juHO4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikBI6-0001oN-1J; Wed, 25 Dec 2019 18:21:50 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8C6DED01A24; Wed, 25 Dec 2019 18:21:49 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 18:21:49 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: wcd934x: add playback dapm widgets" to
	the asoc tree
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

   ASoC: wcd934x: add playback dapm widgets

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

From dd9eb19b567303e4b92747dcfb5deedb182af111 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 19 Dec 2019 10:31:47 +0000
Subject: [PATCH] ASoC: wcd934x: add playback dapm widgets

This patch adds required dapm widgets for playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20191219103153.14875-6-srinivas.kandagatla@linaro.org
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 1550 ++++++++++++++++++++++++++++++++++++
 1 file changed, 1550 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 27a864f2ff77..556c051f7f99 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -412,6 +412,94 @@ static const char * const rx_hph_mode_mux_text[] = {
 	"Class-H Hi-Fi Low Power"
 };
 
+static const char *const slim_rx_mux_text[] = {
+	"ZERO", "AIF1_PB", "AIF2_PB", "AIF3_PB", "AIF4_PB",
+};
+
+static const char * const rx_int0_7_mix_mux_text[] = {
+	"ZERO", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5",
+	"RX6", "RX7", "PROXIMITY"
+};
+
+static const char * const rx_int_mix_mux_text[] = {
+	"ZERO", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5",
+	"RX6", "RX7"
+};
+
+static const char * const rx_prim_mix_text[] = {
+	"ZERO", "DEC0", "DEC1", "IIR0", "IIR1", "RX0", "RX1", "RX2",
+	"RX3", "RX4", "RX5", "RX6", "RX7"
+};
+
+static const char * const rx_sidetone_mix_text[] = {
+	"ZERO", "SRC0", "SRC1", "SRC_SUM"
+};
+
+static const char * const iir_inp_mux_text[] = {
+	"ZERO", "DEC0", "DEC1", "DEC2", "DEC3", "DEC4", "DEC5", "DEC6",
+	"DEC7", "DEC8", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5", "RX6", "RX7"
+};
+
+static const char * const rx_int_dem_inp_mux_text[] = {
+	"NORMAL_DSM_OUT", "CLSH_DSM_OUT",
+};
+
+static const char * const rx_int0_1_interp_mux_text[] = {
+	"ZERO", "RX INT0_1 MIX1",
+};
+
+static const char * const rx_int1_1_interp_mux_text[] = {
+	"ZERO", "RX INT1_1 MIX1",
+};
+
+static const char * const rx_int2_1_interp_mux_text[] = {
+	"ZERO", "RX INT2_1 MIX1",
+};
+
+static const char * const rx_int3_1_interp_mux_text[] = {
+	"ZERO", "RX INT3_1 MIX1",
+};
+
+static const char * const rx_int4_1_interp_mux_text[] = {
+	"ZERO", "RX INT4_1 MIX1",
+};
+
+static const char * const rx_int7_1_interp_mux_text[] = {
+	"ZERO", "RX INT7_1 MIX1",
+};
+
+static const char * const rx_int8_1_interp_mux_text[] = {
+	"ZERO", "RX INT8_1 MIX1",
+};
+
+static const char * const rx_int0_2_interp_mux_text[] = {
+	"ZERO", "RX INT0_2 MUX",
+};
+
+static const char * const rx_int1_2_interp_mux_text[] = {
+	"ZERO", "RX INT1_2 MUX",
+};
+
+static const char * const rx_int2_2_interp_mux_text[] = {
+	"ZERO", "RX INT2_2 MUX",
+};
+
+static const char * const rx_int3_2_interp_mux_text[] = {
+	"ZERO", "RX INT3_2 MUX",
+};
+
+static const char * const rx_int4_2_interp_mux_text[] = {
+	"ZERO", "RX INT4_2 MUX",
+};
+
+static const char * const rx_int7_2_interp_mux_text[] = {
+	"ZERO", "RX INT7_2 MUX",
+};
+
+static const char * const rx_int8_2_interp_mux_text[] = {
+	"ZERO", "RX INT8_2 MUX",
+};
+
 static const struct soc_enum cf_dec0_enum =
 	SOC_ENUM_SINGLE(WCD934X_CDC_TX0_TX_PATH_CFG0, 5, 3, cf_text);
 
@@ -485,6 +573,236 @@ static const struct soc_enum rx_hph_mode_mux_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
 			    rx_hph_mode_mux_text);
 
+static const struct soc_enum slim_rx_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(slim_rx_mux_text), slim_rx_mux_text);
+
+static const struct soc_enum rx_int0_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG1, 0, 10,
+			rx_int0_7_mix_mux_text);
+
+static const struct soc_enum rx_int1_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int2_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int3_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int4_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int7_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG1, 0, 10,
+			rx_int0_7_mix_mux_text);
+
+static const struct soc_enum rx_int8_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int0_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int0_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int0_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int1_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int1_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int1_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int2_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int2_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int2_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int3_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int3_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int3_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int4_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int4_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int4_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int7_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int7_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int7_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int8_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int8_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int8_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int0_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 0, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int1_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 2, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int2_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 4, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int3_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 6, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int4_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG1, 0, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int7_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG1, 2, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum iir0_inp0_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG0,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir0_inp1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG1,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir0_inp2_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG2,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir0_inp3_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG3,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp0_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG0,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG1,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp2_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG2,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp3_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG3,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum rx_int0_dem_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX0_RX_PATH_SEC0, 0,
+			ARRAY_SIZE(rx_int_dem_inp_mux_text),
+			rx_int_dem_inp_mux_text);
+
+static const struct soc_enum rx_int1_dem_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX1_RX_PATH_SEC0, 0,
+			ARRAY_SIZE(rx_int_dem_inp_mux_text),
+			rx_int_dem_inp_mux_text);
+
+static const struct soc_enum rx_int2_dem_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX2_RX_PATH_SEC0, 0,
+			ARRAY_SIZE(rx_int_dem_inp_mux_text),
+			rx_int_dem_inp_mux_text);
+static const struct soc_enum rx_int0_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
+			rx_int0_1_interp_mux_text);
+
+static const struct soc_enum rx_int1_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
+			rx_int1_1_interp_mux_text);
+
+static const struct soc_enum rx_int2_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
+			rx_int2_1_interp_mux_text);
+
+static const struct soc_enum rx_int3_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int3_1_interp_mux_text);
+
+static const struct soc_enum rx_int4_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int4_1_interp_mux_text);
+
+static const struct soc_enum rx_int7_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int7_1_interp_mux_text);
+
+static const struct soc_enum rx_int8_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int8_1_interp_mux_text);
+
+static const struct soc_enum rx_int0_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int0_2_interp_mux_text);
+
+static const struct soc_enum rx_int1_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int1_2_interp_mux_text);
+
+static const struct soc_enum rx_int2_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int2_2_interp_mux_text);
+
+static const struct soc_enum rx_int3_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int3_2_interp_mux_text);
+
+static const struct soc_enum rx_int4_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int4_2_interp_mux_text);
+
+static const struct soc_enum rx_int7_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int7_2_interp_mux_text);
+
+static const struct soc_enum rx_int8_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int8_2_interp_mux_text);
+
 static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd,
 				      int sido_src)
 {
@@ -639,6 +957,22 @@ static int __wcd934x_cdc_mclk_enable(struct wcd934x_codec *wcd, bool enable)
 	return ret;
 }
 
+static int wcd934x_codec_enable_mclk(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return __wcd934x_cdc_mclk_enable(wcd, true);
+	case SND_SOC_DAPM_POST_PMD:
+		return __wcd934x_cdc_mclk_enable(wcd, false);
+	}
+
+	return 0;
+}
+
 static int wcd934x_get_version(struct wcd934x_codec *wcd)
 {
 	int val1, val2, ver, ret;
@@ -1814,6 +2148,311 @@ static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
 	return 0;
 }
 
+static int slim_rx_mux_get(struct snd_kcontrol *kc,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dapm->dev);
+
+	ucontrol->value.enumerated.item[0] = wcd->rx_port_value[w->shift];
+
+	return 0;
+}
+
+static int slim_rx_mux_put(struct snd_kcontrol *kc,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(w->dapm->dev);
+	struct soc_enum *e = (struct soc_enum *)kc->private_value;
+	struct snd_soc_dapm_update *update = NULL;
+	u32 port_id = w->shift;
+
+	if (wcd->rx_port_value[port_id] == ucontrol->value.enumerated.item[0])
+		return 0;
+
+	wcd->rx_port_value[port_id] = ucontrol->value.enumerated.item[0];
+
+	switch (wcd->rx_port_value[port_id]) {
+	case 0:
+		list_del_init(&wcd->rx_chs[port_id].list);
+		break;
+	case 1:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF1_PB].slim_ch_list);
+		break;
+	case 2:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF2_PB].slim_ch_list);
+		break;
+	case 3:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF3_PB].slim_ch_list);
+		break;
+	case 4:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF4_PB].slim_ch_list);
+		break;
+	default:
+		dev_err(wcd->dev, "Unknown AIF %d\n",
+			wcd->rx_port_value[port_id]);
+		goto err;
+	}
+
+	snd_soc_dapm_mux_update_power(w->dapm, kc, wcd->rx_port_value[port_id],
+				      e, update);
+
+	return 0;
+err:
+	return -EINVAL;
+}
+
+static int wcd934x_int_dem_inp_mux_put(struct snd_kcontrol *kc,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kc->private_value;
+	struct snd_soc_component *component;
+	int reg, val, ret;
+
+	component = snd_soc_dapm_kcontrol_component(kc);
+	val = ucontrol->value.enumerated.item[0];
+	if (e->reg == WCD934X_CDC_RX0_RX_PATH_SEC0)
+		reg = WCD934X_CDC_RX0_RX_PATH_CFG0;
+	else if (e->reg == WCD934X_CDC_RX1_RX_PATH_SEC0)
+		reg = WCD934X_CDC_RX1_RX_PATH_CFG0;
+	else if (e->reg == WCD934X_CDC_RX2_RX_PATH_SEC0)
+		reg = WCD934X_CDC_RX2_RX_PATH_CFG0;
+	else
+		return -EINVAL;
+
+	/* Set Look Ahead Delay */
+	if (val)
+		snd_soc_component_update_bits(component, reg,
+					      WCD934X_RX_DLY_ZN_EN_MASK,
+					      WCD934X_RX_DLY_ZN_ENABLE);
+	else
+		snd_soc_component_update_bits(component, reg,
+					      WCD934X_RX_DLY_ZN_EN_MASK,
+					      WCD934X_RX_DLY_ZN_DISABLE);
+
+	ret = snd_soc_dapm_put_enum_double(kc, ucontrol);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new rx_int0_2_mux =
+	SOC_DAPM_ENUM("RX INT0_2 MUX Mux", rx_int0_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_2_mux =
+	SOC_DAPM_ENUM("RX INT1_2 MUX Mux", rx_int1_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_2_mux =
+	SOC_DAPM_ENUM("RX INT2_2 MUX Mux", rx_int2_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_2_mux =
+	SOC_DAPM_ENUM("RX INT3_2 MUX Mux", rx_int3_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_2_mux =
+	SOC_DAPM_ENUM("RX INT4_2 MUX Mux", rx_int4_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_2_mux =
+	SOC_DAPM_ENUM("RX INT7_2 MUX Mux", rx_int7_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_2_mux =
+	SOC_DAPM_ENUM("RX INT8_2 MUX Mux", rx_int8_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT0_1 MIX1 INP0 Mux", rx_int0_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT0_1 MIX1 INP1 Mux", rx_int0_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT0_1 MIX1 INP2 Mux", rx_int0_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT1_1 MIX1 INP0 Mux", rx_int1_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT1_1 MIX1 INP1 Mux", rx_int1_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT1_1 MIX1 INP2 Mux", rx_int1_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT2_1 MIX1 INP0 Mux", rx_int2_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT2_1 MIX1 INP1 Mux", rx_int2_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT2_1 MIX1 INP2 Mux", rx_int2_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT3_1 MIX1 INP0 Mux", rx_int3_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT3_1 MIX1 INP1 Mux", rx_int3_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT3_1 MIX1 INP2 Mux", rx_int3_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT4_1 MIX1 INP0 Mux", rx_int4_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT4_1 MIX1 INP1 Mux", rx_int4_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT4_1 MIX1 INP2 Mux", rx_int4_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT7_1 MIX1 INP0 Mux", rx_int7_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT7_1 MIX1 INP1 Mux", rx_int7_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT7_1 MIX1 INP2 Mux", rx_int7_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT8_1 MIX1 INP0 Mux", rx_int8_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT8_1 MIX1 INP1 Mux", rx_int8_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT8_1 MIX1 INP2 Mux", rx_int8_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT0 MIX2 INP Mux", rx_int0_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int1_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT1 MIX2 INP Mux", rx_int1_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int2_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT2 MIX2 INP Mux", rx_int2_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int3_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT3 MIX2 INP Mux", rx_int3_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int4_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT4 MIX2 INP Mux", rx_int4_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int7_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT7 MIX2 INP Mux", rx_int7_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new iir0_inp0_mux =
+	SOC_DAPM_ENUM("IIR0 INP0 Mux", iir0_inp0_mux_enum);
+static const struct snd_kcontrol_new iir0_inp1_mux =
+	SOC_DAPM_ENUM("IIR0 INP1 Mux", iir0_inp1_mux_enum);
+static const struct snd_kcontrol_new iir0_inp2_mux =
+	SOC_DAPM_ENUM("IIR0 INP2 Mux", iir0_inp2_mux_enum);
+static const struct snd_kcontrol_new iir0_inp3_mux =
+	SOC_DAPM_ENUM("IIR0 INP3 Mux", iir0_inp3_mux_enum);
+
+static const struct snd_kcontrol_new iir1_inp0_mux =
+	SOC_DAPM_ENUM("IIR1 INP0 Mux", iir1_inp0_mux_enum);
+static const struct snd_kcontrol_new iir1_inp1_mux =
+	SOC_DAPM_ENUM("IIR1 INP1 Mux", iir1_inp1_mux_enum);
+static const struct snd_kcontrol_new iir1_inp2_mux =
+	SOC_DAPM_ENUM("IIR1 INP2 Mux", iir1_inp2_mux_enum);
+static const struct snd_kcontrol_new iir1_inp3_mux =
+	SOC_DAPM_ENUM("IIR1 INP3 Mux", iir1_inp3_mux_enum);
+
+static const struct snd_kcontrol_new slim_rx_mux[WCD934X_RX_MAX] = {
+	SOC_DAPM_ENUM_EXT("SLIM RX0 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX1 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX2 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX3 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX4 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX5 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX6 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX7 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+};
+
+static const struct snd_kcontrol_new rx_int1_asrc_switch[] = {
+	SOC_DAPM_SINGLE("HPHL Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int2_asrc_switch[] = {
+	SOC_DAPM_SINGLE("HPHR Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int3_asrc_switch[] = {
+	SOC_DAPM_SINGLE("LO1 Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int4_asrc_switch[] = {
+	SOC_DAPM_SINGLE("LO2 Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int0_dem_inp_mux =
+	SOC_DAPM_ENUM_EXT("RX INT0 DEM MUX Mux", rx_int0_dem_inp_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  wcd934x_int_dem_inp_mux_put);
+
+static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
+	SOC_DAPM_ENUM_EXT("RX INT1 DEM MUX Mux", rx_int1_dem_inp_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  wcd934x_int_dem_inp_mux_put);
+
+static const struct snd_kcontrol_new rx_int2_dem_inp_mux =
+	SOC_DAPM_ENUM_EXT("RX INT2 DEM MUX Mux", rx_int2_dem_inp_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  wcd934x_int_dem_inp_mux_put);
+
+static const struct snd_kcontrol_new rx_int0_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT0_1 INTERP Mux", rx_int0_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT1_1 INTERP Mux", rx_int1_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT2_1 INTERP Mux", rx_int2_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT3_1 INTERP Mux", rx_int3_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT4_1 INTERP Mux", rx_int4_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT7_1 INTERP Mux", rx_int7_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT8_1 INTERP Mux", rx_int8_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int0_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT0_2 INTERP Mux", rx_int0_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int1_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT1_2 INTERP Mux", rx_int1_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int2_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT2_2 INTERP Mux", rx_int2_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int3_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT3_2 INTERP Mux", rx_int3_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int4_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT4_2 INTERP Mux", rx_int4_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int7_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT7_2 INTERP Mux", rx_int7_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int8_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT8_2 INTERP Mux", rx_int8_2_interp_mux_enum);
+
 static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
 	/* Gain Controls */
 	SOC_SINGLE_TLV("EAR PA Volume", WCD934X_ANA_EAR, 4, 4, 1, ear_pa_gain),
@@ -1983,12 +2622,923 @@ static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
 		       wcd934x_compander_get, wcd934x_compander_set),
 };
 
+static void wcd934x_codec_enable_int_port(struct wcd_slim_codec_dai_data *dai,
+					  struct snd_soc_component *component)
+{
+	int port_num = 0;
+	unsigned short reg = 0;
+	unsigned int val = 0;
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+	struct wcd934x_slim_ch *ch;
+
+	list_for_each_entry(ch, &dai->slim_ch_list, list) {
+		if (ch->port >= WCD934X_RX_START) {
+			port_num = ch->port - WCD934X_RX_START;
+			reg = WCD934X_SLIM_PGD_PORT_INT_EN0 + (port_num / 8);
+		} else {
+			port_num = ch->port;
+			reg = WCD934X_SLIM_PGD_PORT_INT_TX_EN0 + (port_num / 8);
+		}
+
+		regmap_read(wcd->if_regmap, reg, &val);
+		if (!(val & BIT(port_num % 8)))
+			regmap_write(wcd->if_regmap, reg,
+				     val | BIT(port_num % 8));
+	}
+}
+
+static int wcd934x_codec_enable_slim(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(comp);
+	struct wcd_slim_codec_dai_data *dai = &wcd->dai[w->shift];
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		wcd934x_codec_enable_int_port(dai, comp);
+		break;
+	}
+
+	return 0;
+}
+
+static void wcd934x_codec_hd2_control(struct snd_soc_component *component,
+				      u16 interp_idx, int event)
+{
+	u16 hd2_scale_reg;
+	u16 hd2_enable_reg = 0;
+
+	switch (interp_idx) {
+	case INTERP_HPHL:
+		hd2_scale_reg = WCD934X_CDC_RX1_RX_PATH_SEC3;
+		hd2_enable_reg = WCD934X_CDC_RX1_RX_PATH_CFG0;
+		break;
+	case INTERP_HPHR:
+		hd2_scale_reg = WCD934X_CDC_RX2_RX_PATH_SEC3;
+		hd2_enable_reg = WCD934X_CDC_RX2_RX_PATH_CFG0;
+		break;
+	default:
+		return;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P3125);
+		snd_soc_component_update_bits(component, hd2_enable_reg,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_ENABLE);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(component, hd2_enable_reg,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_DISABLE);
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P0000);
+	}
+}
+
+static void wcd934x_codec_hphdelay_lutbypass(struct snd_soc_component *comp,
+					     u16 interp_idx, int event)
+{
+	u8 hph_dly_mask;
+	u16 hph_lut_bypass_reg = 0;
+	u16 hph_comp_ctrl7 = 0;
+
+	switch (interp_idx) {
+	case INTERP_HPHL:
+		hph_dly_mask = 1;
+		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHL_COMP_LUT;
+		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER1_CTL7;
+		break;
+	case INTERP_HPHR:
+		hph_dly_mask = 2;
+		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHR_COMP_LUT;
+		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER2_CTL7;
+		break;
+	default:
+		return;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
+					      hph_dly_mask, 0x0);
+		snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
+					      WCD934X_HPH_LUT_BYPASS_MASK,
+					      WCD934X_HPH_LUT_BYPASS_ENABLE);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
+					      hph_dly_mask, hph_dly_mask);
+		snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
+					      WCD934X_HPH_LUT_BYPASS_MASK,
+					      WCD934X_HPH_LUT_BYPASS_DISABLE);
+	}
+}
+
+static int wcd934x_config_compander(struct snd_soc_component *comp,
+				    int interp_n, int event)
+{
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int compander;
+	u16 comp_ctl0_reg, rx_path_cfg0_reg;
+
+	/* EAR does not have compander */
+	if (!interp_n)
+		return 0;
+
+	compander = interp_n - 1;
+	if (!wcd->comp_enabled[compander])
+		return 0;
+
+	comp_ctl0_reg = WCD934X_CDC_COMPANDER1_CTL0 + (compander * 8);
+	rx_path_cfg0_reg = WCD934X_CDC_RX1_RX_PATH_CFG0 + (compander * 20);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Enable Compander Clock */
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_CLK_EN_MASK,
+					      WCD934X_COMP_CLK_ENABLE);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_SOFT_RST_MASK,
+					      WCD934X_COMP_SOFT_RST_ENABLE);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_SOFT_RST_MASK,
+					      WCD934X_COMP_SOFT_RST_DISABLE);
+		snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
+					      WCD934X_HPH_CMP_EN_MASK,
+					      WCD934X_HPH_CMP_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
+					      WCD934X_HPH_CMP_EN_MASK,
+					      WCD934X_HPH_CMP_DISABLE);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_HALT_MASK,
+					      WCD934X_COMP_HALT);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_SOFT_RST_MASK,
+					      WCD934X_COMP_SOFT_RST_ENABLE);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_SOFT_RST_MASK,
+					      WCD934X_COMP_SOFT_RST_DISABLE);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_CLK_EN_MASK, 0x0);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg,
+					      WCD934X_COMP_SOFT_RST_MASK, 0x0);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_interp_clk(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int interp_idx = w->shift;
+	u16 main_reg = WCD934X_CDC_RX0_RX_PATH_CTL + (interp_idx * 20);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Clk enable */
+		snd_soc_component_update_bits(comp, main_reg,
+					     WCD934X_RX_CLK_EN_MASK,
+					     WCD934X_RX_CLK_ENABLE);
+		wcd934x_codec_hd2_control(comp, interp_idx, event);
+		wcd934x_codec_hphdelay_lutbypass(comp, interp_idx, event);
+		wcd934x_config_compander(comp, interp_idx, event);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd934x_config_compander(comp, interp_idx, event);
+		wcd934x_codec_hphdelay_lutbypass(comp, interp_idx, event);
+		wcd934x_codec_hd2_control(comp, interp_idx, event);
+		/* Clk Disable */
+		snd_soc_component_update_bits(comp, main_reg,
+					     WCD934X_RX_CLK_EN_MASK, 0);
+		/* Reset enable and disable */
+		snd_soc_component_update_bits(comp, main_reg,
+					      WCD934X_RX_RESET_MASK,
+					      WCD934X_RX_RESET_ENABLE);
+		snd_soc_component_update_bits(comp, main_reg,
+					      WCD934X_RX_RESET_MASK,
+					      WCD934X_RX_RESET_DISABLE);
+		/* Reset rate to 48K*/
+		snd_soc_component_update_bits(comp, main_reg,
+					      WCD934X_RX_PCM_RATE_MASK,
+					      WCD934X_RX_PCM_RATE_F_48K);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int offset_val = 0;
+	u16 gain_reg, mix_reg;
+	int val = 0;
+
+	gain_reg = WCD934X_CDC_RX0_RX_VOL_MIX_CTL +
+					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
+	mix_reg = WCD934X_CDC_RX0_RX_PATH_MIX_CTL +
+					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Clk enable */
+		snd_soc_component_update_bits(comp, mix_reg,
+					      WCD934X_CDC_RX_MIX_CLK_EN_MASK,
+					      WCD934X_CDC_RX_MIX_CLK_ENABLE);
+		break;
+
+	case SND_SOC_DAPM_POST_PMU:
+		val = snd_soc_component_read32(comp, gain_reg);
+		val += offset_val;
+		snd_soc_component_write(comp, gain_reg, val);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int reg = w->reg;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* B1 GAIN */
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B2 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B3 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B4 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B5 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
+					  struct snd_kcontrol *kcontrol,
+					  int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	u16 gain_reg;
+
+	gain_reg = WCD934X_CDC_RX0_RX_VOL_CTL + (w->shift *
+						 WCD934X_RX_PATH_CTL_OFFSET);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write(comp, gain_reg,
+				snd_soc_component_read32(comp, gain_reg));
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Disable AutoChop timer during power up */
+		snd_soc_component_update_bits(comp,
+				      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK, 0x0);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_EAR, CLS_H_NORMAL);
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_EAR, CLS_H_NORMAL);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int hph_mode = wcd->hph_mode;
+	u8 dem_inp;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Read DEM INP Select */
+		dem_inp = snd_soc_component_read32(comp,
+				   WCD934X_CDC_RX1_RX_PATH_SEC0) & 0x03;
+
+		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
+		     (hph_mode == CLS_H_LP)) && (dem_inp != 0x01)) {
+			return -EINVAL;
+		}
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control enable */
+			snd_soc_component_update_bits(comp,
+					WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+					WCD934X_SIDO_RIPPLE_FREQ_EN_MASK,
+					WCD934X_SIDO_RIPPLE_FREQ_ENABLE);
+		/* Disable AutoChop timer during power up */
+		snd_soc_component_update_bits(comp,
+				      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK, 0x0);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 1000us required as per HW requirement */
+		usleep_range(1000, 1100);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control disable */
+			snd_soc_component_update_bits(comp,
+					WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+					WCD934X_SIDO_RIPPLE_FREQ_EN_MASK, 0x0);
+
+		break;
+	default:
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int hph_mode = wcd->hph_mode;
+	u8 dem_inp;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dem_inp = snd_soc_component_read32(comp,
+					WCD934X_CDC_RX2_RX_PATH_SEC0) & 0x03;
+		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
+		     (hph_mode == CLS_H_LP)) && (dem_inp != 0x01)) {
+			return -EINVAL;
+		}
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control enable */
+			snd_soc_component_update_bits(comp,
+					WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+					WCD934X_SIDO_RIPPLE_FREQ_EN_MASK,
+					WCD934X_SIDO_RIPPLE_FREQ_ENABLE);
+		/* Disable AutoChop timer during power up */
+		snd_soc_component_update_bits(comp,
+				      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK, 0x0);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHR,
+			     hph_mode);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 1000us required as per HW requirement */
+		usleep_range(1000, 1100);
+
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHR, hph_mode);
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control disable */
+			snd_soc_component_update_bits(comp,
+					WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+					WCD934X_SIDO_RIPPLE_FREQ_EN_MASK, 0x0);
+		break;
+	default:
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_lineout_dac_event(struct snd_soc_dapm_widget *w,
+					   struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_LO, CLS_AB);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_LO, CLS_AB);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required after PA is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is needed.
+		 */
+		usleep_range(20000, 20100);
+
+		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
+					      WCD934X_HPH_OCP_DET_MASK,
+					      WCD934X_HPH_OCP_DET_ENABLE);
+		/* Remove Mute on primary path */
+		snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
+				      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
+				      0);
+		/* Enable GM3 boost */
+		snd_soc_component_update_bits(comp, WCD934X_HPH_CNP_WG_CTL,
+					      WCD934X_HPH_GM3_BOOST_EN_MASK,
+					      WCD934X_HPH_GM3_BOOST_ENABLE);
+		/* Enable AutoChop timer at the end of power up */
+		snd_soc_component_update_bits(comp,
+				      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK,
+				      WCD934X_HPH_AUTOCHOP_TIMER_ENABLE);
+		/* Remove mix path mute */
+		snd_soc_component_update_bits(comp,
+				WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
+				WCD934X_CDC_RX_PGA_MUTE_EN_MASK, 0x00);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Enable DSD Mute before PA disable */
+		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
+					      WCD934X_HPH_OCP_DET_MASK,
+					      WCD934X_HPH_OCP_DET_DISABLE);
+		snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
+					      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
+					      WCD934X_RX_PATH_PGA_MUTE_ENABLE);
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
+					      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
+					      WCD934X_RX_PATH_PGA_MUTE_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 5ms sleep is required after PA disable. If compander is
+		 * disabled, then 20ms delay is needed after PA disable.
+		 */
+		usleep_range(20000, 20100);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required after PA is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is needed.
+		 */
+		usleep_range(20000, 20100);
+		snd_soc_component_update_bits(comp, WCD934X_HPH_R_TEST,
+					      WCD934X_HPH_OCP_DET_MASK,
+					      WCD934X_HPH_OCP_DET_ENABLE);
+		/* Remove mute */
+		snd_soc_component_update_bits(comp, WCD934X_CDC_RX2_RX_PATH_CTL,
+					      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
+					      0);
+		/* Enable GM3 boost */
+		snd_soc_component_update_bits(comp, WCD934X_HPH_CNP_WG_CTL,
+					      WCD934X_HPH_GM3_BOOST_EN_MASK,
+					      WCD934X_HPH_GM3_BOOST_ENABLE);
+		/* Enable AutoChop timer at the end of power up */
+		snd_soc_component_update_bits(comp,
+				      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK,
+				      WCD934X_HPH_AUTOCHOP_TIMER_ENABLE);
+		/* Remove mix path mute if it is enabled */
+		if ((snd_soc_component_read32(comp,
+				      WCD934X_CDC_RX2_RX_PATH_MIX_CTL)) & 0x10)
+			snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX2_RX_PATH_MIX_CTL,
+					      WCD934X_CDC_RX_PGA_MUTE_EN_MASK,
+					      WCD934X_CDC_RX_PGA_MUTE_DISABLE);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(comp, WCD934X_HPH_R_TEST,
+					      WCD934X_HPH_OCP_DET_MASK,
+					      WCD934X_HPH_OCP_DET_DISABLE);
+		snd_soc_component_update_bits(comp, WCD934X_CDC_RX2_RX_PATH_CTL,
+					      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
+					      WCD934X_RX_PATH_PGA_MUTE_ENABLE);
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX2_RX_PATH_MIX_CTL,
+					      WCD934X_CDC_RX_PGA_MUTE_EN_MASK,
+					      WCD934X_CDC_RX_PGA_MUTE_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 5ms sleep is required after PA disable. If compander is
+		 * disabled, then 20ms delay is needed after PA disable.
+		 */
+		usleep_range(20000, 20100);
+		break;
+	};
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
+	/* Analog Outputs */
+	SND_SOC_DAPM_OUTPUT("EAR"),
+	SND_SOC_DAPM_OUTPUT("HPHL"),
+	SND_SOC_DAPM_OUTPUT("HPHR"),
+	SND_SOC_DAPM_OUTPUT("LINEOUT1"),
+	SND_SOC_DAPM_OUTPUT("LINEOUT2"),
+	SND_SOC_DAPM_OUTPUT("SPK1 OUT"),
+	SND_SOC_DAPM_OUTPUT("SPK2 OUT"),
+	SND_SOC_DAPM_OUTPUT("ANC EAR"),
+	SND_SOC_DAPM_OUTPUT("ANC HPHL"),
+	SND_SOC_DAPM_OUTPUT("ANC HPHR"),
+	SND_SOC_DAPM_OUTPUT("WDMA3_OUT"),
+	SND_SOC_DAPM_OUTPUT("MAD_CPE_OUT1"),
+	SND_SOC_DAPM_OUTPUT("MAD_CPE_OUT2"),
+	SND_SOC_DAPM_AIF_IN_E("AIF1 PB", "AIF1 Playback", 0, SND_SOC_NOPM,
+			      AIF1_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("AIF2 PB", "AIF2 Playback", 0, SND_SOC_NOPM,
+			      AIF2_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("AIF3 PB", "AIF3 Playback", 0, SND_SOC_NOPM,
+			      AIF3_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("AIF4 PB", "AIF4 Playback", 0, SND_SOC_NOPM,
+			      AIF4_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("SLIM RX0 MUX", SND_SOC_NOPM, WCD934X_RX0, 0,
+			 &slim_rx_mux[WCD934X_RX0]),
+	SND_SOC_DAPM_MUX("SLIM RX1 MUX", SND_SOC_NOPM, WCD934X_RX1, 0,
+			 &slim_rx_mux[WCD934X_RX1]),
+	SND_SOC_DAPM_MUX("SLIM RX2 MUX", SND_SOC_NOPM, WCD934X_RX2, 0,
+			 &slim_rx_mux[WCD934X_RX2]),
+	SND_SOC_DAPM_MUX("SLIM RX3 MUX", SND_SOC_NOPM, WCD934X_RX3, 0,
+			 &slim_rx_mux[WCD934X_RX3]),
+	SND_SOC_DAPM_MUX("SLIM RX4 MUX", SND_SOC_NOPM, WCD934X_RX4, 0,
+			 &slim_rx_mux[WCD934X_RX4]),
+	SND_SOC_DAPM_MUX("SLIM RX5 MUX", SND_SOC_NOPM, WCD934X_RX5, 0,
+			 &slim_rx_mux[WCD934X_RX5]),
+	SND_SOC_DAPM_MUX("SLIM RX6 MUX", SND_SOC_NOPM, WCD934X_RX6, 0,
+			 &slim_rx_mux[WCD934X_RX6]),
+	SND_SOC_DAPM_MUX("SLIM RX7 MUX", SND_SOC_NOPM, WCD934X_RX7, 0,
+			 &slim_rx_mux[WCD934X_RX7]),
+
+	SND_SOC_DAPM_MIXER("SLIM RX0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX6", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX7", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_EAR, 0,
+			   &rx_int0_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
+			   &rx_int1_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2_2 MUX", SND_SOC_NOPM, INTERP_HPHR, 0,
+			   &rx_int2_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT3_2 MUX", SND_SOC_NOPM, INTERP_LO1, 0,
+			   &rx_int3_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT4_2 MUX", SND_SOC_NOPM, INTERP_LO2, 0,
+			   &rx_int4_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT7_2 MUX", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			   &rx_int7_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT8_2 MUX", SND_SOC_NOPM, INTERP_SPKR2, 0,
+			   &rx_int8_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			   &rx_int7_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			   &rx_int7_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			   &rx_int7_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			   &rx_int8_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			   &rx_int8_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			   &rx_int8_1_mix_inp2_mux),
+	SND_SOC_DAPM_MIXER("RX INT0_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int1_asrc_switch,
+			   ARRAY_SIZE(rx_int1_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT2_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int2_asrc_switch,
+			   ARRAY_SIZE(rx_int2_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT3_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT3 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int3_asrc_switch,
+			   ARRAY_SIZE(rx_int3_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT4_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT4 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int4_asrc_switch,
+			   ARRAY_SIZE(rx_int4_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT7_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT7 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT8_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT8 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT0 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT3 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT3 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT4 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT4 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER("RX INT7 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX INT7 CHAIN", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX INT8 CHAIN", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, NULL, 0),
+	SND_SOC_DAPM_MUX_E("RX INT0 MIX2 INP", WCD934X_CDC_RX0_RX_PATH_CFG0, 4,
+			   0,  &rx_int0_mix2_inp_mux, NULL,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1 MIX2 INP", WCD934X_CDC_RX1_RX_PATH_CFG0, 4,
+			   0, &rx_int1_mix2_inp_mux,  NULL,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2 MIX2 INP", WCD934X_CDC_RX2_RX_PATH_CFG0, 4,
+			   0, &rx_int2_mix2_inp_mux, NULL,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT3 MIX2 INP", WCD934X_CDC_RX3_RX_PATH_CFG0, 4,
+			   0, &rx_int3_mix2_inp_mux, NULL,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT4 MIX2 INP", WCD934X_CDC_RX4_RX_PATH_CFG0, 4,
+			   0, &rx_int4_mix2_inp_mux, NULL,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT7 MIX2 INP", WCD934X_CDC_RX7_RX_PATH_CFG0, 4,
+			   0, &rx_int7_mix2_inp_mux, NULL,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("IIR0 INP0 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp0_mux),
+	SND_SOC_DAPM_MUX("IIR0 INP1 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp1_mux),
+	SND_SOC_DAPM_MUX("IIR0 INP2 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp2_mux),
+	SND_SOC_DAPM_MUX("IIR0 INP3 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp3_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP0 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp0_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP1 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp1_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP2 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp2_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP3 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp3_mux),
+
+	SND_SOC_DAPM_PGA_E("IIR0", WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL,
+			   0, 0, NULL, 0, wcd934x_codec_set_iir_gain,
+			   SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_PGA_E("IIR1", WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B1_CTL,
+			   1, 0, NULL, 0, wcd934x_codec_set_iir_gain,
+			   SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_MIXER("SRC0", WCD934X_CDC_SIDETONE_SRC0_ST_SRC_PATH_CTL,
+			   4, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SRC1", WCD934X_CDC_SIDETONE_SRC1_ST_SRC_PATH_CTL,
+			   4, 0, NULL, 0),
+	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_dem_inp_mux),
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_dem_inp_mux),
+	SND_SOC_DAPM_MUX("RX INT2 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_dem_inp_mux),
+
+	SND_SOC_DAPM_MUX_E("RX INT0_1 INTERP", SND_SOC_NOPM, INTERP_EAR, 0,
+			   &rx_int0_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1_1 INTERP", SND_SOC_NOPM, INTERP_HPHL, 0,
+			   &rx_int1_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2_1 INTERP", SND_SOC_NOPM, INTERP_HPHR, 0,
+			   &rx_int2_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT3_1 INTERP", SND_SOC_NOPM, INTERP_LO1, 0,
+			   &rx_int3_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT4_1 INTERP", SND_SOC_NOPM, INTERP_LO2, 0,
+			   &rx_int4_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT7_1 INTERP", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			   &rx_int7_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT8_1 INTERP", SND_SOC_NOPM, INTERP_SPKR2, 0,
+			   &rx_int8_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RX INT0_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT1_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT2_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT3_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT4_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT7_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int7_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT8_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int8_2_interp_mux),
+	SND_SOC_DAPM_DAC_E("RX INT0 DAC", NULL, SND_SOC_NOPM,
+			   0, 0, wcd934x_codec_ear_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT1 DAC", NULL, WCD934X_ANA_HPH,
+			   5, 0, wcd934x_codec_hphl_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT2 DAC", NULL, WCD934X_ANA_HPH,
+			   4, 0, wcd934x_codec_hphr_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT3 DAC", NULL, SND_SOC_NOPM,
+			   0, 0, wcd934x_codec_lineout_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT4 DAC", NULL, SND_SOC_NOPM,
+			   0, 0, wcd934x_codec_lineout_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("EAR PA", WCD934X_ANA_EAR, 7, 0, NULL, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHL PA", WCD934X_ANA_HPH, 7, 0, NULL, 0,
+			   wcd934x_codec_enable_hphl_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHR PA", WCD934X_ANA_HPH, 6, 0, NULL, 0,
+			   wcd934x_codec_enable_hphr_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("LINEOUT1 PA", WCD934X_ANA_LO_1_2, 7, 0, NULL, 0,
+			   NULL, 0),
+	SND_SOC_DAPM_PGA_E("LINEOUT2 PA", WCD934X_ANA_LO_1_2, 6, 0, NULL, 0,
+			   NULL, 0),
+	SND_SOC_DAPM_SUPPLY("RX_BIAS", WCD934X_ANA_RX_SUPPLIES, 0, 0, NULL,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("SBOOST0", WCD934X_CDC_RX7_RX_PATH_CFG1,
+			 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SBOOST0_CLK", WCD934X_CDC_BOOST0_BOOST_PATH_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SBOOST1", WCD934X_CDC_RX8_RX_PATH_CFG1,
+			 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SBOOST1_CLK", WCD934X_CDC_BOOST1_BOOST_PATH_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("INT0_CLK", SND_SOC_NOPM, INTERP_EAR, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("INT1_CLK", SND_SOC_NOPM, INTERP_HPHL, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("INT2_CLK", SND_SOC_NOPM, INTERP_HPHR, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("INT3_CLK", SND_SOC_NOPM, INTERP_LO1, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("INT4_CLK", SND_SOC_NOPM, INTERP_LO2, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("INT7_CLK", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("INT8_CLK", SND_SOC_NOPM, INTERP_SPKR2, 0,
+			    wcd934x_codec_enable_interp_clk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("DSMDEM0_CLK", WCD934X_CDC_RX0_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DSMDEM1_CLK", WCD934X_CDC_RX1_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DSMDEM2_CLK", WCD934X_CDC_RX2_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DSMDEM3_CLK", WCD934X_CDC_RX3_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DSMDEM4_CLK", WCD934X_CDC_RX4_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DSMDEM7_CLK", WCD934X_CDC_RX7_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DSMDEM8_CLK", WCD934X_CDC_RX8_RX_PATH_DSMDEM_CTL,
+			    0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MCLK", SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_mclk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
 static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.probe = wcd934x_comp_probe,
 	.remove = wcd934x_comp_remove,
 	.set_sysclk = wcd934x_comp_set_sysclk,
 	.controls = wcd934x_snd_controls,
 	.num_controls = ARRAY_SIZE(wcd934x_snd_controls),
+	.dapm_widgets = wcd934x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wcd934x_dapm_widgets),
 };
 
 static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
