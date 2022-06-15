Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3854CA6C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 15:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C99193B;
	Wed, 15 Jun 2022 15:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C99193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655301374;
	bh=ekP0QNj5q0wLAX06GcBg0CJvxlJ3QpBhVkxB3X4207k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHxbfa2vtpRc5X79HLYN3mIppHgq/kR/tFBydnZ7gs4af8OwmOjMkiFN3ziz8Shxw
	 2KkaFzxS9WpXIz6q0gg/jJD4tMPZQZTHtG6iQiHT/fPEzTPnrleSUSu322Vg1XTg0l
	 rpcFRBA1svR2GA7zgdbLzpndjNOFjw+fHrXgSZco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22708F80529;
	Wed, 15 Jun 2022 15:54:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC97FF804B0; Wed, 15 Jun 2022 15:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D3ECF800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 15:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D3ECF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G1p69ZqU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08A27B81721;
 Wed, 15 Jun 2022 13:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF57FC3411B;
 Wed, 15 Jun 2022 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655301278;
 bh=ekP0QNj5q0wLAX06GcBg0CJvxlJ3QpBhVkxB3X4207k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G1p69ZqU5KSno9XBwtkKDa3gaYtxzLf3SdqOfaLvjVFKW7NNno3JKa8DQcBGa7JK6
 suJpslhmltYavZsPZ9EPCsftE8+daMIgpIDEckeobs8jF1Pz55Qck7A7JtQiKwiiR0
 iKPZDYbxWlIB0QQtbirPdw9DW3kzDP2gUbLNro5mbR6Y/TgQfEdoAiN35EsW/QfoVL
 /cnmpOjnKo8ppFazHzCKV1xMnymZQmkSIPImwC5sGv9AWe9kJNsDYcx7DIoYihUcBf
 Pk1u06qUyB0pJOAYHt74blA37SXt1Z8ukCCWltImrpHxyhdwBxs5Z+GZ5N3uf7KGqt
 VHeDV1KlY/Kdw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 perex@perex.cz, spujar@nvidia.com
In-Reply-To: <1655280277-4701-1-git-send-email-spujar@nvidia.com>
References: <1655280277-4701-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix clock DAI format on Tegra210
Message-Id: <165530127643.947339.2607790181344123264.b4-ty@kernel.org>
Date: Wed, 15 Jun 2022 14:54:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On Wed, 15 Jun 2022 13:34:37 +0530, Sameer Pujar wrote:
> I2S reset failures are seen on Tegra210 and later platforms. This indicates
> absence of I2S bit clock, which is required to perform the reset operation.
> Following failures are seen with I2S based tests on Tegra210 and later:
> 
>   tegra210-i2s 2901100.i2s: timeout: failed to reset I2S for playback
>   tegra210-i2s 2901100.i2s: ASoC: PRE_PMU: I2S2 RX event failed: -110
>   tegra210-i2s 2901100.i2s: timeout: failed to reset I2S for capture
>   tegra210-i2s 2901100.i2s: ASoC: PRE_PMU: I2S2 TX event failed: -110
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix clock DAI format on Tegra210
      commit: 5983a8a4a4dc13b5f192212a5e744eb303cd65c2

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
