Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F921C3E6F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 17:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB455171D;
	Mon,  4 May 2020 17:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB455171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588605931;
	bh=o0Pi2RXnCXtfd+41C8gctF8KJGX1w+a7yEUtFLgby4Q=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/7A9mCOEAQ1vnsBPIN6hGh5zC6XHIoR8ni5dIPjghCog5n40IVoR4KcZmG0Z7lgy
	 F1tM8P2fnthU34bjk3bHl9vPCmbc8pAvYqQkec24MD/BAuch+MsLSfpwNfqcYfyUfM
	 66wv9nQBjL+XVicOtuBJy8WvTQMmCXf9U+Mc/QNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD910F800EE;
	Mon,  4 May 2020 17:23:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45598F80258; Mon,  4 May 2020 17:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13B4EF800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 17:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B4EF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SoxiEpct"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2FDE206B8;
 Mon,  4 May 2020 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588605821;
 bh=o0Pi2RXnCXtfd+41C8gctF8KJGX1w+a7yEUtFLgby4Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=SoxiEpctoghFbnidMxaGKwrIvL3G3SqfnKYa2gS0m/yIGJkiMqVBa6g9bxamBnuUu
 Qb0KVtWGqxnWTh76x4xh0oac1W2NM/yqpbuKsFQ0hRZMF6CKRU6UKz3c9EjTIyDCZP
 WiAsq317QrW205fyt9U6duTYFtX/DngyQonSguqs=
Date: Mon, 04 May 2020 16:23:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "jack.yu@realtek.com" <jack.yu@realtek.com>, lgirdwood@gmail.com
In-Reply-To: <20200504112013.2499-1-jack.yu@realtek.com>
References: <20200504112013.2499-1-jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt1015: Add condition to prevent SoC providing bclk
 in ratio of 50 times of sample rate.
Message-Id: <158860581280.26857.13925215097392595128.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, albertwang@realtek.com, flove@realtek.com
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

On Mon, 4 May 2020 19:20:13 +0800, jack.yu@realtek.com wrote:
> From: Jack Yu <jack.yu@realtek.com>
> 
> Add condition to prevent SoC providing bclk in ratio of 50 times of sample rate.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> ---
>  sound/soc/codecs/rt1015.c | 27 +++++++++++++++++++++++++++
>  sound/soc/codecs/rt1015.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: rt1015: Add condition to prevent SoC providing bclk in ratio of 50 times of sample rate.
      commit: d696a61413b405a13bbe04f31e6f4531a426fee7

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
