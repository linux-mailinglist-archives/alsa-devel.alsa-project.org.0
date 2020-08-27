Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731DF254534
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 14:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8DF17E5;
	Thu, 27 Aug 2020 14:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8DF17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598532299;
	bh=RfOn4MpJGSygXgZB6gTbjR05rmqV7m4mkO0CFDmHpiA=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmKpFWm6uDLpgh7LZ52LgluSdjr5KzT1OTLr3GBsc0tvc5hn54HGCwHh4Hy9QNlzW
	 8hkLchIElUigvsayMl+YzVfoorH9flpGRVw1kmsSYwvvwB+U1U/4zOiCuX2D8mROu+
	 vwMCBV3WD2EDqmW1KXV3F7vxfrxhnOtm4KaP57jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3215CF801D9;
	Thu, 27 Aug 2020 14:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C460F8016F; Thu, 27 Aug 2020 14:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFA7F800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 14:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFA7F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="mpSbrexX"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200827124307euoutp01895d284d9b95fbe187b46b9b24b47bac~vII4TTYZD2984029840euoutp01y
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 12:43:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200827124307euoutp01895d284d9b95fbe187b46b9b24b47bac~vII4TTYZD2984029840euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598532187;
 bh=Z9hoJjw+81T5d4pJyA/LSGFD+r9gkXkSP2oCwCRDj/s=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mpSbrexXWmIrjNeaWi0UvaNcMdEEa6RfMWvdsIoNuzvZ+YrX/X+B6aBkMIGgxvltm
 jtWqVxWIywnC6qhz9ezo31fODvixT/24lU8SKw3WTMSRK3Mgjaaa3+zHbxTZDaA16e
 YGqdM751e/AGWo639VIo7W8vIrWTnCjc4zO51OdM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200827124307eucas1p2bcb9e419e35857280b8711eca24d56fa~vII4B8Oc21506815068eucas1p2j;
 Thu, 27 Aug 2020 12:43:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FF.E7.06456.A5AA74F5; Thu, 27
 Aug 2020 13:43:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e~vII3as-jG1506815068eucas1p2i;
 Thu, 27 Aug 2020 12:43:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200827124306eusmtrp217aba062195652cb3c9307038294aa83~vII3aFimg1149811498eusmtrp2M;
 Thu, 27 Aug 2020 12:43:06 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-58-5f47aa5a2bfc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 14.35.06314.A5AA74F5; Thu, 27
 Aug 2020 13:43:06 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200827124305eusmtip1041113616a0be8c7ef401b6b6a44d189~vII2yU-jO1715217152eusmtip1W;
 Thu, 27 Aug 2020 12:43:05 +0000 (GMT)
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
Date: Thu, 27 Aug 2020 14:43:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200731120603.2243261-1-jbrunet@baylibre.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djP87pRq9zjDW5Ms7a4cvEQk8XUh0/Y
 LN48OsJs8bN9C5PFtysdTBYLZnNbXN41h82i8fRKJgcOjw2fm9g83t9oZffYOesuu8emVZ1s
 HpuX1Htsfv2C2ePzJrkA9igum5TUnMyy1CJ9uwSujIPv9jEWnJKrmLhasIFxiVQXIyeHhICJ
 xJ69nexdjFwcQgIrGCV2TehjgnC+MEp0fXjJCOF8ZpTYvOAmI0zL+4s/oKqWM0rMnLuRFcJ5
 zyhxb+EWsCphATuJ3z93MIPYIgIFEs8mPAUbxSywkFHi8IvFrCAJNgFDia63XWwgNi9Qw8Pv
 a8GaWQRUJZ7dX8MEYosKxElsPX6VCaJGUOLkzCcsIDangI1E/5JlYDazgLxE89bZzBC2uMSt
 J/PBzpMQOMYusWLFe2aIu10k+m+sZ4KwhSVeHd/CDmHLSPzfCdPQzCjx8Nxadginh1HictMM
 qK+tJe6c+wV0KgfQCk2J9bv0IcKOEnsObWcGCUsI8EnceCsIcQSfxKRt06HCvBIdbUIQ1WoS
 s46vg1t78MIl5gmMSrOQvDYLyTuzkLwzC2HvAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ
 +bmbGIEJ6vS/4592MH69lHSIUYCDUYmHVyPeLV6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVV
 qUX58UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTCm/ZzyV7X011OmvnUN
 V09+Pum++sumKUve+zQky2TU+9p7fwxM5TK/PTfjbU/+u8Rux32hLRM4Her39ForBDuIGumf
 c8wpmrbpoUN40sqHb7f9186fdmpa+fXmBW8DzmwK4zrVknU+iO+arEnTdONKrS+RS1kOK9s9
 W6S06frvNrVwXh+PMDUlluKMREMt5qLiRAC9ob5zTAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7pRq9zjDZ7fFrS4cvEQk8XUh0/Y
 LN48OsJs8bN9C5PFtysdTBYLZnNbXN41h82i8fRKJgcOjw2fm9g83t9oZffYOesuu8emVZ1s
 HpuX1Htsfv2C2ePzJrkA9ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jIPv9jEWnJKrmLhasIFxiVQXIyeHhICJxPuLP5i6GLk4hASWMkp8nvuG
 GSIhI3FyWgMrhC0s8edaFxtE0VtGiV33J4IVCQvYSfz+uQPMFhEokJh+8D8zSBGzwEJGiV/z
 fzGCJIQErCWmrv0IVsQmYCjR9RZkEicHL1Dzw+9rwWpYBFQlnt1fwwRiiwrESTzu/c8MUSMo
 cXLmExYQm1PARqJ/yTIwm1nATGLe5ofMELa8RPPW2VC2uMStJ/OZJjAKzULSPgtJyywkLbOQ
 tCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGI/bjv3cvIPx0sbgQ4wCHIxKPLwa8W7x
 QqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGCqyCuJNzQ1
 NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwCj8Wdkr6ETc/7XFz1atfvqw
 4Sx396q3AQv3pDRfcNM17m+z8yqy56ie+Cxumqgm4/VXwioLZwhd1hL3ncu62jPZ+gCTp+6y
 9mpPzsf2KeUzV1hcOPbq3MlTUyLCnl7uc/x92XS++68jW9dm7TM9fV3nj6OQYeujhusea7L1
 Fya4BYWWz53oulWJpTgj0VCLuag4EQBTUQm+3QIAAA==
