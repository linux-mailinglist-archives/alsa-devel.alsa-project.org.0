Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42356FD58
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 11:54:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883D6825;
	Mon, 11 Jul 2022 11:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883D6825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657533275;
	bh=3N262QoHq7zgv+1D1IpRmJMMCOTGj2506vH+/IAwPgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X1rm2RSqzdMQyWJU86Cfk0lIwmQhl28LXtZXeT8Kp1M1nRGOxrE+sV41yePDWvd4r
	 XoLSIgEfCeGMJL0XgowQT76OtN/vP+zY72L/r07UMJZlnr/Bo9D3BXnO5vkSGe3T/r
	 twGSsfzQQQBQeWq3XU2CmzhGqTT+/YWMlQjpuU7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE057F80543;
	Mon, 11 Jul 2022 11:52:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44ACAF80163; Mon, 11 Jul 2022 11:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3237AF80163
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 11:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3237AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S5P3e3lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657533150; x=1689069150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3N262QoHq7zgv+1D1IpRmJMMCOTGj2506vH+/IAwPgk=;
 b=S5P3e3lrWAjMRCoZTpzU0bAkDTgmU4wZDZIE47X9+Xy6DEtSQ47ZNtV7
 9C5nCbKuaC195swjG/2NmYpVKlwCf6xluOne4zHePUVmos/kBkNK4sH1H
 EaYh6xV+d+YoXhA8Dnj+Fznho89kf4KzDkzmyw0iiWrIG3JLtD0zoP28T
 hrxlSVSaZC7AnluSTZK04sliP9dBgZdNCAzo14Qvkgg/6sjrmD6Q4EdqJ
 AJDQmXY4gWWuSMYz/QBKp8d5FkjqEiHD/yKtJAu+eZMGqlRXB+CBiGob8
 gZ78h83e3axf6pIcX0BN4lOjTEVarKswaR2Ca/wDQlGoN78JT/jFwPH0j Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="370930114"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="370930114"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 02:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="840953940"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2022 02:52:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 85029400; Mon, 11 Jul 2022 12:52:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH v1 4/4] ALSA: hda: cs35l41: Consolidate selections under
 SND_HDA_SCODEC_CS35L41
Date: Mon, 11 Jul 2022 12:52:19 +0300
Message-Id: <20220711095219.36915-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711095219.36915-1-andriy.shevchenko@linux.intel.com>
References: <20220711095219.36915-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>
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

Selections can be propagated via selections, while dependencies are not.
Hence, consolidate selections under the SND_HDA_SCODEC_CS35L41 option.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index e86cf80bdf96..8b73a12d356f 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -93,16 +93,16 @@ config SND_HDA_PATCH_LOADER
 
 config SND_HDA_SCODEC_CS35L41
 	tristate
+	select SND_HDA_GENERIC
+	select REGMAP_IRQ
 
 config SND_HDA_SCODEC_CS35L41_I2C
 	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
 	depends on I2C
 	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
-	select SND_HDA_GENERIC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
-	select REGMAP_IRQ
 	help
 	  Say Y or M here to include CS35L41 I2C HD-audio side codec support
 	  in snd-hda-intel driver, such as ALC287.
@@ -115,10 +115,8 @@ config SND_HDA_SCODEC_CS35L41_SPI
 	depends on SPI_MASTER
 	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
-	select SND_HDA_GENERIC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
-	select REGMAP_IRQ
 	help
 	  Say Y or M here to include CS35L41 SPI HD-audio side codec support
 	  in snd-hda-intel driver, such as ALC287.
-- 
2.35.1

