Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE36ABFD1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 13:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21551108;
	Mon,  6 Mar 2023 13:46:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21551108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678106860;
	bh=u39hN/wwIlITAu/b88DSvIgwjo46vuqUzKvxdfHdQ3Q=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CjwbrIIOiokjIgXfTcQCAzktzcsPYQt0MOhMASHXJJ18qqc7aziFP7fi7xBfPdEBq
	 Za95FFUSIvN2buIFY1a0Du6C/uDNOvdhMhG1jUgKBOEqmWHkzqhgss8DE6ST2QR4sB
	 UERsl6w3JAIRnqTqEccpa844UwH5hUPzrGnNGXBU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87901F80527;
	Mon,  6 Mar 2023 13:45:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12828F8042F; Mon,  6 Mar 2023 13:45:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04F86F80236
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 13:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F86F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IyaBW3m/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99FBF60E9C;
	Mon,  6 Mar 2023 12:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75545C4339B;
	Mon,  6 Mar 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678106744;
	bh=u39hN/wwIlITAu/b88DSvIgwjo46vuqUzKvxdfHdQ3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IyaBW3m/TuBgQD4m9tIIV/WVS4eiepeLHuNJbj2jyrN3Slk6DPYlyXTaMK/GXbCWa
	 qRVqVICiOKDOLsd0KZTGhyo6h9OuEq02QP4dxSvQotq+rSbyNMnoEVPFy2N5mJKTI3
	 H0XZIARYMt8mnYwlkF0COryGMj8ImRpOp9/CaYtb6jhdLX9EzDpkIkzNnDSLvgrcTY
	 13E5SLkXO/oMVay0IYjKV7A9WH4eaEuev7r+9eoH/b/BKNUlyUeY/xa/GqO/aojkAW
	 fecvpFJ/9mcunJEMhAIqasitC7+6yN8HS+Uv16yHnTHWd6ZuajGxayGt/mrZQVEdRS
	 VcB9Psu1xdV5w==
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
In-Reply-To: <20230304080702.609-1-quic_visr@quicinc.com>
References: <20230304080702.609-1-quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: tx-macro: Fix for KASAN:
 slab-out-of-bounds
Message-Id: <167810674220.45838.12997652294866709663.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 12:45:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: GFTSRMQ4DFZPRBSBLSE6YO7G3GGPENQ2
X-Message-ID-Hash: GFTSRMQ4DFZPRBSBLSE6YO7G3GGPENQ2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFTSRMQ4DFZPRBSBLSE6YO7G3GGPENQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 04 Mar 2023 13:37:02 +0530, Ravulapati Vishnu Vardhan Rao wrote:
> When we run syzkaller we get below Out of Bound.
>     "KASAN: slab-out-of-bounds Read in regcache_flat_read"
> 
>     Below is the backtrace of the issue:
> 
>     dump_backtrace+0x0/0x4c8
>     show_stack+0x34/0x44
>     dump_stack_lvl+0xd8/0x118
>     print_address_description+0x30/0x2d8
>     kasan_report+0x158/0x198
>     __asan_report_load4_noabort+0x44/0x50
>     regcache_flat_read+0x10c/0x110
>     regcache_read+0xf4/0x180
>     _regmap_read+0xc4/0x278
>     _regmap_update_bits+0x130/0x290
>     regmap_update_bits_base+0xc0/0x15c
>     snd_soc_component_update_bits+0xa8/0x22c
>     snd_soc_component_write_field+0x68/0xd4
>     tx_macro_digital_mute+0xec/0x140
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
      commit: e5e7e398f6bb7918dab0612eb6991f7bae95520d

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

