Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F034963D9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 18:26:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083272AE4;
	Fri, 21 Jan 2022 18:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083272AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642785960;
	bh=mBU7v8gENChjwJWL7Qys7pgw6+Shc/Va++Lwq4OPhqg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gu1+fwSi151+UMigQz/KuhXy7Sh9yECwJY4olq+tjSFusOOkQlcYDrFC/3B5rw3mx
	 6nuwRsi7kXi0BF0c4y4nl6GNlTGkXoW0/EICV3N0LZm0h9PUNL3Mvp1m5aArdKPS+r
	 iKZ7YqJJB6ZxmU6imZE6cfRaAfdpwWlDsTVgUVWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 612C7F80302;
	Fri, 21 Jan 2022 18:24:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 924B4F8028B; Fri, 21 Jan 2022 18:24:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9DB3F800F5
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 18:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9DB3F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="B5VlcrdM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LH9Hb3013159;
 Fri, 21 Jan 2022 11:24:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=fdUwz2fE9/QnfJvce4ApsdtnpQfQkVgz1hq5AF0+SjU=;
 b=B5VlcrdMdMnk8NnB1oGnvhNUY8thT0ZHWhzqkHQunX7NyQuJcAtBq8n8dCbgQSYKT5SM
 OslAjFIQCDqEbwQYQ92p15vSdJCpQW3OyzT4AB+VcTrbNo1CeDlindcIxz/Bsw1y3jWt
 62uTq9+gyhPJLWscj0cgTj7hsjozFXA8okB2UdDnYoN5VF/hdpsz46mB5G2Ugg1B3dJW
 /3f1L08AeTQBSdS72TmWxhdUKijFH/ALpCIlH5sujkzffXMQjNjwQ6MSMYKuHWqptE4s
 AdbAgUR4IK5LsrkO+qC+yqBKjmUerS1J9aRDPb9tTnXv4tCl/atB3KPOYA4QOdhUv9WY fA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhynrw8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 11:24:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 17:24:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 17:24:46 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2132CB0E;
 Fri, 21 Jan 2022 17:24:40 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 0/9] Support Spi in i2c-multi-instantiate driver
Date: Fri, 21 Jan 2022 17:24:22 +0000
Message-ID: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: t8MGG8qELi458L786NZmVmfIVRSJege4
X-Proofpoint-GUID: t8MGG8qELi458L786NZmVmfIVRSJege4
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

The new driver (serial multi instantiate, smi) checks for the
hard-coded bus type and returns -ENODEV in case of zero devices
found for that bus. In the case of automatic bus detection, 
the driver will give preference to I2C.

The expectation is for a device node in the ACPI table to have
multiple I2cSerialBus only or multiple SpiSerialBus only, not
a mix of both; and for the case where there are both entries in
one device node, only the I2C ones would be probed.

This new serial multi instantiate will be used in CS35L41 HDA new
driver.

Changes since V5:
 - comment, commit message and Kconfig description fixes
 - minor fixes in serial-multi-instantiate
 - use lowercase for SSIDs in patch_realtek.c

Lucas Tanure (4):
  platform/x86: i2c-multi-instantiate: Rename it for a generic serial
    driver name
  platform/x86: serial-multi-instantiate: Reorganize I2C functions
  ALSA: hda/realtek: Add support for HP Laptops
  ACPI / scan: Create platform device for CS35L41

Stefan Binding (5):
  spi: Make spi_alloc_device and spi_add_device public again
  spi: Create helper API to lookup ACPI info for spi device
  spi: Support selection of the index of the ACPI Spi Resource before
    alloc
  spi: Add API to count spi acpi resources
  platform/x86: serial-multi-instantiate: Add SPI support

 MAINTAINERS                                   |   4 +-
 drivers/acpi/scan.c                           |  16 +-
 drivers/platform/x86/Kconfig                  |  12 +-
 drivers/platform/x86/Makefile                 |   2 +-
 drivers/platform/x86/i2c-multi-instantiate.c  | 174 ---------
 .../platform/x86/serial-multi-instantiate.c   | 349 ++++++++++++++++++
 drivers/spi/spi.c                             | 137 ++++++-
 include/linux/spi/spi.h                       |  20 +
 sound/pci/hda/patch_realtek.c                 |  43 ++-
 9 files changed, 551 insertions(+), 206 deletions(-)
 delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c
 create mode 100644 drivers/platform/x86/serial-multi-instantiate.c

-- 
2.25.1

