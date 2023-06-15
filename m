Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FF731717
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 13:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A350822;
	Thu, 15 Jun 2023 13:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A350822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686829203;
	bh=5qJyjj5ZnCtjTB9bqLDwzwATM9iMekDyKcCHCMY2ZD0=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HoqCKJKsajXS7w2ClxEa0rFaP5+ICBIB1vfLNOxeyvRZM6zVkFcfNzcWL47lH7LZe
	 uNZq3bqMDVj7oTPPoFMo5nilN4as0YikhbZxrJonbFuphx4ihYIDOAgyf7P9M/QKUp
	 AE+GES17K0uvaJ7UyeU8jtlrY57uuou9DwQ6c0iM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DC42F80149; Thu, 15 Jun 2023 13:39:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B60F800ED;
	Thu, 15 Jun 2023 13:39:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6071BF80149; Thu, 15 Jun 2023 13:39:08 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D63F800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 13:39:08 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Jun 2023 11:39:08 -0000
Message-ID: 
 <168682914833.20.10859690398442251462@mailman-web.alsa-project.org>
In-Reply-To: <87h6rabklt.wl-tiwai@suse.de>
References: <87h6rabklt.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: EZ4ZM5KZJIQREQUU2YYRVCEBXOEKTJ3G
X-Message-ID-Hash: EZ4ZM5KZJIQREQUU2YYRVCEBXOEKTJ3G
X-MailFrom: happy.debugging@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGLVWUQ3OT6CNGWJ33QHO2H2RBJWTVWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

That was indeed worth a lot. Built this sound.git on two machines:

make menuconfig
enabled:
* MIDI 2.0 Support by USB audio driver
* Support for UMP Events
Save to .config
make

Found to .ko files in usb folder:
snd-usb-audio.ko
sndmidi-lib.ko

Ubuntu 22.04 LTS (Linux H3 5.19.0-43-generic #44~22.04.1-Ubuntu) with 5.19 HWE Stack Option
sudo insmod snd-usb-audio.ko
insmod: ERROR: could not insert module snd-usb-audio.ko: Invalid module format

Ubuntu 23.04 (runs in KVM)  (Linux Ubuntu 6.2.0-20-generic)
sudo insmod snd-usb-audio.ko
insmod: ERROR: could not insert module snd-usb-audio.ko: Unknown symbol in module
[37207.309239] snd_usb_audio: Unknown symbol snd_ump_receive (err -2)
[37207.309275] snd_usb_audio: Unknown symbol media_entity_pads_init (err -2)
[37207.309289] snd_usb_audio: Unknown symbol media_remove_intf_link (err -2)
[37207.309311] snd_usb_audio: Unknown symbol snd_usbmidi_resume (err -2)
[37207.309420] snd_usb_audio: Unknown symbol media_device_delete (err -2)
[37207.309434] snd_usb_audio: Unknown symbol snd_ump_endpoint_new (err -2)
[37207.309440] snd_usb_audio: Unknown symbol media_devnode_create (err -2)
[37207.309449] snd_usb_audio: Unknown symbol media_device_unregister_entity (err -2)
[37207.309460] snd_usb_audio: Unknown symbol snd_usbmidi_disconnect (err -2)
[37207.309468] snd_usb_audio: Unknown symbol media_device_usb_allocate (err -2)

Can it be done on 6.2 or 5.15 ?

How to insert the new module or build it so it can be used with a current kernel ?
How to proceed in case the existing module is use (rmmod) ?  Canoncial does not provide kernel sources for newer kernels than 6.2 , like 6.4.0.rc2 of this sound.git, at least could not find them, but I did successfully built the 6.2 and 5.15 Ubuntu distro kernels already from their respective sources. Just copy the sound/usb and sound/core files over the current kernel sources, recompile it (of-course with and updated version number).
