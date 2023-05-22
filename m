Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625670C1E7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22C2A4D;
	Mon, 22 May 2023 17:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22C2A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767877;
	bh=ZzCrfWXY7FxJ0s2FjGH0TL7QTy+9v4JSvkeEVCTndqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q1ktYjRK3zpPOKKEl5GcoVolhs7nnQWoYWihv9/B3/hK68BR7Zu8Jyqps3gmFe4/d
	 ufvCvDugZYOTPqefy5zlqg9mDuqmsqivHzZe9mKs9eZxnmfNR+j3SDhN1O91fsXCIS
	 jwgvzGGdUNLAquX1LHeFdcOhxbTSlv0vJwUsw4ls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24490F805C2; Mon, 22 May 2023 17:02:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8449FF805B3;
	Mon, 22 May 2023 17:02:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCF88F8058C; Mon, 22 May 2023 17:01:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF199F80549
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF199F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tfgobSaI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF9BE623CA;
	Mon, 22 May 2023 15:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD9DC433EF;
	Mon, 22 May 2023 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767712;
	bh=ZzCrfWXY7FxJ0s2FjGH0TL7QTy+9v4JSvkeEVCTndqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tfgobSaIOSHpTwW0PLhFpvBjgFoEtYOui1gIFUGOc/WebAOEty04B4Tdk4Iuphk4K
	 /5n/jOVqHJnqaSgXAqUZrZBdzj+ElKXzzMUuSSZIMdo4Ib3YdvDYA4lNlhzQ0p1Bbe
	 O3yO8fN8gg4QSCPNtOnoFe7WfzRVpJR2HPNVR4cycPhhgk63UOMmv4Piv3I+ASwP4e
	 GAcRV/BQUzsKDJuOWn4sUH8l+LnO7JhxPPxmrDPJdOaE1a4UaibOOUaxFNCCGjm0pX
	 8zYLZUMen7s6P8T3Y1zxXIP+0IVBwRXVHmXnNoNzqHdOze/wnMBSXL2rG8fs/Fn0zA
	 AlreJyxRfioVA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: 
 <f538c24ad7b1926478347a03b5b7f0432e195e3b.1684594691.git.christophe.jaillet@wanadoo.fr>
References: 
 <f538c24ad7b1926478347a03b5b7f0432e195e3b.1684594691.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: rt5682s: Use the devm_clk_get_optional() helper
Message-Id: <168476771031.849172.218735201462158916.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: K7NK4XCP3KRRIFWSLNNV5HFEE3ARIDFK
X-Message-ID-Hash: K7NK4XCP3KRRIFWSLNNV5HFEE3ARIDFK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7NK4XCP3KRRIFWSLNNV5HFEE3ARIDFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 16:58:24 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Use the devm_clk_get_optional() helper
      commit: 17cf9faeba463d24e7c497ff8137a8c8414644dc

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

