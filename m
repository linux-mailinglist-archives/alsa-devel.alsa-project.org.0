Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186467769D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:45:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C571E41EC;
	Mon, 23 Jan 2023 09:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C571E41EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463552;
	bh=0iZ/R0dVF8F48USATu7yXFVqUlTIMGl7DX81/T9GpGU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BqIHfHA1H6xzLR5r15nqQsTLWYtbUKdy14xWwXGF7VFsXZOnIbkT5B4Q44LNTZ92o
	 xUyuKWmxYA4nQghbpj1CKCKLqIkCT0OhdS+pQFMvV0CclxNZUAoxWD9KVpvzFAjgyN
	 F+pb9cWHOcR/tNLkJKYRbDW2olLAlC8npInp8v+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50B2BF8057C;
	Mon, 23 Jan 2023 09:42:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E7F2F8026D; Fri, 20 Jan 2023 23:54:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FC48F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 23:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC48F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=akamai.com header.i=@akamai.com header.a=rsa-sha256
 header.s=jan2016.eng header.b=EPT8LfiB
Received: from pps.filterd (m0050093.ppops.net [127.0.0.1])
 by m0050093.ppops.net-00190b01. (8.17.1.19/8.17.1.19) with ESMTP id
 30KKxCF7012239
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 22:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=date : from : to :
 subject : message-id : mime-version : content-type; s=jan2016.eng;
 bh=axqHJeCq5SawaU6hJmZgETb5nFLY/rXcuyDJgvsGRDk=;
 b=EPT8LfiBuC88gJjKGJqyc4AIXd4Ctwwn4wCnxbNC/5zuU0TykOxVBCWOlYbwdrihp5fl
 Bzf5pjWgL81LgIMwQbqiF34hB+8IIKXe9Qzl7fszCL1AoVVHm3skbUsoq+hlM2dv3enu
 CKD6FHr/hTTRvhku5+rwWiyEkHL4CFkBn/ziUibj20EfONxGhGF+m3plzmUxYTugpb+3
 YSlJ5i5yCdJTVE/LvBKXev79cw4nGeh3zLFIhA5zJzl6ZLuNzIOA8b8krTD9U4Hy8++H
 YECtI9wlQAZ0Z6Dfb++uXQNYMBFg1TU7wsHJlFL/31SHJ/rVjs/aeDQuVcu/yhHBWZCz HA== 
Received: from prod-mail-ppoint6 (prod-mail-ppoint6.akamai.com [184.51.33.61]
 (may be forged))
 by m0050093.ppops.net-00190b01. (PPS) with ESMTPS id 3n6b7fy7dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 22:54:21 +0000
Received: from pps.filterd (prod-mail-ppoint6.akamai.com [127.0.0.1])
 by prod-mail-ppoint6.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KLw4ax006969
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 17:54:20 -0500
Received: from email.msg.corp.akamai.com ([172.27.91.21])
 by prod-mail-ppoint6.akamai.com (PPS) with ESMTPS id 3n3rm3gcqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 17:54:20 -0500
