Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9255BAAE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 17:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0471E9;
	Mon, 27 Jun 2022 17:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0471E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656342832;
	bh=Hp+WENVBVl1RrjIlf08WD/vdxEpwC7u8O6uoatajoAk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5YSP8VfwxeFV9Bj9tzO0yXjyEITkcVrOGKZeRlgwWDqb1ORrHI1EQchYAsvWHlZS
	 99i4LQlgIvZC/85zsbbt4KRxu7KhIVOtoA6C4YYCaWER3D8xUCKCAEPLz6FHn2BMRx
	 TifZZZBTlkjWvxZnVLBZ0AZ4rPm+Zu7MWIXtpMlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 225B3F800E9;
	Mon, 27 Jun 2022 17:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A4FF8028B; Mon, 27 Jun 2022 17:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 984B2F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984B2F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OZf6TZRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656342768; x=1687878768;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Hp+WENVBVl1RrjIlf08WD/vdxEpwC7u8O6uoatajoAk=;
 b=OZf6TZRGnOdpuPqmcNOr8nMREPEDpLi50t6wqu/i9FjOcwFMPEgy3/3G
 G6VoxhtzjCBxxt7svU+18aZX6sryxwYcq6IF+QK+hohWd60ccSUWER0Co
 2zd8WeDVw8PI82E6ReoiS7juGeD92DTlx+o0Ff6GUTeGEsmOj56ND2mTm
 djpOQ0iSVG7G55y8i9hC/Ovhp6Qjsip+0hY2jglgGt9ljng9dV1d9BYns
 sqIBONj1HLfZA9FfP5wCNTsoiBqwBlwhSRez2TE4NloBBAaaTSbsXckGb
 ayP6ZS/OETSu64U2ynHJiMwX8hsiTYItTSp6uI/RIaXKay2wpfZJ4aWp+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282203150"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="282203150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:12:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="622577482"
Received: from vthayala-mobl.amr.corp.intel.com (HELO [10.209.144.177])
 ([10.209.144.177])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:12:38 -0700
Message-ID: <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
Date: Mon, 27 Jun 2022 10:12:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Content-Language: en-US
To: Alex Natalsson <harmoniesworlds@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

[Adding alsa-devel]

On 6/26/22 04:29, Alex Natalsson wrote:
> Hello friends.
> I have Khadas VIM3 SBC with Amlogic A311D SOC device.
> After update kernel my media software (alsamixer, mplayer, ffplay and
> etc.) not responding after launch and not terminating throught kill
> -9.
> 
> The log after alsamixer launch:
> [  103.786358] Internal error: Oops: 96000004 [#1] SMP
> [  103.786509] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device bnep nls_utf8 mt7601u mac80211 hci_uart libarc4 joydev
> brcmfmac btbcm panfrost bluetooth meson_vdec(C) brcmutil gpu_sched
> cfg80211 dwmac_generic videobuf2_dma_contig v4l2_mem2mem
> videobuf2_memops videobuf2_v4l2 videobuf2_common drm_shmem_helper
> ecdh_generic dwmac_meson8b stmmac_platform dw_hdmi_i2s_audio stmmac
> ecc ir_nec_decoder videodev pcs_xpcs rc_khadas phylink ptp
> meson_saradc meson_ir rc_core snd_soc_meson_axg_frddr
> snd_soc_meson_axg_toddr snd_soc_meson_axg_sound_card
> snd_soc_meson_card_utils snd_soc_meson_axg_fifo ao_cec_g12a
> snd_soc_meson_axg_tdmin snd_soc_meson_axg_tdm_interface
> snd_soc_meson_axg_tdmout snd_soc_meson_axg_tdm_formatter rfkill
> meson_gxbb_wdt fuse crypto_user uas usb_storage adc_keys
> gpio_keys_polled industrialio
> [  103.857778] CPU: 3 PID: 530 Comm: pipewire-media- Tainted: G
>  C        5.16.0-ARCH+ #8

Any chance you could try with an updated kernel? It's not clear to me if
this is a real issue or just a warning that's been fixed since by commit.

bbf7d3b1c4f40 "ASoC: soc-pcm: Fix DPCM lockdep warning due to nested
stream locks"

You may also want to open a bugzilla issue to attach the full dmesg log
and your configuration reported by 'alsa-info'

> [  103.857791] Hardware name: Khadas VIM3 (DT)
> [  103.857795] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  103.857801] pc : dpcm_be_connect+0xd0/0x2d0
> [  103.881758] lr : dpcm_add_paths.isra.0+0xcc/0x1e0
> [  103.881763] sp : ffff800009f4b870
> [  103.881765] x29: ffff800009f4b870 x28: ffff000003b944c0 x27: 0000000000000001
> [  103.881772] x26: 0000000000000001 x25: 0000000000000340 x24: 00000000000002a0
> [  103.881777] x23: 0000000000000001 x22: 0000000000000000 x21: ffff000005b18080
> [  103.881782] x20: ffff000005b183c0 x19: ffff000005b1c080 x18: 0000000000000000
> [  103.881787] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  103.881792] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  103.881797] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [  103.881801] x8 : ffff000012020400 x7 : 0000000000000000 x6 : 000000000000003f
> [  103.881806] x5 : 0000000000000040 x4 : 0000000000000000 x3 : ffff000002822000
> [  103.881811] x2 : ffff000002861b50 x1 : ffff00000282f800 x0 : ffff000002861800
> [  103.881817] Call trace:
> [  103.881819]  dpcm_be_connect+0xd0/0x2d0
> [  103.881823]  dpcm_add_paths.isra.0+0xcc/0x1e0
> [  103.881826]  dpcm_fe_dai_open+0x80/0x194
> [  103.881831]  snd_pcm_open_substream+0xa4/0x174
> [  103.881838]  snd_pcm_open.part.0+0xd8/0x1dc
> [  103.881843]  snd_pcm_capture_open+0x64/0x94
> [  103.992730]  snd_open+0xac/0x1d0
> [  103.992739]  chrdev_open+0xe0/0x2d0
> [  103.999389]  do_dentry_open+0x12c/0x3a0
> [  103.999397]  vfs_open+0x30/0x3c
> [  103.999401]  do_open+0x204/0x414
> [  103.999405]  path_openat+0x10c/0x27c
> [  103.999408]  do_filp_open+0x80/0x130
> [  103.999412]  do_sys_openat2+0xb4/0x170
> [  103.999414]  __arm64_sys_openat+0x64/0xb0
> [  103.999416]  invoke_syscall+0x48/0x114
> [  103.999426]  el0_svc_common.constprop.0+0xd4/0xfc
> [  103.999429]  do_el0_svc+0x28/0x90
> [  103.999432]  el0_svc+0x28/0x80
> 
> After I removed pipewire software the error message was
> disappear. But the sound and media still doesn't working and alsamixer
> cannot change sound card to my usb audio device.
