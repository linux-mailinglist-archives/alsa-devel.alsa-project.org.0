Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E86FE211C52
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 08:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA351684;
	Thu,  2 Jul 2020 08:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA351684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593673195;
	bh=HKyZ/JBCbJ/HCoUSNAxm/lX7FnW1kQvDcuBgNCpiI6k=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YtxCigLNQadDX/HY/crM8HwYFVu8bSp6X4CUEZf9EPO99Sd+7ayeQ9MgrUTdGcRhu
	 RSTdWsyLm/30Jrn1mDf4XYfdZiKV2q8/dRbKOQfWkLzLLs3wCH7N/P1vnHJOPzCtOz
	 o/lXyetdy813/k4nofzCSaxD0OIdiYZq2XuA/tKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A849DF80245;
	Thu,  2 Jul 2020 08:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 931F8F8022D; Thu,  2 Jul 2020 08:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 891DAF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 08:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891DAF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="KR+prety"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702065801euoutp0178bc8c3af1bc25ca5b841107f82dd109~d3TlvHKN-1351113511euoutp01f
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200702065801euoutp0178bc8c3af1bc25ca5b841107f82dd109~d3TlvHKN-1351113511euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593673081;
 bh=NzaDBQfr6WRKi/ptL89uBWwolYKgYnuCPeIKSeN9LuI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=KR+prety+t2iAfFfCHgMVLYAnHRi8ZbR5e+5xYhZX0KLeuQkBLHiWxe9ggMUASjdZ
 PP0ahDjwFaxAlQzohByYq3aQlWVeuN+Z1K23e6ouRaPNcLkXMObWpFjniHTJrEDlLM
 Ne3tkIBO1+ur+HpO21bCChJgd70BvdxKdas2sxTo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702065801eucas1p2c22c35b32d3a7f13154a9a74ac1ac6c7~d3TlkWoce0034400344eucas1p2m;
 Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7B.2E.05997.9758DFE5; Thu,  2
 Jul 2020 07:58:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702065801eucas1p203cd0ed7dc1c7efd7f37624c24940082~d3Tk-2nPT0037400374eucas1p22;
 Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702065801eusmtrp2aa3b2154a9c6fb4d5f458198cff3e558~d3Tk-O52v1081310813eusmtrp2R;
 Thu,  2 Jul 2020 06:58:01 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-9b-5efd8579f6c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 16.05.06314.8758DFE5; Thu,  2
 Jul 2020 07:58:00 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702065800eusmtip10a240e25b980d08ba755d2c71639018c~d3Tkc-O610867808678eusmtip1Y;
 Thu,  2 Jul 2020 06:58:00 +0000 (GMT)
Subject: Re: [PATCH] drm/vc4/vc4_hdmi: fill ASoC card owner
To: Stefan Wahren <stefan.wahren@i2se.com>, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b31f4a5e-98ec-cf57-5aaa-38df273d56d9@samsung.com>
Date: Thu, 2 Jul 2020 08:58:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89bb3b69-2c81-3f83-da68-0e3b9a068cf5@i2se.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO2duZ+LkuCm+aHQZGhakWRonFKlQWBDRjyAyU095mpKXtePM
 1Q9veWnWvP3QVtEKUzNMUZtNKHGFQ03TMpGpmBewhUNQ0wybbTta/nve93ufG3wELja6+REp
 6ZmMMp1OlfLdeYae9cFD6sI/8Yd15gDq/mAvRo0MmzBq01CBUyM/F/lUxXiLgDLo6vlUa8MY
 n7K2LWAnCFnLcj5f9nZVz5O9toTLOla/ucmmSs2YrK02R9bWf/ucINY9MolJTclilCFRie7J
 3/XrmKLBP7tnehLLRbWgQUICyDB4n9eOObGYbEBgKo3RIHcHXkFgH51344ZlBBXaErTNeDnc
 jXOMegRVdhV3tIhgaaLBJSUhIyB3strF9iaLEPyabUbOASfbEWjm61xSfDIUNDYN34lFZBQM
 NC24ZHlkAEyPrrmUfMh4aLZ2YNyNF/Q+mOM5sZCMhOd9jS4dnNwDHbZHOId9wTL3BHOaAdkn
 AGNXNY/LHQ0vWkq3Okjgh7ldwOFdsGncJhQgmB5sEnDDPQRf8mu2GBEwMfjbEZVwWByA5s4Q
 bn0SJvSjyLkG0hPGbF5cCE+oNFTj3FoEJUVi7no/6Myv/tl2D33Gy5FUt6Oabkcd3Y46uv++
 esRrRL6Mik2TM+yRdOZmMEunsap0efDVjLRW5PhQ/XbzyhvUuXHFhEgCST1Eydkb8WI3OotV
 p5kQELjUW3RqoD9eLEqi1bcYZUaCUpXKsCbkT/CkvqKjz6yXxaSczmSuM4yCUW6/YoTQLxfF
 1tV65MUdl9+wzzIZKVrjkkftpRrVHYYOfBqnGI+Y796tVu2L8fwoGJup6mKEd2eGbF+zrI+r
 gq6FB0o+UAsePpW07XzBUrl27WyY9mHx3tNBCSuKzTKttUxiyVQqwlrLCuTDzcWJ1k+FKOGi
 JyuZeldiib6g88shj51hOqQ8NpkOPYgrWfov/NbQEEwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xu7qVrX/jDA6tY7HoPXeSyeLKxUNM
 Fv+3TWS2uPL1PZvFxNsb2C22zVrOZrFpxQ02i5eb3zA5cHhs+NzE5rH32wIWj623TD22f3vA
 6nG/+ziTx+Yl9R6bT1cHsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb
 2aSk5mSWpRbp2yXoZbxY8JOpYIV0xbGHd5kaGJdIdDFyckgImEisvniQuYuRi0NIYCmjRNvZ
 LywQCRmJk9MaWCFsYYk/17rYIIreMkqcOP0WLCEsYC3RcHc6K0hCRKCNUeLRx26wUcwCWxgl
 3rzcwgLRcphRYvvue4wgLWwChhJdb0FmcXLwCthJnF37hhnEZhFQkXh47TsTiC0qECexfMt8
 dogaQYmTM5+A3cQpYCOx9NQqsDnMAmYS8zY/ZIaw5SW2v50DZYtL3Hoyn2kCo9AsJO2zkLTM
 QtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIFRue3Yz807GC9tDD7EKMDBqMTD
 m1HxJ06INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTBh5
 JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYGbvecd2+u+B80JYM
 rRb/30fepde/dNu3/fT6IKv1f/O8LR78C3l8fPMP/imbpmlo7pzrcehl9knV9I6Hj/iyeGRL
 yjVWbRNp+f3k3zypJSdu6iueM3U/OyPwN2fP7Wr5Wk8bxxW91b2v1pxPPsv/zlW9fZPcUQ3J
 rBu6KctvPlq4u05Dc8+VcCWW4oxEQy3mouJEAI2UgZbgAgAA
