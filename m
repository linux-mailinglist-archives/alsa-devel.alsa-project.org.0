Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5CA254600
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 15:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23A7B17F0;
	Thu, 27 Aug 2020 15:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23A7B17F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598535240;
	bh=EqfTHawWiofr0/cH+NI9mrjBfhG704U9RxW9aS4vny8=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fIrX/LTeSs5ZHxOCK8bGE88uIUwKcGf1Ft63fZc6HWrCiCjP88dqhAtR4bP62a5vC
	 p/bVlcHYv//Xqgdsl2LyjkeJ6cNVAucybNp2HimpynNZfuUHV8WXOndgH4hp9sDQNf
	 go3j9d9C9MpaziCDYJ8Ot+D2E1wUOF1fFDmstNto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35771F80105;
	Thu, 27 Aug 2020 15:32:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A823F8016F; Thu, 27 Aug 2020 15:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_29,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84470F80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 15:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84470F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="llWyNpxJ"
Received: by mail-wm1-x342.google.com with SMTP id z9so5122358wmk.1
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=RzjTTXuW8DoQzMoQkpQltYkMS2hvfG2Wfy3KypxE85c=;
 b=llWyNpxJ3XYx4msjmJiZYlY6gVQe7XWBxESPQWE5O4+p1/7ffuz3Hh+8PKvIOKijtA
 xPjWCpULHdChCIFlNhwXM0bYx4QhMtmMkWALfpAteoa++wRIjBx4elYwR365z7mcimmn
 QzEJsSO9u2Zwd6DQ/83vF0GIYszdYx0fCcmDa/v87iBYf/cggfoNA+iD8VHiv7Qg9CG5
 d4gi9feMHBUGAhGUMqRb78xOKL/6fZtMkY3OBwTH/+LwxSByvYejWSaXvx/8Omr9lLH9
 6C1ipG5Z68JQKmc7vA0fDA8Y07pG9V1XyucEBTsVIWzEqikWY8pKDYIHa4vzfy+4fysd
 mZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=RzjTTXuW8DoQzMoQkpQltYkMS2hvfG2Wfy3KypxE85c=;
 b=bGQq0y8rdSSt1gOg8hJQnRPBnHjOM6QSFw6gBLUfqdIS3yCgmPqxsf4ez5r6bhloxt
 KlkursNm2o4Xo1GVbLG2skr43+Ckc4cUenx5FJkiEyLHSai8fcAjDqVQ1m7UXiusSWRC
 l0B+quhw+BrlkDKMxqFuWr/tCRdO4+ioqMvAuC1MKEfLx+2HW9PPGeDDOhaBb9nRkIdh
 r4qOZAasxCOYT6fXVdIwh5IPwhQfrCrFHer1MaVLDSVt045o4yRsUcVzKOks8ajvLOip
 GgBkmeQgIsXlBzXnmRdRfKwHPPThxE0Kh/V4bhdntd1biO1ng7Ll1IoDTC/pUT9Ip7YY
 2gNg==
X-Gm-Message-State: AOAM531rQ6nTJH8TZiV62CkeM0uoITcLu1HgYNla8iY/hWeaEq7ofdq4
 VahiYJfLdoQp/CD6wqojLH0HNw==
X-Google-Smtp-Source: ABdhPJw34SA8WJgrEgzMp2TR1ApIy6v1Wx2UvzK6DpDa87F1baFk/BT77mLLH0QK1paRl37b2MDcRQ==
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr12466841wmf.26.1598535129044; 
 Thu, 27 Aug 2020 06:32:09 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 31sm6239269wrp.87.2020.08.27.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 06:32:08 -0700 (PDT)
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
 <CGME20200827124306eucas1p2c355345ca848e396f1fb06a7ef7a111e@eucas1p2.samsung.com>
 <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
In-reply-to: <e950898e-0a07-4f75-2640-ec8039d81464@samsung.com>
Date: Thu, 27 Aug 2020 15:32:07 +0200
Message-ID: <1jmu2g6wq0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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


On Thu 27 Aug 2020 at 14:43, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Hi Jerome,
>
> On 31.07.2020 14:06, Jerome Brunet wrote:
>> Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
>> changed the meaning of dpcm_playback/dpcm_capture and now requires the
>> CPU DAI BE to aligned with those flags.
>>
>> This broke all Amlogic cards with uni-directional backends (All gx and
>> most axg cards).
>>
>> While I'm still confused as to how this change is an improvement, those
>> cards can't remain broken forever. Hopefully, next time an API change is
>> done like that, all the users will be updated as part of the change, and
>> not left to fend for themselves.
>>
>> Fixes: b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> This patch landed finally in v5.9-rc1. I've noticed it causes a 
> following warning on Hardkernel's Odroid N2 board 
> (arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb):

