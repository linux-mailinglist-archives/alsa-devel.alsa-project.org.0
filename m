Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C387086F5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 19:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F42DE;
	Thu, 18 May 2023 19:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F42DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684431133;
	bh=+5h/6N8I0UV/l06NAtCmeaQnePCeUKDhjroTzI85C4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wq8RFRMc6dsPaybZPyh4kFQnAvgeZNgAtC49yJiDCeBFV/rCvi/qRLl3A86MKaqd8
	 zrtD/CxxOy2daKDt7Hh4FB0d1e0v5e0yqO//yDexSjwDXtYlT74Czt3+oX9xow4b/w
	 +K7VGs5F/MYlogB8fnRLxAHBNs8lMJ5Nv6B8SKQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B133F80431; Thu, 18 May 2023 19:31:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F66AF8025A;
	Thu, 18 May 2023 19:31:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF509F802E8; Thu, 18 May 2023 19:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16935F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 19:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16935F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UyCONONY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0510619E1;
	Thu, 18 May 2023 17:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9169EC433D2;
	Thu, 18 May 2023 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684431066;
	bh=+5h/6N8I0UV/l06NAtCmeaQnePCeUKDhjroTzI85C4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UyCONONYRD7xFmaZobBaYzr3h53pKq6TKE/mJ9CLm97V9nCbkH2GSJY5V/wVFuLDU
	 NfoUw1EyeldIQPWq1FDRsvhBgUMAs8zaGHpHbNimdLNUVM8Dt+8Y1Lz6UN7ZQgToZw
	 CEVEuvH+EsPsF4qmI8M8Zb3LyoDcFeyYf/Xk+WWgD1KR5jOGqoMcmq0auvfBeZQrka
	 jxaK+JvOr5wxot37R5ER4ClVdZcoX5MJB0fuNgddNuGj8hc0bCYI6W0dq/G899ejcB
	 SwJGJBM32phimhm5p3ABV0N56nn/nvrmz7U4L3+xGhc0JpFemTh6F4j1VPCxAUpPwG
	 MTOYTKN4msMhA==
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230511112532.16106-1-quic_visr@quicinc.com>
References: <20230511112532.16106-1-quic_visr@quicinc.com>
Subject: Re: [PATCH v2] ASoC:codecs: lpass: Fix for KASAN use_after_free
 out of bounds
Message-Id: <168443106443.480335.16812738995271810180.b4-ty@kernel.org>
Date: Fri, 19 May 2023 02:31:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: TEHOWTJRGFY5Y6IVMET6EJJRF7YH5D6R
X-Message-ID-Hash: TEHOWTJRGFY5Y6IVMET6EJJRF7YH5D6R
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TEHOWTJRGFY5Y6IVMET6EJJRF7YH5D6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 May 2023 16:55:32 +0530, Ravulapati Vishnu Vardhan Rao wrote:
> When we run syzkaller we get below Out of Bounds error.
> 
> "KASAN: slab-out-of-bounds Read in regcache_flat_read"
> 
> Below is the backtrace of the issue:
> 
> BUG: KASAN: slab-out-of-bounds in regcache_flat_read+0x10c/0x110
> Read of size 4 at addr ffffff8088fbf714 by task syz-executor.4/14144
> CPU: 6 PID: 14144 Comm: syz-executor.4 Tainted: G        W
> Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
> Call trace:
> dump_backtrace+0x0/0x4ec
> show_stack+0x34/0x50
> dump_stack_lvl+0xdc/0x11c
> print_address_description+0x30/0x2d8
> kasan_report+0x178/0x1e4
> __asan_report_load4_noabort+0x44/0x50
> regcache_flat_read+0x10c/0x110
> regcache_read+0xf8/0x5a0
> _regmap_read+0x45c/0x86c
> _regmap_update_bits+0x128/0x290
> regmap_update_bits_base+0xc0/0x15c
> snd_soc_component_update_bits+0xa8/0x22c
> snd_soc_component_write_field+0x68/0xd4
> tx_macro_put_dec_enum+0x1d0/0x268
> snd_ctl_elem_write+0x288/0x474
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC:codecs: lpass: Fix for KASAN use_after_free out of bounds
      commit: 75e5fab7db0cecb6e16b22c34608f0b40a4c7cd1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

