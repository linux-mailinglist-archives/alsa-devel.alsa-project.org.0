Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AE494F50
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 14:45:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A80392EF4;
	Thu, 20 Jan 2022 14:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A80392EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642686328;
	bh=nWsvxoa8MD8gyQ3hFz77FuTwryQd5E/j1Mx+AdG4490=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vLFBZD+Qxgrml0O0d5EbFp/nlLvZkePyE3YV3toiNX2axY1rpY37ZDfdbfx4b0eQU
	 KMSQRbq8G+YyEms+3xOUczAIHRdVt5KeWNt+7vc3LunJDHBT8VNH5jRH/Hm1LFmht7
	 HhTybRovDbxgRO6RPBGTQTmS3rDObGZSKvKs+pOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6CF8F80128;
	Thu, 20 Jan 2022 14:43:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E7E6F800F2; Thu, 20 Jan 2022 14:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1BA1F800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 14:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1BA1F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PeG5I/+V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K4mpgj024668;
 Thu, 20 Jan 2022 07:43:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=DzR07ZdJHZPEr4WdjQIs/Aa6Ap341lhnel2ikN6KcYQ=;
 b=PeG5I/+V3g+zlBmOJ0W83BCDaWNbXXtPEiiMk6bY4ne1y6SEHKxnVpaztVD72WjcbWNI
 q32g3B/M522unWRjePKIUew2/H1jn/hdKmfhVfbBhqH0OU81/iIvy5DJ9DplWzGuuPCN
 PRGLXz2m6YBNcspCIywcDrYLLKRJPdd1yT081ibi4t/0cp9+PGbLtTPg7wveglpkzszE
 jto/yj5NDAq/kXbI16Z54cvg9XO1JZepHOgTLoVwPkIUmP+5/F71yzZHSZAh085RGxcm
 H9VgEYl9zp164Z9iYQ3juPDQEXbvbpYzk6EKt1QXyDtHrN+sNTVtNLS4y4KOhUS45pEs RQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dpk9mh838-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jan 2022 07:43:41 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 13:43:40 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 20 Jan 2022 13:43:40 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CEB9CB13;
 Thu, 20 Jan 2022 13:43:39 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 0/9] Support Spi in i2c-multi-instantiate driver
Date: Thu, 20 Jan 2022 13:43:17 +0000
Message-ID: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 12Kqa8o7-oMcgl1qB3jB62GN_b8lxr3R
X-Proofpoint-GUID: 12Kqa8o7-oMcgl1qB3jB62GN_b8lxr3R
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>,
 linux-spi@vger.kernel.org
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

Add support for SPI bus in the i2c-multi-instantiate driver as
upcoming laptops will need to multi instantiate SPI devices from
a single device node, which has multiple SpiSerialBus entries at
the ACPI table.

With the new SPI support, i2c-multi-instantiate becomes
bus-multi-instantiate and is moved to the ACPI folder.

The intention is to support the SPI bus by re-using the current
I2C multi instantiate, instead of creating a new SPI multi
instantiate, to make it possible for peripherals that can be
controlled by I2C or SPI to have the same HID at the ACPI table.

The new driver (Bus multi instantiate, bmi) checks for the
hard-coded bus type and returns -ENODEV in case of zero devices
found for that bus. In the case of automatic bus detection, 
the driver will give preference to I2C.

The expectation is for a device node in the ACPI table to have
multiple I2cSerialBus only or multiple SpiSerialBus only, not
a mix of both; and for the case where there are both entries in
one device node, only the I2C ones would be probed.

This new bus multi instantiate will be used in CS35L41 HDA new
driver.

Changes since V2:
 - Moved bus-multi-instantiate back into platform/x86

Lucas Tanure (4):
  platform/x86: i2c-multi-instantiate: Rename it for a generic bus
    driver name
  platform/x86: bus-multi-instantiate: Reorganize I2C functions
  ALSA: hda/realtek: Add support for HP Laptops
  ACPI / scan: Create platform device for CS35L41

Stefan Binding (5):
  spi: Make spi_alloc_device and spi_add_device public again
  spi: Create helper API to lookup ACPI info for spi device
  spi: Support selection of the index of the ACPI Spi Resource before
    alloc
  spi: Add API to count spi acpi resources
  platform/x86: bus-multi-instantiate: Add SPI support

 MAINTAINERS                                  |   4 +-
 drivers/acpi/scan.c                          |  16 +-
 drivers/platform/x86/Kconfig                 |  14 +-
 drivers/platform/x86/Makefile                |   2 +-
 drivers/platform/x86/bus-multi-instantiate.c | 369 +++++++++++++++++++
 drivers/platform/x86/i2c-multi-instantiate.c | 174 ---------
 drivers/spi/spi.c                            | 142 ++++++-
 include/linux/spi/spi.h                      |  32 ++
 sound/pci/hda/patch_realtek.c                |  43 ++-
 9 files changed, 588 insertions(+), 208 deletions(-)
 create mode 100644 drivers/platform/x86/bus-multi-instantiate.c
 delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c

-- 
2.25.1

