Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217B3555C6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 15:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87DD15F9;
	Tue,  6 Apr 2021 15:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87DD15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617717273;
	bh=3G1M9aN2wq1G+CrndlUJI2VuYi6jzPWue92dEIjE95I=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=r2KW0VULHLO8pQaMeE08v9QRDuDcGrgrojCeJFcHhckcSM/ak8aw6GU9o5e+vg8v2
	 t7tV5gWbgTp8pncsNn084bhPa5VAVEjpME7VICK0rkDlynJEWP8hbtUYo3cnGuR8IE
	 Rr/G9IjSCIR0R1ZaKQKvGL7IcTL6SQ14EwkJGLrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE50F80246;
	Tue,  6 Apr 2021 15:53:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 624CEF8020B; Sun,  4 Apr 2021 18:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODYSUB_10, PRX_BODY_13, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A848FF80127
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 18:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A848FF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="O4qbdzRm"
Date: Sun, 04 Apr 2021 16:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1617555215;
 bh=/Ub0cUJa0jnlWXIwvUuWU2DLTnQMvmVN/5aU0DkDelE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=O4qbdzRmEeq83TQKILykTpJ0Gy+gPgr2TE8WHi8/7zRof/cgkvLhJm3UI0YMSorMi
 9sCAfCjXsvOzP3jlE0LYBz8uBpVs0WFtvspFbNFJRrsRchj77jH2bHqEkWikuXsqCj
 zQXWYyTnybQctrk2pSJCmQR8NQKlpQItmtNriMJQ=
To: Perry Yuan <Perry.Yuan@dell.com>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v6 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Message-ID: <cWWbrEA1yiaAjQlmJAa4JxS_mMAPGbFs8_1vyHRYw9oX5IL3q_B99re11CL1DoTZOER54QHidpc-pb-BQaY2JTLMirsXVFLta-PtfwWhR3E=@protonmail.com>
In-Reply-To: <20210404083137.14364-1-Perry_Yuan@Dell.com>
References: <20210404083137.14364-1-Perry_Yuan@Dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 06 Apr 2021 15:53:04 +0200
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "Mario.Limonciello@dell.com" <Mario.Limonciello@dell.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>,
 "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi


2021. =C3=A1prilis 4., vas=C3=A1rnap 10:31 keltez=C3=A9ssel, Perry Yuan =
=C3=ADrta:

> From: Perry Yuan <perry_yuan@dell.com>
>
> add support for Dell privacy driver for the Dell units equipped
> hardware privacy design, which protect users privacy of audio and
> camera from hardware level. Once the audio or camera privacy mode
> activated, any applications will not get any audio or video stream
> when user pressed ctrl+F4 hotkey, audio privacy mode will be
> enabled, micmute led will be also changed accordingly
> The micmute led is fully controlled by hardware & EC(embedded controller)
> and camera mute hotkey is Ctrl+F9. Currently design only emits
> SW_CAMERA_LENS_COVER event while the camera lens shutter will be
> changed by EC & HW(hardware) control
>
> *The flow is like this:
> 1) User presses key. HW does stuff with this key (timeout timer is starte=
d)
> 2) WMI event is emitted from BIOS to kernel
> 3) WMI event is received by dell-privacy
> 4) KEY_MICMUTE emitted from dell-privacy
> 5) Userland picks up key and modifies kcontrol for SW mute
> 6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
>    ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led ? LED_ON :LED_=
OFF);
> 7) If "LED" is set to on dell-privacy notifies EC, and timeout is cancell=
ed,
>    HW mic mute activated. If EC not notified, HW mic mute will also be
>    activated when timeout used up, it is just later than active ack
>
> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
> ---
> v5 -> v6:
> * addressed feedback from Hans
> * addressed feedback from Pierre
> * optimize some debug format with dev_dbg()
> * remove platform driver,combined privacy acpi driver into single wmi
>   driver file
> * optimize sysfs interface with string added to be more clearly reading
> v4 -> v5:
> * addressed feedback from Randy Dunlap
> * addressed feedback from Pierre-Louis Bossart
> * rebase to latest 5.12 rc4 upstream kernel
> * fix some space alignment problem
> v3 -> v4:
> * fix format for Kconfig
> * add sysfs document
> * add flow comments to the privacy wmi/acpi driver
> * addressed feedback from Barnab=C3=A1s P=C5=91cze[Thanks very much]
> * export privacy_valid to make the global state simpler to query
> * fix one issue which will block the dell-laptop driver to load when
>   privacy driver invalid
> * addressed feedback from Pierre-Louis Bossart,remove the EC ID match
> v2 -> v3:
> * add sysfs attributes doc
> v1 -> v2:
> * query EC handle from EC driver directly.
> * fix some code style.
> * add KEY_END to keymap array.
> * clean platform device when cleanup called
> * use hexadecimal format for log print in dev_dbg
> * remove __set_bit for the report keys from probe.
> * fix keymap leak
> * add err_free_keymap in dell_privacy_wmi_probe
> * wmi driver will be unregistered if privacy_acpi_init() fails
> * add sysfs attribute files for user space query.
> * add leds micmute driver to privacy acpi
> * add more design info the commit info
> ---
> ---
>  .../testing/sysfs-platform-dell-privacy-wmi   |  55 +++
>  drivers/platform/x86/dell/Kconfig             |  14 +
>  drivers/platform/x86/dell/Makefile            |   1 +
>  drivers/platform/x86/dell/dell-laptop.c       |  23 +-
>  drivers/platform/x86/dell/dell-privacy-wmi.c  | 441 ++++++++++++++++++
>  drivers/platform/x86/dell/dell-privacy-wmi.h  |  32 ++
>  drivers/platform/x86/dell/dell-wmi.c          |  13 +-
>  7 files changed, 572 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy=
-wmi
>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/=
Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
> new file mode 100644
> index 000000000000..a57ddc6a221e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
> @@ -0,0 +1,55 @@
> +What:=09=09/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/del=
l_privacy_supported_type
> +Date:=09=09Apr 2021
> +KernelVersion:=095.13
> +Contact:=09"perry.yuan@dell.com>"
> +Description:
> +=09=09Display which dell hardware level privacy devices are supported
> +=09=09=E2=80=9CDell Privacy=E2=80=9D is a set of HW, FW, and SW features=
 to enhance
