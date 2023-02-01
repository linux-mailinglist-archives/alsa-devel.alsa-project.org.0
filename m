Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CF686A2C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 16:24:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62BB4DF;
	Wed,  1 Feb 2023 16:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62BB4DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675265049;
	bh=k073vJl0WTiBoaGQQ9tAhHMBenhKUSYdg+RdPLDDN2c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B/sOCAMQARsymEjf6cqwaenaArod7Oq5OscyIzETUCz8X4MJqx2RQsws8jSQRSPCd
	 jtSlb5lnl85hsVbchAjOM6L5pWUAq7d++2IgaOwGGv5QTbVvn+RB6rPIv7N/L0jzEe
	 /X13XrffdTUNIm3wBUPVInf2dMFxBOi9KFhKQlRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5913F80155;
	Wed,  1 Feb 2023 16:23:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04844F80423; Wed,  1 Feb 2023 16:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E54FAF80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 16:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E54FAF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jG77iaMB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAB0E6176D;
 Wed,  1 Feb 2023 15:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C8AC433EF;
 Wed,  1 Feb 2023 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675264984;
 bh=k073vJl0WTiBoaGQQ9tAhHMBenhKUSYdg+RdPLDDN2c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jG77iaMB2HkTaRksdoFQ4JRKIhAtS3P31MUbZLJS8VtD5ZZhtmKFdde8gdWNYB1LK
 GjY5jE/mjXEbdJUMwc+JB2eAV/In9xE56bgVUKmHAnVcBZNeVC5nuDlQRHp8NW5HKO
 s0b8YTUNIQA1zZUCA6FqcHbuMa3Rh3Q6vwC5aDbXzr3os5LvYW5+Ceqm6N9WBsBjAQ
 fh6Ia4j9tDNy25kzxreNyKdfN3K3fw+r1otmW07yM+B5BLQqH+M6AavtnAWM5ToAQM
 qZFFH09pDnJJLDynPtbGvRzXPDGeZUC5Zx5/4OwzV9zzp4YUWUh4NoV7GDYafzkSHE
 E3gutemD5fZ6w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/15] ASoC: rsnd: cleanup add R-Car Gen4 Sound support
Message-Id: <167526498330.445826.16606223243397883957.b4-ty@kernel.org>
Date: Wed, 01 Feb 2023 15:23:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 01 Feb 2023 01:59:29 +0000, Kuninori Morimoto wrote:
> This patch-set adds R-Car Gen4 support on Renesas sound driver.
> To add it, it needs some cleanups / prepares which makes
> easy to review the patch.
> 
> 
> Kuninori Morimoto (15):
>   ASoC: rsnd: check whether playback/capture property exists
>   ASoC: rsnd: fixup #endif position
>   ASoC: rsnd: Remove unnecessary rsnd_dbg_dai_call()
>   ASoC: rsnd: indicate necessary error when clock start failed
>   ASoC: rsnd: indicate warning once if it can't handle requested rule
>   ASoC: rsnd: use same debug message format on clkout
>   ASoC: rsnd: remove unnecessary ADG flags
>   ASoC: rsnd: rename clk to clkin
>   ASoC: rsnd: moves clkout_name to top of the file
>   ASoC: rsnd: use clkin/out_size
>   ASoC: rsnd: use array for 44.1kHz/48kHz rate handling
>   ASoC: rsnd: tidyup rsnd_dma_addr()
>   ASoC: rsnd: dma.c: tidyup rsnd_dma_probe()
>   ASoC: dt-bindings: renesas: add R8A779G0 V4H
>   ASoC: rsnd: add R-Car Gen4 Sound support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: rsnd: check whether playback/capture property exists
        commit: 68a410aff971e59b9e94aa22c4c5cb6a6af30729
[02/15] ASoC: rsnd: fixup #endif position
        commit: 49123b51cd896e00b256a27c2ce9e6bfe1bbc22f
[03/15] ASoC: rsnd: Remove unnecessary rsnd_dbg_dai_call()
        commit: e5a3c491e194768f4899e8d1746301542cd7c1e8
[04/15] ASoC: rsnd: indicate necessary error when clock start failed
        commit: c12dc0f6655bbf41d32a863b8e314f18f746fb0b
[05/15] ASoC: rsnd: indicate warning once if it can't handle requested rule
        commit: 6d612f67a8d430ab1905f795fb440e6e3545d94f
[06/15] ASoC: rsnd: use same debug message format on clkout
        commit: 3e262e9592bb18c4f491c2db8fd6cc49d9e23c38
[07/15] ASoC: rsnd: remove unnecessary ADG flags
        commit: 184d82e142eeb0a741ba9335601c075fc45b34aa
[08/15] ASoC: rsnd: rename clk to clkin
        commit: 4bbff16d26e83a150851e19a1e24f4ee71125863
[09/15] ASoC: rsnd: moves clkout_name to top of the file
        commit: da2f9e859413465c11d8aff01ff6f112d516c58e
[10/15] ASoC: rsnd: use clkin/out_size
        commit: efaab61588c4a85814ebf1fe983710bceb662d58
[11/15] ASoC: rsnd: use array for 44.1kHz/48kHz rate handling
        commit: 662721ece4f0146a09a0fe4108e7a05274723d7e
[12/15] ASoC: rsnd: tidyup rsnd_dma_addr()
        commit: c20bc7c9ce3a3ad8d51b26823e2ad2ba9b8bb447
[13/15] ASoC: rsnd: dma.c: tidyup rsnd_dma_probe()
        commit: beab0aad7276795952d4bb52f88fe6bd2406404c
[14/15] ASoC: dt-bindings: renesas: add R8A779G0 V4H
        commit: f76fec606d07b43d21475a0dda6294613379e224
[15/15] ASoC: rsnd: add R-Car Gen4 Sound support
        commit: c2bc65274a307e11743d0f56a762f8e57f279b9e

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