X-CMS-MailID: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
 <CGME20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e@eucas1p2.samsung.com>
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

Hi Jerome,

On 31.07.2020 14:06, Jerome Brunet wrote:
> Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
> changed the meaning of dpcm_playback/dpcm_capture and now requires the
> CPU DAI BE to aligned with those flags.
>
> This broke all Amlogic cards with uni-directional backends (All gx and
> most axg cards).
>
> While I'm still confused as to how this change is an improvement, those
> cards can't remain broken forever. Hopefully, next time an API change is
> done like that, all the users will be updated as part of the change, and
> not left to fend for themselves.
>
> Fixes: b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

This patch landed finally in v5.9-rc1. I've noticed it causes a 
following warning on Hardkernel's Odroid N2 board 
(arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb):

meson-drm ff900000.vpu: [drm] fb0: mesondrmfb frame buffer device
------------[ cut here ]------------
WARNING: CPU: 3 PID: 66 at sound/soc/soc-core.c:817 
snd_soc_find_dai+0xe4/0xf0
Modules linked in: dw_hdmi_i2s_audio dw_hdmi_cec meson_gxl realtek 
dwmac_generic crct10dif_ce snd_soc_meson_axg_sound_card 
snd_soc_meson_card_utils rc_odroid pwm_meson meson_ir 
snd_soc_meson_g12a_toacodec snd_soc_meson_axg_tdmout rtc_meson_vrtc 
snd_soc_meson_g12a_tohdmitx snd_soc_meson_codec_glue mdio_mux_meson_g12a 
snd_soc_meson_axg_tdmin dwmac_meson8b stmmac_platform 
reset_meson_audio_arb snd_soc_meson_axg_frddr axg_audio 
snd_soc_meson_axg_toddr sclk_div clk_phase meson_rng stmmac rng_core 
meson_dw_hdmi snd_soc_meson_axg_fifo meson_drm meson_canvas mdio_xpcs 
dw_hdmi snd_soc_meson_t9015 display_connector nvmem_meson_efuse 
snd_soc_meson_axg_tdm_interface snd_soc_meson_axg_tdm_formatter 
snd_soc_simple_amplifier
CPU: 3 PID: 66 Comm: kworker/3:1 Not tainted 5.9.0-rc1 #1527
Hardware name: Hardkernel ODROID-N2 (DT)
Workqueue: events deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
pc : snd_soc_find_dai+0xe4/0xf0
lr : snd_soc_find_dai+0xe0/0xf0
...
Call trace:
  snd_soc_find_dai+0xe4/0xf0
  snd_soc_dai_link_set_capabilities+0x68/0x160
  axg_card_add_link+0x188/0x5c4 [snd_soc_meson_axg_sound_card]
  meson_card_probe+0x1e0/0x960 [snd_soc_meson_card_utils]
  platform_drv_probe+0x50/0xa8
  really_probe+0x110/0x400
  driver_probe_device+0x54/0xb8
  __device_attach_driver+0x90/0xc0
  bus_for_each_drv+0x70/0xc8
  __device_attach+0xec/0x150
  device_initial_probe+0x10/0x18
  bus_probe_device+0x94/0xa0
  deferred_probe_work_func+0x70/0xa8
  process_one_work+0x2a8/0x718
  worker_thread+0x48/0x460
  kthread+0x134/0x160
  ret_from_fork+0x10/0x1c
irq event stamp: 269690
hardirqs last  enabled at (269689): [<ffff800010f6048c>] 
_raw_spin_unlock_irqrestore+0x7c/0x98
hardirqs last disabled at (269690): [<ffff800010025a68>] 
do_debug_exception+0x140/0x26c
softirqs last  enabled at (269318): [<ffff800010001654>] 
efi_header_end+0x654/0x6d4
softirqs last disabled at (269313): [<ffff80001008929c>] 
irq_exit+0x16c/0x178
---[ end trace 56a3ea4fa00c37c8 ]---
...
axg-sound-card sound: ASoC: no DMI vendor name!

The warning is repeated 10 times.

The bisect between v5.8-rc1 and v5.9-rc1 points to the commit 
c8f7dbdbaa15 ("Merge remote-tracking branch 'asoc/for-5.8' into 
asoc-linus"), which introduced a branch with this patch.

The commit with this patch is applied on the earlier kernel release 
(da3f23fde9d7 "ASoC: meson: cards: deal dpcm flag change" on top of 
v5.7-rc1) worked fine, so it looks that there is an interference with 
something merged later.

If I revert this patch on top of v5.9-rc1 or current linux-next, the 
warning is gone. Let me know how I can help debugging this issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