> +=09=09Dell=E2=80=99s commitment to platform privacy for MIC, Camera, and
> +=09=09ePrivacy screens.
> +=09=09The supported hardware privacy devices are:
> +Attributes:
> +=09=09Microphone Mute:
> +=09=09=09=09Identifies the local microphone can be muted by hardware, no=
 applications
> +=09=09=09=09is available to capture system mic sound
> +
> +                Camera Shutter:
   ^^^^^^^^^^^^^^^^

Spaces used instead of tabs.


> +=09=09=09=09Identifies camera shutter controlled by hardware, which is a=
 micromechanical
> +=09=09=09=09shutter assembly that is built onto the camera module to blo=
ck capturing images
> +=09=09=09=09from outside the laptop
> +
> +=09=09supported:
> +=09=09=09=09The privacy device is supported by this system
> +
> +=09=09unsupported:
> +=09=09=09=09The privacy device is not supported on this system
> +
> +=09=09For example to check which privacy devices are supported:
> +
> +=09=09# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3=
AB0A901919/dell_privacy_supported_type
> +=09=09[Microphone Mute] [supported]
> +=09=09[Camera Shutter] [supported]
> +=09=09[ePrivacy Screen] [unsupport]
> +
> +What:=09=09/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/del=
l_privacy_current_state
> +Date:=09=09Apr 2021
> +KernelVersion:=095.13
> +Contact:=09"perry.yuan@dell.com>"
> +Description:
> +=09=09Allow user space to check current dell privacy device state.
> +=09=09Describes the Device State class exposed by BIOS which can be
> +=09=09consumed by various applications interested in knowing the Privacy
> +=09=09feature capabilities
> +Attributes:
> +=09=09muted:
> +=09=09=09Identifies the privacy device is turned off and cannot send str=
eam to OS applications
> +
> +=09=09unmuted:
> +=09=09=09Identifies the privacy device is turned on ,audio or camera dri=
ver can get
> +=09=09=09stream from mic and camera module to OS applications
> +
> +=09=09For example to check all supported current privacy device states:
> +
> +=09=09# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3=
AB0A901919/dell_privacy_current_state
> +=09=09[Microphone] [unmuted]
> +=09=09[Camera Shutter] [unmuted]
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/del=
l/Kconfig
> index e0a55337f51a..05d124442b25 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -204,4 +204,18 @@ config DELL_WMI_SYSMAN
>  =09  To compile this driver as a module, choose M here: the module will
>  =09  be called dell-wmi-sysman.
>
> +config DELL_PRIVACY
> +=09tristate "Dell Hardware Privacy Support"
> +=09depends on ACPI
> +=09depends on ACPI_WMI
> +=09depends on INPUT
> +=09depends on DELL_LAPTOP
> +=09depends on LEDS_TRIGGER_AUDIO
> +=09select DELL_WMI
> +=09help
> +=09  This driver provides integration with the "Dell Hardware Privacy" f=
eature
> +=09  of Dell laptops.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called dell_privacy.
>  endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/de=
ll/Makefile
> index d720a3e42ae3..7da0c33dfcca 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -19,3 +19,4 @@ obj-$(CONFIG_DELL_WMI_AIO)=09=09+=3D dell-wmi-aio.o
>  obj-$(CONFIG_DELL_WMI_DESCRIPTOR)=09+=3D dell-wmi-descriptor.o
>  obj-$(CONFIG_DELL_WMI_LED)=09=09+=3D dell-wmi-led.o
>  obj-$(CONFIG_DELL_WMI_SYSMAN)=09=09+=3D dell-wmi-sysman/
> +obj-$(CONFIG_DELL_PRIVACY)              +=3D dell-privacy-wmi.o
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x=
86/dell/dell-laptop.c
> index 70edc5bb3a14..a9b4cf13913c 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -31,6 +31,8 @@
>  #include "dell-rbtn.h"
>  #include "dell-smbios.h"
>
> +#include "dell-privacy-wmi.h"
> +
>  struct quirk_entry {
>  =09bool touchpad_led;
>  =09bool kbd_led_not_present;
> @@ -90,6 +92,7 @@ static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
>  static struct rfkill *wwan_rfkill;
>  static bool force_rfkill;
> +static bool has_privacy;
>
>  module_param(force_rfkill, bool, 0444);
>  MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models"=
);
> @@ -2206,10 +2209,16 @@ static int __init dell_init(void)
>
>  =09if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>  =09    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
> -=09=09micmute_led_cdev.brightness =3D ledtrig_audio_get(LED_AUDIO_MICMUT=
E);
> -=09=09ret =3D led_classdev_register(&platform_device->dev, &micmute_led_=
cdev);
> -=09=09if (ret < 0)
> -=09=09=09goto fail_led;
> +=09=09if (dell_privacy_has_micmute())
> +=09=09=09has_privacy =3D true;
> +=09=09else
> +=09=09=09has_privacy =3D false;
> +=09=09if (!has_privacy) {
> +=09=09=09micmute_led_cdev.brightness =3D ledtrig_audio_get(LED_AUDIO_MIC=
MUTE);
> +=09=09=09ret =3D led_classdev_register(&platform_device->dev, &micmute_l=
ed_cdev);
> +=09=09=09if (ret < 0)
> +=09=09=09=09goto fail_led;
> +=09=09}
>  =09}
>
>  =09if (acpi_video_get_backlight_type() !=3D acpi_backlight_vendor)
> @@ -2257,7 +2266,8 @@ static int __init dell_init(void)
>  fail_get_brightness:
>  =09backlight_device_unregister(dell_backlight_device);
>  fail_backlight:
> -=09led_classdev_unregister(&micmute_led_cdev);
> +=09if (!has_privacy)
> +=09=09led_classdev_unregister(&micmute_led_cdev);
>  fail_led:
>  =09dell_cleanup_rfkill();
>  fail_rfkill:
> @@ -2278,7 +2288,8 @@ static void __exit dell_exit(void)
>  =09=09touchpad_led_exit();
>  =09kbd_led_exit();
>  =09backlight_device_unregister(dell_backlight_device);
> -=09led_classdev_unregister(&micmute_led_cdev);
> +=09if (!has_privacy)
> +=09=09led_classdev_unregister(&micmute_led_cdev);
>  =09dell_cleanup_rfkill();
>  =09if (platform_device) {
>  =09=09platform_device_unregister(platform_device);
> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.c b/drivers/platf=
orm/x86/dell/dell-privacy-wmi.c
> new file mode 100644
> index 000000000000..3fae8dd077f1
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Dell privacy notification driver
> + *
> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/list.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#include "dell-privacy-wmi.h"
> +
> +#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
> +#define MICROPHONE_STATUS=09=09BIT(0)
> +#define CAMERA_STATUS=09=09        BIT(1)
> +#define DELL_PRIVACY_AUDIO_EVENT  0x1
> +#define DELL_PRIVACY_CAMERA_EVENT 0x2
> +#define cdev_to_led(c)       container_of(c, struct privacy_wmi_data, cd=
ev)

