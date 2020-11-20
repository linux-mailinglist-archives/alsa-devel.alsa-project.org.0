Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F72BB034
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:25:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78251732;
	Fri, 20 Nov 2020 17:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78251732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889527;
	bh=hUJkunHo8Nfcr2uWL1x9GpPMBlvI204ks175M5PYJr4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tG7Gm/NW6IqWnaiedoR41UKExblciJM5g3vDaBQqQRpBARmAjjGClmL+9KOaxT5Dd
	 GTGPXe0Zdo6Tm0sUAFIMu8djym1dH6GDo+9CwX/csYPvSE88avQthPNG+YJB+XYz5v
	 a7GK4oj8DvaC3fnyIUCuWuuL4BtKnjpvLmCq3YPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3011BF8053C;
	Fri, 20 Nov 2020 17:18:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEDFFF8053B; Fri, 20 Nov 2020 17:18:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08D18F80525
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08D18F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zMPhRu0O"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE1A924137;
 Fri, 20 Nov 2020 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889124;
 bh=hUJkunHo8Nfcr2uWL1x9GpPMBlvI204ks175M5PYJr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zMPhRu0Os3XEKHUs+gGQOmsihnr3R/UocQ7H0e1Ol0a61S50PPPs4pbp3QjRPE2C1
 0UPxFy/E5EGty3PwH1bNn4cuHw67Z4+7SoMFvJxT/ee9E+xlkkZq17Mh5Q80DzTJvi
 xfJYeQ6OstFhB5AZ3cuGsLKEDoK+FJBVdnz2s8t4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 17/38] ASoC: da7219: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:31 +0100
Message-Id: <20201120161653.445521-17-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can match by multiple methods.  Its of_device_id table is
referenced via of_match_ptr() so it will be unused for !CONFIG_OF
builds:

  sound/soc/codecs/da7219.c:1705:34: warning: ‘da7219_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/da7219.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 0b3b7909efc9..e9b45daec0ca 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1702,11 +1702,13 @@ static struct snd_soc_dai_driver da7219_dai = {
  * DT/ACPI
  */
 
+#ifdef CONFIG_OF
 static const struct of_device_id da7219_of_match[] = {
 	{ .compatible = "dlg,da7219", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da7219_of_match);
+#endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id da7219_acpi_match[] = {
-- 
2.25.1