Looks like the after match of the flag change again ...

>
> meson-drm ff900000.vpu: [drm] fb0: mesondrmfb frame buffer device
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 66 at sound/soc/soc-core.c:817

Marek, is it possible that you have CONFIG_LOCKDEP enabled in your
configuration ?

snd_soc_find_dai() is called by snd_soc_dai_link_set_capabilities().
Indeed, the client_mutex will not be help by any of the user of 
snd_soc_dai_link_set_capabilities() when called.

So I believe simple card and qcom will be impacted as well.

> snd_soc_find_dai+0xe4/0xf0
> Modules linked in: dw_hdmi_i2s_audio dw_hdmi_cec meson_gxl realtek 
> dwmac_generic crct10dif_ce snd_soc_meson_axg_sound_card 
> snd_soc_meson_card_utils rc_odroid pwm_meson meson_ir 
> snd_soc_meson_g12a_toacodec snd_soc_meson_axg_tdmout rtc_meson_vrtc 
> snd_soc_meson_g12a_tohdmitx snd_soc_meson_codec_glue mdio_mux_meson_g12a 
> snd_soc_meson_axg_tdmin dwmac_meson8b stmmac_platform 
> reset_meson_audio_arb snd_soc_meson_axg_frddr axg_audio 
> snd_soc_meson_axg_toddr sclk_div clk_phase meson_rng stmmac rng_core 
> meson_dw_hdmi snd_soc_meson_axg_fifo meson_drm meson_canvas mdio_xpcs 
> dw_hdmi snd_soc_meson_t9015 display_connector nvmem_meson_efuse 
> snd_soc_meson_axg_tdm_interface snd_soc_meson_axg_tdm_formatter 
> snd_soc_simple_amplifier
> CPU: 3 PID: 66 Comm: kworker/3:1 Not tainted 5.9.0-rc1 #1527
> Hardware name: Hardkernel ODROID-N2 (DT)
> Workqueue: events deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
> pc : snd_soc_find_dai+0xe4/0xf0
> lr : snd_soc_find_dai+0xe0/0xf0
> ...
> Call trace:
>   snd_soc_find_dai+0xe4/0xf0
>   snd_soc_dai_link_set_capabilities+0x68/0x160
>   axg_card_add_link+0x188/0x5c4 [snd_soc_meson_axg_sound_card]
>   meson_card_probe+0x1e0/0x960 [snd_soc_meson_card_utils]
>   platform_drv_probe+0x50/0xa8
>   really_probe+0x110/0x400
>   driver_probe_device+0x54/0xb8
>   __device_attach_driver+0x90/0xc0
>   bus_for_each_drv+0x70/0xc8
>   __device_attach+0xec/0x150
>   device_initial_probe+0x10/0x18
>   bus_probe_device+0x94/0xa0
>   deferred_probe_work_func+0x70/0xa8
>   process_one_work+0x2a8/0x718
>   worker_thread+0x48/0x460
>   kthread+0x134/0x160
>   ret_from_fork+0x10/0x1c
> irq event stamp: 269690
> hardirqs last  enabled at (269689): [<ffff800010f6048c>] 
> _raw_spin_unlock_irqrestore+0x7c/0x98
> hardirqs last disabled at (269690): [<ffff800010025a68>] 
> do_debug_exception+0x140/0x26c
> softirqs last  enabled at (269318): [<ffff800010001654>] 
> efi_header_end+0x654/0x6d4
> softirqs last disabled at (269313): [<ffff80001008929c>] 
> irq_exit+0x16c/0x178
> ---[ end trace 56a3ea4fa00c37c8 ]---
> ...
> axg-sound-card sound: ASoC: no DMI vendor name!
>
> The warning is repeated 10 times.

That's the probe defferal mechanism causing the repeat

>
> The bisect between v5.8-rc1 and v5.9-rc1 points to the commit 
> c8f7dbdbaa15 ("Merge remote-tracking branch 'asoc/for-5.8' into 
> asoc-linus"), which introduced a branch with this patch.
>
> The commit with this patch is applied on the earlier kernel release 
> (da3f23fde9d7 "ASoC: meson: cards: deal dpcm flag change" on top of 
> v5.7-rc1) worked fine, so it looks that there is an interference with 
> something merged later.
>
> If I revert this patch on top of v5.9-rc1 or current linux-next, the 
> warning is gone.

... but any aml platform with uni-directional backend (not the N2, lucky
you) would be broken.

> Let me know how I can help debugging this issue.

If you have CONFIG_LOCKDEP enabled, try disabling see how it goes and
report. It is not a fix but at least you'll be unblocked.

>
> Best regards

