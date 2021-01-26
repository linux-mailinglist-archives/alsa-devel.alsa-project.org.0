Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76EF304A0B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 21:25:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1AD81750;
	Tue, 26 Jan 2021 21:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1AD81750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611692704;
	bh=+EsghCNbKfoMSubSdhekrk7Lexni+2yNl926lkdHUas=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gm9XMXYkJfoTt1KymlXB5ck165sjDXG/r7QV5wsCSxq1fBsKm1ngM8OZ6+5/A0JIT
	 lqbKfaT3TVzRkB20cY9Xp8xSoeolQqpY5c6Ge3paiVSA0+L6w6UWAohH44P4ULjknX
	 YZf7cbrGS5KACMOtmeTbhUk36GRYsuBZrum0TUHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF21F801D8;
	Tue, 26 Jan 2021 21:23:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F26CF8015B; Tue, 26 Jan 2021 21:23:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A0D2F80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 21:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A0D2F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qwRjUfaK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F2B122241;
 Tue, 26 Jan 2021 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611692602;
 bh=+EsghCNbKfoMSubSdhekrk7Lexni+2yNl926lkdHUas=;
 h=From:To:Cc:Subject:Date:From;
 b=qwRjUfaK417oQM28DFY8h3Ud1rcErIYR4T7Bmp0ZdAgKa8w/gXoTZIhygR/b+QPRG
 ThnmNkLq6RievbT9icGV7yrwEj9kslvhrvzHMBIAe+3azHatZ+o54YYVY/VFvQvBG1
 2gntQ3GiBy8pF00YTQQcx72bZ9S7TkTNnBSvI0+t+3R2q4faV0Vu9DS2TNjfCIy/sl
 BN+RCQ+4b7QG2hM1TNlRmNed7E7oQyQNG8sJnffJFrhym128OmaPciCSTCDWH32zBb
 eAWcDx0UiTtUizZXKQiyM8Yvcav5WB15Ojw/VbEQ8Gjnt6a25MtgXar7j9Ql1PQyCB
 tvzORGfjCd4Jg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Corentin Chary <corentin.chary@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
Date: Tue, 26 Jan 2021 14:23:17 -0600
Message-Id: <20210126202317.2914080-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 acpi4asus-user@lists.sourceforge.net, amd-gfx@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
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

From: Bjorn Helgaas <bhelgaas@google.com>

The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
Replace it with "if (ACPI_SUCCESS(status))".

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---

This isn't really an ACPI patch, but I'm sending it to you, Rafael, since
it seems easier to just apply these all at once.  But I'd be happy to split
them up into individual patches if you'd rather.


 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_bios.c     | 4 ++--
 drivers/hwmon/acpi_power_meter.c         | 4 ++--
 drivers/platform/x86/asus-laptop.c       | 6 +++---
 drivers/spi/spi.c                        | 2 +-
 sound/pci/hda/hda_intel.c                | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index 6333cada1e09..055f600eeed8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -291,7 +291,7 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
 			continue;
 
 		status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
-		if (!ACPI_FAILURE(status)) {
+		if (ACPI_SUCCESS(status)) {
 			found = true;
 			break;
 		}
@@ -304,7 +304,7 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
 				continue;
 
 			status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
-			if (!ACPI_FAILURE(status)) {
+			if (ACPI_SUCCESS(status)) {
 				found = true;
 				break;
 			}
diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index bb29cf02974d..43bbbfd6ade8 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -205,7 +205,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
 			continue;
 
 		status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
-		if (!ACPI_FAILURE(status)) {
+		if (ACPI_SUCCESS(status)) {
 			found = true;
 			break;
 		}
@@ -218,7 +218,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
 				continue;
 
 			status = acpi_get_handle(dhandle, "ATRM", &atrm_handle);
-			if (!ACPI_FAILURE(status)) {
+			if (ACPI_SUCCESS(status)) {
 				found = true;
 				break;
 			}
diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 848718ab7312..7d3ddcba34ce 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -161,7 +161,7 @@ static ssize_t set_avg_interval(struct device *dev,
 	mutex_lock(&resource->lock);
 	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_PAI",
 				       &args, &data);
-	if (!ACPI_FAILURE(status))
+	if (ACPI_SUCCESS(status))
 		resource->avg_interval = temp;
 	mutex_unlock(&resource->lock);
 
@@ -232,7 +232,7 @@ static ssize_t set_cap(struct device *dev, struct device_attribute *devattr,
 	mutex_lock(&resource->lock);
 	status = acpi_evaluate_integer(resource->acpi_dev->handle, "_SHL",
 				       &args, &data);
-	if (!ACPI_FAILURE(status))
+	if (ACPI_SUCCESS(status))
 		resource->cap = temp;
 	mutex_unlock(&resource->lock);
 
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 0edafe687fa9..bfea656e910c 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -861,7 +861,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 	 * The significance of others is yet to be found.
 	 */
 	rv = acpi_evaluate_integer(asus->handle, "SFUN", NULL, &temp);
-	if (!ACPI_FAILURE(rv))
+	if (ACPI_SUCCESS(rv))
 		len += sprintf(page + len, "SFUN value         : %#x\n",
 			       (uint) temp);
 	/*
@@ -873,7 +873,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 	 * takes several seconds to run on some systems.
 	 */
 	rv = acpi_evaluate_integer(asus->handle, "HWRS", NULL, &temp);
-	if (!ACPI_FAILURE(rv))
+	if (ACPI_SUCCESS(rv))
 		len += sprintf(page + len, "HWRS value         : %#x\n",
 			       (uint) temp);
 	/*
@@ -884,7 +884,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 	 * silently ignored.
 	 */
 	rv = acpi_evaluate_integer(asus->handle, "ASYM", NULL, &temp);
-	if (!ACPI_FAILURE(rv))
+	if (ACPI_SUCCESS(rv))
 		len += sprintf(page + len, "ASYM value         : %#x\n",
 			       (uint) temp);
 	if (asus->dsdt_info) {
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 720ab34784c1..801d8b499788 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2210,7 +2210,7 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 		return AE_OK;
 
 	if (!lookup.max_speed_hz &&
-	    !ACPI_FAILURE(acpi_get_parent(adev->handle, &parent_handle)) &&
+	    ACPI_SUCCESS(acpi_get_parent(adev->handle, &parent_handle)) &&
 	    ACPI_HANDLE(ctlr->dev.parent) == parent_handle) {
 		/* Apple does not use _CRS but nested devices for SPI slaves */
 		acpi_spi_parse_apple_properties(adev, &lookup);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 770ad25f1907..fe8049cd2765 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1444,7 +1444,7 @@ static bool atpx_present(void)
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (dhandle) {
 			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
-			if (!ACPI_FAILURE(status)) {
+			if (ACPI_SUCCESS(status)) {
 				pci_dev_put(pdev);
 				return true;
 			}
@@ -1454,7 +1454,7 @@ static bool atpx_present(void)
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (dhandle) {
 			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
-			if (!ACPI_FAILURE(status)) {
+			if (ACPI_SUCCESS(status)) {
 				pci_dev_put(pdev);
 				return true;
 			}
-- 
2.25.1

