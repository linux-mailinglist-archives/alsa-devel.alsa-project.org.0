Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7771A7A3E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 14:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D75616AB;
	Tue, 14 Apr 2020 14:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D75616AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586865719;
	bh=Kk6Glg27PmiUIbJHtAYB1vVo0hJ0EZ7DGxJRzOg/UZw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ku30hE59hkAHNt481dC67a+EYFWk/9adxKvk339didhoGsduZrSl1YMYINE9GDLl2
	 aIh13symQN9QxexOPqjP/53i+UIrbmn1JLDKJYEI1ELCpf1WU/eJmU5FvILh0cZpTc
	 gA8BK/7bQ1YMPoA6jfAJo9gE2hvGhwjnlKT/Rrgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D65F8016F;
	Tue, 14 Apr 2020 13:59:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD75F80278; Tue, 14 Apr 2020 13:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 864B0F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 13:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864B0F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bXeZtBrf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1CFE206A2;
 Tue, 14 Apr 2020 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586865570;
 bh=Kk6Glg27PmiUIbJHtAYB1vVo0hJ0EZ7DGxJRzOg/UZw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bXeZtBrf8TnDxrFUrNK5eyd4aDS58oP9LY6vZvkR7LDjrLWKlPlgyPRDGaWgiTGFV
 KBHuL+YSaMLGakc7DDEgrFFlWIiygxKQf2Fm9PccnNWTT8brVuv7RH3x1AMvgscraX
 M+3egCNLMcxhvKAidFPPKU8Ran0wL7caReJL4lbA=
Date: Tue, 14 Apr 2020 12:59:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Philipp Puschmann <p.puschmann@pironex.de>
Subject: Applied "ASoC: tas571x: disable regulators on failed probe" to the
 asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: tas571x: disable regulators on failed probe

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

From 9df8ba7c63073508e5aa677dade48fcab6a6773e Mon Sep 17 00:00:00 2001
From: Philipp Puschmann <p.puschmann@pironex.de>
Date: Tue, 14 Apr 2020 13:27:54 +0200
Subject: [PATCH] ASoC: tas571x: disable regulators on failed probe

If probe fails after enabling the regulators regulator_put is called for
each supply without having them disabled before. This produces some
warnings like

WARNING: CPU: 0 PID: 90 at drivers/regulator/core.c:2044 _regulator_put.part.0+0x154/0x15c
[<c010f7a8>] (unwind_backtrace) from [<c010c544>] (show_stack+0x10/0x14)
[<c010c544>] (show_stack) from [<c012b640>] (__warn+0xd0/0xf4)
[<c012b640>] (__warn) from [<c012b9b4>] (warn_slowpath_fmt+0x64/0xc4)
[<c012b9b4>] (warn_slowpath_fmt) from [<c04c4064>] (_regulator_put.part.0+0x154/0x15c)
[<c04c4064>] (_regulator_put.part.0) from [<c04c4094>] (regulator_put+0x28/0x38)
[<c04c4094>] (regulator_put) from [<c04c40cc>] (regulator_bulk_free+0x28/0x38)
[<c04c40cc>] (regulator_bulk_free) from [<c0579b2c>] (release_nodes+0x1d0/0x22c)
[<c0579b2c>] (release_nodes) from [<c05756dc>] (really_probe+0x108/0x34c)
[<c05756dc>] (really_probe) from [<c0575aec>] (driver_probe_device+0xb8/0x16c)
[<c0575aec>] (driver_probe_device) from [<c0575d40>] (device_driver_attach+0x58/0x60)
[<c0575d40>] (device_driver_attach) from [<c0575da0>] (__driver_attach+0x58/0xcc)
[<c0575da0>] (__driver_attach) from [<c0573978>] (bus_for_each_dev+0x78/0xc0)
[<c0573978>] (bus_for_each_dev) from [<c0574b5c>] (bus_add_driver+0x188/0x1e0)
[<c0574b5c>] (bus_add_driver) from [<c05768b0>] (driver_register+0x74/0x108)
[<c05768b0>] (driver_register) from [<c061ab7c>] (i2c_register_driver+0x3c/0x88)
[<c061ab7c>] (i2c_register_driver) from [<c0102df8>] (do_one_initcall+0x58/0x250)
[<c0102df8>] (do_one_initcall) from [<c01a91bc>] (do_init_module+0x60/0x244)
[<c01a91bc>] (do_init_module) from [<c01ab5a4>] (load_module+0x2180/0x2540)
[<c01ab5a4>] (load_module) from [<c01abbd4>] (sys_finit_module+0xd0/0xe8)
[<c01abbd4>] (sys_finit_module) from [<c01011e0>] (__sys_trace_return+0x0/0x20)

Fixes: 3fd6e7d9a146 (ASoC: tas571x: New driver for TI TAS571x power amplifiers)
Signed-off-by: Philipp Puschmann <p.puschmann@pironex.de>
Link: https://lore.kernel.org/r/20200414112754.3365406-1-p.puschmann@pironex.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas571x.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 1554631cb397..5b7f9fcf6cbf 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -820,8 +820,10 @@ static int tas571x_i2c_probe(struct i2c_client *client,
 
 	priv->regmap = devm_regmap_init(dev, NULL, client,
 					priv->chip->regmap_config);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
+	if (IS_ERR(priv->regmap)) {
+		ret = PTR_ERR(priv->regmap);
+		goto disable_regs;
+	}
 
 	priv->pdn_gpio = devm_gpiod_get_optional(dev, "pdn", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pdn_gpio)) {
@@ -845,7 +847,7 @@ static int tas571x_i2c_probe(struct i2c_client *client,
 
 	ret = regmap_write(priv->regmap, TAS571X_OSC_TRIM_REG, 0);
 	if (ret)
-		return ret;
+		goto disable_regs;
 
 	usleep_range(50000, 60000);
 
@@ -861,12 +863,20 @@ static int tas571x_i2c_probe(struct i2c_client *client,
 		 */
 		ret = regmap_update_bits(priv->regmap, TAS571X_MVOL_REG, 1, 0);
 		if (ret)
-			return ret;
+			goto disable_regs;
 	}
 
-	return devm_snd_soc_register_component(&client->dev,
+	ret = devm_snd_soc_register_component(&client->dev,
 				      &priv->component_driver,
 				      &tas571x_dai, 1);
+	if (ret)
+		goto disable_regs;
+
+	return ret;
+
+disable_regs:
+	regulator_bulk_disable(priv->chip->num_supply_names, priv->supplies);
+	return ret;
 }
 
 static int tas571x_i2c_remove(struct i2c_client *client)
-- 
2.20.1

