Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D359A8B9
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 00:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18EF41698;
	Sat, 20 Aug 2022 00:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18EF41698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660949322;
	bh=/6ipmcsaaRQMn187N8aThFgVGWkO8zOtXUtqu8qYFDc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAF/Qy41dwnJ6RdhFMKFdrHwI4o+cGQ/x+/Fn36iMsulltelgJQcMc9YNv+AYAj3t
	 vxxCB45TxVCWhFR1WuPF+w/Tmx7REBr/ieny5syZ7AhJnfjRcTzqFMYKpWYf/WiZaH
	 Rq1Qsn+y9/0egx1rjgG5+yJ/rRYi3G7Czmdd5o7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 818ABF8016C;
	Sat, 20 Aug 2022 00:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC4FF801F7; Sat, 20 Aug 2022 00:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1835F800B5
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 00:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1835F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AfgOuvt7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF290B8280F;
 Fri, 19 Aug 2022 22:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8563C433D7;
 Fri, 19 Aug 2022 22:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660949255;
 bh=/6ipmcsaaRQMn187N8aThFgVGWkO8zOtXUtqu8qYFDc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AfgOuvt7po+HQ1UABnL3AJl49XOdQ28PP9FPw+4hiusHP2+4ACy0JkS9vTc+3E4a3
 2mM+b9gUcebYqXrpYsxIdZsjvRK7205oNe/u2YpZ7v8QMoETjJxgxdzepPvUIuDpbC
 kwbQh+jK0Cn7edLLOnFijL+qz9my/vnqoNa5VttfSj+PCb5aMrxwnMQOz5R8MUL4aN
 mQMB/y+YatZk3NK59zt6QZO7y/bLAYYluIfnPkwSXsanfB32AXCUte1+0PHcQ7HjJd
 5jN63gF7D+1DqDqkCDn9QlSEfCEvt6TWYoyb8+hXPjvvwyPw2l7EGSB0Hf+9/7Omrj
 iGP12I/u6Su2w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
In-Reply-To: <20220818165336.76403-1-povik+lin@cutebit.org>
References: <20220818165336.76403-1-povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: Change handling of unimplemented set_bclk_ratio
Message-Id: <166094925439.19151.638543064587781826.b4-ty@kernel.org>
Date: Fri, 19 Aug 2022 23:47:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 18 Aug 2022 18:53:36 +0200, Martin Povišer wrote:
> If a 'set_bclk_ratio' call is attempted on a DAI not implementing the
> method, make it an -ENOSUPP error instead of -EINVAL. Assume the DAI can
> still be okay with the ratio, just does not care to register a handler.
> 
> No current in-tree users of snd_soc_dai_set_bclk_ratio seem to inspect
> the return value, but -ENOSUPP disables an error print from within the
> common soc_dai_ret return filter. With the new behavior a machine
> driver can do a blanket 'set_bclk_ratio' on all DAIs on a bus, some of
> which may care about the ratio, some of which may not.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Change handling of unimplemented set_bclk_ratio
      commit: ceff365a29aaf275c0cd1bb7edaf57dcf254bc77

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
