Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2502C98B6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 08:56:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B203178B;
	Tue,  1 Dec 2020 08:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B203178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606809418;
	bh=p1wQfzJKhCDmyd6jugRzGwXQI82OM1YN/x0eH5HzUGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X44l2IEHfAwHW6ww7dCukMV9KW4RZG9ULCDSWo8yuvVXGnsYvmrs0VkNe9WBNfVbq
	 TNsuEPeFk7iYmIQ8hwsFCtuLGbUpW+/g+sjRl1EEjo+4MYSxAINPmiSRIHHv0OtbWK
	 kAeQbsSD6z/gAK/oDRDhcCKnFeYCiS88G4xEVWGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65FC4F80254;
	Tue,  1 Dec 2020 08:55:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DB37F8016D; Tue,  1 Dec 2020 08:55:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B93FF80158
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 08:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B93FF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="Cf/vNuXV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=tw0DJA4esh5MMXV9OzeODejW4HL90j+FG+EMlgyXvp0=; b=Cf/vNuXVuVMeKwuF4k94Eu69Z1
 ujSyjGMGGguVdArj1vQerOkDUPQPbiroc0KX+YaSAUqPxNAlDEWxPwc/wv47fFEsfu/U15oN3/9X8
 EiiKE+X+bxuvPQJWLPzz2qq7kjfu8UqxOtFoDGS8pffA0CxnUs/axbsc76RxhixnkPAgWIgISWy/A
 VYPhtrAuinbhjZo+AljZJ1fR5F3SIx64c84TEAlD6EHMFBG1CEY27srOoQwOQHjMhbj4C/tuCwuqO
 Tls+GALdsdkCUgj0zW0t17U9E2zkPrmMU2BE0zhtXHytPqXc1ykbhj1YcsNPkPUjaC11YA6MevsOm
 wvWXu7MQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kk0V9-00083n-Ot; Tue, 01 Dec 2020 08:55:07 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kk0V9-000JKe-KU; Tue, 01 Dec 2020 08:55:07 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: adau1372: Add missing KConfig dependencies
Date: Tue,  1 Dec 2020 08:54:35 +0100
Message-Id: <20201201075435.29909-1-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26004/Mon Nov 30 15:29:06 2020)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
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

The I2C and SPI version of the adau1372 driver respectively depend on the
I2C and SPI framework being enabled. Otherwise compile or linker errors
will occur when building the driver.

Add the proper Kconfig dependencies to ensure that the drivers are only
selectable if the required framework is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/soc/codecs/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ec30d700901b..c3cb7ca3f883 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -372,11 +372,13 @@ config SND_SOC_ADAU1372
 
 config SND_SOC_ADAU1372_I2C
 	tristate "Analog Devices ADAU1372 CODEC (I2C)"
+	depends on I2C
 	select SND_SOC_ADAU1372
 	select REGMAP_I2C
 
 config SND_SOC_ADAU1372_SPI
 	tristate "Analog Devices ADAU1372 CODEC (SPI)"
+	depends on SPI_MASTER
 	select SND_SOC_ADAU1372
 	select REGMAP_SPI
 
-- 
2.20.1

