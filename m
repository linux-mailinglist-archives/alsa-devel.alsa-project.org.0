Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED6D2345B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 14:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA90C165E;
	Mon, 20 May 2019 14:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA90C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558356165;
	bh=kVJd7PcI+56ipEgrzw44x5N9Erx9QZ1FqBkIomn47Dg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ec+3bL8WGAgTlYvXyksXHDwdxyg7NrBox8wvWU8h61Mh4Rdb/b1r3V/n2JssY5co2
	 OqbRps3zmY7DPZ0WPEkyLEBKwxyP4J+XAeNc8aDFVavTi6J5LVhcnICSefasplMXDJ
	 MP/xr1v1MyrQscbJrYwDQPY2g78pqhgI03UaAkS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B363F8961D;
	Mon, 20 May 2019 14:41:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01F45F8962F; Mon, 20 May 2019 14:38:00 +0200 (CEST)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FE87F80726
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 14:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FE87F80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mMdbdS/B"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="H9FJ6h6l"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3A0063A9;
 Mon, 20 May 2019 08:27:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 20 May 2019 08:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm1; bh=OVzCm2w2GsS7NPag+N6tbJcadPLYb6Ek/DYLaOq7ORA=; b=mMdbd
 S/BMFHRVt0PximAf4XfTin6mEKLI3zjJAYo1yMX9GD/8pShD3Q2kfF0UwSeszgqu
 bqL2xaGz5cBafWcz31FIklhBix6IBcTJATCI5stXER9pfBla2y+Bet8s6VNYKvqP
 J8Ds/Ulyk79gmMhVEiRrkjF3KyLnrMdUZnrUd3O3M0n2mxefWFgO8AIjtFcBTcN8
 UHbLsJH/otcsCLclDzcD3zIcrgk5sqlZo3U5+8r37ye7UOLq/o/AbSf7iIX2S/uz
 nQR879PjOoCtubN6XPps7HWSRrNINMimogYIDScZcbajQ5+kleWVWjwTN+uO4c5a
 7JLIUiTKMaWXgXZeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=OVzCm2w2GsS7NPag+N6tbJcadPLYb
 6Ek/DYLaOq7ORA=; b=H9FJ6h6lz6qHBzJWwG184ZhM0CZaNnMlNMfGyxbsgSShY
 dECd4eA+y4Ojr3viLtnfQyGs6WccDZJCHYTEreR4KJxJtVPPijiyYMfJ3SRuiMYt
 ol4e1R7UGK9kx+Z7FB4Tc1pKwZ8a+iDLcZ9jc6yhTM/n0npN2f5SDbRmKL1oLIMV
 RnQd12SwjspQDjn1fnTSwbKLNYwwvbOqttj9SEhq3Hb7N/Y/RwcSgFlrZTM/t2f/
 3Tp5oBq8cx/7tJYdLC4Te+k59JmcvehgubsFozP9jY+Q9y55ic2ExS+CGDIpblOg
 t6Smj18enFfkb6hnSo67Xttd+k4wpk2OUaPEQvbXQ==
X-ME-Sender: <xms:NJ3iXO0ncloH4CB6V0-APQj9TDlFVal1lj24Z2j_F8qUyT6jMfCakg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtkedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtuggfsehttdertd
 dtredvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgpdhgihhthhhusgdrtghomhenucfkphepudegrdefrdejhedrudekudenucfrrghrrghm
 pehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenuc
 evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NJ3iXKugikIVRzfVRJBcDf4qYU6xh2wySvDR20fa0yN2fB9isO53GA>
 <xmx:NJ3iXG4C1vrUAw5C_nuGwfG-00v9rYTjD6YP7zmRhoCuC0XYBmjjKA>
 <xmx:NJ3iXDLlM-nfFUosRW1bfzWoS_fINpY88C0NeaYjyRh21_76JpYc7w>
 <xmx:NJ3iXNVqnYir-RhIlcBcElm4-6ALJqAmB95qRXSCeS6DwRDVm91N_A>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 440A28005B;
 Mon, 20 May 2019 08:27:30 -0400 (EDT)
Date: Mon, 20 May 2019 21:27:27 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: systemd-devel@lists.freedesktop.org
Message-ID: <20190520122724.GA14864@workstation>
Mail-Followup-To: systemd-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net,
 linux1394-devel@lists.sourceforge.net, clemens@ladisch.de
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: clemens@ladisch.de, alsa-devel@alsa-project.org,
 linux1394-devel@lists.sourceforge.net, ffado-devel@lists.sourceforge.net
Subject: [alsa-devel] udev: Access permission of fw character device in
 which fw node includes unit handled by ALSA
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

I'm an ALSA developer, mainly committing to drivers for audio and
music units on IEEE 1394 bus (yes, it's legacy FireWire). I have a
concern about access permission for fw character device.

In the last few years 9 drivers have been added to support 120 models
around[1]. The drivers allow ALSA applications to transfer audio data
frames and MIDI messages, but they expect userspace application to
use fw character device for operations of the other functionalities
such as physical volume controls.

At present, for some models, udevd configures fw character device for
good access permission to userspace applications. On the other hand,
for the other models, udevd doesn't. In my opinion, for one half of
supported models, fw character device is configured with root:root/0500.

I'd like to change this inconvenience, changing group ownership of the
special file to 'audio', and add ACL +uaccess when logging in.

For your information, I prepare a repository including image of
configuration ROM from supported devices[2]. At present, 80 images are
added.  You can parse the image by crpp in linux-firewire-utils
repository[3].

At present I assume three options:

1. Add entries into udev rules for each of device

This is an enhancement of existent rules[4][5] and simple solution.
But developers always take care of adding new entries when users suggests,
perhaps.

2. Reconfigure fw character device when ALSA firewire driver is attached
   to unit

IEEE 1394 specification refers to IEEE 1212 to represent device and its
functionalities. Each device is represented as 'node' and its
functionalities are represented as 'unit'. The information about 'node'
and 'unit' is in configuration ROM.

Linux firewire subsystem reads content of the ROM, parses
it and adds fw character device to system for 'node', then binds in-kernel
driver to 'unit'. Kevents for the node and unit are generated separately.

If udevd handles unit kevent to seek binding driver then configures fw
character device, developers don't need to maintain rule list. Although
one node is allowed to have several units, nut the most of supported
models have only one unit, except for Applie iSight[6].

3. Fulfill hwdb to have supplemental information

I'm not good at hwdb, but according to its name, hwdb is good to store
device dependent information. If adding some hints to database and
using the information, this issue might be solved.

I'm happy to receive your comments to improve this situation.

As a mockup of such control application, I wrote libhinawa[7] and
hinawa-utils[8]. They're my (rough) private work and out of ALSA project,
but for future I wish to propose better implementation to ALSA project
as a control server program.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/firewire/Kconfig
[2] https://github.com/takaswie/am-config-roms/
[3] https://github.com/cladisch/linux-firewire-utils
[4] https://github.com/systemd/systemd/blob/master/rules/50-udev-default.rules.in
[5] https://github.com/systemd/systemd/blob/master/src/login/70-uaccess.rules.m4
    This rule refers to a rule optionally added by FFADO project.
[6] This device has four units; IIDC, Audio, vendor-dependent and IRIS.
[7] https://github.com/takaswie/libhinawa/
[8] https://github.com/takaswie/hinawa-utils/


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
