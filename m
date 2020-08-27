Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A725474E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 16:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE6E417F7;
	Thu, 27 Aug 2020 16:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE6E417F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598539693;
	bh=AYCbxtWnZntszpEQVqFYApttKwBOKXgSBxCtxmAcgFY=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEDsNSKG0NG3tjztaFhpqDuMBFtonim/SRfdpQSCBjo2hTRuEKoO6IMZ+7tngPhcS
	 k7OZihFUYubXt2NTIEV3h9eUL7EqOVjD9QdY1XHmyPHpJ/z4UTAah2tR8c7mi4yWPe
	 /HKVGeT8dcbtJBsNf+7VspiKKBxfx/nwS5YukpMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD5DDF801D9;
	Thu, 27 Aug 2020 16:46:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D263DF8016F; Thu, 27 Aug 2020 16:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_29,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17CAF800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 16:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17CAF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="QqekevUc"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200827144616euoutp02ec135c90789d4f3e9051bc366e989380~vJ0Z6_XQw2361323613euoutp02D
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 14:46:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200827144616euoutp02ec135c90789d4f3e9051bc366e989380~vJ0Z6_XQw2361323613euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598539576;
 bh=bfYHG/OvY7faFyGz2klWMd1yoNRtbGbgih2IyrZiibc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=QqekevUcHsSO2ZsiZpBHKNHUGio5hI0U+c7/nWp16dyhjCl3CKxf3F8tKN1J0/Xnq
 rgoOvMAAC/+ufUnD1w+Zpc5OgfrFZq7p09P7yqK82m+Xt9MavpaetJHBNjGQZxDJ0C
 TIGLkRYp4g6sBUNpXiBH82hA+UQ7GNj7Do9rsrxk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200827144616eucas1p1401d8fe408315d454a3b3af23c4e2a16~vJ0Z0C0sz2332423324eucas1p11;
 Thu, 27 Aug 2020 14:46:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DC.59.05997.837C74F5; Thu, 27
 Aug 2020 15:46:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200827144615eucas1p26e2e13f503ad810fb7eabb145a2ff75c~vJ0ZUGWdK1538615386eucas1p2c;
 Thu, 27 Aug 2020 14:46:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200827144615eusmtrp22fbe258574a204ed1a90634f927698fd~vJ0ZTYB0P2232022320eusmtrp2P;
 Thu, 27 Aug 2020 14:46:15 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-3d-5f47c7384aca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8D.E8.06314.737C74F5; Thu, 27
 Aug 2020 15:46:15 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200827144615eusmtip2c3a8bec75faa8f4d014885d05a89d39f~vJ0YnyOLU0209002090eusmtip2Z;
 Thu, 27 Aug 2020 14:46:14 +0000 (GMT)
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@intel.com>, Stephan Gerhold <stephan@gerhold.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1b540f64-bf03-af59-756a-c4981fc43259@samsung.com>
Date: Thu, 27 Aug 2020 16:46:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1jmu2g6wq0.fsf@starbuckisacylon.baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7djPc7oWx93jDV6e4rW4cvEQk8XUh0/Y
 LN48OsJs8bN9C5PFq8O7GC2+Xelgslgwm9vi8q45bBbf7vezWLQdO8ZqcWOuiUXj6ZVMDjwe
 Gz43sXm8v9HK7tG2wN5j56y77B6L97xk8ti0qpPN4861PWwem5fUe2x+/YLZ49uZiSwenzfJ
 BXBHcdmkpOZklqUW6dslcGV87rzNXHBUo+LgFZkGxnalLkZODgkBE4kPq7pZuxi5OIQEVjBK
 nG86yQLhfGGU6H3UyQ7hfGaU2PhxMjtMy7XDjVAtyxklLp9qZYZw3jNKHD9xjAWkSljATuL3
 zx1gCRGBA0wSOya8YQNxmAUWMkocfrGYFaSKTcBQouttFxuIzQvUse/oeWYQm0VAVeLwlfmM
 ILaoQJzE1uNXmSBqBCVOznwCtoFTwFqib2YDWC+zgLzE9rdzmCFscYlbT+YzgSyTEGjkkJja
 /5YZ4nAXiclPr0A9ISzx6vgWKFtG4v9OmIZmRomH59ayQzg9QN81zWCEqLKWuHPuF9A6DqAV
 mhLrd+lDhB0l9hzazgwSlhDgk7jxVhDiCD6JSdumQ4V5JTrahCCq1SRmHV8Ht/bghUvMExiV
 ZiF5bRaSd2YheWcWwt4FjCyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAtPd6X/Hv+xg
 3PUn6RCjAAejEg/vjn3u8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xCjN
 waIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgXHKST8+DYuT5dMstBk2xLHvClvd2fszXaHC
 PjxsfbKh/qHJ7iGM/m31zrULv3xJiPy8ZB2/9z9/n4T/+xMErt9OmDpb2Wj1qYILWlXNemG5
 h9oENujf3BnoL/KtKrr50Z/yqcVfO3pUuwpb2M6tV38tbn/PUy5fUylpTlKj0rqbjzfX9NTp
 KLEUZyQaajEXFScCANL3dXFzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xe7rmx93jDXqeqFtcuXiIyWLqwyds
 Fm8eHWG2+Nm+hcni1eFdjBbfrnQwWSyYzW1xedccNotv9/tZLNqOHWO1uDHXxKLx9EomBx6P
 DZ+b2Dze32hl92hbYO+xc9Zddo/Fe14yeWxa1cnmcefaHjaPzUvqPTa/fsHs8e3MRBaPz5vk
 Arij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DI+
 d95mLjiqUXHwikwDY7tSFyMnh4SAicS1w42sXYxcHEICSxkluh7PZodIyEicnNbACmELS/y5
 1sUGYgsJvGWU+Ho6B8QWFrCT+P1zBzNIs4jAISaJdTcWsoA4zAILGSV+zf/FCDH2K6PEtH89
 jCAtbAKGEl1vIUbxArXvO3qeGcRmEVCVOHxlPliNqECcxOPe/8wQNYISJ2c+YQGxOQWsJfpm
 NoD1MguYSczb/JAZwpaX2P52DpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem
 5xYb6hUn5haX5qXrJefnbmIERve2Yz8372C8tDH4EKMAB6MSD++Ofe7xQqyJZcWVuYcYJTiY
 lUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGDiySuJNzQ1NLewNDQ3Njc2s1AS
 5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwNhqffs3/+kfx3+Ub9DglK0RPrzztIimT/Wlzeur
 vIrvcCt77p0yq1CuxHlVrtyjK9W3fmtt32QZYH5gWp2fcuM/40lGx7bdS7ze1Zty/1rUcacP
 FrcLXQ1+H5jozcp7dNeWL1si799n+jyTkfved72wae0vKp+//2Xl7c7bemXPq5/bF94ROhSs
 xFKckWioxVxUnAgAkM0SnAQDAAA=
