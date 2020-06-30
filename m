Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E325720F4AA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F2FE167D;
	Tue, 30 Jun 2020 14:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F2FE167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593520354;
	bh=e5ObAcDJgVtH2OReQ2vbZEDV9KTdn/kEy/fwfdN7ATg=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLbzRroHx2PRt+J1MWEIsA7e1nZtDbCJMkN95bbIUdg1X3JHpPtUVFT5Gx+Up+ATG
	 LGY8rslSOAvO0P0DIpub03m0LYdPuzmcOe57yhgxdWpR/91byThgGM/ySRAWHVoT3g
	 2ehoOuLVzhnyn4Bvs+f8/CbnGJ0Ek/u0VSu9Q7q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 911A9F8022D;
	Tue, 30 Jun 2020 14:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD39F801F2; Tue, 30 Jun 2020 14:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 321B9F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 321B9F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="FcsdGipA"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200630123043euoutp01e947738494a2d9aeb0e6796dd7ee93a6~dUjgGGMcI3186131861euoutp01k
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 12:30:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200630123043euoutp01e947738494a2d9aeb0e6796dd7ee93a6~dUjgGGMcI3186131861euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593520243;
 bh=DXacmdXuldbg/RSXdRDYy98Kz6n4M3KUpYvL+dDFKNQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FcsdGipAPbsyPUHLYFUy6P1VmGXB6/iwiitbQB6jpdD4aTNksbOn0okcF/WpA8yhS
 vGxI59eE1k2wN5gOobygMgxFlCUX96uDLI46d+rYFhHgvaRXl39tlsqW2avy3YJveg
 9o1dB9A0DHGT0dHOtwYGGItQBpEyOJ8uI1E+h5O8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200630123043eucas1p27e3f8a117e4e56b767b8a023030aaf2c~dUjf6AT7K3119831198eucas1p2b;
 Tue, 30 Jun 2020 12:30:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E3.9D.06318.3703BFE5; Tue, 30
 Jun 2020 13:30:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405~dUjfoiAgK0189801898eucas1p2F;
 Tue, 30 Jun 2020 12:30:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200630123043eusmtrp1dc43e0debdafc057289091930f499304~dUjfn88121121611216eusmtrp1z;
 Tue, 30 Jun 2020 12:30:43 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-b9-5efb3073ef6f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.C6.06017.3703BFE5; Tue, 30
 Jun 2020 13:30:43 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200630123042eusmtip291c618635370fdf580e54fb1f7a1716d~dUjfN6bEw3127731277eusmtip2P;
 Tue, 30 Jun 2020 12:30:42 +0000 (GMT)
Subject: Re: [PATCH] ALSA: core: Warn on empty module
To: Takashi Iwai <tiwai@suse.de>, linux-rpi-kernel
 <linux-rpi-kernel@lists.infradead.org>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0ec9855e-18d5-6144-ae5f-6cb239214dee@samsung.com>
Date: Tue, 30 Jun 2020 14:30:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624160300.21703-1-tiwai@suse.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87rFBr/jDJpuyFpcuXiIyWLT42us
 FhNvb2C32DZrOZvFr//PmCxebn7D5MDmseFzE5vHvJOBHpuX1HtsPl0dwBLFZZOSmpNZllqk
 b5fAlXHv5HaWgsuKFZs3XGRqYOyT7WLk5JAQMJHYfOsDaxcjF4eQwApGiUvrbjJBOF8YJe7t
 +AHlfGaUuPl5Gztcy//d7BCJ5YwSR/bvZIZw3jNKtHx6wQZSJSxgKrFrzV6wKhGB+4wSL492
 As3i4GAWiJNY0sQFUsMmYCjR9bYLrJ5XwE5i4Zn3YCUsAqoSkzaHg4RFBWIl+pYugCoRlDg5
 8wkLiM0pYCzxd89uZhCbWUBeYvvbOVC2uMStJ/PBrpYQWMQucfP/a0aIq10k/jc9gPpAWOLV
 8S1QtozE6ck9LBANzYwSD8+tZYdwehglLjfNgOq2lrhz7hcbxAOaEut36UOEHSXaF74AO1pC
 gE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheS1WUjemYXknVkIexcw
 sqxiFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITDan/x3/uoNx35+kQ4wCHIxKPLwdsr/j
 hFgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs
 1NSC1CKYLBMHp1QD4/bSm27XAt4Y8U4qDt0U+kVUME/H9RBbaU6nekLbTLmUZ/u65ff5HJp1
 98ranhM/P6a5hJ6dfnNdlXPIrAkP3VkEQ+bKyK8IllCL1Qx+cqU148geUa/TLAGZjmeD/275
 5FMmNaNQvpoj9Ocl34vzPvnXszFIffN4X/ZS7Hm7RISHxkHhyNhlSizFGYmGWsxFxYkA1iSQ
 cTIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7rFBr/jDLZP5rK4cvEQk8Wmx9dY
 LSbe3sBusW3WcjaLX/+fMVm83PyGyYHNY8PnJjaPeScDPTYvqffYfLo6gCVKz6Yov7QkVSEj
 v7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+Peye0sBZcVKzZvuMjU
 wNgn28XIySEhYCKx+f9u9i5GLg4hgaWMEj+XzWGDSMhInJzWwAphC0v8udbFBlH0llHi8stT
 jCAJYQFTiV1r9oJ1iwjcZ5T4c3E5WDezQJzE3R9fmUFsIQEjif1/DzOB2GwChhJdb7vAangF
 7CQWnnkPFOfgYBFQlZi0ORwkLCoQK/Ht3haoEkGJkzOfsIDYnALGEn/37GaGGG8mMW/zQyhb
 XmL72zlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpec
 n7uJERhd24793LKDsetd8CFGAQ5GJR7eDtnfcUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxK
 LcqPLyrNSS0+xGgK9NtEZinR5Hxg5OeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5N
 LUgtgulj4uCUamB0FWGPlvh5Q6acrXalyO79cU+KjWf++rxHjkk/d4dWf0rjJEXV/z6/uvdH
 VK4Pem8WY1WtcDZtOfuT/kmefo6r3Ns7jn1WcL1mq2mbt1pw9x2bA6cuasdsM+KIiNv35+6J
 XTGXim5tiN0jckS0ybd66bKoH5k6DMWxYRbPXwpfOJU03/z/Dk0lluKMREMt5qLiRACdjQAF
 xAIAAA==
