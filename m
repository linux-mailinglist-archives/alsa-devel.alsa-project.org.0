Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1697460A6A
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Nov 2021 22:51:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B0B1751;
	Sun, 28 Nov 2021 22:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B0B1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638136286;
	bh=vTd3nGG/eLMbgTIHPzxaCMJMQvtLFOUexfekoS64Hv4=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2n9w7tHfKvDpHl0flMDj87srorjOuU4Br2348xzeYK+4pNQuCqryRdl6LCIfBZmi
	 3yFf4+wWeY4aHmbbttpyWH+JR3Z2t3tW5blQQS39F8PXGKskp49zSa2K45fXs1omq0
	 0Dt21yTx2LcbZnAUQUtFkb3BleWnEg2ChmZRjM7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EA9F800EE;
	Sun, 28 Nov 2021 22:50:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5E52F8028D; Sun, 28 Nov 2021 22:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20DF6F80149
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 22:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20DF6F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=base.nu header.i=@base.nu
 header.b="Z/SbFvCo"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=s1; bh=vTd3nGG/eLMbgTIHP
 zxaCMJMQvtLFOUexfekoS64Hv4=;
 h=references:in-reply-to:subject:to:from:
 date; d=base.nu; b=Z/SbFvCoA+xw0/WOSQ19uMFDn05I9H/FIJnko55BUxFuB6DYdZE
 hfBP7GhOwHYJGDySsUtnbi5Yc8/R3ge+O4RNkA2r8fOWfHRVz7ZK807I9SwoK6xpBFxjp9
 USrKP+9c0Ac9F67A5oObIR5smhAs3uBzO26DbpdMMcAeUY9QLYzv0ujFRfr6f7jnB8WsWv
 97+yj4CWN8YDCTto9T+wMzFh2+NVWK12FCI+HsiLvyQexSXla1y/vsu+22LnvKe/WmB86v
 NW8GzX73Ps3TxgNLTAdxQRbFkb6P6BhABnWAmch95jOCxYJNsLQxh/96aWoQWer0FY3sDM
 VA1pCnRYIfA==
