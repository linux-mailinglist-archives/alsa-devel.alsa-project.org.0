Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1883DF803
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 00:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55358846;
	Wed,  4 Aug 2021 00:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55358846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628030310;
	bh=LXhoBeBzUTqbh8mDn29zpcWCz1WKAtQq4APb31gMywI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=my6zsfPTX3Eb1+k9LRfsltCjme2BzsrQ1Lre/gsRJE1e25RgYm0MC31Fn+nmiNgIU
	 H+KEti5WjWNk3/QYjtZaq6eG3l52tLOeHekFuL+b/7Bz77hhm7GtiGBLeImALTVijt
	 SmQuL/cCnCiCcnIKqkoQt9oW1IkUpnUd2H+Rr8AQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70230F804E2;
	Wed,  4 Aug 2021 00:36:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D0FF8049E; Wed,  4 Aug 2021 00:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D798F804AB
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 00:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D798F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="as3eYrOE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF24360EBB;
 Tue,  3 Aug 2021 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628030177;
 bh=LXhoBeBzUTqbh8mDn29zpcWCz1WKAtQq4APb31gMywI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=as3eYrOEj1INmODgOgzQjzwKcBchk8y0e9ltc9kyj+McqYMklyah52uvSJzVkphfO
 LUoSTnLuEPZHVtRzlkwbj1+S1WSWo5akkJD2DDfRjM2vJgi//clAjHdaOIedmcRbfi
 0uSSgjq9uj69PV8wPZokDtpENqa1tNSAOVpcvWwbJyjJ+YNpfIOXUC/cbO3lRQrLfo
 YqA5b7lYEjagGVDC1KeG7mMK6Q/jBFdAIHMWRLTigAjzdemM2MZ5fj68ky2k2eKhHq
 dfldOI4LwqfgFkJsej4YEOVClo0+mtvpMOv2ZLy4rW3wYM+4FkYx1svp4khYxejdd6
 e4Bqvpwp7QSQw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
 Colin King <colin.king@canonical.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: rt5514: make array div static const,
 makes object smaller
Date: Tue,  3 Aug 2021 23:35:37 +0100
Message-Id: <162802985540.42099.11025103485301142729.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210801064023.138359-1-colin.king@canonical.com>
References: <20210801064023.138359-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sun, 1 Aug 2021 07:40:23 +0100, Colin King wrote:
> Don't populate the array div on the stack but instead it
> static const. Makes the object code smaller by 48 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   53894   16368     128   70390   112f6 ./sound/soc/codecs/rt5514.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5514: make array div static const, makes object smaller
      commit: 5c8a7efc2fd5eb716c48d7d7ab4295effbc09ba3

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
