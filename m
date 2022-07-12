Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 883FA571F88
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 17:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0FD41673;
	Tue, 12 Jul 2022 17:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0FD41673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657640230;
	bh=o0xWXv2hPnaq6dui+hkXkWYBLtudgtqDyCMY+iqKa4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ToEcX4lgQvPnkNGMyDNc3WewFdHQNlA4JIjnVTPxDpxdZGeidRJ2X1iXVdw7JfjE6
	 B8PTJI0nPkLs5LO3ZPc326adilbLa69eZ+gcUgJZFd/xt3beAJ0kENkajWAkTrtUPZ
	 T3uz+mYN2M5zAVTzas2GAuZmygOsBm+isRuDSH7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D11CF80506;
	Tue, 12 Jul 2022 17:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC2BF8053D; Tue, 12 Jul 2022 17:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1EFF800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 17:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1EFF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MEfnz00Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657640127; x=1689176127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0xWXv2hPnaq6dui+hkXkWYBLtudgtqDyCMY+iqKa4I=;
 b=MEfnz00ZXkCuuj1xA169UbXK+I69Gn6Nt2d/vg5E/WuK9lw32Pn6rWHt
 XHjBoK7BZ+y6zQaqRqn7cvdCuaVoZZ01rdHswh3ge8jUBx4f6Q1+P+YrV
 dWqIRsScmjyWn1901HmZL+ed5pUh0ulJ4WIUuL8pc/aOwMFkcxoOZQQza
 pXZPsEQ/q9xVoPLhWsYnWFC2PDBBNP49thJd6U1Wege8+JPJ4NiSr3MFf
 EXW2aU7KAHIfuQ2VWtT8FFA45TKP1g9POdFATGhvpDl9cwCg+iOfmrK/7
 NVDOzub3nwMrinAdhhJRH3JecCWAYjXVY50vQj4LOCFwvK2qftPtq1KcE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="310590178"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="310590178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 08:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="662994045"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2022 08:35:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3808916D; Tue, 12 Jul 2022 18:35:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH v2 4/4] ALSA: hda: cs35l41: Consolidate selections under
 SND_HDA_SCODEC_CS35L41
Date: Tue, 12 Jul 2022 18:35:19 +0300
Message-Id: <20220712153519.35692-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712153519.35692-1-andriy.shevchenko@linux.intel.com>
References: <20220712153519.35692-1-andriy.shevchenko@linux.intel.com>
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
v2: no changes
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