Received: from usma1ex-dag4mb4.msg.corp.akamai.com (172.27.91.23) by
 usma1ex-dag4mb2.msg.corp.akamai.com (172.27.91.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 20 Jan 2023 17:54:19 -0500
Received: from akamai.com (172.28.222.23) by
 usma1ex-dag4mb4.msg.corp.akamai.com (172.27.91.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20 via Frontend Transport; Fri, 20 Jan 2023 17:54:19 -0500
Date: Fri, 20 Jan 2023 16:54:18 -0600
From: Andy Bailey <bailey@akamai.com>
To: <alsa-devel@alsa-project.org>
Subject: Behringer UV1 needs modified USB-Audio.pcm.iec958_device index
Message-ID: <20230120225418.3tt3ylaqad73behb@akamai.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nvot62spc3o42ig2"
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_11,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200218
X-Proofpoint-ORIG-GUID: QGThhuJx7IIynQy00ZsvVYYixie7gVpn
X-Proofpoint-GUID: QGThhuJx7IIynQy00ZsvVYYixie7gVpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_11,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301200219
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:42:43 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

--nvot62spc3o42ig2
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline

I recently purchased a Behringer UV1 USB Channel strip interface and
found that the Analog Stereo Duplex profile using Pipewire+ALSA would
work as a source but not an output, but if I selected the IEC958
Profile, everything works fine. Indeed, the device has no digital outs,
so I modified /usr/share/alsa/cards/USB-Audio.conf setting the iec958
index to 999, and now the Analog Stereo Duplex profile is working
nicely.

I'm not sure whether "Behringer UV1" or "UV1" is the correct card string
so I've uploaded my alsa-info output with id
f4314b25c46bf1f9aa35231aad198db6723bec17.

Thanks!!

-- 
   .andy

--nvot62spc3o42ig2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="alsa-info.txt"
Content-Transfer-Encoding: quoted-printable

upload=3Dtrue&script=3Dtrue&cardinfo=3D
!!################################
!!ALSA Information Script v 0.5.1
!!################################

!!Script ran on: Fri Jan 20 22:42:11 UTC 2023


!!Linux Distribution
!!------------------

DISTRIB_ID=3DUbuntu DISTRIB_DESCRIPTION=3D"Ubuntu 22.04.1 LTS" PRETTY_NAME=
=3D"Ubuntu 22.04.1 LTS" NAME=3D"Ubuntu" ID=3Dubuntu ID_LIKE=3Ddebian HOME_U=
RL=3D"https://www.ubuntu.com/" SUPPORT_URL=3D"https://help.ubuntu.com/" BUG=
_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/" PRIVACY_POLICY_URL=3D"ht=
tps://www.ubuntu.com/legal/terms-and-policies/privacy-policy" UBUNTU_CODENA=
ME=3Djammy


!!DMI Information
!!---------------

Manufacturer:      Dell Inc.
Product Name:      Precision 5560
Product Version:  =20
Firmware Version:  1.17.0
System SKU:        0A62
Board Vendor:      Dell Inc.
Board Name:        0WPMMN


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/ACPI000C:00/status 	 15
/sys/bus/acpi/devices/ACPI000E:00/status 	 15
/sys/bus/acpi/devices/DLL0945:00/status 	 15
/sys/bus/acpi/devices/DLLK0A62:00/status 	 15
/sys/bus/acpi/devices/INT33A1:00/status 	 15
/sys/bus/acpi/devices/INT33E1:00/status 	 15
/sys/bus/acpi/devices/INT340E:00/status 	 15
/sys/bus/acpi/devices/INT3472:07/status 	 15
/sys/bus/acpi/devices/INT34C6:00/status 	 15
/sys/bus/acpi/devices/INT3F0D:00/status 	 15
/sys/bus/acpi/devices/INTC1040:00/status 	 15
/sys/bus/acpi/devices/INTC1043:00/status 	 15
/sys/bus/acpi/devices/INTC1043:01/status 	 15
/sys/bus/acpi/devices/INTC1043:02/status 	 15
/sys/bus/acpi/devices/INTC1043:03/status 	 15
/sys/bus/acpi/devices/INTC1043:04/status 	 15
/sys/bus/acpi/devices/INTC1043:05/status 	 15
/sys/bus/acpi/devices/INTC1043:06/status 	 15
/sys/bus/acpi/devices/INTC1043:07/status 	 15
/sys/bus/acpi/devices/INTC1043:08/status 	 15
/sys/bus/acpi/devices/INTC1047:00/status 	 15
/sys/bus/acpi/devices/INTC1050:00/status 	 15
/sys/bus/acpi/devices/INTC1051:00/status 	 15
/sys/bus/acpi/devices/LNXPOWER:00/status 	 1
/sys/bus/acpi/devices/LNXPOWER:01/status 	 1
/sys/bus/acpi/devices/LNXPOWER:02/status 	 1
/sys/bus/acpi/devices/LNXPOWER:03/status 	 1
/sys/bus/acpi/devices/LNXPOWER:04/status 	 1
/sys/bus/acpi/devices/LNXPOWER:05/status 	 1
/sys/bus/acpi/devices/LNXPOWER:06/status 	 1
/sys/bus/acpi/devices/LNXPOWER:07/status 	 1
/sys/bus/acpi/devices/LNXPOWER:08/status 	 1
/sys/bus/acpi/devices/LNXPOWER:09/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0a/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0b/status 	 1
/sys/bus/acpi/devices/LNXVIDEO:00/status 	 15
/sys/bus/acpi/devices/NVDA0820:00/status 	 15
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0C02:02/status 	 11
/sys/bus/acpi/devices/PNP0C02:04/status 	 11
/sys/bus/acpi/devices/PNP0C04:00/status 	 31
/sys/bus/acpi/devices/PNP0C09:00/status 	 15
/sys/bus/acpi/devices/PNP0C0A:00/status 	 31
/sys/bus/acpi/devices/PRP00001:00/status 	 11
/sys/bus/acpi/devices/PRP00001:01/status 	 11
/sys/bus/acpi/devices/SONY362A:00/status 	 15
/sys/bus/acpi/devices/STM0125:00/status 	 15
/sys/bus/acpi/devices/USBC000:00/status 	 15
/sys/bus/acpi/devices/device:0f/status 	 15
/sys/bus/acpi/devices/device:6f/status 	 15
/sys/bus/acpi/devices/device:92/status 	 15
/sys/bus/acpi/devices/device:93/status 	 15
/sys/bus/acpi/devices/device:94/status 	 15
/sys/bus/acpi/devices/device:96/status 	 15
/sys/bus/acpi/devices/device:97/status 	 15
/sys/bus/acpi/devices/device:98/status 	 15
/sys/bus/acpi/devices/device:9d/status 	 15
/sys/bus/acpi/devices/device:a5/status 	 15
/sys/bus/acpi/devices/device:aa/status 	 15
/sys/bus/acpi/devices/device:ac/status 	 15


!!Kernel Information
!!------------------

Kernel release:    5.14.0-1054-oem
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         x86_64
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k5.14.0-1054-oem
Library version:    1.2.6.1
Utilities version:  1.2.6


!!Loaded ALSA modules
!!-------------------

snd_usb_audio (card 0)
snd_usb_audio (card 1)


!!Sound Servers on this system
!!----------------------------

PipeWire:
      Installed - Yes (/usr/bin/pipewire)
      Running - Yes

Pulseaudio:
      Installed - Yes (/usr/bin/pulseaudio)
      Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [U0x46d0x809    ]: USB-Audio - USB Device 0x46d:0x809
                      USB Device 0x46d:0x809 at usb-0000:00:14.0-4.1.3.1.4,=
 high speed
 1 [UV1            ]: USB-Audio - UV1
                      Behringer UV1 at usb-0000:00:14.0-4.1.3.1.1.1, high s=
peed


!!PCI Soundcards installed in the system
!!--------------------------------------



!!Modprobe options (Sound related)
!!--------------------------------

snd_pcsp: index=3D-2
snd_usb_audio: index=3D-2
snd_atiixp_modem: index=3D-2
snd_intel8x0m: index=3D-2
snd_via82xx_modem: index=3D-2
snd_atiixp_modem: index=3D-2
snd_intel8x0m: index=3D-2
snd_via82xx_modem: index=3D-2
snd_usb_audio: index=3D-2
snd_usb_caiaq: index=3D-2
snd_usb_ua101: index=3D-2
snd_usb_us122l: index=3D-2
snd_usb_usx2y: index=3D-2
snd_cmipci: mpu_port=3D0x330 fm_port=3D0x388
snd_pcsp: index=3D-2
snd_usb_audio: index=3D-2
snd_hda_intel: patch=3Dhda-jack-retask.fw,hda-jack-retask.fw,hda-jack-retas=
k.fw,hda-jack-retask.fw
snd_usb_audio: implicit_fb=3D1


!!Loaded sound module options
!!---------------------------

!!Module: snd_usb_audio
	autoclock : Y
	delayed_register : (null),(null),(null),(null),(null),(null),(null),(null)=
,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(nul=
l),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(n=
ull),(null),(null)
	device_setup : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0=
,0,0
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null)=
,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(nul=
l),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(n=
ull)
	ignore_ctl_error : N
	implicit_fb : Y,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,=
N,N
	index : -2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,=
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	lowlatency : Y
	pid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1=
,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : (null),(null),(null),(null),(null),(null),(null),(null),(nul=
l),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(n=
ull),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),=
(null),(null)
	skip_validation : N
	use_vmalloc : Y
	vid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1=
