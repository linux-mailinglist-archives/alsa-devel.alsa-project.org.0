Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2EF8A9F63
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 18:00:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B6A2BD3;
	Thu, 18 Apr 2024 18:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B6A2BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713456024;
	bh=4yYFpI40HF8hoBgPI51w7Phe0yr2o8NsS/vauU47CsY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=caU+b1FtzjqaPrOTVtjIYfI8c8eDh4o2Q5GihrhLUtdCnpTYgvqVYD1fbKXvleC0O
	 VW2dbyqrqe9XqFVH+HNzuOukarG43ScLUxlm4JiV24aaZco9Zosa3LXLbe7K5mPsk8
	 YWN2pkirNp25lS0TVFgil3IAn6XQTaBUx3PwMcWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5954F80568; Thu, 18 Apr 2024 17:53:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E72BF897E6;
	Thu, 18 Apr 2024 17:53:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 733E2F80423; Thu, 18 Apr 2024 06:03:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FF4BF80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF4BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Yao/4Z9G
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43I43FnE128703;
	Wed, 17 Apr 2024 23:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713412995;
	bh=spfUr/qhLIVWEOh0la3CmouAOkTlfQqnVFmDsZxox7g=;
	h=From:To:CC:Subject:Date;
	b=Yao/4Z9G4WBWCC+7UFMYQZZjusSa9GuBGXjGGWU2n8kKS1N10NqWT5RHx/4X1cX+O
	 RfWBh2dA4qMEBwonsFe6jiihMlRDS2qkF2Jd7ODslVZNZvCRO+mekT+KNgJfFbPzpq
	 2bO3UpmNjWEx2hFHskL2XqzWLoFBCRnoEo874HQ4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43I43FSf016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 23:03:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 23:03:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 23:03:15 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43I439ik070557;
	Wed, 17 Apr 2024 23:03:09 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <shenghao-ding@ti.com>, <navada@ti.com>, <13916275206@139.com>,
        <v-po@ti.com>, <niranjan.hy@ti.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <broonie@kernel.org>, <soyer@irl.hu>
Subject: [PATCH v3 0/3] ALSA: hda/tas2781: Add tas2781 driver for SPI.
Date: Thu, 18 Apr 2024 12:02:36 +0800
Message-ID: <20240418040240.2337-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CYGT5DWAEJDXL3GACLG7C64WDW4JRMIT
X-Message-ID-Hash: CYGT5DWAEJDXL3GACLG7C64WDW4JRMIT
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYGT5DWAEJDXL3GACLG7C64WDW4JRMIT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
It use ACPI node descript about parameters of TAS2781 on SPI, it like:
    Scope (_SB.PC00.SPI0)
    {
        Device (GSPK)
        {
            Name (_HID, "TXNW2781")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    SpiSerialBusV2 (...)
                    SpiSerialBusV2 (...)
                }
            }
        }
    }

And in platform/x86/serial-multi-instantiate.c, those spi devices will be
added into system as a single SPI device, so TAS2781 SPI driver will
probe twice for every single SPI device. And driver will also parser
mono DSP firmware binary and RCA binary for itself.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Baojun Xu (3):
  ALSA: hda/tas2781: Modification for add tas2781 driver for SPI
  ALSA: hda/tas2781: Main code of tas2781 driver for SPI
  ALSA: hda/tas2781: Firmware load for tas2781 driver for SPI

 drivers/acpi/scan.c                           |    1 +
 .../platform/x86/serial-multi-instantiate.c   |   10 +
 sound/pci/hda/Kconfig                         |   15 +
 sound/pci/hda/Makefile                        |    2 +
 sound/pci/hda/patch_realtek.c                 |   13 +
 sound/pci/hda/tas2781-spi.h                   |  165 ++
 sound/pci/hda/tas2781_hda_spi.c               | 1305 ++++++++++
 sound/pci/hda/tas2781_spi_fwlib.c             | 2272 +++++++++++++++++
 8 files changed, 3783 insertions(+)
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c
 create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c

-- 
2.40.1

