Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0E3280D5
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 15:29:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CB081680;
	Mon,  1 Mar 2021 15:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CB081680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614608991;
	bh=x/dddQGyphPEhYcR+WR9KmZMoLhNRTwpHCuBjWNHvbs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kNG7c1LWwrcXolIcrxw98mcpWH6sxHLGBsf92JG4D+C0rhpjkBp22YNsmVCSm2UBR
	 O/FS6wIPtIbVzfRdh+VHR+KNCfBVMPXT6Ro8uYv1hIDa02ssVvJmpVUcRoHgIrhdt5
	 +LpTPoCIVuf3rcSQB2Z0/1HSKKp6L7fknpLGYq/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63BB6F802E0;
	Mon,  1 Mar 2021 10:38:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4717AF804A9; Mon,  1 Mar 2021 10:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODYSUB_10, PRX_BODY_13, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC3B7F802E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 10:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC3B7F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="cMW1IffA"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1219aiWp019980
 for <alsa-devel@alsa-project.org>; Mon, 1 Mar 2021 04:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=QJkNVa30DTK3WP3K0l007xLHd/l262Fr5W+r7JLEpLw=;
 b=cMW1IffACTHV9ljulSW38i3ASdpPP/POw6N7L0UteEVq3lILSNmQlRj7u6j0tripPF2B
 HquqIZXFL9R7oH9fVlnyuth9/LSV1LpKU2lmHgx89oX3sy9k/qTBFmmBFYuzJ2k6uuhW
 oRaWLc16JvYgXwtvQd7UZKjr+ISdbY+UhI40L3wpUyc4K5o2mqviK2w51kgV9W6qtR6n
 TWUo3iiatOAhTYFrpiZfuDNKRX9XcDZijAbtEt8XMcUpCnNPytupBwlLutUnJVoTHFzN
 gfnm26d9zqLNLtq9Xljd8MNdSiyrpW6Wo6kHY5hnB+N2ylvDD2lMxALfgPM+z7rQ5PmP SA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 36yj4jv18n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 04:38:17 -0500
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1219K91r108427
 for <alsa-devel@alsa-project.org>; Mon, 1 Mar 2021 04:38:16 -0500
Received: from ausc60pc101.us.dell.com (ausc60pc101.us.dell.com
 [143.166.85.206])
 by mx0b-00154901.pphosted.com with ESMTP id 37046jn8qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 04:38:16 -0500
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.81,215,1610431200"; d="scan'208";a="1672352590"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com, Mario.Limonciello@dell.com
Subject: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Date: Mon,  1 Mar 2021 17:37:53 +0800
Message-Id: <20210301093753.16300-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_05:2021-02-26,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010078
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010079
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Perry.Yuan@dell.com, lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org
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

From: Perry Yuan <perry_yuan@dell.com>

add support for Dell privacy driver for the Dell units equipped
hardware privacy design, which protect users privacy of audio and
camera from hardware level. Once the audio or camera privacy mode
activated, any applications will not get any audio or video stream
when user pressed ctrl+F4 hotkey, audio privacy mode will be
enabled, micmute led will be also changed accordingly
The micmute led is fully controlled by hardware & EC(embedded controller)
and camera mute hotkey is Ctrl+F9. Currently design only emmits
SW_CAMERA_LENS_COVER event while the camera lens shutter will be
changed by EC & hw(hadware) control

*The flow is like this:
1) User presses key. HW does stuff with this key (timeout timer is started)
2) WMI event is emitted from BIOS to kernel
3) WMI event is received by dell-privacy
4) KEY_MICMUTE emitted from dell-privacy
5) Userland picks up key and modifies kcontrol for SW mute
6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
	ledtrig_audio_set(LED_AUDIO_MICMUTE,
		rt715->micmute_led ? LED_ON :LED_OFF);
7) If "LED" is set to on dell-privacy notifies EC,
	  and timeout is cancelled, HW mic mute activated.