X-CMS-MailID: 20200827144615eucas1p26e2e13f503ad810fb7eabb145a2ff75c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
 <CGME20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e@eucas1p2.samsung.com>
 <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
 <1jmu2g6wq0.fsf@starbuckisacylon.baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com
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

On 27.08.2020 15:32, Jerome Brunet wrote:
> On Thu 27 Aug 2020 at 14:43, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 31.07.2020 14:06, Jerome Brunet wrote:
>>> Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
>>> changed the meaning of dpcm_playback/dpcm_capture and now requires the
>>> CPU DAI BE to aligned with those flags.
>>>
>>> This broke all Amlogic cards with uni-directional backends (All gx and
>>> most axg cards).
>>>
>>> While I'm still confused as to how this change is an improvement, those
>>> cards can't remain broken forever. Hopefully, next time an API change is
>>> done like that, all the users will be updated as part of the change, and
>>> not left to fend for themselves.
>>>
>>> Fixes: b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> This patch landed finally in v5.9-rc1. I've noticed it causes a
>> following warning on Hardkernel's Odroid N2 board
>> (arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb):
> Looks like the after match of the flag change again ...
>
>> meson-drm ff900000.vpu: [drm] fb0: mesondrmfb frame buffer device
>> ------------[ cut here ]------------
>> WARNING: CPU: 3 PID: 66 at sound/soc/soc-core.c:817
> Marek, is it possible that you have CONFIG_LOCKDEP enabled in your
> configuration ?
Right, I have CONFIG_PROVE_LOCKING and CONFIG_LOCKDEP enabled.
> snd_soc_find_dai() is called by snd_soc_dai_link_set_capabilities().
> Indeed, the client_mutex will not be help by any of the user of
> snd_soc_dai_link_set_capabilities() when called.
>
> So I believe simple card and qcom will be impacted as well.
>
>> snd_soc_find_dai+0xe4/0xf0
>> Modules linked in: dw_hdmi_i2s_audio dw_hdmi_cec meson_gxl realtek
>> dwmac_generic crct10dif_ce snd_soc_meson_axg_sound_card
>> snd_soc_meson_card_utils rc_odroid pwm_meson meson_ir
>> snd_soc_meson_g12a_toacodec snd_soc_meson_axg_tdmout rtc_meson_vrtc
>> snd_soc_meson_g12a_tohdmitx snd_soc_meson_codec_glue mdio_mux_meson_g12a
>> snd_soc_meson_axg_tdmin dwmac_meson8b stmmac_platform
>> reset_meson_audio_arb snd_soc_meson_axg_frddr axg_audio
>> snd_soc_meson_axg_toddr sclk_div clk_phase meson_rng stmmac rng_core
>> meson_dw_hdmi snd_soc_meson_axg_fifo meson_drm meson_canvas mdio_xpcs
>> dw_hdmi snd_soc_meson_t9015 display_connector nvmem_meson_efuse
>> snd_soc_meson_axg_tdm_interface snd_soc_meson_axg_tdm_formatter
>> snd_soc_simple_amplifier
>> CPU: 3 PID: 66 Comm: kworker/3:1 Not tainted 5.9.0-rc1 #1527
>> Hardware name: Hardkernel ODROID-N2 (DT)
>> Workqueue: events deferred_probe_work_func
>> pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
>> pc : snd_soc_find_dai+0xe4/0xf0
>> lr : snd_soc_find_dai+0xe0/0xf0
>> ...
>> Call trace:
>>    snd_soc_find_dai+0xe4/0xf0
>>    snd_soc_dai_link_set_capabilities+0x68/0x160
>>    axg_card_add_link+0x188/0x5c4 [snd_soc_meson_axg_sound_card]
>>    meson_card_probe+0x1e0/0x960 [snd_soc_meson_card_utils]
>>    platform_drv_probe+0x50/0xa8
>>    really_probe+0x110/0x400
>>    driver_probe_device+0x54/0xb8
>>    __device_attach_driver+0x90/0xc0
>>    bus_for_each_drv+0x70/0xc8
>>    __device_attach+0xec/0x150
>>    device_initial_probe+0x10/0x18
>>    bus_probe_device+0x94/0xa0
>>    deferred_probe_work_func+0x70/0xa8
>>    process_one_work+0x2a8/0x718
>>    worker_thread+0x48/0x460
>>    kthread+0x134/0x160
>>    ret_from_fork+0x10/0x1c
>> irq event stamp: 269690
>> hardirqs last  enabled at (269689): [<ffff800010f6048c>]
>> _raw_spin_unlock_irqrestore+0x7c/0x98
>> hardirqs last disabled at (269690): [<ffff800010025a68>]
>> do_debug_exception+0x140/0x26c
>> softirqs last  enabled at (269318): [<ffff800010001654>]
>> efi_header_end+0x654/0x6d4
>> softirqs last disabled at (269313): [<ffff80001008929c>]
>> irq_exit+0x16c/0x178
>> ---[ end trace 56a3ea4fa00c37c8 ]---
>> ...
>> axg-sound-card sound: ASoC: no DMI vendor name!
>>
>> The warning is repeated 10 times.
> That's the probe defferal mechanism causing the repeat
>
>> The bisect between v5.8-rc1 and v5.9-rc1 points to the commit
>> c8f7dbdbaa15 ("Merge remote-tracking branch 'asoc/for-5.8' into
>> asoc-linus"), which introduced a branch with this patch.
>>
>> The commit with this patch is applied on the earlier kernel release
>> (da3f23fde9d7 "ASoC: meson: cards: deal dpcm flag change" on top of
>> v5.7-rc1) worked fine, so it looks that there is an interference with
>> something merged later.
>>
>> If I revert this patch on top of v5.9-rc1 or current linux-next, the
>> warning is gone.
> ... but any aml platform with uni-directional backend (not the N2, lucky
> you) would be broken.
>
>> Let me know how I can help debugging this issue.
> If you have CONFIG_LOCKDEP enabled, try disabling see how it goes and
> report. It is not a fix but at least you'll be unblocked.

Right, disabling LOCKDEP hides it. The issue is not a problem for me. 
I've just added OdroidN2 to my test machines and wanted to report what I 
found and help fixing it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

