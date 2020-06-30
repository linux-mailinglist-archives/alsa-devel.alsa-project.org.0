Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452620F4C8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B84F1167F;
	Tue, 30 Jun 2020 14:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B84F1167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593520589;
	bh=aTi1ElkRjrhe+y6SGpGx/EhxGyFCG8FCX6a/Oe4H+Lk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsShHxjt4w8yva+Z5Zp4n3NkwprO5BWhdH+USktTB2NizMZ9/8g4CHe/XvTpn3Nou
	 IyQtaGjAg9Mo1D803N0rz9yapyrjjVhwcrhjkn+03XoqsOIQSLyzVlsHo5BVD4UWVk
	 pJ/jQJB9qJ3n9C5LLM99rK8ST1QIUlGk1MU5hXsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C22F8013E;
	Tue, 30 Jun 2020 14:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E20D8F801F2; Tue, 30 Jun 2020 14:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B806F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B806F80135
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31404AF24;
 Tue, 30 Jun 2020 12:34:40 +0000 (UTC)
Message-ID: <c16be1b9b4da811e923e3ff589ff5dfcdfebe314.camel@suse.de>
Subject: Re: [PATCH] ALSA: core: Warn on empty module
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Takashi Iwai
 <tiwai@suse.de>,  linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 30 Jun 2020 14:34:39 +0200
In-Reply-To: <0ec9855e-18d5-6144-ae5f-6cb239214dee@samsung.com>
References: <20200624160300.21703-1-tiwai@suse.de>
 <CGME20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405@eucas1p2.samsung.com>
 <0ec9855e-18d5-6144-ae5f-6cb239214dee@samsung.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-T29H5IrPZ4ZcZyWqZhnQ"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--=-T29H5IrPZ4ZcZyWqZhnQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,
Thanks for pointing this out!

On Tue, 2020-06-30 at 14:30 +0200, Marek Szyprowski wrote:
> Hi
>=20
> On 24.06.2020 18:03, Takashi Iwai wrote:
> > The module argument passed to snd_card_new() must be a valid non-NULL
> > pointer when the module support is enabled.  Since ASoC driver passes
> > the argument from each snd_soc_card definition, one may forget to set
> > the owner field and lead to a NULL module easily.
> >=20
> > For catching such an overlook, add a WARN_ON() in snd_card_new().
> > Also, put the card->module assignment in the ifdef block for a very
> > minor optimization.
> >=20
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
>=20
> I know that this is intended, but I would like to note that this patch=
=20
> reveals the following issue on Raspberry Pi 3B with ARM 32bit kernel=20
> compiled from multi_v7_defconfig:
>=20
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 210 at sound/core/init.c:207=20
> snd_card_new+0x378/0x398 [snd]
> Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine=20
> bluetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore=
=20
> ecdh_generic ecc bcm2835_thermal phy_generic
> CPU: 1 PID: 210 Comm: systemd-udevd Not tainted=20
> 5.8.0-rc1-00027-g81033c6b584b #1087
> Hardware name: BCM2835
> [<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0x14)
> [<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
> [<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
> [<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
> [<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>]=20
> (snd_card_new+0x378/0x398 [snd])
> [<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>]=20
> (snd_soc_bind_card+0x280/0x99c [snd_soc_core])
> [<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>]=20
> (devm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
> [<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from=20
> [<bf165654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
> [<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>]=20
> (component_bind_all+0xec/0x24c)
> [<c09d660c>] (component_bind_all) from [<bf15c44c>]=20
> (vc4_drm_bind+0xd4/0x174 [vc4])
> [<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>]=20
> (try_to_bring_up_master+0x160/0x1b0)
> [<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>]=20
> (component_master_add_with_match+0xd0/0x104)
> [<c09d6f38>] (component_master_add_with_match) from [<bf15c588>]=20
> (vc4_platform_drm_probe+0x9c/0xbc [vc4])
> [<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>]=20
> (platform_drv_probe+0x6c/0xa4)
> [<c09df740>] (platform_drv_probe) from [<c09dd6f0>]=20
> (really_probe+0x210/0x350)
> [<c09dd6f0>] (really_probe) from [<c09dd940>]=20
> (driver_probe_device+0x5c/0xb4)
> [<c09dd940>] (driver_probe_device) from [<c09ddb38>]=20
> (device_driver_attach+0x58/0x60)
> [<c09ddb38>] (device_driver_attach) from [<c09ddbc0>]=20
> (__driver_attach+0x80/0xbc)
> [<c09ddbc0>] (__driver_attach) from [<c09db820>]=20
> (bus_for_each_dev+0x68/0xb4)
> [<c09db820>] (bus_for_each_dev) from [<c09dc9f8>]=20
> (bus_add_driver+0x130/0x1e8)
> [<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x78/0x1=
10)
> [<c09de648>] (driver_register) from [<c0302038>]=20
> (do_one_initcall+0x50/0x220)
> [<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x60/0x2=
10)
> [<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/0x233=
8)
> [<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/0xbc)
> [<c03dac00>] (sys_finit_module) from [<c03000c0>]=20
> (ret_fast_syscall+0x0/0x54)
> Exception stack(0xeded9fa8 to 0xeded9ff0)
> ...
> ---[ end trace 6414689569c2bc08 ]---
>=20
> This warning is not present when booting ARM 64bit kernel, but I suspect=
=20
> that this is due to the differences in the kernel configuration.

It's because vc4 is not yet supported on RPi4.

Maxime Rippard is working on it:
https://lkml.kernel.org/lkml/20200629142145.aa2vdfkgeugrze4c@gilmour.lan/T/=
.

Regards,
Nicolas


--=-T29H5IrPZ4ZcZyWqZhnQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl77MV8ACgkQlfZmHno8
x/66bAgAktufM8XXiMg8VmO5FvXnUAStB4/HSj094uDC4x6SsNgedaj5oXxcISV1
wyd/bI0wBvRzKtfAae2zMZ7BYExeeXReLIMXSbdgZYPWaFk6AQebEf5CKe6AXDlg
BJU95OF77zjJo/V9YzV93+fnt5Er2KfqDEaMo43hSGLxFCoON0lPRX0u6v66ytNH
4W3yy00Mn7ZZ7TvqucfLfrIsKSR69B1MHiKV/u/If/NgeTaiq2ELz9kwdbTlnUH3
LRPxN0dmJ7WedL5hA7AS4czJrGyh9ITIyGha+osYofGGdxZEsGbHqzRyAefzsjUm
3vWo1Wbh6TmTYRS+8H3Nt/cNHjpzGw==
=M03X
-----END PGP SIGNATURE-----

--=-T29H5IrPZ4ZcZyWqZhnQ--