X-CMS-MailID: 20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405
References: <20200624160300.21703-1-tiwai@suse.de>
 <CGME20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405@eucas1p2.samsung.com>
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

Hi

On 24.06.2020 18:03, Takashi Iwai wrote:
> The module argument passed to snd_card_new() must be a valid non-NULL
> pointer when the module support is enabled.  Since ASoC driver passes
> the argument from each snd_soc_card definition, one may forget to set
> the owner field and lead to a NULL module easily.
>
> For catching such an overlook, add a WARN_ON() in snd_card_new().
> Also, put the card->module assignment in the ifdef block for a very
> minor optimization.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

I know that this is intended, but I would like to note that this patch 
reveals the following issue on Raspberry Pi 3B with ARM 32bit kernel 
compiled from multi_v7_defconfig:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 210 at sound/core/init.c:207 
snd_card_new+0x378/0x398 [snd]
Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine 
bluetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore 
ecdh_generic ecc bcm2835_thermal phy_generic
CPU: 1 PID: 210 Comm: systemd-udevd Not tainted 
5.8.0-rc1-00027-g81033c6b584b #1087
Hardware name: BCM2835
[<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0x14)
[<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
[<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
[<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
[<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>] 
(snd_card_new+0x378/0x398 [snd])
[<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>] 
(snd_soc_bind_card+0x280/0x99c [snd_soc_core])
[<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>] 
(devm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
[<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from 
[<bf165654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
[<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>] 
(component_bind_all+0xec/0x24c)
[<c09d660c>] (component_bind_all) from [<bf15c44c>] 
(vc4_drm_bind+0xd4/0x174 [vc4])
[<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>] 
(try_to_bring_up_master+0x160/0x1b0)
[<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>] 
(component_master_add_with_match+0xd0/0x104)
[<c09d6f38>] (component_master_add_with_match) from [<bf15c588>] 
(vc4_platform_drm_probe+0x9c/0xbc [vc4])
[<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>] 
(platform_drv_probe+0x6c/0xa4)
[<c09df740>] (platform_drv_probe) from [<c09dd6f0>] 
(really_probe+0x210/0x350)
[<c09dd6f0>] (really_probe) from [<c09dd940>] 
(driver_probe_device+0x5c/0xb4)
[<c09dd940>] (driver_probe_device) from [<c09ddb38>] 
(device_driver_attach+0x58/0x60)
[<c09ddb38>] (device_driver_attach) from [<c09ddbc0>] 
(__driver_attach+0x80/0xbc)
[<c09ddbc0>] (__driver_attach) from [<c09db820>] 
(bus_for_each_dev+0x68/0xb4)
[<c09db820>] (bus_for_each_dev) from [<c09dc9f8>] 
(bus_add_driver+0x130/0x1e8)
[<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x78/0x110)
[<c09de648>] (driver_register) from [<c0302038>] 
(do_one_initcall+0x50/0x220)
[<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x60/0x210)
[<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/0x2338)
[<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/0xbc)
[<c03dac00>] (sys_finit_module) from [<c03000c0>] 
(ret_fast_syscall+0x0/0x54)
Exception stack(0xeded9fa8 to 0xeded9ff0)
...
---[ end trace 6414689569c2bc08 ]---

This warning is not present when booting ARM 64bit kernel, but I suspect 
that this is due to the differences in the kernel configuration.

> ---
>   sound/core/init.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/sound/core/init.c b/sound/core/init.c
> index b02a99766351..0478847ba2b8 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -203,7 +203,10 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
>   	mutex_unlock(&snd_card_mutex);
>   	card->dev = parent;
>   	card->number = idx;
> +#ifdef MODULE
> +	WARN_ON(!module);
>   	card->module = module;
> +#endif
>   	INIT_LIST_HEAD(&card->devices);
>   	init_rwsem(&card->controls_rwsem);
>   	rwlock_init(&card->ctl_files_rwlock);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