,-1,-1,-1,-1,-1,-1,-1,-1,-1

!!Module: snd_usb_audio
	autoclock : Y
	delayed_register : (null),(null),(null),(null),(null),(null),(null),(null)=
,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(nul=
l),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(n=
ull),(null),(null)
	device_setup : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0=
,0,0
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null)=
,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(nul=
l),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(n=
ull)
	ignore_ctl_error : N
	implicit_fb : Y,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,=
N,N
	index : -2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,=
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	lowlatency : Y
	pid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1=
,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : (null),(null),(null),(null),(null),(null),(null),(null),(nul=
l),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(n=
ull),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),=
(null),(null)
	skip_validation : N
	use_vmalloc : Y
	vid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1=
,-1,-1,-1,-1,-1,-1,-1,-1,-1


!!Sysfs card info
!!---------------

!!Card: /sys/class/sound/card0
Driver: /sys/bus/usb/drivers/snd-usb-audio
Tree:
	/sys/class/sound/card0
	|-- controlC0
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- power
	|   |-- subsystem -> ../../../../../../../../../../../../../class/sound
	|   `-- uevent
	|-- device -> ../../../3-4.1.3.1.4:1.2
	|-- id
	|-- number
	|-- pcmC0D0c
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../../../../../../../class/sound
	|   `-- uevent
	|-- power
	|   |-- async
	|   |-- autosuspend_delay_ms
	|   |-- control
	|   |-- runtime_active_kids
	|   |-- runtime_active_time
	|   |-- runtime_enabled
	|   |-- runtime_status
	|   |-- runtime_suspended_time
	|   `-- runtime_usage
	|-- subsystem -> ../../../../../../../../../../../../class/sound
	`-- uevent

