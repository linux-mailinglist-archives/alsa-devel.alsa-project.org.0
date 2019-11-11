Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99BF76E3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 15:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77468167F;
	Mon, 11 Nov 2019 15:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77468167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573483557;
	bh=V2geMa0h+E3Bm4LzLRxH9jOLFm9/2F7Hy8NfVigEl7U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjHRgNs4D2nrPiwfLjRkoBNbeDohN9vwh4c0ZCCnYLf916KqSO7J3MjQQ59D/hc6G
	 qWbaR3rPlag1P/muZbXbjy9cleGMBA67CrUGYw/Lmwil+rGj4lWAcAzpEmF6AL2ugl
	 DmBI4MgVp2KVYc/Dv88h29OS7tb8pSed0cVepoX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F31D0F805F9;
	Mon, 11 Nov 2019 15:43:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D51F2F8053A; Mon, 11 Nov 2019 15:43:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73BFFF80518
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 15:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73BFFF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="omdmlSLX"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc973570000>; Mon, 11 Nov 2019 06:42:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 06:43:33 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 06:43:33 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Nov
 2019 14:43:29 +0000
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <87d0e63joh.wl-kuninori.morimoto.gx@renesas.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c976b330-f635-e818-1feb-f25db42a6ae4@nvidia.com>
Date: Mon, 11 Nov 2019 14:43:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87d0e63joh.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573483352; bh=Rz1XDA4NJ5vsiZHJx+N4smo9VZJBBI0XCVmtdWHkGic=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=omdmlSLXIUQJ5V0pHU072UrN2PyV4nyiin96J9M76Su4shJFEC/ZLjGfQcJblffeO
 gb82vsglxCI8uFXeRJuW2orcc5wXh0G3tBctlHCUSI7nHCKCKPW7W+D5/QxKa8zYWT
 2HlUU49UBj+zoeGijbJsFIx7F6hcZwKoOg24zsrRRy4STxDf14GnCS1M1XLnD5knL0
 XwHsh4Z5oRElvfd8rBTL0w+p0md70csa4df575KT6iu7Q6GWfsub8U8it5Iilh7TgB
 QyVcwf8VcmN0HUCVYh5+p9F+nQBaVaAvBDMbPFbCLsnWnKeMoonhtIAxEE7tLbnoK7
 KC6wIsVhcc1VQ==
Cc: linux-tegra <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 02/19] ASoC: soc-core: tidyup
 soc_init_dai_link()
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


On 05/11/2019 06:45, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_init_dai_link() is needed to be called before soc_bind_dai_link().
> 
> 	int snd_soc_instantiate_card()
> 	{
> 		for_each_card_prelinks(...) {
> (1)			ret = soc_init_dai_link(...);
> 			...
> 		}
> 		...
> 		for_each_card_prelinks(...) {
> (2)			ret = soc_bind_dai_link(...);
> 			...
> 		}
> 		...
> 		for_each_card_links(...) {
> 			...
> (A)			ret = soc_init_dai_link(...);
> 			...
> (B)			ret = soc_bind_dai_link(...);
> 		}
> 		...
> 
> (1) is for (2), and (A) is for (B)
> (1) and (2) are for card prelink   dai_link.
> (A) and (B) are for topology added dai_link.
> 
> soc_init_dai_link() is sanity check for dai_link, not initializing today.
> Therefore, it is confusable naming. We can rename it as sanity_check.
> 
> And this check is for soc_bind_dai_link().
> It can be more simple code if we can call it from soc_bind_dai_link().
> 
> This patch renames it to soc_dai_link_sanity_check(), and
> call it from soc_bind_dai_link().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
> v2 -> v3
> 	- add Reviewed-by
> 	- call soc_dai_link_sanity_check() after soc_is_dai_link_bound()
> 
>  sound/soc/soc-core.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)

I am seeing an audio regression on -next and bisect is pointing to
this commit. I am seeing the following crash on boot during probe
deferral of the soundcard ...

