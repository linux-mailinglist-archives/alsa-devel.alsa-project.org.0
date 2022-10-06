Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BF5F721E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Oct 2022 02:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D62A1666;
	Fri,  7 Oct 2022 01:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D62A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665100803;
	bh=GubIuvwTi7+BQrL8Mxaavx53iikFhz4GGXttcAkf2G0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DgnyDIOXeeEX8XUTxF3nyqXnoTkZBcaw4Zhz9Rr0a3aoGjUNKUMjznKf/1m7GvzTs
	 K7H+SQg/6kzxdF/LhcZswVlESOCQzeKN+0uJs1nckclGoZV9jfetKB+vhB9FdeAQzA
	 bfYNYE37/YP5aCrJKPT1F2tzjTtHukN8HuFts4pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E7E3F80424;
	Fri,  7 Oct 2022 01:59:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 002B5F802BE; Fri,  7 Oct 2022 01:59:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16EF3F800BF
 for <alsa-devel@alsa-project.org>; Fri,  7 Oct 2022 01:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16EF3F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="kZzdyoud"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Gxc90LALKCGw03i9q6AW2ibojsSeeP/54Gweysctd9E=; b=kZzdyoudU3Qd4nKIuVaPDxHP96
 nd+DEpGujDwPt7F+Spxgqyv0ik832ldoYu9KRgn+wdNUeY64rNibQRyNZlVj7TVyLgxesEA9vAgm5
 I3GPDtw/a686JMn9wjjRHC7issOKllcV/QA9j7Ee6A88WaODaRdh5ZfwI6/OCmSHazRqq8vvk4VcH
 NFSXCq6mRH+63L6FFr/Hs+KG3UNgH7X7dzeXdRil080MqaI721O//5psJ/1EX8yQlgAQH4d/jaPGH
 9AzFxmtfErihsyQqzuTcSWElTHV3uzfZP4niLsGNm0rQ6EQNLUrRlvTIqi9ZS9C/KtIxy+PFBivCw
 dP591g3Q==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ogalI-001XLV-Bz; Thu, 06 Oct 2022 23:58:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa883x: add GPIOLIB dependency
Date: Thu,  6 Oct 2022 16:58:35 -0700
Message-Id: <20221006235835.31072-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>
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

Fix a build error when GPIOLIB is not set/enabled:

../sound/soc/codecs/wsa883x.c: In function 'wsa883x_probe':
../sound/soc/codecs/wsa883x.c:1394:25: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
 1394 |         wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
../sound/soc/codecs/wsa883x.c:1395:49: error: 'GPIOD_FLAGS_BIT_NONEXCLUSIVE' undeclared (first use in this function)
 1395 |                                                 GPIOD_FLAGS_BIT_NONEXCLUSIVE);
../sound/soc/codecs/wsa883x.c:1414:9: error: implicit declaration of function 'gpiod_direction_output'; did you mean 'gpio_direction_output'? [-Werror=implicit-function-declaration]
 1414 |         gpiod_direction_output(wsa883x->sd_n, 1);


Fixes: 43b8c7dc85a14 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
---
 sound/soc/codecs/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2029,6 +2029,7 @@ config SND_SOC_WSA881X
 config SND_SOC_WSA883X
 	tristate "WSA883X Codec"
 	depends on SOUNDWIRE
+	depends on GPIOLIB
 	select REGMAP_SOUNDWIRE
 	tristate
 	help
