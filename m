Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8741080D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 14:55:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C551316E4;
	Wed,  1 May 2019 14:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C551316E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556715331;
	bh=d/evx9heqFxX/YYLgj4Q61wgcPVlgCDubDsiJQufby4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oejGyAInSKzPK49qoABKktzPtrZ+V70rwDpXSRXzbF/KM1XQrUKymclj7NFdUKp/B
	 RsiV7cvgVqNq5k6e0uuEztSWRD0ez4vQ1XFNr6dJAIbtddJbM8LQJBUSzGTTY+N52s
	 x9lmY/wsdjvkqhGaBUmkKbcnuQOd5mpS0IPRQ4Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA953F896B6;
	Wed,  1 May 2019 14:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B7FEF896B7; Wed,  1 May 2019 14:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 802F2F89693
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 14:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 802F2F89693
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 05:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,417,1549958400"; d="scan'208";a="320528458"
Received: from sbahirat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.197])
 by orsmga005.jf.intel.com with ESMTP; 01 May 2019 05:53:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 07:53:22 -0500
Message-Id: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Robert Moore <robert.moore@intel.com>,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, joe@perches.com,
 "open list:ACPI COMPONENT ARCHITECTURE ACPICA" <devel@acpica.org>,
 Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
Subject: [alsa-devel] [PATCH v2] ACPI / device_sysfs: change _ADR
	representation to 64 bits
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Standards such as the MIPI DisCo for SoundWire 1.0 specification
assume the _ADR field is 64 bits.

_ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
released in 2002. The low levels already use _ADR as 64 bits, e.g. in
struct acpi_device_info.

This patch bumps the representation used for sysfs to 64 bits. To
avoid any compatibility/ABI issues, the printf format is only extended
to 16 characters when the actual _ADR value exceeds the 32 bit
maximum.

Example with a SoundWire device, the results show the complete
vendorID and linkID which were omitted before:

Before:
$ more /sys/bus/acpi/devices/device\:38/adr
0x5d070000
After:
$ more /sys/bus/acpi/devices/device\:38/adr
0x000010025d070000

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
v2: only use 64 bits when required to avoid compatibility issues
(feedback from Vinod and Rafael)

 drivers/acpi/device_sysfs.c | 6 ++++--
 include/acpi/acpi_bus.h     | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
index 8940054d6250..7dda0ee05cd1 100644
--- a/drivers/acpi/device_sysfs.c
+++ b/drivers/acpi/device_sysfs.c
@@ -428,8 +428,10 @@ static ssize_t acpi_device_adr_show(struct device *dev,
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 
-	return sprintf(buf, "0x%08x\n",
-		       (unsigned int)(acpi_dev->pnp.bus_address));
+	if (acpi_dev->pnp.bus_address > 0xFFFFFFFF)
+		return sprintf(buf, "0x%016llx\n", acpi_dev->pnp.bus_address);
+	else
+		return sprintf(buf, "0x%08llx\n", acpi_dev->pnp.bus_address);
 }
 static DEVICE_ATTR(adr, 0444, acpi_device_adr_show, NULL);
 
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index f7981751ac77..9075e28ea60a 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -230,7 +230,7 @@ struct acpi_device_dir {
 /* Plug and Play */
 
 typedef char acpi_bus_id[8];
-typedef unsigned long acpi_bus_address;
+typedef u64 acpi_bus_address;
 typedef char acpi_device_name[40];
 typedef char acpi_device_class[20];
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