This name is confusing in my opinion. Something like `led_to_priv` could be
clearer.


> +
> +/*
> + * The wmi_list is used to store the privacy_priv struct with mutex prot=
ecting
> + */
> +static LIST_HEAD(wmi_list);
> +static DEFINE_MUTEX(list_mutex);
> +
> +struct privacy_wmi_data {
> +=09struct input_dev *input_dev;
> +=09struct wmi_device *wdev;
> +=09struct list_head list;
> +=09struct led_classdev cdev;
> +=09u32 features_present;
> +=09u32 last_status;
> +};
> +
> +/* DELL Privacy Type */
> +enum dell_hardware_privacy_type {
> +=09DELL_PRIVACY_TYPE_AUDIO =3D 0,
> +=09DELL_PRIVACY_TYPE_CAMERA,
> +=09DELL_PRIVACY_TYPE_SCREEN,
> +=09DELL_PRIVACY_TYPE_MAX,
> +};
> +
> +static const char * const privacy_types[DELL_PRIVACY_TYPE_MAX] =3D {
> +=09[DELL_PRIVACY_TYPE_AUDIO] =3D "Microphone",
> +=09[DELL_PRIVACY_TYPE_CAMERA] =3D "Camera Shutter",
> +=09[DELL_PRIVACY_TYPE_SCREEN] =3D "ePrivacy Screen",
> +};
> +
> +/*
> + * Keymap for WMI privacy events of type 0x0012
> + */
> +static const struct key_entry dell_wmi_keymap_type_0012[] =3D {
> +=09/* privacy mic mute */
> +=09{ KE_KEY, 0x0001, { KEY_MICMUTE } },
> +=09/* privacy camera mute */
> +=09{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
> +=09{ KE_END, 0},
> +};
> +
> +/*
> + * global privacy state for other modules to query if the privacy driver=
 loaded successfully
> + * or no privacy WMI device was detected at initial probe phase
> + */
> +bool dell_privacy_present(void)
> +{
> +=09struct privacy_wmi_data *priv;
> +
> +=09mutex_lock(&list_mutex);
> +=09priv =3D list_first_entry_or_null(&wmi_list,
> +=09=09=09struct privacy_wmi_data,
> +=09=09=09list);
> +=09mutex_unlock(&list_mutex);
> +
> +=09return priv;
> +}
> +EXPORT_SYMBOL_GPL(dell_privacy_present);
> +
> +/*
> + * Allow other modules to check current dell privacy mic mute state
> + */
> +int dell_privacy_has_micmute(void)
> +{
> +=09struct privacy_wmi_data *priv;
> +=09int ret;
> +
> +=09mutex_lock(&list_mutex);
> +=09priv =3D list_first_entry_or_null(&wmi_list,
> +=09=09=09struct privacy_wmi_data,
> +=09=09=09list);
> +=09/*
> +=09 * There is no privacy device node yet, so we need to wait
> +=09 * until the privacy driver has created software node for the micmute=
 device.
> +=09 * This function will return -EPROBE_DEFER until the privacy device i=
s registered.
> +=09 */
> +=09if (!priv) {
> +=09=09ret =3D -EPROBE_DEFER;
> +=09=09goto out;
> +=09}
> +=09ret =3D priv->features_present & MICROPHONE_STATUS;
> +=09if (!ret) {
> +=09=09dev_err(&priv->wdev->dev, "privacy mic mute feature is not support=
ed: %d\n", ret);
> +=09=09ret =3D -ENODEV;
> +=09=09goto out;
> +=09}
> +=09dev_err(&priv->wdev->dev, "privacy mic mute feature is supported: %d\=
n", ret);

I think this could be `dev_info()`, but definitely not `dev_err()`. Althoug=
h I'd
personally move the logging from here to the probe function if you want to =
log
which features are available. `ret` is necessarily 1 here, so I don't think=
 printing it
provides additional information.


> +
> +out:
> +=09mutex_unlock(&list_mutex);
> +=09return ret;
> +}
> +EXPORT_SYMBOL_GPL(dell_privacy_has_micmute);
> +
> +/*
> + * The flow of privacy event:
> + * 1) User presses key. HW does stuff with this key (timeout is started)
> + * 2) WMI event is emitted from BIOS
> + * 3) WMI event is received by dell-privacy
> + * 4) KEY_MICMUTE emitted from dell-privacy
> + * 5) Userland picks up key and modifies kcontrol for SW mute
> + * 6) Codec kernel driver catches and calls ledtrig_audio_set defined by
> + *    dell-privacy-acpi driver. Codec driver will call like this to swit=
ch micmute led state.
> + *    ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led ? LED_ON :LED_OFF=
);
> + * 7) If "LED" is set to on dell-privacy notifies EC,and timeout is canc=
elled,
> + *=09HW mic mute activated.
> + */
> +bool dell_privacy_process_event(int type, int code, int status)
> +{
> +=09struct privacy_wmi_data *priv;
> +=09const struct key_entry *key;
> +=09bool ret =3D false;
> +
> +=09mutex_lock(&list_mutex);
> +=09priv =3D list_first_entry_or_null(&wmi_list,
> +=09=09=09struct privacy_wmi_data,
> +=09=09=09list);
> +=09if (!priv) {
> +=09=09dev_err(&priv->wdev->dev, "priv data is NULL\n");
> +=09=09goto error;
> +=09}
> +

I think the rest of the function could be replaced with:

  ret =3D sparse_keymap_report_event(priv->input_dev, DELL_SCAN_CODE(type, =
code), 1, true)

  if (ret)
    priv->last_status =3D status;

  error:
    [...]

(see later a comment for the definition of DELL_SCAN_CODE())


> +=09key =3D sparse_keymap_entry_from_scancode(priv->input_dev, (type << 1=
6) | code);
> +=09if (!key) {
> +=09=09dev_warn(&priv->wdev->dev, "Unknown key with type 0x%04x and code =
0x%04x pressed\n",
> +=09=09=09type, code);
> +=09=09goto error;
> +=09}
> +=09dev_dbg(&priv->wdev->dev, "Key with type 0x%04x and code 0x%04x press=
ed\n", type, code);
> +
> +=09switch (code) {
> +=09case DELL_PRIVACY_AUDIO_EVENT: /* Mic mute */
> +=09case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
> +=09=09priv->last_status =3D status;
> +=09=09sparse_keymap_report_entry(priv->input_dev, key, 1, true);
> +=09=09ret =3D true;
> +=09=09break;
> +=09default:
> +=09=09dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x", type=
, code);

The capitalization is inconsistent. Please either make all messages lowerca=
se or
make them all start with an uppercase letter. (And a newline character is m=
issing.)


> +=09}
> +
> +error:
> +=09mutex_unlock(&list_mutex);
> +=09return ret;
> +}
> +EXPORT_SYMBOL_GPL(dell_privacy_process_event);
> +
> +static ssize_t dell_privacy_supported_type_show(struct device *dev,
> +=09=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09=09char *buf)
> +{
> +=09enum dell_hardware_privacy_type type;
> +=09struct privacy_wmi_data *priv =3D dev_get_drvdata(dev);
> +=09char *s =3D buf;
> +=09u32 privacy_list;
> +
> +=09privacy_list =3D priv->features_present;
> +=09for (type =3D DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; =
type++) {
> +=09=09if (privacy_types[type]) {

Is this check necessary?


> +=09=09=09if (privacy_list & BIT(type))
> +=09=09=09=09s +=3D sprintf(s, "[%s] [supported]\n", privacy_types[type])=
;
> +=09=09=09else
> +=09=09=09=09s +=3D sprintf(s, "[%s] [unsupport]\n", privacy_types[type])=
;

You can use `sysfs_emit_at()` here.


> +=09=09}
> +=09}
> +
> +=09if (s !=3D buf)
> +=09=09/* convert the last space to a newline */
> +=09=09*(s-1) =3D '\n';

I believe this is not needed?


> +=09return (s - buf);
> +}
> +
> +static ssize_t dell_privacy_current_state_show(struct device *dev,
> +=09=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09=09char *buf)
> +{
> +=09struct privacy_wmi_data *priv =3D dev_get_drvdata(dev);
> +=09enum dell_hardware_privacy_type type;
> +=09u32 privacy_state =3D priv->last_status;
> +=09u32 privacy_supported =3D priv->features_present;
> +=09char *s =3D buf;
> +
> +=09for (type =3D DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; =
type++) {
> +=09=09if (privacy_supported & BIT(type)) {
> +=09=09=09if (privacy_state & BIT(type))
> +=09=09=09=09s +=3D sprintf(s, "[%s] [unmuted]\n", privacy_types[type]);
> +=09=09=09else
> +=09=09=09=09s +=3D sprintf(s, "[%s] [muted]\n", privacy_types[type]);

sysfs_emit_at


> +=09=09}
> +=09}
> +
> +=09if (s !=3D buf)
> +=09=09/* convert the last space to a newline */
> +=09=09*(s-1) =3D '\n';

not needed?


> +=09return (s - buf);
> +}
> +
> +static DEVICE_ATTR_RO(dell_privacy_supported_type);
> +static DEVICE_ATTR_RO(dell_privacy_current_state);
> +
> +static struct attribute *privacy_attributes[] =3D {
> +=09&dev_attr_dell_privacy_supported_type.attr,
> +=09&dev_attr_dell_privacy_current_state.attr,
> +=09NULL,
> +};
> +
> +static const struct attribute_group privacy_attribute_group =3D {
> +=09.attrs =3D privacy_attributes
> +};
> +
> +/*
> + * Describes the Device State class exposed by BIOS which can be consume=
d by
> + * various applications interested in knowing the Privacy feature capabi=
lities.
> + * class DeviceState
> + * {
> + *  [key, read] string InstanceName;
> + *  [read] boolean ReadOnly;
> + *  [WmiDataId(1), read] uint32 DevicesSupported;
> + *   0 =E2=80=93 None, 0x1 =E2=80=93 Microphone, 0x2 =E2=80=93 Camera, 0=
x4 -ePrivacy  Screen
          ^           ^                 ^             ^        ^^
Please use a single type of hyphen/dash consistently.     One space is enou=
gh.


> + *  [WmiDataId(2), read] uint32 CurrentState;
> + *   0:Off; 1:On. Bit0 =E2=80=93 Microphone, Bit1 =E2=80=93 Camera, Bit2=
 - ePrivacyScreen
                          ^                  ^              ^
Same here.


> + * };
> + */
> +static int get_current_status(struct wmi_device *wdev)
> +{
> +=09struct privacy_wmi_data *priv =3D dev_get_drvdata(&wdev->dev);
> +=09union acpi_object *obj_present;
> +=09u32 *buffer;
> +=09int ret =3D 0;
> +
> +=09if (!priv) {
> +=09=09pr_err("dell privacy priv is NULL\n");

dev_err?


> +=09=09return -EINVAL;
> +=09}
> +=09/* check privacy support features and device states */
> +=09obj_present =3D wmidev_block_query(wdev, 0);
> +=09if (!obj_present) {
> +=09=09dev_err(&wdev->dev, "failed to read Binary MOF\n");
> +=09=09ret =3D -EIO;
> +=09=09return ret;

return -EIO ?


> +=09}
> +
> +=09if (obj_present->type !=3D ACPI_TYPE_BUFFER) {
> +=09=09dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
> +=09=09ret =3D -EIO;
> +=09=09goto obj_free;
> +=09}
> +=09/*  Although it's not technically a failure, this would lead to
> +=09 *  unexpected behavior
> +=09 */
> +=09if (obj_present->buffer.length !=3D 8) {
> +=09=09dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d=
)!\n",
> +=09=09=09=09obj_present->buffer.length);
> +=09=09ret =3D -EINVAL;
> +=09=09goto obj_free;
> +=09}
> +=09buffer =3D (u32 *)obj_present->buffer.pointer;
> +=09priv->features_present =3D buffer[0];
> +=09priv->last_status =3D buffer[1];

It's a minor thing, but I still think it'd more explicit and somewhat bette=
r to
use `get_unaligned_le32()` (or `get_unaligned_cpu32()`).


> +
> +obj_free:
> +=09kfree(obj_present);
> +=09return ret;
> +}
> +
> +static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
> +=09=09=09=09=09enum led_brightness brightness)
> +{
> +=09struct privacy_wmi_data *priv =3D cdev_to_led(led_cdev);
> +=09static char *acpi_method =3D (char *)"ECAK";
> +=09acpi_status status;
> +=09acpi_handle handle;
> +
> +=09handle =3D ec_get_handle();
> +=09if (!handle)
> +=09=09return -EIO;
> +
> +=09if (!acpi_has_method(handle, acpi_method))
> +=09=09return -EIO;
> +
> +=09status =3D acpi_evaluate_object(handle, acpi_method, NULL, NULL);
> +=09if (ACPI_FAILURE(status)) {
> +=09=09dev_err(&priv->wdev->dev, "Error setting privacy EC ack value: %s\=
n",
> +=09=09=09=09acpi_format_exception(status));
> +=09=09return -EIO;
> +=09}
> +
> +=09return 0;
> +}
> +
> +/*
> + * Pressing the mute key activates a time delayed circuit to physically =
cut
> + * off the mute. The LED is in the same circuit, so it reflects the true
> + * state of the HW mute.  The reason for the EC "ack" is so that softwar=
e
> + * can first invoke a SW mute before the HW circuit is cut off.  Without=
 SW
> + * cutting this off first does not affect the time delayed muting or sta=
tus
> + * of the LED but there is a possibility of a "popping" noise.
> + *
> + * If the EC receives the SW ack, the circuit will be activated before t=
he
> + * delay completed.
> + *
> + * Exposing as an LED device allows the codec drivers notification path =
to
> + * EC ACK to work
> + */
> +static int dell_privacy_leds_setup(struct device *dev)
> +{
> +=09struct privacy_wmi_data *priv =3D dev_get_drvdata(dev);
> +=09int ret;
> +
> +=09priv->cdev.name =3D "dell-privacy::micmute";
> +=09priv->cdev.max_brightness =3D 1;
> +=09priv->cdev.brightness_set_blocking =3D dell_privacy_micmute_led_set;
> +=09priv->cdev.default_trigger =3D "audio-micmute";
> +=09priv->cdev.brightness =3D ledtrig_audio_get(LED_AUDIO_MICMUTE);
> +=09ret =3D devm_led_classdev_register(dev, &priv->cdev);
> +=09if (ret)
> +=09=09return ret;
> +=09return 0;

You can replace the last four lines with:

  return devm_led_classdev_register(...);


> +}
> +
> +static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *c=
ontext)
> +{
> +=09struct privacy_wmi_data *priv;
> +=09struct key_entry *keymap;
> +=09int ret, i;
> +
> +=09ret =3D wmi_has_guid(DELL_PRIVACY_GUID);
> +=09if (!ret)
> +=09=09pr_debug("Unable to detect available Dell privacy devices: %d\n", =
ret);

When this branch is taken, `ret` is necessarily zero, so I don't think prin=
ting it
provides useful information.

And I believe this `wmi_has_guid()` check is unnecessary since the probe me=
thod
would not be called if the device didn't have such WMI guid if I'm not mist=
aken.


> +
> +=09priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +=09if (!priv)
> +=09=09return -ENOMEM;
> +
> +=09dev_set_drvdata(&wdev->dev, priv);
> +=09priv->wdev =3D wdev;
> +=09/* create evdev passing interface */
> +=09priv->input_dev =3D devm_input_allocate_device(&wdev->dev);
> +=09if (!priv->input_dev)
> +=09=09return -ENOMEM;
> +
> +=09/* remap the wmi keymap event to new keymap */
> +=09keymap =3D kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
> +=09=09=09sizeof(struct key_entry), GFP_KERNEL);
> +=09if (!keymap)
> +=09=09return -ENOMEM;
> +
> +=09/* remap the keymap code with Dell privacy key type 0x12 as prefix
> +=09 * KEY_MICMUTE scancode will be reported as 0x120001
> +=09 */
> +=09for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
> +=09=09keymap[i] =3D dell_wmi_keymap_type_0012[i];
> +=09=09keymap[i].code |=3D (0x0012 << 16);
> +=09}

