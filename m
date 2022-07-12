Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B23E95722BC
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4372916E4;
	Tue, 12 Jul 2022 20:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4372916E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650916;
	bh=tmqSrm2fPK9hZ8Qm4htcs6IIc2gq/L3JaatZkZbPWgA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d82w2zbEoqm0PZI5gY1j1jYC3WB7wEM5iRGAj+kybIMwV6W6ZDU/Ys9/0v/PEPdTu
	 qtS7VDHHAW4IrUsDMOT6anitD4Ns/IamEZFmi59mLVfwUoaU1v1NY7nU9SvbvtI5oc
	 ENnvF2l8WLyzQO0kZ5lZYN3wo5NkEO/Zp8BMm3+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55A41F800BD;
	Tue, 12 Jul 2022 20:34:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EB98F800BD; Tue, 12 Jul 2022 20:34:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C771DF800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C771DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XlC5k9uR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=fHgrQHCc655FJdPY9x1bi0PKduTmHmcw0it6E+N218Y=; b=XlC5k9uRWiremsaPvGS7ESW3hA
 oNqmGAnAr7nNLazIs8RZvLUmArQgsfeI59rHHactAUdcpd3OHq2oNueDQeQ8WXeU4FowwzpgRSZ4E
 dZKDCdlDTyqNcuIXThuSALyFAwTRw8QHxDe9f9WxXXbr3hVUaahOCBOjODw5ntjtJYn2C8iOeZhLG
 XqBdDJURMP+XYKFykdbLqGTTFfkjMDoGyoVHXWI1UZm48sQWr04a7WDdask6S9akqJv3yjsur9z+L
 TlCLmPH036fn5ycNN6M6APUq/jZdAkh/MhwRgQEDCTMymHj/YhIN/dwdrpYZ/C3uul3Q8XqM70mR7
 O4VO/2VQ==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oBKho-007C5w-3h; Tue, 12 Jul 2022 18:33:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] ASoC: amd: fix Jadeite kconfig warning and build errors
Date: Tue, 12 Jul 2022 11:33:48 -0700
Message-Id: <20220712183348.31046-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Since SND_SOC_ES8316 has a hard dependency on I2C and since 'select'
does not follow any dependency chains, SND_SOC_AMD_ST_ES8336_MACH
also needs to have a hard dependency on I2C.

Fixes a kconfig warning and subsequent build errors:

WARNING: unmet direct dependencies detected for SND_SOC_ES8316
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
  Selected by [y]:
  - SND_SOC_AMD_ST_ES8336_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP [=y] && ACPI [=y] && (I2C [=n] || COMPILE_TEST [=y])

sound/soc/codecs/es8316.c:866:1: warning: data definition has no type or storage class
  866 | module_i2c_driver(es8316_i2c_driver);
sound/soc/codecs/es8316.c:866:1: error: type defaults to ‘int’ in declaration of ‘module_i2c_driver’ [-Werror=implicit-int]
sound/soc/codecs/es8316.c:866:1: warning: parameter names (without types) in function declaration
sound/soc/codecs/es8316.c:857:26: warning: ‘es8316_i2c_driver’ defined but not used [-Wunused-variable]
  857 | static struct i2c_driver es8316_i2c_driver = {

Fixes: f94fa8405801 ("ASoC: amd: enable machine driver build for Jadeite platform")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
---
 sound/soc/amd/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -28,7 +28,7 @@ config SND_SOC_AMD_ST_ES8336_MACH
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_ES8316
 	depends on SND_SOC_AMD_ACP && ACPI
-	depends on I2C || COMPILE_TEST
+	depends on I2C
 	help
 	 This option enables machine driver for Jadeite platform
 	 using es8336 codec.
