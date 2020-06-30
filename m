Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805220F4D2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:38:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD523167F;
	Tue, 30 Jun 2020 14:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD523167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593520718;
	bh=7xF0GZritUCqtTTpYuGO79/oTHPVVZjR1mxH0nj1D+E=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojNNxyt16M0byn4TAVFHCsjmPGh7jpYDzbAphQrwBBco5mmgFvTGjio3bWnFByPQp
	 FJsdqpiRaArITE96Vt4JTv1bXPTJ6lQoAn8PYKizIUB2edGRrymV6AClARk3+APcjJ
	 G6nTWmjhpC2ysvoqICx0xGzfkCbHiW4rH8HteryA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 328EFF8013E;
	Tue, 30 Jun 2020 14:36:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B038F801F2; Tue, 30 Jun 2020 14:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C40C6F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40C6F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="GA8N/j6p"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200630123647euoutp02a3f12fa4441f437f7fa44147751079f8~dUozChcUq0106101061euoutp02s
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 12:36:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200630123647euoutp02a3f12fa4441f437f7fa44147751079f8~dUozChcUq0106101061euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593520607;
 bh=giwPrAlGQTdX9OLsabJrmzU87EUFfsibm+7e4k18b8c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=GA8N/j6pcY+P/cCK3E+YGdmcqr1TjAMwh0SLPISxhwm3zfS2XOfLjhBijVgctN7hZ
 zy8gF7a+y62WNMzpDBQX/+gKqqjFf23Ei7mBIFHUnfNtVM4R73cxJ3SWta6ugGXJkS
 Vz6fyzk6I5K5knfOXsX2LMjsTDaLkQ1SvR3yU82E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200630123647eucas1p2cc72bdfc89b32a9b6843591625eee1d3~dUoy2lfBR0958709587eucas1p2G;
 Tue, 30 Jun 2020 12:36:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A6.49.05997.FD13BFE5; Tue, 30
 Jun 2020 13:36:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200630123647eucas1p1a96f4f2c3abc224299103ae7a833cde8~dUoyku7Od1982319823eucas1p1h;
 Tue, 30 Jun 2020 12:36:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200630123647eusmtrp1f1fe72db2647bf57c0a3d00a4931f322~dUoyj7Sod1535515355eusmtrp1Z;
 Tue, 30 Jun 2020 12:36:47 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-2f-5efb31dff339
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 73.C7.06017.FD13BFE5; Tue, 30
 Jun 2020 13:36:47 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200630123646eusmtip1dac79df5117808acc1dacebd030ff494~dUoyHTXAn2500025000eusmtip1q;
 Tue, 30 Jun 2020 12:36:46 +0000 (GMT)
Subject: Re: [PATCH] ALSA: core: Warn on empty module
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Takashi Iwai
 <tiwai@suse.de>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <8a5e65f3-771d-5896-1288-f4e441225034@samsung.com>
Date: Tue, 30 Jun 2020 14:36:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c16be1b9b4da811e923e3ff589ff5dfcdfebe314.camel@suse.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djPc7r3DX/HGayZKW1x5eIhJotNj6+x
 Wky8vYHdYtus5WwWv/4/Y7J4ufkNkwObx4bPTWwe804GemxeUu+x+XR1AEsUl01Kak5mWWqR
 vl0CV0bH8sXMBfMVKl4cmM/cwPhVuouRk0NCwERi5fen7F2MXBxCAisYJf7cfccG4XxhlPgy
 8xYThPOZUeLrr4lMMC2nN6+DalnOKHFt4SmolvdAzpTtrCBVwgKmErvW7AWrEhG4zyhx6+Jc
 li5GDg5mgTiJJU1cIDVsAoYSXW+72EBsXgE7iXWnNrGA2CwCqhKdZzaCzREViJXoW7oAqkZQ
 4uTMJ2A1nAKuEi2fpoPVMAvIS2x/O4cZwhaXuPVkPtjZEgLz2CUuv3rDDnG2i0TfjiPMELaw
 xKvjW6DiMhKnJ/ewQDQ0M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9sEB9oSqzfpQ8RdpRoX/iC
 CSQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzULy2iwk78xC8s4s
 hL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKab0/+Of9nBuOtP0iFGAQ5GJR7e
 DtnfcUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6
 YklqdmpqQWoRTJaJg1OqgXFzWWj1xPiThTZHCp+J2zuF2DwXvq9nv1/rulz97Mv8ElmVIlad
 OtcO7TnNx9cjVz/5j/WUKH7+M9s+RVrO31zJ8rS59Mzt2Rr3q1NTy16vkFTPyfz4+vLTDI/L
 650WrQhd7yZ+5OKJKSIqm6a5qAR9vxg2fcKKcxNXJHDPLHprufTu4pt3HRSUWIozEg21mIuK
 EwHLZXgsMwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7r3DX/HGdxbyG5x5eIhJotNj6+x
 Wky8vYHdYtus5WwWv/4/Y7J4ufkNkwObx4bPTWwe804GemxeUu+x+XR1AEuUnk1RfmlJqkJG
 fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbH8sXMBfMVKl4cmM/c
 wPhVuouRk0NCwETi9OZ17F2MXBxCAksZJRqOb2CBSMhInJzWwAphC0v8udbFBlH0llFi7oIP
 zCAJYQFTiV1r9oJ1iwjcZ5T4uKmXESTBLBAncffHV2aIjm+MEuubb4Il2AQMJbregozi5OAV
 sJNYd2oT2DoWAVWJzjMbwdaJCsRKfLu3BapGUOLkzCdgNZwCrhItn6azQiwwk5i3+SEzhC0v
 sf3tHChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P
 3cQIjLBtx35u2cHY9S74EKMAB6MSD2+H7O84IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW
 5ccXleakFh9iNAV6biKzlGhyPjD680riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YW
 pBbB9DFxcEo1MK5bdWXStY0PXhpvkrnwwGBG/uN9Al9V9fbw33bSb7He/MTY7CeXpl6Ax7JF
 xl67uIIDBSYt9lYI+iXT8cDg/J353h6XjvHfVWz1sRAI52jcnv9TM8OpUW/dlKfxCT6HQyrm
 CB+8I3Wx3sTAxrhN4TL3KdPmzc//h9jYGr/7Wv6q/8OLM5O9DZVYijMSDbWYi4oTAYSvAUnG
 AgAA