Signed-off-by: Perry Yuan <perry_yuan@dell.com>
---
v3 -> v4:
* fix format for Kconfig
* add sysfs document
* add flow comments to the privacy wmi/acpi driver
* addressed feedback from Barnabás Pőcze[Thanks very much]
* export privacy_valid to make the global state simpler to query
* fix one issue which will block the dell-laptop driver to load when
  privacy driver invalid
* addressed feedback from Pierre-Louis Bossart,remove the EC ID match
v2 -> v3:
* add sysfs attributes doc
v1 -> v2:
* query EC handle from EC driver directly.
* fix some code style.
* add KEY_END to keymap array.
* clean platform device when cleanup called
* use hexadecimal format for log print in dev_dbg
* remove __set_bit for the report keys from probe.
* fix keymap leak
* add err_free_keymap in dell_privacy_wmi_probe
* wmi driver will be unregistered if privacy_acpi_init() fails
* add sysfs attribute files for user space query.
* add leds micmute driver to privacy acpi
* add more design info the commit info
---
---
 .../testing/sysfs-platform-dell-privacy-wmi   |  32 ++
 drivers/platform/x86/Kconfig                  |  17 +
 drivers/platform/x86/Makefile                 |   4 +-
 drivers/platform/x86/dell-laptop.c            |  26 +-
 drivers/platform/x86/dell-privacy-acpi.c      | 164 +++++++++
 drivers/platform/x86/dell-privacy-wmi.c       | 340 ++++++++++++++++++
 drivers/platform/x86/dell-privacy-wmi.h       |  35 ++
 drivers/platform/x86/dell-wmi.c               |  29 +-
 8 files changed, 631 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
 create mode 100644 drivers/platform/x86/dell-privacy-acpi.c
 create mode 100644 drivers/platform/x86/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell-privacy-wmi.h

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
new file mode 100644
index 000000000000..20c15a51ec38
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
@@ -0,0 +1,32 @@
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/devices_supported
+Date:		Feb 2021
+KernelVersion:	5.12
+Contact:	"perry.yuan@dell.com>"
+Description:
+		Display which dell hardware level privacy devices are supported
+		“Dell Privacy” is a set of HW, FW, and SW features to enhance
+		Dell’s commitment to platform privacy for MIC, Camera, and
+		ePrivacy screens.
+		The supported hardware privacy devices are:
+		- 0 = Not Supported
+		- 1 = Supported
+		- Bit0 -> Microphone
+		- Bit1 -> Camera
+		- Bit2 -> ePrivacy Screen
+
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/current_state
+Date:		Feb 2021
+KernelVersion:	5.12
+Contact:	"perry.yuan@dell.com>"
+Description:
+		Allow user space to check current dell privacy device state.
+		Describes the Device State class exposed by BIOS which can be
+		consumed by various applications interested in knowing the Privacy
+		feature capabilities
+		There are three Bits for available states:
+		- 0 = Enabled
+		- 1 = Disabled
+		- Bit0 -> Microphone
+		- Bit1 -> Camera
+		- Bit2 -> ePrivacyScreen
+
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 91e6176cdfbd..e20f79389a39 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -491,6 +491,23 @@ config DELL_WMI_LED
 	  This adds support for the Latitude 2100 and similar
 	  notebooks that have an external LED.
 
+config DELL_PRIVACY
+	tristate "Dell Hardware Privacy Support"
+	depends on ACPI
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on DELL_LAPTOP
+	depends on LEDS_TRIGGER_AUDIO
+	select DELL_WMI
+	  help
+	  This driver provides support for the "Dell Hardware Privacy" feature
+	  of Dell laptops.
+	  Support for a micmute and camera mute privacy will be provided as
+	  hardware button Ctrl+F4 and Ctrl+F9 hotkey.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dell_privacy.
+
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
 	depends on RFKILL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 581475f59819..18c430456de7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -51,7 +51,9 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
 obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
