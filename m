Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78901782678
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 11:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE5911C;
	Mon, 21 Aug 2023 11:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE5911C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692611260;
	bh=15D+t6iQibnxwHweIY4i1RKOUYkWZAbshrhbd7JT2Z0=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fiQv4uhka3vsF9X72aq6AYfM+bfh/WMDo7eF4R1pTP5L4FBsT0oSJ9Z0k16Uv0ZKs
	 UI1DCV0kxI/o+1EbnRgboQaD1b6kLLq9WFDJfYsxwfe62szGPzwcjCtdIORUmXUSjg
	 SSb4ZwYmxkds63cGEmzKAXT2mWyjqdADPzwPeoYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F987F8016C; Mon, 21 Aug 2023 11:46:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41EC9F8016C;
	Mon, 21 Aug 2023 11:46:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92E6FF800F8; Mon, 21 Aug 2023 11:46:44 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 88993F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 11:46:44 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Codec stops working after sleep and resume
From: =?utf-8?b?SmVzw7pzIEppbcOpbmV6IFPDoW5jaGV6?=
 <Jesus.JimenezSanchez@verifone.com>
To: alsa-devel@alsa-project.org
Date: Mon, 21 Aug 2023 09:46:44 -0000
Message-ID: <169261120455.20.1254929135837680857@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: S6456ZUOMFXLRHU2B2JNZUSGKIGXNBXY
X-Message-ID-Hash: S6456ZUOMFXLRHU2B2JNZUSGKIGXNBXY
X-MailFrom: Jesus.JimenezSanchez@verifone.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6456ZUOMFXLRHU2B2JNZUSGKIGXNBXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I am using the tlv320aic31xx codec in my embedded device and I've noticed that, after forcing the unit into sleep and then, resume, I get a bunch of these errors:
```
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: aic31xx_wait_bits: Failed! 0x25 was 0xcc239ca8 expected 0x0 (-108, 0x20, 0 us)
tlv320aic31xx-codec 0-0018: ASoC: POST_PMD: HPL Driver event failed: -1
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: POST_PMD: SPL ClassD event failed: -108
tlv320aic31xx-codec 0-0018: ASoC: POST_PMD: SPR ClassD event failed: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
tlv320aic31xx-codec 0-0018: ASoC: error at snd_soc_component_update_bits on tlv320aic31xx-codec.0-0018: -108
```

