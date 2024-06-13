Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59159907813
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504BF210C;
	Thu, 13 Jun 2024 18:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504BF210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295437;
	bh=HAObrbbzE0TQLfgup3KQTN40gEAzIttEj6AOQZ738lM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IlW5KZvMNBK5oz9MBRxbyeEr9gGhofHcfgllHt8rPw3oY+2osBBwi/nf27QrGb7To
	 oA3fQhXc918UitMUuE0zPg97cMCBcB5XrmLOgol3kFv4GlWBbrTTBgWtYAZr9UlW/0
	 sytviUyBLNqSuV846woSNPLZDbJKeMcDVduX+wrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20839F89A24; Thu, 13 Jun 2024 18:05:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 808CEF89A23;
	Thu, 13 Jun 2024 18:05:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6296FF80580; Thu, 13 Jun 2024 10:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75681F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 10:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75681F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=m3qHUrZv
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45D8R6kK096441;
	Thu, 13 Jun 2024 03:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718267226;
	bh=6NtxnPB5cbCDF/Wpkq/8aAGbHdXDlZm6OGryzWfh4Q8=;
	h=From:To:CC:Subject:Date;
	b=m3qHUrZvtUT/0EGVmM8zXu7fkYUEyab3avZE3nFIjK6h7aRc8kwwaw++77qReR/Jw
	 ZyGnkFgAETigxm7hpPGU9k+Ny7XJeF5WCpQ4O/cL06/HSJNFnfaUsSlBh4Vs7+GYrH
	 wKvPT/9gvccyBgP8L0OdBu9tQL5RUDSJdtLCPmlI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45D8R6YF012520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 03:27:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 03:27:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 03:27:06 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45D8QwPT058785;
	Thu, 13 Jun 2024 03:26:59 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <shenghao-ding@ti.com>, <navada@ti.com>, <13916275206@139.com>,
        <v-hampiholi@ti.com>, <v-po@ti.com>, <niranjan.hy@ti.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <liam.r.girdwood@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <baojun.xu@ti.com>, <broonie@kernel.org>, <soyer@irl.hu>
Subject: [PATCH v7 0/1] Add tas2781 driver for SPI.
Date: Thu, 13 Jun 2024 16:26:32 +0800
Message-ID: <20240613082633.388-1-baojun.xu@ti.com>
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
Message-ID-Hash: KSCDDDD3AWUH3HB4Y6EWOMDOCWIGAMOU
X-Message-ID-Hash: KSCDDDD3AWUH3HB4Y6EWOMDOCWIGAMOU
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSCDDDD3AWUH3HB4Y6EWOMDOCWIGAMOU/>
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

Baojun Xu (1):
  ALSA: hda/tas2781: Add tas2781 hda driver based on SPI

 drivers/acpi/scan.c                           |    1 +
 .../platform/x86/serial-multi-instantiate.c   |   12 +
 sound/pci/hda/Kconfig                         |   14 +
 sound/pci/hda/Makefile                        |    2 +
 sound/pci/hda/patch_realtek.c                 |   14 +
 sound/pci/hda/tas2781-spi.h                   |  148 ++
 sound/pci/hda/tas2781_hda_spi.c               | 1266 ++++++++++
 sound/pci/hda/tas2781_spi_fwlib.c             | 2101 +++++++++++++++++
 8 files changed, 3558 insertions(+)
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c
 create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c

-- 
2.40.1

