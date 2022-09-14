Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC95B86FD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 13:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BECB18A0;
	Wed, 14 Sep 2022 13:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BECB18A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663153607;
	bh=+C1DrCX2EMubCZOr89vFTbgchz4May6+jHiY4U8kULs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIAlaX4Zf2f81nLqqT3vH5C/d6oOmAo/e7feKAc/XxO+nvhzqXHLtOI0R/sn5dxLN
	 MwnztLFB4puCLV8omXik1E5aLG1P3U76JwgT6L9h1+63QDdTGr+b+vMj4K0i1cWy9K
	 QP4/IX7aEYdSr6dWYlBV9Km7llnfn/Qm2Mczv2QE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0E2F800C0;
	Wed, 14 Sep 2022 13:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0FC3F800C0; Wed, 14 Sep 2022 13:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2031F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 13:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2031F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ebX4sk2D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A846B819DC;
 Wed, 14 Sep 2022 11:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669ECC433C1;
 Wed, 14 Sep 2022 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663153538;
 bh=+C1DrCX2EMubCZOr89vFTbgchz4May6+jHiY4U8kULs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ebX4sk2D7mIy7arbkB3y6MYmTeABmHuOKb2VHPqHU3kAtUplTNPnojmCyK6Pv9Lht
 niwyIuE9U85uW9SZOK/YsJfeRNg0bwNUSH3W2p3jfy51Vj7qrq6zcpsslltCWitsjH
 fgMSC5SkIocxEz873GYqAxrwX7E27ZCcg41ZwpQB7ILTpgptlp/ugsMcLhQx5Fh6nf
 Ex2JZkgZoP93lKJ3CIaCfyW4VeoqXJ3qdlvAkdYaIsffU/oUTalZmxroO7+11KREcn
 yifTjDKr7RYoBuOzhT927f9KGqfYcllGE9uJw1aqlMC9LpWxGH9QjvauZBQKbqi7Kk
 c6FfT+0z6TjJg==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20220913231706.516849-1-festevam@gmail.com>
References: <20220913231706.516849-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: tas2562: Propagate the error in tas2562_dac_event()
Message-Id: <166315353718.340317.15239860181186565813.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 12:05:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
Cc: povik+lin@cutebit.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@denx.de>
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

On Tue, 13 Sep 2022 20:17:06 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 2848d34c3ba1 ("ASoC: tas2562: Fix mute/unmute") the
> following build warning is seen:
> 
> sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2562: Propagate the error in tas2562_dac_event()
      commit: 3e9a838634b181b5775d3459f05c2055d24d080a

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