!!Card: /sys/class/sound/card1
Driver: /sys/bus/usb/drivers/snd-usb-audio
Tree:
	/sys/class/sound/card1
	|-- controlC1
	|   |-- dev
	|   |-- device -> ../../card1
	|   |-- power
	|   |-- subsystem -> ../../../../../../../../../../../../../../class/sound
	|   `-- uevent
	|-- device -> ../../../3-4.1.3.1.1.1:1.0
	|-- id
	|-- number
	|-- pcmC1D0c
	|   |-- dev
	|   |-- device -> ../../card1
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../../../../../../../../class/sound
	|   `-- uevent
	|-- pcmC1D0p
	|   |-- dev
	|   |-- device -> ../../card1
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../../../../../../../../../class/sound
	|   `-- uevent
	|-- power
	|   |-- async
	|   |-- autosuspend_delay_ms
	|   |-- control
	|   |-- runtime_active_kids
	|   |-- runtime_active_time
	|   |-- runtime_enabled
	|   |-- runtime_status
	|   |-- runtime_suspended_time
	|   `-- runtime_usage
	|-- subsystem -> ../../../../../../../../../../../../../class/sound
	`-- uevent


!!USB Descriptors
!!---------------
--startcollapse--

Bus 003 Device 017: ID 046d:0809 Logitech, Inc. Webcam Pro 9000
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2=20
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x046d Logitech, Inc.
  idProduct          0x0809 Webcam Pro 9000
  bcdDevice            0.09
  iManufacturer           0=20
  iProduct                0=20
  iSerial                 2 CC64FA56
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0a1d
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0=20
      iFunction               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0=20
      iInterface              0=20
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x00f5
        dwClockFrequency       48.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0=20
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000080e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          PanTilt (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000175b
          Brightness
          Contrast
          Saturation
          Sharpness
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0=20
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d221e}
        bNumControls           10
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0xff
        bmControls( 1)       0x03
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                13
        guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d221f}
        bNumControls            7
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0x6f
        bmControls( 1)       0x01
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 8
        guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d2251}
        bNumControls            3
        bNrInPins               1
        baSourceID( 0)          4
        bControlSize            3
        bmControls( 0)       0x19
        bmControls( 1)       0x00
        bmControls( 2)       0x00
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                10
        guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d2252}
        bNumControls           24
        bNrInPins               1
        baSourceID( 0)          4
        bControlSize            3
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0xff
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                14
        guidExtensionCode         {a45b93b7-c715-4502-90f4-532a3b311365}
        bNumControls            4
        bNrInPins               1
        baSourceID( 0)          1
        bControlSize            3
        bmControls( 0)       0x0f
        bmControls( 1)       0x00
        bmControls( 2)       0x00
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 9
        guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d2256}
        bNumControls            5
        bNrInPins               1
        baSourceID( 0)          4
        bControlSize            3
        bmControls( 0)       0x0c
        bmControls( 1)       0x00
        bmControls( 2)       0x00
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                12
        guidExtensionCode         {63610682-5070-49ab-b8cc-b3855e8d2250}
        bNumControls           17
        bNrInPins               1
        baSourceID( 0)          4
        bControlSize            3
        bmControls( 0)       0xfe
        bmControls( 1)       0x7f
        bmControls( 2)       0x70
        iExtension              0=20
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0=20
      ** UNRECOGNIZED:  20 41 01 0b 82 06 61 63 70 50 ab 49 b8 cc b3 85 5e =
8d 22 55 01 01 04 03 01 00 00 00 00 00 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x073c
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       5
        bStillCaptureMethod                 2
        bTriggerSupport                     1
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     4
        bmaControls( 2)                     4
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors               18
        guidFormat                            {32595559-0000-0010-8000-00aa=
00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           400
        dwMinBitRate                 20480000
        dwMaxBitRate                122880000
        dwMaxVideoFrameBufferSize      512000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            768
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      737280
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           456
        dwMinBitRate                 29184000
        dwMaxBitRate                145920000
        dwMaxVideoFrameBufferSize      729600
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           504
        dwMinBitRate                 32256000
        dwMaxBitRate                161280000
        dwMaxVideoFrameBufferSize      806400
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                192000000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            864
        wHeight                           480
        dwMinBitRate                 33177600
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 55296000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  3
        dwFrameInterval( 0)            666666
        dwFrameInterval( 1)           1000000
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1333333
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                 81920000
        dwMaxBitRate                163840000
        dwMaxVideoFrameBufferSize     2048000
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1333333
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           904
        dwMinBitRate                115712000
        dwMaxBitRate                115712000
        dwMaxVideoFrameBufferSize     2892800
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1000
        dwMinBitRate                128000000
        dwMaxBitRate                128000000
        dwMaxVideoFrameBufferSize     3200000
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        18
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1200
        dwMinBitRate                153600000
        dwMaxBitRate                153600000
        dwMaxVideoFrameBufferSize     3840000
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            79
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns              18
        wWidth( 0)                        640
        wHeight( 0)                       480
        wWidth( 1)                        160
        wHeight( 1)                       120
        wWidth( 2)                        176
        wHeight( 2)                       144
        wWidth( 3)                        320
        wHeight( 3)                       240
        wWidth( 4)                        352
        wHeight( 4)                       288
        wWidth( 5)                        640
        wHeight( 5)                       360
        wWidth( 6)                        640
        wHeight( 6)                       400
        wWidth( 7)                        768
        wHeight( 7)                       480
        wWidth( 8)                        800
        wHeight( 8)                       456
        wWidth( 9)                        800
        wHeight( 9)                       504
        wWidth(10)                        800
        wHeight(10)                       600
        wWidth(11)                        864
        wHeight(11)                       480
        wWidth(12)                        960
        wHeight(12)                       720
        wWidth(13)                       1280
        wHeight(13)                       720
        wWidth(14)                       1280
        wHeight(14)                       800
        wWidth(15)                       1600
        wHeight(15)                       904
        wWidth(16)                       1600
        wHeight(16)                      1000
        wWidth(17)                       1600
        wHeight(17)                      1200
        bNumCompressionPatterns             1
        bCompression( 0)                    5
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
        bNumFrameDescriptors               18
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           400
        dwMinBitRate                 20480000
        dwMaxBitRate                122880000
        dwMaxVideoFrameBufferSize      512000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            768
        wHeight                           480
        dwMinBitRate                 29491200
        dwMaxBitRate                176947200
        dwMaxVideoFrameBufferSize      737280
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           456
        dwMinBitRate                 29184000
        dwMaxBitRate                175104000
        dwMaxVideoFrameBufferSize      729600
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           504
        dwMinBitRate                 32256000
        dwMaxBitRate                193536000
        dwMaxVideoFrameBufferSize      806400
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                230400000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            864
        wHeight                           480
        dwMinBitRate                 33177600
        dwMaxBitRate                199065600
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 55296000
        dwMaxBitRate                331776000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  6
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            400000
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            46
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           800
        dwMinBitRate                 81920000
        dwMaxBitRate                409600000
        dwMaxVideoFrameBufferSize     2048000
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  5
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           904
        dwMinBitRate                115712000
        dwMaxBitRate                231424000
        dwMaxVideoFrameBufferSize     2892800
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1000
        dwMinBitRate                128000000
        dwMaxBitRate                256000000
        dwMaxVideoFrameBufferSize     3200000
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        18
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                          1200
        dwMinBitRate                153600000
        dwMaxBitRate                307200000
        dwMaxVideoFrameBufferSize     3840000
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            83
        bDescriptorType                    36
        bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
        bEndpointAddress                 0x00  EP 0 OUT
        bNumImageSizePatterns              18
        wWidth( 0)                        640
        wHeight( 0)                       480
        wWidth( 1)                        160
        wHeight( 1)                       120
        wWidth( 2)                        176
        wHeight( 2)                       144
        wWidth( 3)                        320
        wHeight( 3)                       240
        wWidth( 4)                        352
        wHeight( 4)                       288
        wWidth( 5)                        640
        wHeight( 5)                       360
        wWidth( 6)                        640
        wHeight( 6)                       400
        wWidth( 7)                        768
        wHeight( 7)                       480
        wWidth( 8)                        800
        wHeight( 8)                       456
        wWidth( 9)                        800
        wHeight( 9)                       504
        wWidth(10)                        800
        wHeight(10)                       600
        wWidth(11)                        864
        wHeight(11)                       480
        wWidth(12)                        960
        wHeight(12)                       720
        wWidth(13)                       1280
        wHeight(13)                       720
        wWidth(14)                       1280
        wHeight(14)                       800
        wWidth(15)                       1600
        wHeight(15)                       904
        wWidth(16)                       1600
        wHeight(16)                      1000
        wWidth(17)                       1600
        wHeight(17)                      1200
        bNumCompressionPatterns             5
        bCompression( 0)                    5
        bCompression( 1)                   10
        bCompression( 2)                   15
        bCompression( 3)                   20
        bCompression( 4)                   25
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0180  1x 384 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0280  1x 640 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03b0  1x 944 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0a80  2x 640 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       8
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b20  2x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       9
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0be0  2x 992 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      10
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1380  3x 896 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      11
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0=20
      iFunction               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0026
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0000
        iChannelNames           0=20
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          1
        bSourceID               5
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        16000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0044  1x 68 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        24000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0064  1x 100 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        32000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0084  1x 132 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c4  1x 196 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000

Bus 003 Device 016: ID 1397:0510 BEHRINGER International GmbH UV1
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2=20
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1397 BEHRINGER International GmbH
  idProduct          0x0510=20
  bcdDevice            1.00
  iManufacturer           1 Behringer
  iProduct                2 UV1
  iSerial                 3 12345678
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x011d
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass          1 Audio
      bFunctionSubClass       0=20
      bFunctionProtocol      32=20
      iFunction               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol     32=20
      iInterface              0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               2.00
        bCategory               8
        wTotalLength       0x0077
        bmControls           0x01
          Latency control Control (read-only)
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               41
        bmAttributes            3 Internal programmable clock=20
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource           10=20
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     11 (CLOCK_SELECTOR)
        bClockID               40
        bNrInPins               1
        baCSourceID(0)         41
        bmControls           0x03
          Clock Selector Control (read/write)
        iClockSelector          0=20
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bCSourceID             40
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames         192=20
        bmControls         0x0000
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                10
        bSourceID               2
        bmaControls(0)     0x00000000
        bmaControls(1)     0x00000000
        bmaControls(2)     0x00000000
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            20
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID              10
        bCSourceID             40
        bmControls         0x0000
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bCSourceID             40
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames         128=20
        bmControls         0x0000
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                11
        bSourceID               1
        bmaControls(0)     0x00000000
        bmaControls(1)     0x00000000
        bmaControls(2)     0x00000000
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            22
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID              11
        bCSourceID             40
        bmControls         0x0000
        iTerminal               0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0006  1x 6 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames         192=20
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x08  EP 8 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0190  1x 400 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0008
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes           17
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames         128=20
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x0190  1x 400 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0008
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol     16=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               8
--endcollapse--


!!USB Stream information
!!----------------------
--startcollapse--

USB Device 0x46d:0x809 at usb-0000:00:14.0-4.1.3.1.4, high speed : USB Audio

Capture:
  Status: Stop
  Interface 3
    Altset 1
    Format: S16_LE
    Channels: 1
    Endpoint: 0x86 (6 IN) (ASYNC)
    Rates: 16000
    Data packet interval: 1000 us
    Bits: 16
    Channel map: MONO
  Interface 3
    Altset 2
    Format: S16_LE
    Channels: 1
    Endpoint: 0x86 (6 IN) (ASYNC)
    Rates: 24000
    Data packet interval: 1000 us
    Bits: 16
    Channel map: MONO
  Interface 3
    Altset 3
    Format: S16_LE
    Channels: 1
    Endpoint: 0x86 (6 IN) (ASYNC)
    Rates: 32000
    Data packet interval: 1000 us
    Bits: 16
    Channel map: MONO
  Interface 3
    Altset 4
    Format: S16_LE
    Channels: 1
    Endpoint: 0x86 (6 IN) (ASYNC)
    Rates: 48000
    Data packet interval: 1000 us
    Bits: 16
    Channel map: MONO
Behringer UV1 at usb-0000:00:14.0-4.1.3.1.1.1, high speed : USB Audio

Playback:
  Status: Running
    Interface =3D 1
    Altset =3D 1
    Packet Size =3D 72
    Momentary freq =3D 48000 Hz (0x6.0000)
  Interface 1
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 0x08 (8 OUT) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR
    Sync Endpoint: 0x88 (8 IN)
    Sync EP Interface: 2
    Sync EP Altset: 1
    Implicit Feedback Mode: Yes

Capture:
  Status: Running
    Interface =3D 2
    Altset =3D 1
    Packet Size =3D 72
    Momentary freq =3D 48000 Hz (0x6.0000)
  Interface 2
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 0x88 (8 IN) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR
--endcollapse--


!!USB Mixer information
!!---------------------
--startcollapse--

USB Mixer: usb_id=3D0x046d0809, ctrlif=3D2, ctlerr=3D0
Card: USB Device 0x46d:0x809 at usb-0000:00:14.0-4.1.3.1.4, high speed
  Unit: 5
    Control: name=3D"Mic Capture Volume", index=3D0
    Info: id=3D5, control=3D2, cmask=3D0x0, channels=3D1, type=3D"S16"
    Volume: min=3D1536, max=3D7936, dBmin=3D600, dBmax=3D3100
  Unit: 5
    Control: name=3D"Mic Capture Switch", index=3D0
    Info: id=3D5, control=3D1, cmask=3D0x0, channels=3D1, type=3D"INV_BOOLE=
AN"
    Volume: min=3D0, max=3D1, dBmin=3D0, dBmax=3D0
USB Mixer: usb_id=3D0x13970510, ctrlif=3D0, ctlerr=3D0
Card: Behringer UV1 at usb-0000:00:14.0-4.1.3.1.1.1, high speed
  Unit: 41
    Control: name=3D"Internal Validity", index=3D0
    Info: id=3D41, control=3D2, cmask=3D0x0, channels=3D1, type=3D"BOOLEAN"
    Volume: min=3D0, max=3D1, dBmin=3D0, dBmax=3D0
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116,  6 Jan 20 16:15 /dev/snd/controlC0
crw-rw----+ 1 root audio 116,  4 Jan 20 16:15 /dev/snd/controlC1
crw-rw----+ 1 root audio 116,  5 Jan 20 16:16 /dev/snd/pcmC0D0c
crw-rw----+ 1 root audio 116,  3 Jan 20 16:16 /dev/snd/pcmC1D0c
crw-rw----+ 1 root audio 116,  2 Jan 20 16:16 /dev/snd/pcmC1D0p
crw-rw----+ 1 root audio 116,  1 Jan 20 16:15 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 Jan 20 16:15 /dev/snd/timer

/dev/snd/by-id:
total 0
drwxr-xr-x 2 root root  80 Jan 20 16:15 .
drwxr-xr-x 4 root root 220 Jan 20 16:15 ..
lrwxrwxrwx 1 root root  12 Jan 20 16:15 usb-046d_0809_CC64FA56-02 -> ../con=
trolC0
lrwxrwxrwx 1 root root  12 Jan 20 16:15 usb-Behringer_UV1_12345678-00 -> ..=
/controlC1

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  80 Jan 20 16:15 .
drwxr-xr-x 4 root root 220 Jan 20 16:15 ..
lrwxrwxrwx 1 root root  12 Jan 20 16:15 pci-0000:00:14.0-usb-0:4.1.3.1.1.1:=
1.0 -> ../controlC1
lrwxrwxrwx 1 root root  12 Jan 20 16:15 pci-0000:00:14.0-usb-0:4.1.3.1.4:1.=
2 -> ../controlC0


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 1: UV1 [UV1], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 0: U0x46d0x809 [USB Device 0x46d:0x809], device 0: USB Audio [USB Audi=
o]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: UV1 [UV1], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card U0x46d0x809

Card sysdefault:0 'U0x46d0x809'/'USB Device 0x46d:0x809 at usb-0000:00:14.0=
-4.1.3.1.4, high speed'
  Mixer name	: 'USB Mixer'
  Components	: 'USB046d:0809'
  Controls      : 3
  Simple ctrls  : 1
Simple mixer control 'Mic',0
  Capabilities: cvolume cvolume-joined cswitch cswitch-joined
  Capture channels: Mono
  Limits: Capture 0 - 17
  Mono: Capture 11 [65%] [22.17dB] [on]

!!-------Mixer controls for card UV1

Card sysdefault:1 'UV1'/'Behringer UV1 at usb-0000:00:14.0-4.1.3.1.1.1, hig=
h speed'
  Mixer name	: 'USB Mixer'
  Components	: 'USB1397:0510'
  Controls      : 3
  Simple ctrls  : 0


!!Alsactl output
!!--------------

--startcollapse--
state.U0x46d0x809 {
	control.1 {
		iface PCM
		name 'Capture Channel Map'
		value 0
		comment {
			access read
			type INTEGER
			count 1
			range '0 - 36'
		}
	}
	control.2 {
		iface MIXER
		name 'Mic Capture Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.3 {
		iface MIXER
		name 'Mic Capture Volume'
		value 11
		comment {
			access 'read write'
			type INTEGER
			count 1
			range '0 - 17'
			dbmin 600
			dbmax 3100
			dbvalue.0 2217
		}
	}
}
state.UV1 {
	control.1 {
		iface PCM
		name 'Playback Channel Map'
		value.0 3
		value.1 4
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.2 {
		iface PCM
		name 'Capture Channel Map'
		value.0 3
		value.1 4
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.3 {
		iface CARD
		name 'Internal Validity'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

acpi_pad
acpi_tad
acpi_thermal_rel
aesni_intel
af_alg
algif_hash
algif_skcipher
auth_rpcgss
autofs4
binfmt_misc
bluetooth
bnep
br_netfilter
bridge
btbcm
btintel
btqca
btrtl
btusb
cdc_ether
cec
cfg80211
cmac
coretemp
crc32_pclmul
crct10dif_pclmul
cros_ec
cros_ec_ishtp
cryptd
crypto_simd
dcdbas
dell_laptop
dell_smbios
dell_wmi
dell_wmi_descriptor
dell_wmi_sysman
dm_crypt
dptf_power
drm
drm_kms_helper
ecc
ecdh_generic
ee1004
efi_pstore
fb_sys_fops
firmware_attributes_class
fscache
ghash_clmulni_intel
grace
hci_uart
hid
hid_generic
hid_led
hid_multitouch
hid_sensor_als
hid_sensor_custom
hid_sensor_custom_intel_hinge
hid_sensor_hub
hid_sensor_iio_common
hid_sensor_trigger
i2c_algo_bit
i2c_hid
i2c_hid_acpi
i2c_i801
i2c_smbus
i915
idma64
industrialio
industrialio_triggered_buffer
input_leds
int3400_thermal
int3403_thermal
int340x_thermal_zone
intel_cstate
intel_hid
intel_ish_ipc
intel_ishtp
intel_ishtp_hid
intel_ishtp_loader
intel_lpss
intel_lpss_pci
intel_pmt
intel_pmt_class
intel_pmt_telemetry
intel_powerclamp
intel_rapl_common
intel_rapl_msr
intel_skl_int3472
intel_soc_dts_iosf
intel_tcc_cooling
ip6_tables
ip6t_REJECT
ip6t_rt
ip_tables
ipt_REJECT
iwlmvm
iwlwifi
joydev
kfifo_buf
kvm
kvm_intel
ledtrig_audio
libarc4
libcrc32c
llc
lockd
lp
mac80211
mac_hid
mc
mei
mei_hdcp
mei_me
mii
msr
netfs
nf_conntrack
nf_conntrack_netlink
nf_defrag_ipv4
nf_defrag_ipv6
nf_nat
nf_reject_ipv4
nf_reject_ipv6
nf_tables
nfnetlink
nfs
nfs_acl
nfsv3
nfsv4
nft_chain_nat
nft_compat
nft_counter
nft_limit
nls_iso8859_1
nvidia
nvidia_drm
nvidia_modeset
nvidia_uvm
nvme
nvme_core
overlay
parport
parport_pc
pinctrl_tigerlake
power_ctrl_logic
ppdev
processor_thermal_device
processor_thermal_device_pci_legacy
processor_thermal_mbox
processor_thermal_rapl
processor_thermal_rfim
psmouse
pstore_blk
pstore_zone
r8152
r8153_ecm
ramoops
rc_core
reed_solomon
rfcomm
rpcsec_gss_krb5
rtsx_pci
rtsx_pci_sdmmc
sch_fq_codel
serio_raw
snd
snd_hrtimer
snd_hwdep
snd_pcm
snd_rawmidi
snd_seq
snd_seq_device
snd_seq_dummy
snd_seq_midi
snd_seq_midi_event
snd_timer
snd_usb_audio
snd_usbmidi_lib
soundcore
sparse_keymap
stp
sunrpc
syscopyarea
sysfillrect
sysimgblt
thunderbolt
ttm
typec
typec_ucsi
uas
ucsi_acpi
usb_storage
usbhid
usbnet
uvcvideo
video
videobuf2_common
videobuf2_memops
videobuf2_v4l2
videobuf2_vmalloc
videodev
wmi
wmi_bmof
x86_pkg_temp_thermal
x_tables
xfrm_algo
xfrm_user
xhci_pci
xhci_pci_renesas
xt_MASQUERADE
xt_addrtype
xt_comment
xt_conntrack
xt_hl
xt_limit
xt_tcpudp


!!ALSA/HDA dmesg
!!--------------

[    0.000000] Linux version 5.14.0-1054-oem (buildd@lcy02-amd64-108) (gcc =
(Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.3=
4) #61-Ubuntu SMP Fri Oct 14 13:05:50 UTC 2022 (Ubuntu 5.14.0-1054.61-oem 5=
=2E14.21)
[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-5.14.0-1054-oem root=3D/=
dev/mapper/vgubuntu-root ro ip=3D192.168.1.225::192.168.1.1:255.255.255.0::=
enxa02919f0a51f::192.168.1.237:: i915.modeset=3D1 snd_usb_audio.implicit_fb=
=3D1 quiet splash crashkernel=3D512M-:192M vt.handoff=3D7
[    0.000000] KERNEL supported cpus:
--
[    0.048474] Policy zone: Normal
[    0.048475] Kernel command line: BOOT_IMAGE=3D/vmlinuz-5.14.0-1054-oem r=
oot=3D/dev/mapper/vgubuntu-root ro ip=3D192.168.1.225::192.168.1.1:255.255.=
255.0::enxa02919f0a51f::192.168.1.237:: i915.modeset=3D1 snd_usb_audio.impl=
icit_fb=3D1 quiet splash crashkernel=3D512M-:192M vt.handoff=3D7
[    0.048564] Unknown command line parameters: splash BOOT_IMAGE=3D/vmlinu=
z-5.14.0-1054-oem ip=3D192.168.1.225::192.168.1.1:255.255.255.0::enxa02919f=
0a51f::192.168.1.237::
--
[    0.157242] ACPI: Added _OSI(Linux-Dell-Video)
[    0.157242] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.157242] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
--
[   13.184524] usb 3-4.1.3.1.4: set resolution quirk: cval->res =3D 384
[   13.184693] usbcore: registered new interface driver snd-usb-audio
[   13.213290] iwlwifi 0000:00:14.3: reporting RF_KILL (radio disabled)
--
[   92.444630] WARNING: CPU: 3 PID: 4871 at kernel/trace/trace_event_perf.c=
:402 perf_trace_buf_alloc+0x86/0xa0
[   92.444635] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer nfsv3 nf=
s_acl nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink xfrm_user xfr=
m_algo br_netfilter bridge stp llc rpcsec_gss_krb5 auth_rpcgss nfsv4 nfs lo=
ckd grace fscache netfs xt_comment cmac algif_hash algif_skcipher af_alg ov=
erlay ip6t_REJECT nf_reject_ipv6 xt_hl ip6_tables ip6t_rt ipt_REJECT nf_rej=
ect_ipv4 nft_limit bnep xt_limit xt_addrtype xt_tcpudp xt_conntrack nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nft_counter nf_tables libcrc=
32c dell_laptop sunrpc nfnetlink binfmt_misc snd_usb_audio snd_usbmidi_lib =
snd_hwdep snd_pcm mei_hdcp intel_tcc_cooling iwlmvm snd_seq_midi snd_seq_mi=
di_event x86_pkg_temp_thermal intel_powerclamp intel_rapl_msr snd_rawmidi m=
ac80211 snd_seq uvcvideo hid_sensor_als videobuf2_vmalloc coretemp hid_sens=
or_custom_intel_hinge dell_wmi videobuf2_memops hid_sensor_trigger ledtrig_=
audio videobuf2_v4l2 snd_seq_device industrialio_triggered_buffer kvm_intel=
 libarc4 kvm iwlwifi
[   92.444671]  kfifo_buf snd_timer dell_smbios videobuf2_common hid_sensor=
_iio_common mei_me dcdbas intel_cstate industrialio videodev snd dell_wmi_s=
ysman nls_iso8859_1 serio_raw firmware_attributes_class dell_wmi_descriptor=
 cros_ec_ishtp processor_thermal_device_pci_legacy cfg80211 wmi_bmof ee1004=
 hid_multitouch mei soundcore mc joydev input_leds btusb cros_ec processor_=
thermal_device intel_pmt_telemetry hci_uart processor_thermal_rfim intel_pm=
t_class processor_thermal_mbox processor_thermal_rapl btqca intel_rapl_comm=
on btrtl btbcm btintel intel_soc_dts_iosf ucsi_acpi typec_ucsi bluetooth ty=
pec ecdh_generic ecc dptf_power int3403_thermal int340x_thermal_zone intel_=
skl_int3472 mac_hid power_ctrl_logic int3400_thermal intel_hid sparse_keyma=
p acpi_pad acpi_thermal_rel acpi_tad nvidia_uvm(POE) sch_fq_codel msr parpo=
rt_pc ppdev lp parport ramoops reed_solomon pstore_blk pstore_zone efi_psto=
re ip_tables x_tables autofs4 hid_led uas usb_storage dm_crypt usbhid r8153=
_ecm r8152 cdc_ether usbnet
[   92.444705]  mii hid_sensor_custom hid_sensor_hub intel_ishtp_loader int=
el_ishtp_hid nvidia_drm(POE) nvidia_modeset(POE) hid_generic nvidia(POE) i9=
15 rtsx_pci_sdmmc i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect s=
ysimgblt fb_sys_fops cec rc_core i2c_i801 crct10dif_pclmul crc32_pclmul gha=
sh_clmulni_intel aesni_intel crypto_simd cryptd psmouse rtsx_pci i2c_smbus =
drm intel_lpss_pci thunderbolt intel_ish_ipc nvme xhci_pci intel_lpss intel=
_ishtp idma64 xhci_pci_renesas intel_pmt nvme_core wmi i2c_hid_acpi i2c_hid=
 hid video pinctrl_tigerlake


!!Packages installed
!!--------------------

ii  alsa-tools                                                  1.2.5-2    =
                             amd64        Console based ALSA utilities for =
specific hardware
ii  alsa-tools-gui                                              1.2.5-2    =
                             amd64        GUI based ALSA utilities for spec=
ific hardware
ii  alsa-topology-conf                                          1.2.5.1-2  =
                             all          ALSA topology configuration files
ii  alsa-ucm-conf                                               1.2.6.3-1ub=
untu1.2                      all          ALSA Use Case Manager configurati=
on files
ii  alsa-utils                                                  1.2.6-1ubun=
tu1                          amd64        Utilities for configuring and usi=
ng ALSA


--nvot62spc3o42ig2--
