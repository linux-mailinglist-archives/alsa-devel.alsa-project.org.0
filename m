Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68D3E204D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4DA216DF;
	Fri,  6 Aug 2021 02:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4DA216DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211114;
	bh=ebSCxHPLyiLi3QtLw46r1IOo/s6BBPhByAQ8UJYP2kc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipOD48qO0KrkAy78Ba4C8bYrExT2WuowxZFlP8a4nxS2M9tG0uAC/a3sGxoemexAd
	 4lSm9de2wsrPLrwfvTSuJ+9dwmhJd92jah68d4nYqcMBnhIRrxcA6WrSX74v4X5Lvh
	 7mUE5oEPQ/qdRAHDnFYnm3wtbwUMhrMvTMMS94Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9308FF804FF;
	Fri,  6 Aug 2021 02:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B55DF804FE; Fri,  6 Aug 2021 02:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA6E9F804EB
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA6E9F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UTgayJVE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EF1C60F14;
 Fri,  6 Aug 2021 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210915;
 bh=ebSCxHPLyiLi3QtLw46r1IOo/s6BBPhByAQ8UJYP2kc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UTgayJVEpwi1QPCt4Jq5pi3YwiJznCf/jxdX63XE4S7egAFn1hD0BWykWuoHulg8z
 TiRTWhfBWejXyCydFin1Kp1asf69JymlmBFirTqcaeHes871cn9yFtO/f8gdB/cSEd
 yiYVu+ygwao2Mn5xRz+Iu7vswSCU6o3/eDOEotrj8Gq+7VtMU3nkc9UUQbHi1chkT4
 sDIvBZanMznGFKIEZWwtKIBQjNuykOEECW/hbNRlJApz2gFkNSlS7Ymb2PkkWBY4al
 APzQ+IYe/e3Hnf/3cSoo9FXELSZNuOqmMiZMJ0AP6bJE+Q9OEX+4pMIaUpiZuOwHdm
 2ThIkeqXnWq/Q==
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Avoid over-allocating DLCs
Date: Fri,  6 Aug 2021 01:47:53 +0100
Message-Id: <162821054281.18754.4391897780830223126.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805050706.46833-1-samuel@sholland.org>
References: <20210805050706.46833-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, 5 Aug 2021 00:07:06 -0500, Samuel Holland wrote:
> The allocation of the DAI link components (DLCs) passed the wrong
> pointer to sizeof. Since simple_dai_props is much larger than
> snd_soc_dai_link_component, there was no out of bounds access, only
> wasted memory.
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Avoid over-allocating DLCs
      commit: 36a9d79e5e9518dfd9548e3237e7a49464c16922

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