X-CMS-MailID: 20200702065801eucas1p203cd0ed7dc1c7efd7f37624c24940082
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
References: <CGME20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba@eucas1p1.samsung.com>
 <20200701073949.28941-1-m.szyprowski@samsung.com>
 <89bb3b69-2c81-3f83-da68-0e3b9a068cf5@i2se.com>
Cc: Takashi Iwai <tiwai@suse.de>, David Airlie <airlied@linux.ie>,
 alsa-devel@alsa-project.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
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

On 01.07.2020 20:49, Stefan Wahren wrote:
> Am 01.07.20 um 09:39 schrieb Marek Szyprowski:
>> card->owner is a required property and since commit 81033c6b584b ("ALSA:
>> core: Warn on empty module") a warning is issued if it is empty. Fix lack
>> of it. This fixes following warning observed on RaspberryPi 3B board
>> with ARM 32bit kernel and multi_v7_defconfig:
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 210 at sound/core/init.c:207 snd_card_new+0x378/0x398 [snd]
>> Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine bluetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore ecdh_generic ecc bcm2835_thermal phy_generic
>> CPU: 1 PID: 210 Comm: systemd-udevd Not tainted 5.8.0-rc1-00027-g81033c6b584b #1087
>> Hardware name: BCM2835
>> [<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0x14)
>> [<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
>> [<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
>> [<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
>> [<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>] (snd_card_new+0x378/0x398 [snd])
>> [<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>] (snd_soc_bind_card+0x280/0x99c [snd_soc_core])
>> [<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>] (devm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
>> [<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf165654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
>> [<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>] (component_bind_all+0xec/0x24c)
>> [<c09d660c>] (component_bind_all) from [<bf15c44c>] (vc4_drm_bind+0xd4/0x174 [vc4])
>> [<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>] (try_to_bring_up_master+0x160/0x1b0)
>> [<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>] (component_master_add_with_match+0xd0/0x104)
>> [<c09d6f38>] (component_master_add_with_match) from [<bf15c588>] (vc4_platform_drm_probe+0x9c/0xbc [vc4])
>> [<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>] (platform_drv_probe+0x6c/0xa4)
>> [<c09df740>] (platform_drv_probe) from [<c09dd6f0>] (really_probe+0x210/0x350)
>> [<c09dd6f0>] (really_probe) from [<c09dd940>] (driver_probe_device+0x5c/0xb4)
>> [<c09dd940>] (driver_probe_device) from [<c09ddb38>] (device_driver_attach+0x58/0x60)
>> [<c09ddb38>] (device_driver_attach) from [<c09ddbc0>] (__driver_attach+0x80/0xbc)
>> [<c09ddbc0>] (__driver_attach) from [<c09db820>] (bus_for_each_dev+0x68/0xb4)
>> [<c09db820>] (bus_for_each_dev) from [<c09dc9f8>] (bus_add_driver+0x130/0x1e8)
>> [<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x78/0x110)
>> [<c09de648>] (driver_register) from [<c0302038>] (do_one_initcall+0x50/0x220)
>> [<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x60/0x210)
>> [<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/0x2338)
>> [<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/0xbc)
>> [<c03dac00>] (sys_finit_module) from [<c03000c0>] (ret_fast_syscall+0x0/0x54)
>> Exception stack(0xeded9fa8 to 0xeded9ff0)
>> ...
>> ---[ end trace 6414689569c2bc08 ]---
>>
>> Suggested-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> thanks for this patch. Any chance for a fixes tag here?

Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

