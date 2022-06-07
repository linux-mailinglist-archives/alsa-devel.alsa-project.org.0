Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364853FC73
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74101A94;
	Tue,  7 Jun 2022 12:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74101A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599261;
	bh=emluHOkPwOdLw8g48Pp6E94iAZ6WdkH2R/ZMnEXLDN4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6PjBlZJ5bvUnhO3HxDds0sl8WLSeDNSJamZ3iHANXNVwHUQo/APJIv9VMOovtUWN
	 Ao0nUN/AuYGgk6qo0PG+iUWObCb2FvAz879B7JdD2gmMkw3QgX50UAQSg+LT/N9Nj+
	 NBo6OV91gukdQjyamKmmTEwUa6Lns0SBrPOe4WWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6AD9F80604;
	Tue,  7 Jun 2022 12:46:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C8FEF805FD; Tue,  7 Jun 2022 12:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE981F805F2
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE981F805F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="leVRtPee"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB4FE61555;
 Tue,  7 Jun 2022 10:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71F0C34115;
 Tue,  7 Jun 2022 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598779;
 bh=emluHOkPwOdLw8g48Pp6E94iAZ6WdkH2R/ZMnEXLDN4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=leVRtPeeYnr6n+ecJ6sQENmeK3bEuqlU6v+aaQJlupT7CG0TrqN40cPU28qASe+QW
 MzZ1BDVE7RZpiW0IqLiWSk1gO7lr+1HD+/fhuIv7N+p6P5sEfE3r8EAjD6kmoChh04
 3IP2AvQ/AjIdsO/2yS5ckymGTYxcofEnod6wp5rvIHY6/WlBPYJKGPj8avAl5NrDeX
 nYYbEtyCHglO8g5+bc8Ecc/QclMHtZI4nDsxBeDXERV5rjl28DyBEC8nLMIbJHZvM4
 nET0OJgNQUWLhiQi23z8vCQih2zPxQnmZybZMa3mGM+enPqdymai9pCQ/Xnue6YCcP
 9AGfm1OkYOOqA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7zflk3n.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7zflk3n.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: rename
 asoc_simple_init_dai_link_params() to asoc_simple_init_for_codec2codec()
Message-Id: <165459877847.301808.3073980786136356007.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Mon, 30 May 2022 04:28:44 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit 95cfc0a0aaf5752071 ("ASoC: simple-card: Add support for
> codec2codec DAI links") added the function
> asoc_simple_init_dai_link_params() to initialize dai_link "params".
> It is very straight naming, but difficult to noticed that it is for
> Codec2Codec support. Handling Codec2Codec is one of very tricky part
> on ALSA SoC, thus it is very important to clarify it. This patch
> renames the function name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: rename asoc_simple_init_dai_link_params() to asoc_simple_init_for_codec2codec()
      commit: ff31753fcb061b90bd8c356d5b27a6eb5f8ade15

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