-
+obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy.o
+dell-privacy-objs                       := dell-privacy-wmi.o \
+	                                   dell-privacy-acpi.o
 # Fujitsu
 obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 70edc5bb3a14..ec0dcc7fc17c 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -31,6 +31,8 @@
 #include "dell-rbtn.h"
 #include "dell-smbios.h"
 
+#include "dell-privacy-wmi.h"
+
 struct quirk_entry {
 	bool touchpad_led;
 	bool kbd_led_not_present;
@@ -90,10 +92,12 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 static bool force_rfkill;
+static bool has_privacy;
 
 module_param(force_rfkill, bool, 0444);
 MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
 
+
 static const struct dmi_system_id dell_device_table[] __initconst = {
 	{
 		.ident = "Dell laptop",
@@ -2205,11 +2209,17 @@ static int __init dell_init(void)
 	dell_laptop_register_notifier(&dell_laptop_notifier);
 
 	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
-	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
-		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
-		if (ret < 0)
-			goto fail_led;
+			dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
+		if (!privacy_valid)
+			has_privacy = true;
+		else
+			has_privacy = false;
+		if (!has_privacy) {
+			micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+			ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
+			if (ret < 0)
+				goto fail_led;
+		}
 	}
 
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
@@ -2257,7 +2267,8 @@ static int __init dell_init(void)
 fail_get_brightness:
 	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
-	led_classdev_unregister(&micmute_led_cdev);
+	if (!has_privacy)
+		led_classdev_unregister(&micmute_led_cdev);
 fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
@@ -2278,7 +2289,8 @@ static void __exit dell_exit(void)
 		touchpad_led_exit();
 	kbd_led_exit();
 	backlight_device_unregister(dell_backlight_device);
-	led_classdev_unregister(&micmute_led_cdev);
+	if (!has_privacy)
+		led_classdev_unregister(&micmute_led_cdev);
 	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
diff --git a/drivers/platform/x86/dell-privacy-acpi.c b/drivers/platform/x86/dell-privacy-acpi.c
new file mode 100644
index 000000000000..4c785b62c7c4
--- /dev/null
+++ b/drivers/platform/x86/dell-privacy-acpi.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Dell privacy notification driver
+ *
+ * Copyright (C) 2021 Dell Inc. All Rights Reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include "dell-privacy-wmi.h"
+
+#define PRIVACY_PLATFORM_NAME	"dell-privacy-acpi"
+#define DELL_PRIVACY_GUID	"6932965F-1671-4CEB-B988-D3AB0A901919"
+
+struct privacy_acpi_priv {
+	struct device *dev;
+	struct platform_device *platform_device;
+	struct led_classdev cdev;
+};
+static struct privacy_acpi_priv *privacy_acpi;
+
+static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
+		enum led_brightness brightness)
+{
+	struct privacy_acpi_priv *priv = privacy_acpi;
+	acpi_status status;
+	acpi_handle handle;
+	static char *acpi_method = (char *)"ECAK";
+
+	handle = ec_get_handle();
+	if (!handle)
+		return -EIO;
+	if (!acpi_has_method(handle, acpi_method))
+		return -EIO;
+	status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		dev_err(priv->dev, "Error setting privacy EC ack value: %s\n",
+				acpi_format_exception(status));
+		return -EIO;
+	}
+	pr_debug("set dell privacy micmute ec ack event done\n");
+	return 0;
+}
+
+static int dell_privacy_acpi_remove(struct platform_device *pdev)
+{
+	struct privacy_acpi_priv *priv = dev_get_drvdata(privacy_acpi->dev);
+
+	led_classdev_unregister(&priv->cdev);
+
+	return 0;
+}
+/*
+ * Pressing the mute key activates a time delayed circuit to physically cut
+ * off the mute. The LED is in the same circuit, so it reflects the true
+ * state of the HW mute.  The reason for the EC "ack" is so that software
+ * can first invoke a SW mute before the HW circuit is cut off.  Without SW
+ * cutting this off first does not affect the time delayed muting or status
+ * of the LED but there is a possibility of a "popping" noise.
+ *
+ * If the EC receives the SW ack, the circuit will be activated before the
+ * delay completed.
+ *
+ * Exposing as an LED device allows the codec drivers notification path to
+ * EC ACK to work
+ */
+static int dell_privacy_leds_setup(struct device *dev)
+{
+	struct privacy_acpi_priv *priv = dev_get_drvdata(dev);
+	int ret = 0;
+
+	priv->cdev.name = "dell-privacy::micmute";
+	priv->cdev.max_brightness = 1;
+	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
+	priv->cdev.default_trigger = "audio-micmute";
+	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+	ret = devm_led_classdev_register(dev, &priv->cdev);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static int dell_privacy_acpi_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	platform_set_drvdata(pdev, privacy_acpi);
+	privacy_acpi->dev = &pdev->dev;
+	privacy_acpi->platform_device = pdev;
+
+	ret = dell_privacy_leds_setup(&pdev->dev);
+	if (ret)
+		return -EIO;
+
+	return 0;
+}
+
+static struct platform_driver dell_privacy_platform_drv = {
+	.driver = {
+		.name = PRIVACY_PLATFORM_NAME,
+	},
+	.probe = dell_privacy_acpi_probe,
+	.remove = dell_privacy_acpi_remove,
+};
+
+int __init dell_privacy_acpi_init(void)
+{
+	int err;
+	struct platform_device *pdev;
+
+	if (!wmi_has_guid(DELL_PRIVACY_GUID))
+		return -ENODEV;
+
+	privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
+	if (!privacy_acpi)
+		return -ENOMEM;
+
+	err = platform_driver_register(&dell_privacy_platform_drv);
+	if (err)
+		goto pdrv_err;
+
+	pdev = platform_device_register_simple(
+			PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(pdev)) {
+		err = PTR_ERR(pdev);
+		goto pdev_err;
+	}
+
+	return 0;
+
+pdev_err:
+	platform_device_unregister(pdev);
+pdrv_err:
+	kfree(privacy_acpi);
+	return err;
+}
+
+void __exit dell_privacy_acpi_exit(void)
+{
+	struct platform_device *pdev = to_platform_device(privacy_acpi->dev);
+
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&dell_privacy_platform_drv);
+	kfree(privacy_acpi);
+}
+
+MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
+MODULE_DESCRIPTION("DELL Privacy ACPI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-privacy-wmi.c b/drivers/platform/x86/dell-privacy-wmi.c
new file mode 100644
index 000000000000..f90cb9d066de
--- /dev/null
+++ b/drivers/platform/x86/dell-privacy-wmi.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Dell privacy notification driver
+ *
+ * Copyright (C) 2021 Dell Inc. All Rights Reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#include "dell-privacy-wmi.h"
+
+#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
+#define MICROPHONE_STATUS		BIT(0)
+#define CAMERA_STATUS		        BIT(1)
+#define PRIVACY_SCREEN_STATUS		BIT(2)
+
+/*
+ * The wmi_list is used to store the privacy_priv struct with mutex protecting
+ */
+static LIST_HEAD(wmi_list);
+static DEFINE_MUTEX(list_mutex);
+/*
+ * global privacy state for other modules to query if the privacy driver loaded successfully
+ * or no privacy WMI device was detected at initial probe phase
+ */
+int privacy_valid = -EPROBE_DEFER;
+EXPORT_SYMBOL_GPL(privacy_valid);
+
+struct privacy_wmi_data {
+	struct input_dev *input_dev;
+	struct wmi_device *wdev;
+	struct list_head list;
+	u32 features_present;
+	u32 last_status;
+};
+
+/*
+ * Keymap for WMI privacy events of type 0x0012
+ */
+static const struct key_entry dell_wmi_keymap_type_0012[] = {
+	/* privacy mic mute */
+	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
+	/* privacy camera mute */
+	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
+	{ KE_END, 0},
+};
+
+int dell_privacy_state(void)
+{
+	return privacy_valid;
+}
+EXPORT_SYMBOL_GPL(dell_privacy_state);
+/*
+ * The flow of privacy event:
+ * 1) User presses key. HW does stuff with this key (timeout is started)
+ * 2) WMI event is emitted from BIOS
+ * 3) WMI event is received by dell-privacy
+ * 4) KEY_MICMUTE emitted from dell-privacy
+ * 5) Userland picks up key and modifies kcontrol for SW mute
+ * 6) Codec kernel driver catches and calls ledtrig_audio_set defined by
+ *    dell-privacy-acpi driver.
+ *    codec driver will call like this to switch micmute led state.
+ *	ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led ? LED_ON :LED_OFF);
+ * 7) If "LED" is set to on dell-privacy notifies EC,and timeout is cancelled,
+ *	HW mic mute activated.
+ */
+void dell_privacy_process_event(int type, int code, int status)
+{
+	struct privacy_wmi_data *priv;
+	const struct key_entry *key;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+			struct privacy_wmi_data,
+			list);
+	if (!priv) {
+		pr_err("dell privacy priv is NULL\n");
+		goto error;
+	}
+	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16) | code);
+	if (!key) {
+		dev_dbg(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
+				type, code);
+		goto error;
+	}
+	switch (code) {
+	case DELL_PRIVACY_TYPE_AUDIO: /* Mic mute */
+		priv->last_status = status;
+		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
+		break;
+	case DELL_PRIVACY_TYPE_CAMERA: /* Camera mute */
+		priv->last_status = status;
+		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
+		break;
+	default:
+			dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x",
+					type, code);
+	}
+error:
+	mutex_unlock(&list_mutex);
+}
+EXPORT_SYMBOL_GPL(dell_privacy_process_event);
+
+static ssize_t devices_supported_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%x\n", priv->features_present);
+}
+
+static ssize_t current_state_show(struct device *dev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%x\n", priv->last_status);
+}
+
+static DEVICE_ATTR_RO(devices_supported);
+static DEVICE_ATTR_RO(current_state);
+
+static struct attribute *privacy_attributes[] = {
+	&dev_attr_devices_supported.attr,
+	&dev_attr_current_state.attr,
+	NULL,
+};
+
+static const struct attribute_group privacy_attribute_group = {
+	.attrs = privacy_attributes
+};
+
+/*
+ * Describes the Device State class exposed by BIOS which can be consumed by
+ * various applications interested in knowing the Privacy feature capabilities.
+ * class DeviceState
+ * {
+ *  [key, read] string InstanceName;
+ *  [read] boolean ReadOnly;
+ *  [WmiDataId(1), read] uint32 DevicesSupported;
+ *   0 – None, 0x1 – Microphone, 0x2 – Camera, 0x4 -ePrivacy  Screen
+ *  [WmiDataId(2), read] uint32 CurrentState;
+ *   0:Off; 1:On. Bit0 – Microphone, Bit1 – Camera, Bit2 - ePrivacyScreen
+ * };
+ */
+
+static int get_current_status(struct wmi_device *wdev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
+	union acpi_object *obj_present;
+	u32 *buffer;
+	int ret = 0;
+
+	if (!priv) {
+		pr_err("dell privacy priv is NULL\n");
+		return -EINVAL;
+	}
+	/* check privacy support features and device states */
+	obj_present = wmidev_block_query(wdev, 0);
+	if (!obj_present) {
+		dev_err(&wdev->dev, "failed to read Binary MOF\n");
+		ret = -EIO;
+		privacy_valid = ret;
+		return ret;
+	}
+
+	if (obj_present->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
+		ret = -EIO;
+		privacy_valid = ret;
+		goto obj_free;
+	}
+	/*  Although it's not technically a failure, this would lead to
+	 *  unexpected behavior
+	 */
+	if (obj_present->buffer.length != 8) {
+		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
+				obj_present->buffer.length);
+		ret = -EINVAL;
+		privacy_valid = ret;
+		goto obj_free;
+	}
+	buffer = (u32 *)obj_present->buffer.pointer;
+	priv->features_present = buffer[0];
+	priv->last_status = buffer[1];
+	privacy_valid = 0;
+
+obj_free:
+	kfree(obj_present);
+	return ret;
+}
+
+static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct privacy_wmi_data *priv;
+	struct key_entry *keymap;
+	int ret, i;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+	priv->wdev = wdev;
+	/* create evdev passing interface */
+	priv->input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!priv->input_dev)
+		return -ENOMEM;
+	/* remap the wmi keymap event to new keymap */
+	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
+			sizeof(struct key_entry), GFP_KERNEL);
+	if (!keymap) {
+		ret = -ENOMEM;
+		goto err_free_dev;
+	}
+	/* remap the keymap code with Dell privacy key type 0x12 as prefix
+	 * KEY_MICMUTE scancode will be reported as 0x120001
+	 */
+	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
+		keymap[i] = dell_wmi_keymap_type_0012[i];
+		keymap[i].code |= (0x0012 << 16);
+	}
+	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
+	if (ret)
+		return ret;
+	priv->input_dev->dev.parent = &wdev->dev;
+	priv->input_dev->name = "Dell Privacy Driver";
+	priv->input_dev->id.bustype = BUS_HOST;
+	if (input_register_device(priv->input_dev)) {
+		pr_debug("input_register_device failed to register!\n");
+		goto err_free_keymap;
+	}
+	mutex_lock(&list_mutex);
+	list_add_tail(&priv->list, &wmi_list);
+	mutex_unlock(&list_mutex);
+
+	if (get_current_status(priv->wdev))
+		goto err_free_input;
+
+	ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
+	if (ret)
+		goto err_free_input;
+
+	kfree(keymap);
+	return 0;
+
+err_free_input:
+	input_unregister_device(priv->input_dev);
+err_free_keymap:
+	privacy_valid = -ENODEV;
+	kfree(keymap);
+err_free_dev:
+	input_free_device(priv->input_dev);
+	return ret;
+}
+
+static int dell_privacy_wmi_remove(struct wmi_device *wdev)
+{
+	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
+
+	mutex_lock(&list_mutex);
+	list_del(&priv->list);
+	mutex_unlock(&list_mutex);
+	privacy_valid = -ENODEV;
+	input_unregister_device(priv->input_dev);
+
+	return 0;
+}
+
+static const struct wmi_device_id dell_wmi_privacy_wmi_id_table[] = {
+	{ .guid_string = DELL_PRIVACY_GUID },
+	{ },
+};
+
+static struct wmi_driver dell_privacy_wmi_driver = {
+	.driver = {
+		.name = "dell-privacy",
+	},
+	.probe = dell_privacy_wmi_probe,
+	.remove = dell_privacy_wmi_remove,
+	.id_table = dell_wmi_privacy_wmi_id_table,
+};
+
+static int __init init_dell_privacy(void)
+{
+	int ret;
+
+	ret = wmi_has_guid(DELL_PRIVACY_GUID);
+	if (!ret) {
+		privacy_valid = -ENODEV;
+		pr_debug("Unable to detect available Dell privacy devices: %d\n", ret);
+		return privacy_valid;
+	}
+
+	ret = wmi_driver_register(&dell_privacy_wmi_driver);
+	if (ret) {
+		pr_err("failed to initialize privacy wmi driver: %d\n", ret);
+		return ret;
+	}
+
+	ret = dell_privacy_acpi_init();
+	if (ret) {
+		pr_err("failed to initialize privacy acpi driver: %d\n", ret);
+		goto err_init;
+	}
+
+	return 0;
+
+err_init:
+	wmi_driver_unregister(&dell_privacy_wmi_driver);
+	return ret;
+}
+
+static void dell_privacy_wmi_exit(void)
+{
+	wmi_driver_unregister(&dell_privacy_wmi_driver);
+}
+
+static void __exit exit_dell_privacy(void)
+{
+	dell_privacy_wmi_exit();
+	dell_privacy_acpi_exit();
+}
+
+module_init(init_dell_privacy);
+module_exit(exit_dell_privacy);
+
+MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
+MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
+MODULE_DESCRIPTION("Dell Privacy WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-privacy-wmi.h b/drivers/platform/x86/dell-privacy-wmi.h
new file mode 100644
index 000000000000..6dda2990df5d
--- /dev/null
+++ b/drivers/platform/x86/dell-privacy-wmi.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Dell privacy notification driver
+ *
+ * Copyright (C) 2021 Dell Inc. All Rights Reserved.
+ */
+
+#ifndef _DELL_PRIVACY_WMI_H_
+#define _DELL_PRIVACY_WMI_H_
+
+#if IS_ENABLED(CONFIG_DELL_PRIVACY)
+extern int privacy_valid;
+int  dell_privacy_state(void);
+void dell_privacy_process_event(int type, int code, int status);
+#else /* CONFIG_DELL_PRIVACY */
+int privacy_valid = -ENODEV;
+static inline int dell_privacy_state(void)
+{
+	return privacy_valid;
+}
+
+static inline void dell_privacy_process_event(int type, int code, int status)
+{}
+#endif /* CONFIG_DELL_PRIVACY */
+
+int  dell_privacy_acpi_init(void);
+void dell_privacy_acpi_exit(void);
+
+/* DELL Privacy Type */
+enum {
+	DELL_PRIVACY_TYPE_UNKNOWN = 0x0,
+	DELL_PRIVACY_TYPE_AUDIO,
+	DELL_PRIVACY_TYPE_CAMERA,
+};
+#endif
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index bbdb3e860892..70e83c7c046d 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -13,20 +13,22 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/types.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/dmi.h>
+#include <linux/types.h>
 #include <linux/wmi.h>
 #include <acpi/video.h>
+
 #include "dell-smbios.h"
 #include "dell-wmi-descriptor.h"
+#include "dell-privacy-wmi.h"
 
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
@@ -381,6 +383,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 	u16 *buffer_entry, *buffer_end;
 	acpi_size buffer_size;
 	int len, i;
+	int err;
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
 		pr_warn("bad response type %x\n", obj->type);
@@ -427,10 +430,9 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 
 		switch (buffer_entry[1]) {
 		case 0x0000: /* One key pressed or event occurred */
-		case 0x0012: /* Event with extended data occurred */
 			if (len > 2)
 				dell_wmi_process_key(wdev, buffer_entry[1],
-						     buffer_entry[2]);
+						buffer_entry[2]);
 			/* Extended data is currently ignored */
 			break;
 		case 0x0010: /* Sequence of keys pressed */
@@ -439,6 +441,17 @@ static void dell_wmi_notify(struct wmi_device *wdev,
 				dell_wmi_process_key(wdev, buffer_entry[1],
 						     buffer_entry[i]);
 			break;
+		case 0x0012:
+			err = dell_privacy_state();
+			if (err == 0) {
+				dell_privacy_process_event(buffer_entry[1],
+						buffer_entry[3], buffer_entry[4]);
+			} else {
+				if (len > 2)
+					dell_wmi_process_key(wdev, buffer_entry[1],
+						buffer_entry[2]);
+			}
+			break;
 		default: /* Unknown event */
 			pr_info("Unknown WMI event type 0x%x\n",
 				(int)buffer_entry[1]);
-- 
2.25.1