[   13.520888] 8<--- cut here ---
[   13.531044] Unable to handle kernel NULL pointer dereference at virtual address 00000558
[   13.546555] pgd = 5c53a857
[   13.556672] [00000558] *pgd=00000000
[   13.574504] Internal error: Oops: 5 [#1] SMP ARM
[   13.585865] Modules linked in: snd_soc_tegra_wm8903(+) snd_soc_tegra_utils snd_soc_wm8903 brcmutil snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundcore snd_soc_tegra30_ahub tegra30_devfreq tegra_wdt
[   13.608218] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   13.617591] CPU: 1 PID: 178 Comm: systemd-udevd Not tainted 5.4.0-rc1-00276-gbfce78a55965 #11
[   13.617598] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   13.617638] PC is at tegra_wm8903_remove+0x10/0x30 [snd_soc_tegra_wm8903]
[   13.617661] LR is at tegra_wm8903_remove+0x10/0x30 [snd_soc_tegra_wm8903]
[   13.685077] pc : [<bf09f254>]    lr : [<bf09f254>]    psr: 60000013
[   13.697095] sp : e9231c60  ip : 00000100  fp : c1704c48
[   13.710229] r10: 00000001  r9 : bf082ca8  r8 : bf087024
[   13.722152] r7 : 00000078  r6 : 00000000  r5 : bf0a1090  r4 : fffffdfb
[   13.734811] r3 : bf0a1280  r2 : 00000000  r1 : bf0a068c  r0 : 00000000
[   13.748859] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   13.762711] Control: 10c5387d  Table: a908004a  DAC: 00000051
[   13.775069] Process systemd-udevd (pid: 178, stack limit = 0x97e0dae2)
[   13.789094] Stack: (0xe9231c60 to 0xe9232000)
[   13.802489] 1c60: fffffdfb bf06e6a0 ffffffff 21a54800 bf0a1118 c1704c48 bf0a1228 bf087000
[   13.817940] 1c80: bf082c74 bf082c94 21a54800 3342fbf9 e9268c54 bf0a1090 00000000 bf0a1000
[   13.834685] 1ca0: ea9ee010 00000000 bf0a1664 00000000 c1704c48 bf06ef68 e9268c54 eb7d7880
[   13.851011] 1cc0: bf0a1000 bf09f518 ea9ee010 00000000 bf0a130c 00000000 bf0a130c 00000018
[   13.867641] 1ce0: 00000000 c095d8dc c18e52a4 ea9ee010 c18e52a8 c095b980 ea9ee010 bf0a130c
[   13.884376] 1d00: bf0a130c c1704c48 00000000 e91a4a64 bf0a1380 c095bc10 bf0a1380 c0cdeed0
[   13.899398] 1d20: bf0a0024 ea9ee010 00000000 bf0a130c c1704c48 00000000 e91a4a64 bf0a1380
[   13.915997] 1d40: c1704c48 c095bec0 00000000 bf0a130c ea9ee010 c095bf48 00000000 bf0a130c
[   13.932785] 1d60: c095bec8 c0959cbc e91a4a64 ea891858 ea9da3b4 3342fbf9 c184b908 bf0a130c
[   13.949018] 1d80: e9268c80 c184b908 00000000 c095acb0 bf0a0668 00210d00 bf0a130c bf0a130c
[   13.964549] 1da0: c18934e0 ffffe000 bf02f000 c095c9cc c1704c48 c18934e0 ffffe000 c0302ec8
[   13.981361] 1dc0: 8040003f e9266840 c1704c48 e93dcc00 f0821fff ebcffb80 e93dcc40 ea801e40
[   13.997018] 1de0: ebcffb80 e93dcc40 8040003e c046e908 00000000 3342fbf9 00000001 ebcffb80
[   14.013462] 1e00: e93dcc00 ea801e40 bf0a1380 3342fbf9 bf0a1380 00000001 e91a4b00 00000001
[   14.030635] 1e20: 00000000 c03dbf44 e9231f38 00000001 e9231f38 00000001 e91a4a40 c03db0a0
[   14.045868] 1e40: bf0a138c 00007fff bf0a1380 c03d7e54 00000000 bf0a13c8 b6df81bc bf0a1494
[   14.061143] 1e60: c1254fb4 bf0a1578 bf030f7d c1704c48 c1254f00 c1254f0c c1254f64 c1704c48
[   14.076164] 1e80: 00000000 00000000 ffffe000 bf000000 00003020 00000000 00000000 00000000
[   14.091152] 1ea0: 00000000 00000000 00000000 00000000 5f646e73 5f636f73 65726f63 00000000
[   14.105966] 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   14.121024] 1ee0: 00000000 00000000 00000000 3342fbf9 7fffffff c1704c48 00000000 00000010
[   14.136351] 1f00: b6df81bc c0301204 e9230000 0000017b 00539720 c03db76c 7fffffff 00000000
[   14.151307] 1f20: 00000003 40000028 b6ea0f42 f081d000 00003020 00000000 f081db14 f081e1c0
[   14.166606] 1f40: f081d000 00003020 f081faa8 f081f94c f081ee00 00003000 00003100 00001f14
[   14.181789] 1f60: 000031de 00000000 00000000 00000000 00001f04 00000020 00000021 00000015
[   14.197068] 1f80: 00000000 00000010 00000000 3342fbf9 b6df8a8c b6df8a8c 00000000 b5caa400
[   14.212561] 1fa0: 0000017b c03011e0 b6df8a8c 00000000 00000010 b6df81bc 00000000 b6df8cd0
[   14.227942] 1fc0: b6df8a8c 00000000 b5caa400 0000017b 005383d0 bea569ac 00000000 00539720
[   14.243189] 1fe0: bea568a8 bea56898 b6df2951 b6ea0f42 400f0030 00000010 00000000 00000000
[   14.258485] [<bf09f254>] (tegra_wm8903_remove [snd_soc_tegra_wm8903]) from [<bf06e6a0>] (snd_soc_instantiate_card+0x2a4/0xa80 [snd_soc_core])
[   14.278509] [<bf06e6a0>] (snd_soc_instantiate_card [snd_soc_core]) from [<bf06ef68>] (snd_soc_register_card+0xec/0x110 [snd_soc_core])
[   14.298197] [<bf06ef68>] (snd_soc_register_card [snd_soc_core]) from [<bf09f518>] (tegra_wm8903_driver_probe+0x2a4/0x310 [snd_soc_tegra_wm8903])
[   14.307225] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   14.318550] [<bf09f518>] (tegra_wm8903_driver_probe [snd_soc_tegra_wm8903]) from [<c095d8dc>] (platform_drv_probe+0x48/0x98)
[   14.318582] [<c095d8dc>] (platform_drv_probe) from [<c095b980>] (really_probe+0x234/0x34c)
[   14.366860] [<c095b980>] (really_probe) from [<c095bc10>] (driver_probe_device+0x60/0x168)
[   14.384433] [<c095bc10>] (driver_probe_device) from [<c095bec0>] (device_driver_attach+0x58/0x60)
[   14.400631] [<c095bec0>] (device_driver_attach) from [<c095bf48>] (__driver_attach+0x80/0xbc)
[   14.410962] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4329-sdio for chip BCM4329/3
[   14.416550] [<c095bf48>] (__driver_attach) from [<c0959cbc>] (bus_for_each_dev+0x74/0xb4)
[   14.447878] [<c0959cbc>] (bus_for_each_dev) from [<c095acb0>] (bus_add_driver+0x164/0x1e8)
[   14.464924] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac4329-sdio.nvidia,cardhu-a04.txt failed with error -2
[   14.465849] [<c095acb0>] (bus_add_driver) from [<c095c9cc>] (driver_register+0x7c/0x114)
[   14.487509] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac4329-sdio.txt failed with error -2
[   14.500541] [<c095c9cc>] (driver_register) from [<c0302ec8>] (do_one_initcall+0x54/0x22c)
[   14.500574] [<c0302ec8>] (do_one_initcall) from [<c03dbf44>] (do_init_module+0x60/0x220)
[   14.549972] [<c03dbf44>] (do_init_module) from [<c03db0a0>] (load_module+0x1ffc/0x2494)
[   14.565845] [<c03db0a0>] (load_module) from [<c03db76c>] (sys_finit_module+0xac/0xd8)
[   14.581476] [<c03db76c>] (sys_finit_module) from [<c03011e0>] (__sys_trace_return+0x0/0x20)
[   14.597680] Exception stack(0xe9231fa8 to 0xe9231ff0)
[   14.610535] 1fa0:                   b6df8a8c 00000000 00000010 b6df81bc 00000000 b6df8cd0
[   14.626607] 1fc0: b6df8a8c 00000000 b5caa400 0000017b 005383d0 bea569ac 00000000 00539720
[   14.642640] 1fe0: bea568a8 bea56898 b6df2951 b6ea0f42
[   14.655529] Code: e92d4010 e5903100 e5931000 ebff2fa9 (e5900558) 
[   14.669547] ---[ end trace 6c5c1edf43b78cdc ]---

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