I still don't see the need for allocating and copying the keymap. Wouldn't =
the
following be sufficient?

  #define DELL_SCAN_CODE(type, code) ((type) << 16 | (code))
  static const struct key_entry dell_wmi_keymap_type_0012[] =3D {
    { KE_KEY, DELL_SCAN_CODE(0x0012, 0x0001), { KEY_MICMUTE } },
    { KE_SW,  DELL_SCAN_CODE(0x0012, 0x0002), { SW_CAMERA_LENS_COVER } },
    { KE_END, 0},
  };

Other Dell drivers potentially merge multiple keymaps, so dynamically alloc=
ating
the key_entry array is justified. Here I see no such need. Can you explain =
why
this copying is done?


> +=09ret =3D sparse_keymap_setup(priv->input_dev, keymap, NULL);
> +=09if (ret)
> +=09=09return ret;

`keymap` is leaked if this or any of the later early-returns are taken.


> +
> +=09priv->input_dev->dev.parent =3D &wdev->dev;
> +=09priv->input_dev->name =3D "Dell Privacy Driver";
> +=09priv->input_dev->id.bustype =3D BUS_HOST;
> +
> +=09ret =3D input_register_device(priv->input_dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D get_current_status(priv->wdev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D devm_device_add_group(&wdev->dev, &privacy_attribute_group);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D dell_privacy_leds_setup(&priv->wdev->dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09mutex_lock(&list_mutex);
> +=09list_add_tail(&priv->list, &wmi_list);
> +=09mutex_unlock(&list_mutex);
> +=09kfree(keymap);
> +=09return 0;
> +}
> +
> +static int dell_privacy_wmi_remove(struct wmi_device *wdev)
> +{
> +=09struct privacy_wmi_data *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +=09mutex_lock(&list_mutex);
> +=09list_del(&priv->list);
> +=09mutex_unlock(&list_mutex);
> +=09return 0;
> +}
> +
> +static const struct wmi_device_id dell_wmi_privacy_wmi_id_table[] =3D {
> +=09{ .guid_string =3D DELL_PRIVACY_GUID },
> +=09{ },
> +};
> +
> +static struct wmi_driver dell_privacy_wmi_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "dell-privacy",
> +=09},
> +=09.probe =3D dell_privacy_wmi_probe,
> +=09.remove =3D dell_privacy_wmi_remove,
> +=09.id_table =3D dell_wmi_privacy_wmi_id_table,
> +};
> +
> +module_wmi_driver(dell_privacy_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
> +MODULE_DESCRIPTION("Dell Privacy WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.h b/drivers/platf=
orm/x86/dell/dell-privacy-wmi.h
> new file mode 100644
> index 000000000000..a24893754286
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Dell privacy notification driver
> + *
> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
> + */
> +
> +#ifndef _DELL_PRIVACY_WMI_H_
> +#define _DELL_PRIVACY_WMI_H_
> +
> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
> +int dell_privacy_has_micmute(void);
> +bool dell_privacy_present(void);
> +bool dell_privacy_process_event(int type, int code, int status);
> +#else /* CONFIG_DELL_PRIVACY */
> +static inline int dell_privacy_has_micmute(void)
> +{
> +=09return -ENODEV;
> +}
> +
> +static inline int dell_privacy_present(void)
                 ^^^
It's declared with `bool` return type a couple lines above.


> +{
> +=09return -ENODEV;
> +}
> +
> +static inline void dell_privacy_process_event(int type, int code, int st=
atus)
                 ^^^^
It's declared with `bool` return type a couple lines above.


> +{}
> +#endif /* CONFIG_DELL_PRIVACY */
> +
> +int  dell_privacy_acpi_init(void);
> +void dell_privacy_acpi_exit(void);

These two don't seem to be referenced anywhere?


> +#endif
> diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/=
dell/dell-wmi.c
> index bbdb3e860892..8ef9e22a538f 100644
> --- a/drivers/platform/x86/dell/dell-wmi.c
> +++ b/drivers/platform/x86/dell/dell-wmi.c
> @@ -27,6 +27,7 @@
>  #include <acpi/video.h>
>  #include "dell-smbios.h"
>  #include "dell-wmi-descriptor.h"
> +#include "dell-privacy-wmi.h"
>
>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>  MODULE_AUTHOR("Pali Roh=C3=A1r <pali@kernel.org>");
> @@ -381,6 +382,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  =09u16 *buffer_entry, *buffer_end;
>  =09acpi_size buffer_size;
>  =09int len, i;
> +=09int ret;
>
>  =09if (obj->type !=3D ACPI_TYPE_BUFFER) {
>  =09=09pr_warn("bad response type %x\n", obj->type);
> @@ -427,7 +429,6 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>
>  =09=09switch (buffer_entry[1]) {
>  =09=09case 0x0000: /* One key pressed or event occurred */
> -=09=09case 0x0012: /* Event with extended data occurred */
>  =09=09=09if (len > 2)
>  =09=09=09=09dell_wmi_process_key(wdev, buffer_entry[1],
>  =09=09=09=09=09=09     buffer_entry[2]);
> @@ -439,6 +440,16 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  =09=09=09=09dell_wmi_process_key(wdev, buffer_entry[1],
>  =09=09=09=09=09=09     buffer_entry[i]);
>  =09=09=09break;
> +=09=09case 0x0012:
> +=09=09=09ret =3D dell_privacy_present();
> +=09=09=09if ((ret) && (len > 2)) {

Is the `len > 2` check correct?

Moreover, I personally don't see any reason to use a new variable here (`re=
t`).

If you incorporate the `dell_privacy_present()` check into
`dell_privacy_process_event()`, then even

  if (len > ?? && dell_privacy_process_event(...))
    /* nothing */ ;
  else if (len > 2)
    dell_wmi_process_key(...);

would work as Hans has already pointed it out. And there'd be no need for
`dell_privacy_present()` anymore.


> +=09=09=09=09dell_privacy_process_event(buffer_entry[1],
> +=09=09=09=09=09=09=09  buffer_entry[3], buffer_entry[4]);
> +=09=09=09} else if (len > 2) {
> +=09=09=09=09dell_wmi_process_key(wdev, buffer_entry[1],
> +=09=09=09=09=09=09     buffer_entry[2]);
> +=09=09=09}
> +=09=09=09break;
>  =09=09default: /* Unknown event */
>  =09=09=09pr_info("Unknown WMI event type 0x%x\n",
>  =09=09=09=09(int)buffer_entry[1]);
> --
> 2.25.1
>


Regards,
Barnab=C3=A1s P=C5=91cze