X-CMS-MailID: 20200630123647eucas1p1a96f4f2c3abc224299103ae7a833cde8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405
References: <20200624160300.21703-1-tiwai@suse.de>
 <CGME20200630123043eucas1p2f95aa10ad1611e902269fbf9b783c405@eucas1p2.samsung.com>
 <0ec9855e-18d5-6144-ae5f-6cb239214dee@samsung.com>
 <c16be1b9b4da811e923e3ff589ff5dfcdfebe314.camel@suse.de>
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


On 30.06.2020 14:34, Nicolas Saenz Julienne wrote:
> Hi Marek,
> Thanks for pointing this out!
>
> On Tue, 2020-06-30 at 14:30 +0200, Marek Szyprowski wrote:
>> Hi
>>
>> On 24.06.2020 18:03, Takashi Iwai wrote:
>>> The module argument passed to snd_card_new() must be a valid non-NULL
>>> pointer when the module support is enabled.  Since ASoC driver passes
>>> the argument from each snd_soc_card definition, one may forget to set
>>> the owner field and lead to a NULL module easily.
>>>
>>> For catching such an overlook, add a WARN_ON() in snd_card_new().
>>> Also, put the card->module assignment in the ifdef block for a very
>>> minor optimization.
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> I know that this is intended, but I would like to note that this patch
>> reveals the following issue on Raspberry Pi 3B with ARM 32bit kernel
>> compiled from multi_v7_defconfig:
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 210 at sound/core/init.c:207
>> snd_card_new+0x378/0x398 [snd]
>> Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine
>> bluetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore
>> ecdh_generic ecc bcm2835_thermal phy_generic
>> CPU: 1 PID: 210 Comm: systemd-udevd Not tainted
>> 5.8.0-rc1-00027-g81033c6b584b #1087
>> Hardware name: BCM2835
>> [<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0x14)
>> [<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
>> [<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
>> [<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
>> [<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>]
>> (snd_card_new+0x378/0x398 [snd])
>> [<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>]
>> (snd_soc_bind_card+0x280/0x99c [snd_soc_core])
>> [<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>]
>> (devm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
>> [<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from
>> [<bf165654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
>> [<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>]
>> (component_bind_all+0xec/0x24c)
>> [<c09d660c>] (component_bind_all) from [<bf15c44c>]
>> (vc4_drm_bind+0xd4/0x174 [vc4])
>> [<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>]
>> (try_to_bring_up_master+0x160/0x1b0)
>> [<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>]
>> (component_master_add_with_match+0xd0/0x104)
>> [<c09d6f38>] (component_master_add_with_match) from [<bf15c588>]
>> (vc4_platform_drm_probe+0x9c/0xbc [vc4])
>> [<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>]
>> (platform_drv_probe+0x6c/0xa4)
>> [<c09df740>] (platform_drv_probe) from [<c09dd6f0>]
>> (really_probe+0x210/0x350)
>> [<c09dd6f0>] (really_probe) from [<c09dd940>]
>> (driver_probe_device+0x5c/0xb4)
>> [<c09dd940>] (driver_probe_device) from [<c09ddb38>]
>> (device_driver_attach+0x58/0x60)
>> [<c09ddb38>] (device_driver_attach) from [<c09ddbc0>]
>> (__driver_attach+0x80/0xbc)
>> [<c09ddbc0>] (__driver_attach) from [<c09db820>]
>> (bus_for_each_dev+0x68/0xb4)
>> [<c09db820>] (bus_for_each_dev) from [<c09dc9f8>]
>> (bus_add_driver+0x130/0x1e8)
>> [<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x78/0x110)
>> [<c09de648>] (driver_register) from [<c0302038>]
>> (do_one_initcall+0x50/0x220)
>> [<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x60/0x210)
>> [<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/0x2338)
>> [<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/0xbc)
>> [<c03dac00>] (sys_finit_module) from [<c03000c0>]
>> (ret_fast_syscall+0x0/0x54)
>> Exception stack(0xeded9fa8 to 0xeded9ff0)
>> ...
>> ---[ end trace 6414689569c2bc08 ]---
>>
>> This warning is not present when booting ARM 64bit kernel, but I suspect
>> that this is due to the differences in the kernel configuration.
> It's because vc4 is not yet supported on RPi4.

This happens on RPi *3B* :)


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

