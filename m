Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654B6DB2C4
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 20:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3576ED4;
	Fri,  7 Apr 2023 20:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3576ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680892147;
	bh=IaqEVSvO4+ec0TMhLkqBwp/Pr6mbvqqD98gAzdvOZHk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hn9DWYn/1RlP8BecuyitNaULXUUP1imBAXVi480l/GGpHJB+ZNC2yHSBO5oa63z/n
	 Xj2CY+EwGQoUYIUwpt5iUlhg7jgEnvLzOko7Nt6fB75+NzVM4EB1lbRY2HW18aNoCH
	 J9pGkFo1/wUfvspYBhTKXhzn+j63+wYYnuliKT5M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BE5F80249;
	Fri,  7 Apr 2023 20:28:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 040B3F8026A; Fri,  7 Apr 2023 20:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DF85F800E5
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 20:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF85F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CB6dOTtS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C44D46531A;
	Fri,  7 Apr 2023 18:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65268C433EF;
	Fri,  7 Apr 2023 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680892080;
	bh=IaqEVSvO4+ec0TMhLkqBwp/Pr6mbvqqD98gAzdvOZHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CB6dOTtScPKXalKF3JrhUEVFMkjNB/W8xrIsDLtw7o/SNFs7/NUayzVsVrI7xZTi6
	 X0uxshqcVt8/ZQ+HQFP/ISqfg2rEQM+1/7fsznDZZ1xVHaYpRO+cGUThOF0czMDS9p
	 aIbj5s+dOxbhvcTm8ox6+jUwTzBb9DhE23Xa4iKQ6aNSlRw76MEzMi6DcfwEitwZ1S
	 QL8as3fZZVBuzbVFXdRwX2oV1qxiRLq6w8L28SKmiDDeM6kLibtgqw7EsOwyKFqNrV
	 ICy1BgUTt1BTI2EFfQ3VSlpquZQgx1VqLOoyChsryqFTYbvOzYJKzS05cDKcik2hg1
	 Yh0tyYdp0SNdw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 colin.i.king@gmail.com, fshao@chromium.org, jiaxin.yu@mediatek.com,
 allen-kh.cheng@mediatek.com, Tom Rix <trix@redhat.com>
In-Reply-To: <20230407115553.1968111-1-trix@redhat.com>
References: <20230407115553.1968111-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: set variable aud_pinctrl to
 static
Message-Id: <168089207711.180511.12653080399028672980.b4-ty@kernel.org>
Date: Fri, 07 Apr 2023 19:27:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: S5ZRZFV3727SPM2MUUAETBSAYJS33LGI
X-Message-ID-Hash: S5ZRZFV3727SPM2MUUAETBSAYJS33LGI
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5ZRZFV3727SPM2MUUAETBSAYJS33LGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Apr 2023 07:55:53 -0400, Tom Rix wrote:
> smatch reports
> sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:14:16: warning: symbol
>   'aud_pinctrl' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: set variable aud_pinctrl to static
      commit: 672029caa5708934817a331f3323bbe48d456c5c

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