Received: from hellmouth.base.nu (localhost [127.0.0.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 59ced277
 for <alsa-devel@alsa-project.org>;
 Sun, 28 Nov 2021 21:50:02 +0000 (UTC)
Received: from [127.0.0.1] ([46.193.66.172]) by hellmouth.base.nu with ESMTPSA
 id AoVOHYr5o2FvagAADaPQrA (envelope-from <livvy@base.nu>)
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 21:50:02 +0000
Date: Sun, 28 Nov 2021 22:50:02 +0100
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_Sound=3A_Add_support_for_t?=
 =?US-ASCII?Q?he_Pioneer_DJM_750MK2_Mixer/Soundcard?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20211010145841.11907-1-willovertonuk@gmail.com>
References: <20211010145841.11907-1-willovertonuk@gmail.com>
Message-ID: <542FEC66-D75D-4F5D-97DC-01835777295C@base.nu>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 10 October 2021 16:58:41 CEST, William Overton <willovertonuk@gmail=2Eco=
m> wrote:
>The kernel already has support for very similar Pioneer djm products and =
this work is based on that=2E
>
>Added device to quirks-table=2Eh and added control info to mixer_quirks=
=2Ec=2E
>
>Tested on my hardware and all working=2E
>
>Signed-off-by: William Overton <willovertonuk@gmail=2Ecom>
>---
> sound/usb/mixer_quirks=2Ec | 34 +++++++++++++++++++++++
> sound/usb/quirks-table=2Eh | 58 ++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 92 insertions(+)
>
>diff --git a/sound/usb/mixer_quirks=2Ec b/sound/usb/mixer_quirks=2Ec
>index 46082dc57be0=2E=2Ed489c1de3bae 100644
>--- a/sound/usb/mixer_quirks=2Ec
>+++ b/sound/usb/mixer_quirks=2Ec
>@@ -2795,6 +2795,7 @@ static int snd_bbfpro_controls_create(struct usb_mi=
xer_interface *mixer)
> #define SND_DJM_750_IDX		0x1
> #define SND_DJM_850_IDX		0x2
> #define SND_DJM_900NXS2_IDX	0x3
>+#define SND_DJM_750MK2_IDX	0x4
>=20
>=20
> #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
>@@ -2984,10 +2985,40 @@ static const struct snd_djm_ctl snd_djm_ctls_900n=
xs2[] =3D {
> 	SND_DJM_CTL("Ch5 Input",   900nxs2_cap5, 3, SND_DJM_WINDEX_CAP)
> };
>=20
>+// DJM-750MK2
>+static const u16 snd_djm_opts_750mk2_cap1[] =3D {
>+	0x0100, 0x0102, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a };
>+static const u16 snd_djm_opts_750mk2_cap2[] =3D {
>+	0x0200, 0x0202, 0x0203, 0x0206, 0x0207, 0x0208, 0x0209, 0x020a };
>+static const u16 snd_djm_opts_750mk2_cap3[] =3D {
>+	0x0300, 0x0302, 0x0303, 0x0306, 0x0307, 0x0308, 0x0309, 0x030a };
>+static const u16 snd_djm_opts_750mk2_cap4[] =3D {
>+	0x0400, 0x0402, 0x0403, 0x0406, 0x0407, 0x0408, 0x0409, 0x040a };
>+static const u16 snd_djm_opts_750mk2_cap5[] =3D {
>+	0x0507, 0x0508, 0x0509, 0x050a, 0x0511, 0x0512, 0x0513, 0x0514 };
>+
>+static const u16 snd_djm_opts_750mk2_pb1[] =3D { 0x0100, 0x0101, 0x0104 =
};
>+static const u16 snd_djm_opts_750mk2_pb2[] =3D { 0x0200, 0x0201, 0x0204 =
};
>+static const u16 snd_djm_opts_750mk2_pb3[] =3D { 0x0300, 0x0301, 0x0304 =
};
>+
>+
>+static const struct snd_djm_ctl snd_djm_ctls_750mk2[] =3D {
>+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
>+	SND_DJM_CTL("Ch1 Input",   750mk2_cap1, 2, SND_DJM_WINDEX_CAP),
>+	SND_DJM_CTL("Ch2 Input",   750mk2_cap2, 2, SND_DJM_WINDEX_CAP),
>+	SND_DJM_CTL("Ch3 Input",   750mk2_cap3, 2, SND_DJM_WINDEX_CAP),
>+	SND_DJM_CTL("Ch4 Input",   750mk2_cap4, 2, SND_DJM_WINDEX_CAP),
>+	SND_DJM_CTL("Ch5 Input",   750mk2_cap5, 3, SND_DJM_WINDEX_CAP),
>+	SND_DJM_CTL("Ch1 Output",   750mk2_pb1, 0, SND_DJM_WINDEX_PB),
>+	SND_DJM_CTL("Ch2 Output",   750mk2_pb2, 1, SND_DJM_WINDEX_PB),
>+	SND_DJM_CTL("Ch3 Output",   750mk2_pb3, 2, SND_DJM_WINDEX_PB)
>+};
>+
>=20
> static const struct snd_djm_device snd_djm_devices[] =3D {
> 	SND_DJM_DEVICE(250mk2),
> 	SND_DJM_DEVICE(750),
>+	SND_DJM_DEVICE(750mk2),
> 	SND_DJM_DEVICE(850),
> 	SND_DJM_DEVICE(900nxs2)
> };
>@@ -3235,6 +3266,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mix=
er_interface *mixer)
> 	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
> 		err =3D snd_djm_controls_create(mixer, SND_DJM_750_IDX);
> 		break;
>+	case USB_ID(0x2b73, 0x001b): /* Pioneer DJ DJM-750MK2 */
>+		err =3D snd_djm_controls_create(mixer, SND_DJM_750MK2_IDX);
>+		break;
> 	case USB_ID(0x08e4, 0x0163): /* Pioneer DJ DJM-850 */
> 		err =3D snd_djm_controls_create(mixer, SND_DJM_850_IDX);
> 		break;
>diff --git a/sound/usb/quirks-table=2Eh b/sound/usb/quirks-table=2Eh
>index e03043f7dad3=2E=2Ebc0116273e94 100644
>--- a/sound/usb/quirks-table=2Eh
>+++ b/sound/usb/quirks-table=2Eh
>@@ -3850,6 +3850,64 @@ YAMAHA_DEVICE(0x7010, "UB99"),
> 		}
> 	}
> },
>+{
>+	/*
>+	 * Pioneer DJ DJM-750MK2
>+	 * 10 channels playback & 12 channels capture @ 48kHz S24LE
>+	 */
>+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x001b),
>+	=2Edriver_info =3D (unsigned long) &(const struct snd_usb_audio_quirk) =
{
>+		=2Eifnum =3D QUIRK_ANY_INTERFACE,
>+		=2Etype =3D QUIRK_COMPOSITE,
>+		=2Edata =3D (const struct snd_usb_audio_quirk[]) {
>+			{
>+				=2Eifnum =3D 0,
>+				=2Etype =3D QUIRK_AUDIO_FIXED_ENDPOINT,
>+				=2Edata =3D &(const struct audioformat) {
>+					=2Eformats =3D SNDRV_PCM_FMTBIT_S24_3LE,
>+					=2Echannels =3D 10,
>+					=2Eiface =3D 0,
>+					=2Ealtsetting =3D 1,
>+					=2Ealtset_idx =3D 1,
>+					=2Eendpoint =3D 0x01,
>+					=2Eep_attr =3D USB_ENDPOINT_XFER_ISOC|
>+					    USB_ENDPOINT_SYNC_ASYNC,
>+					=2Erates =3D SNDRV_PCM_RATE_48000,
>+					=2Erate_min =3D 48000,
>+					=2Erate_max =3D 48000,
>+					=2Enr_rates =3D 1,
>+					=2Erate_table =3D (unsigned int[]) {
>+						48000
>+					}
>+				}
>+			},
>+			{
>+				=2Eifnum =3D 0,
>+				=2Etype =3D QUIRK_AUDIO_FIXED_ENDPOINT,
>+				=2Edata =3D &(const struct audioformat) {
>+					=2Eformats =3D SNDRV_PCM_FMTBIT_S24_3LE,
>+					=2Echannels =3D 12,
>+					=2Eiface =3D 0,
>+					=2Ealtsetting =3D 1,
>+					=2Ealtset_idx =3D 1,
>+					=2Eendpoint =3D 0x82,
>+					=2Eep_idx =3D 1,
>+					=2Eep_attr =3D USB_ENDPOINT_XFER_ISOC|
>+						USB_ENDPOINT_SYNC_ASYNC|
>+						USB_ENDPOINT_USAGE_IMPLICIT_FB,
>+					=2Erates =3D SNDRV_PCM_RATE_48000,
>+					=2Erate_min =3D 48000,
>+					=2Erate_max =3D 48000,
>+					=2Enr_rates =3D 1,
>+					=2Erate_table =3D (unsigned int[]) { 48000 }
>+				}
>+			},
>+			{
>+				=2Eifnum =3D -1
>+			}
>+		}
>+	}
>+},
> {
> 	/*
> 	 * Pioneer DJ DJM-850

This patch has potentially introduced a bug in mixer controls for other de=
vices=2E The device index should match the position in the array=2E Should =
add "SND_DJM_DEVICE(750mk2)," if the IDX is 0x4=2E

Will make a patch and add comment if I have the time=2E

Olivia
