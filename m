Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA802E336C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 02:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2C217D7;
	Mon, 28 Dec 2020 02:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2C217D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609118666;
	bh=l6468ykGjVqpPRRUl52Cs7aMJSadeuA2rrCQiffxDz4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhY4UeS8R78kL6TJwDHACnJRQ1DbSqcX4Zf/PFVaJmaidN4yjq0CNmBsx7f6gXoy4
	 L02ENSexi3WZH9kaSlfxcAsKfOR4GzNjjk2hrX7O3PYbbpesYAXiid+6Rd0jzyNFZ1
	 lF8RvK/e7PSnoUGoqfBXClkxUGLUf+LCdjEEs8yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA72F80279;
	Mon, 28 Dec 2020 02:22:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B622BF80169; Mon, 28 Dec 2020 02:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852F6F8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 02:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852F6F8020C
IronPort-SDR: m7x7CnDQTzDrwTfNmqKUQFxxVMIHGYZyhhZaMoY+zsMcCm8kopnyyihd3R7XF6oDrKc/5VueUB
 HRzShuhjoLWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="156122762"
X-IronPort-AV: E=Sophos;i="5.78,453,1599548400"; d="scan'208";a="156122762"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2020 17:22:13 -0800
IronPort-SDR: q77oZj89JBik9WKpkdovqAW7kEiaGab50MXhxStTwj03iY7y0sRFuX6qlHn5Ls5qe1Bru7X1Ob
 PD4FQ3Vqfxaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,453,1599548400"; d="scan'208";a="343567506"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 27 Dec 2020 17:22:10 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kthEf-0002hJ-Mi; Mon, 28 Dec 2020 01:22:09 +0000
Date: Mon, 28 Dec 2020 09:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH] mfd: arizona: ldoena_gpios can be static
Message-ID: <20201228012155.GA67393@efb0ae19e095>
References: <20201227211232.117801-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201227211232.117801-4-hdegoede@redhat.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org
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


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 arizona-spi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index bcdbd72fefb5ae..7453c8fdd3f6d1 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -26,7 +26,7 @@
 
 #ifdef CONFIG_ACPI
 const struct acpi_gpio_params reset_gpios = { 1, 0, false };
-const struct acpi_gpio_params ldoena_gpios = { 2, 0, false };
+static const struct acpi_gpio_params ldoena_gpios = { 2, 0, false };
 
 static const struct acpi_gpio_mapping arizona_acpi_gpios[] = {
 	{ "reset-gpios", &reset_gpios, 1, },
