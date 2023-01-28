Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B867F9D5
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 18:21:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CF0AE86;
	Sat, 28 Jan 2023 18:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CF0AE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674926473;
	bh=Sf8e39xlrlBgctvAjNmyaVJ8lTKFI4W3ruclNnksOWQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r2kjtTiPaYQypmFLBKvLA4cbEbvMQE/0/vgyzMn0lXXe+ZVM9+wCPKeUyBKrdzSX0
	 AUwQ1RxScp4Qi/q4hOkJxtprfLg7ZgkuOAGEgOZprFg7j5Tkb7A4rKWfxpRIXtbleu
	 bUWeNGchmZpyehFR2LJxpXRdlNO+TBEYbgQLIU1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F65F80171;
	Sat, 28 Jan 2023 18:19:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39A3AF8053D; Sat, 28 Jan 2023 18:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EA44F80171
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 18:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA44F80171
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qlXG48eQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E74B460C38;
 Sat, 28 Jan 2023 17:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DF1C4339C;
 Sat, 28 Jan 2023 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674926339;
 bh=Sf8e39xlrlBgctvAjNmyaVJ8lTKFI4W3ruclNnksOWQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qlXG48eQCOe3z8Urz+wDffxl9GdN0pgqSbrDxcIex7q6Hqmy33aeIetLf/n5jEiJF
 uans6w2v3EkhTjky0H+k3K2LM6E6k3q+j78XU1WgDlV9QSZzBhCpqg7wmYhjpZWRe0
 tg9RIYRlPcCP5vmdjYuxaTlzUxsCRixOwBvPXAX382RNGXYjsvY6OkLm4MfXYFJbRw
 RBl1/leHXfhzCzbYXtpns/ZQF7X8PaiidX1amryL0fV2afygTusdcpLbqpJVMT2Whc
 0oZ5otwv8jNpNqz19KyoWx4cZLtHJKMbGOwUWdJ/cQyetJ7dwGllEZudVZlcE0EOq4
 ERourzK8scoyg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Kees Cook <keescook@chromium.org>
In-Reply-To: <20230127224128.never.410-kees@kernel.org>
References: <20230127224128.never.410-kees@kernel.org>
Subject: Re: [PATCH] ASoC: kirkwood: Iterate over array indexes instead of
 using pointer math
Message-Id: <167492633694.2479102.1677977069431569775.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 17:18:56 +0000
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
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 27 Jan 2023 14:41:29 -0800, Kees Cook wrote:
> Walking the dram->cs array was seen as accesses beyond the first array
> item by the compiler. Instead, use the array index directly. This allows
> for run-time bounds checking under CONFIG_UBSAN_BOUNDS as well. Seen
> with GCC 13 with -fstrict-flex-arrays:
> 
> ../sound/soc/kirkwood/kirkwood-dma.c: In function
> 'kirkwood_dma_conf_mbus_windows.constprop':
> ../sound/soc/kirkwood/kirkwood-dma.c:90:24: warning: array subscript 0 is outside array bounds of 'const struct mbus_dram_window[0]' [-Warray-bounds=]
>    90 |                 if ((cs->base & 0xffff0000) < (dma & 0xffff0000)) {
>       |                      ~~^~~~~~
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: kirkwood: Iterate over array indexes instead of using pointer math
      commit: b3bcedc0402fcdc5c8624c433562d9d1882749d8

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

