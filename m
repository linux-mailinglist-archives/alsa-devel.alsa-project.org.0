Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED064928DA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 15:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E679E1721;
	Tue, 18 Jan 2022 15:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E679E1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642517683;
	bh=JtGog+Ircd6c9IMJNZtgv2O55Ff5UpzK+7TqYmFuiyE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TF3DVSMoNnz2KR/YeZZpS55qj6iUZVJ6MNh4906aiUOq7lWX3QZ9q4eymUHRosFiE
	 LF2MXQvD7kispt5c3QnNdPImiQryXeuAWWFa3WlnPmsgdzOv4QEbpH95OhoEEwZn/R
	 D+AVu/KxJnU5v/Xr9E8WYeWhtFD36lx65UNE8SaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E95F80240;
	Tue, 18 Jan 2022 15:53:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E978AF80246; Tue, 18 Jan 2022 15:53:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E84BF8023A
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 15:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E84BF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gkkinJg8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20IA16xt003923;
 Tue, 18 Jan 2022 08:53:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=oT71zYZrNYYAVg8RxuJrWoYyZlkJNB+Jr07bzKT9yzM=;
 b=gkkinJg8iKrLsu5gefMkccLiXiaaF52vG01jOgeGPicGGgVTtknU5rW7kmtu8Wx6yU6A
 iJV07uKpNyBrorvOiUEl8cMdbaONSKY58MdRNLrpQ7PHbe7zDi4qf95nRs47/nrSmBJB
 dYJ7gLdClb4wIB3NWNI+4zKpLgnDCzT3Ou8rCEoKs5UvhCtvVF9Zg5I6t+pFG1UqlI7k
 QuV9d5xg/7LbmbJMYLQs0kk9UUA9r2Uo+ldP4TBUbAcbYbzc7PkRvDoVKE+DOd0Sg/F9
 mUZazc9L4r06Wzbptmt2HW5dgOQGVyYn8YH85nQ31P6VyhadYXAD2/+nTBhIOPudtsik tw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dn8k2s8sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jan 2022 08:53:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 14:53:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 18 Jan 2022 14:53:27 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0C01B13;
 Tue, 18 Jan 2022 14:53:19 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 00/10] Support Spi in i2c-multi-instantiate driver
Date: Tue, 18 Jan 2022 14:52:41 +0000
Message-ID: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zA00nyU-pN3X5N5JynvrPg8PJJY7TPPk
X-Proofpoint-ORIG-GUID: zA00nyU-pN3X5N5JynvrPg8PJJY7TPPk
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
 - Fix review comments in bus-multi-instantiate
 - Modified spi code to export new helper to allocate spi device
   based on ACPI
 - Add api in spi code to count number of spi devices in ACPI
 - Add patch to add support for HP Laptops
 - Add patch to add support for various CS35L41 devices in
   scan.c and bus-multi-instantiate from previous chain:
   https://lore.kernel.org/all/20220117160830.709403-1-tanureal@opensource.cirrus.com/

Lucas Tanure (5):
  platform/x86: i2c-multi-instantiate: Move it to drivers/acpi folder
  ACPI: i2c-multi-instantiate: Rename it for a generic bus driver name
  ACPI: bus-multi-instantiate: Reorganize I2C functions
  ALSA: hda/realtek: Add support for HP Laptops
  ACPI / scan: Create platform device for CS35L41

Stefan Binding (5):
  spi: Make spi_alloc_device and spi_add_device public again
  spi: Create helper API to lookup ACPI info for spi device
  spi: Support selection of the index of the ACPI Spi Resource before
    alloc
  spi: Add API to count spi acpi resources
  ACPI: bus-multi-instantiate: Add SPI support

 MAINTAINERS                                  |   4 +-
 drivers/acpi/Kconfig                         |  11 +
 drivers/acpi/Makefile                        |   1 +
 drivers/acpi/bus-multi-instantiate.c         | 369 +++++++++++++++++++
 drivers/acpi/scan.c                          |  16 +-
 drivers/platform/x86/Kconfig                 |  11 -
 drivers/platform/x86/Makefile                |   1 -
 drivers/platform/x86/i2c-multi-instantiate.c | 174 ---------
 drivers/spi/spi.c                            | 142 ++++++-
 include/linux/spi/spi.h                      |  32 ++
 sound/pci/hda/patch_realtek.c                |  43 ++-
 11 files changed, 592 insertions(+), 212 deletions(-)
 create mode 100644 drivers/acpi/bus-multi-instantiate.c
 delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c

-- 
2.25.1