When I look at he output of `dmesg`, I found this:
```
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1506 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xac/0xb4
i2c i2c-0: Transfer while suspended
Modules linked in: rfcomm stm32_adc stm32_timer_trigger stm32_lptimer_trigger sha256_generic libsha256 sha256_arm snd_soc_simple_card snd_soc_simple_card_utils cfg80211 stm32_crc32 hci_uart btqca stm32_cryp libdes crypto_engine snd_soc_stm32_i2s snd_soc_tlv320aic31xx bluetooth stm32_adc_core snd_soc_core atmel_mxt_ts snd_pcm_dmaengine snd_pcm ecdh_generic snd_timer snd ecc sgm4151x_charger soundcore libaes [last unloaded: wlan]
CPU: 0 PID: 1506 Comm: sh Tainted: G           O      5.15.67 #1
Hardware name: STM32 (Device Tree Support)
[<c010e8cc>] (unwind_backtrace) from [<c010c120>] (show_stack+0x10/0x14)
[<c010c120>] (show_stack) from [<c011dc1c>] (__warn+0xec/0x148)
[<c011dc1c>] (__warn) from [<c0bed42c>] (warn_slowpath_fmt+0x78/0xac)
[<c0bed42c>] (warn_slowpath_fmt) from [<c092ecdc>] (__i2c_transfer+0xac/0xb4)
[<c092ecdc>] (__i2c_transfer) from [<c092ed80>] (i2c_transfer+0x9c/0x138)
[<c092ed80>] (i2c_transfer) from [<c06f5a40>] (regmap_i2c_read+0x5c/0x98)
[<c06f5a40>] (regmap_i2c_read) from [<c06f0e2c>] (_regmap_raw_read+0x10c/0x2a8)
[<c06f0e2c>] (_regmap_raw_read) from [<c06f1008>] (_regmap_bus_read+0x40/0x6c)
[<c06f1008>] (_regmap_bus_read) from [<c06ef9c4>] (_regmap_read+0x60/0x14c)
[<c06ef9c4>] (_regmap_read) from [<c06effdc>] (_regmap_update_bits+0xb4/0xf4)
[<c06effdc>] (_regmap_update_bits) from [<c06f00c0>] (_regmap_select_page+0xa4/0x108)
[<c06f00c0>] (_regmap_select_page) from [<c06f07a8>] (_regmap_raw_write_impl+0x684/0x968)
[<c06f07a8>] (_regmap_raw_write_impl) from [<c06f0b04>] (_regmap_bus_raw_write+0x78/0xa0)
[<c06f0b04>] (_regmap_bus_raw_write) from [<c06efe40>] (_regmap_write+0x4c/0x134)
[<c06efe40>] (_regmap_write) from [<c06f0010>] (_regmap_update_bits+0xe8/0xf4)
[<c06f0010>] (_regmap_update_bits) from [<c06f1820>] (regmap_update_bits_base+0x50/0x74)
[<c06f1820>] (regmap_update_bits_base) from [<bf0d0980>] (snd_soc_component_update_bits+0x78/0x124 [snd_soc_core])
[<bf0d0980>] (snd_soc_component_update_bits [snd_soc_core]) from [<bf0daa20>] (dapm_seq_run_coalesced+0x14c/0x1a4 [snd_soc_core])
[<bf0daa20>] (dapm_seq_run_coalesced [snd_soc_core]) from [<bf0dab68>] (dapm_seq_run+0xf0/0x350 [snd_soc_core])
[<bf0dab68>] (dapm_seq_run [snd_soc_core]) from [<bf0db170>] (dapm_power_widgets+0x3a8/0x530 [snd_soc_core])
[<bf0db170>] (dapm_power_widgets [snd_soc_core]) from [<bf0cc214>] (snd_soc_dapm_sync+0x48/0x54 [snd_soc_core])
[<bf0cc214>] (snd_soc_dapm_sync [snd_soc_core]) from [<bf0c652c>] (snd_soc_suspend+0xf0/0x230 [snd_soc_core])
[<bf0c652c>] (snd_soc_suspend [snd_soc_core]) from [<c06df188>] (dpm_run_callback+0x48/0x134)
[<c06df188>] (dpm_run_callback) from [<c06df58c>] (__device_suspend+0x11c/0x4c4)
[<c06df58c>] (__device_suspend) from [<c06e1c10>] (dpm_suspend+0x148/0x2cc)
[<c06e1c10>] (dpm_suspend) from [<c06e20e8>] (dpm_suspend_start+0x64/0x6c)
[<c06e20e8>] (dpm_suspend_start) from [<c0159f00>] (suspend_devices_and_enter+0x150/0x2b4)
[<c0159f00>] (suspend_devices_and_enter) from [<c0bede38>] (enter_state+0x204/0x250)
[<c0bede38>] (enter_state) from [<c015a0a4>] (pm_suspend+0x40/0x98)
[<c015a0a4>] (pm_suspend) from [<c0158ae4>] (state_store+0x68/0xc8)
[<c0158ae4>] (state_store) from [<c0330a68>] (kernfs_fop_write_iter+0x10c/0x1cc)
[<c0330a68>] (kernfs_fop_write_iter) from [<c028ea40>] (vfs_write+0x298/0x45c)
[<c028ea40>] (vfs_write) from [<c028ed4c>] (ksys_write+0x60/0xe4)
[<c028ed4c>] (ksys_write) from [<c0100060>] (ret_fast_syscall+0x0/0x48)
Exception stack(0xcffcbfa8 to 0xcffcbff0)
bfa0:                   00000004 005ac7d8 00000001 005ac7d8 00000004 00000000
bfc0: 00000004 005ac7d8 00000001 00000004 b6f01680 bee896d8 005a8448 005a8590
bfe0: 005a6dfc bee89690 004fcda4 b6dcb4f8
---[ end trace 75457fd792755cae ]---
```

I've been trying for a few days, but I can't find the source of the problem or a way to solve it. Is there anything I might be missing?

I assume the problem is that it's trying to write to the registers after the suspend has happened, but I haven't been able to prove that either, and I wouldn't know how to fix that. Could that be what's happening here?

Thanks.
