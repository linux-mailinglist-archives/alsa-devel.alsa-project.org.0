Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E597C7502
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 19:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08E4836;
	Thu, 12 Oct 2023 19:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08E4836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697132655;
	bh=3Rqje43f72angmkB/9A+IImplnlSOfXYr0ju7Rq6x6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SRKGDoO1tExC9/qxzw5efF8ThUT0nRl4jmdNsyWzlQZftekASFYcBFmI3pC39/I9G
	 FJqaMAbZjyQdJlR/MvVUNFF1mO1QnjaioGkWon/A4jy6k2JjEQjocZbjWjVJ37vQlw
	 +iFSlX65hz6YpFXwo71JvPSOk3QBE/cUjdIVzn88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F51CF80563; Thu, 12 Oct 2023 19:42:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FB5F802E8;
	Thu, 12 Oct 2023 19:42:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E5D4F802BE; Thu, 12 Oct 2023 19:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84B54F80130
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 19:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B54F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b6fHFi3i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4F20DB825B8;
	Thu, 12 Oct 2023 17:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06485C433C7;
	Thu, 12 Oct 2023 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697132558;
	bh=3Rqje43f72angmkB/9A+IImplnlSOfXYr0ju7Rq6x6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b6fHFi3iY/oWT/KPevXnxEjuGPA8waGRRJYOLr45VcflxJfoMzMaTsANkJgcLxUzJ
	 62lbBJ+rWh1H7G+0VlOVqGMZWXowgBx1jqC4dfkk1rdl1nX5jfH9IjaiWJm18UCast
	 JiIr6k/ihu8WpEYusBGKDgKJ0HdyGJGNrF4d1jg/fuURQg2gLQGD35390RxUEjRrXs
	 tkk6EmsC77g/25L7V1X7vIrzVPILbH3gloSqdMEzB5IFT7hDqv77MVmKc+2bKrkMEw
	 tByn5g00wdvCJ98JOMsQVtKboa/Lq3Fg/aZjIpW61RjHOjTBWZPUbcyvhdro4IGbFy
	 fFoIq5Hwu1jfA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, Nathan Chancellor <nathan@kernel.org>
Cc: lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 ndesaulniers@google.com, trix@redhat.com, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
In-Reply-To: 
 <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
References: 
 <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: Fix -Wuninitialized in
 tegra210_amx_platform_probe()
Message-Id: <169713255573.343479.16669481673546969427.b4-ty@kernel.org>
Date: Thu, 12 Oct 2023 18:42:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 3Y342JYRFXLK2LXZSX3H76XYWAKPX2EW
X-Message-ID-Hash: 3Y342JYRFXLK2LXZSX3H76XYWAKPX2EW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Y342JYRFXLK2LXZSX3H76XYWAKPX2EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Oct 2023 13:21:51 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   sound/soc/tegra/tegra210_amx.c:553:10: error: variable 'soc_data' is uninitialized when used here [-Werror,-Wuninitialized]
>     553 |                                             soc_data->regmap_conf);
>         |                                             ^~~~~~~~
> 
> A refactoring removed the initialization of this variable but its use
> was not updated. Use the soc_data value in the amx variable to resolve
> the warning and remove the soc_data variable, as it is now entirely
> unused.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix -Wuninitialized in tegra210_amx_platform_probe()
      commit: 41cb1126bed152f7679417834ad7ea39f2252dfb

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

