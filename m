Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F8200098
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 05:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B978167E;
	Fri, 19 Jun 2020 05:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B978167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592536569;
	bh=CHyUvF+FHtgsfUgeUaw4JuaxnX+a/7Zn0xNWqLmTAWA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AD9mf+KH8NlZQ+ZiLdpgJkQdVOzpVa0XDigX1yaKi39Q2J073L1ZWoadBH+zLH8Wf
	 Lmljtj+pWyCgWiuHWaqvSxWjbzWhQ9NqL2Q6AM2yFbs/O0u+Ugxv+WbkDNgIQbRDPF
	 F8F2Ji0MPRYaWk2FHBnZIfgzpHD/3yFKIH7oWvgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD056F80255;
	Fri, 19 Jun 2020 05:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2067F80252; Fri, 19 Jun 2020 05:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FF0EF800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 05:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FF0EF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jtNMIWpC"
Received: by mail-pg1-x543.google.com with SMTP id e9so3860078pgo.9
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=07k7/aElZ8IDLCRU1K4WL2sU+mJSMesA92lX9Cgm4xc=;
 b=jtNMIWpCdbUvuwaeyg40ayk1MkX3OBzqXRCdE2UYXvjV9o8dIAvuVO2NSvYqEi5t0F
 4tqrZ8VeiUZOScf6O7CzKyIWPP7XWwOy+fswvSqLV7vuZvoxwgrzGIuw+4PyiIt1rDOU
 yYyZvXsrq5g8glNsjNH8wMcUQ3CYIw7tioOhjtGC9CYyiv0HyIK0kgfKw87izG6+7g0r
 F/BUxjjzcEHBNtqGczqVrOvqUGj0NSv0cE+IBU2V8SFdXs43jV23phebv4Ulr22UdneX
 pXmV1JHmu5zgaA3rkzNmoO7aplf7u0kYlZh6EOKVfg9ET48WARQxgaWrcLYJYp+182zk
 bGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=07k7/aElZ8IDLCRU1K4WL2sU+mJSMesA92lX9Cgm4xc=;
 b=r/ssnxiwgDNdtxvhSpjuqTAb1eiBGdolAMky0/DJg7Qhv7BSqJjHzjXd1JrvRKFTu6
 YRMhv8397+kOmPWVQqVDc1EDySAqs6IPKATt9i+h2VeGZS/UPLIsEgFv4FdgmLY/e4JP
 xsLnwznP2Rvi2sqbcDlI6NHOGueRxa2cBZrM1niDGm9SwH1RFurAaFfSlT5y19q2lrUO
 ci6qPf7eqs8Uu6WnYpbDpXWDckHR3/rpiYJevedW5F8Wvvq1ouwDR+wvQYTC7zsA/VYw
 8d+e/l/3FUnvKivozPiwf83eAafRT5fkW7TJ23wUBr97xh5SBa7BjHleQmnLeTzm2Wux
 ULcA==
X-Gm-Message-State: AOAM530BUmaPslg+tOcji+iLTXPWWSEkZvrEY+9sPknksodi4LSBEK55
 lwl+aHyjjR9E3zbI8YDIcWRasw==
X-Google-Smtp-Source: ABdhPJwGwCVcBLgClj3L2vTEWGSoJjxxWLP+tqv/lhVv4JWDOx2UhrGvfsXrcTPDwl8DUTPlqWO5Wg==
X-Received: by 2002:a63:fa4d:: with SMTP id g13mr1374296pgk.26.1592536450109; 
 Thu, 18 Jun 2020 20:14:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 u61sm3842579pjb.7.2020.06.18.20.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 20:14:09 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] ASoC: qcom: Kconfig: Tweak dependencies on SND_SOC_SDM845
Date: Fri, 19 Jun 2020 03:14:07 +0000
Message-Id: <20200619031407.116140-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 John Stultz <john.stultz@linaro.org>, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>
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

CROS_EC isn't strictly required for audio to work
on other SDM845 platforms (like the Dragonboard 845c).

So lets remove the dependency and select the related
CROS_EC options via imply.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
Cc: Patrick Lai <plai@codeaurora.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Switch to using imply as suggested by Srinivas
---
 sound/soc/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index f51b28d1b94d..0ea4cde9f4f0 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -99,12 +99,12 @@ config SND_SOC_MSM8996
 
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
-	depends on QCOM_APR && CROS_EC && I2C && SOUNDWIRE
+	depends on QCOM_APR && I2C && SOUNDWIRE
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
-	select SND_SOC_CROS_EC_CODEC
+	imply SND_SOC_CROS_EC_CODEC
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SDM845 SoC-based systems.
-- 
2.17.1

