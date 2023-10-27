Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFF7DA3CB
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 00:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A1CDEB;
	Sat, 28 Oct 2023 00:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A1CDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698447393;
	bh=AAbhixexRBgU2mP2uZA4N/fZc+2gBeKHSi49XtAGO/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akVjdZjSlL7iKbxJMrrJ7Q42ee1420V+0npfFuujaH6zJ/iyD5Y7eJ2cqBWJTUQmk
	 FEDVLqPt87cGrGFQ7LkBks2kRGD7mvlOFcwJjRIJna4sKCgSCcWKMYP83q4ufsRxxF
	 o2f8KYxzhUrNlgLKVS7x4kAXWpVtIFetawTLXXEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58DFFF80558; Sat, 28 Oct 2023 00:55:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9945F80224;
	Sat, 28 Oct 2023 00:55:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16928F8020D; Sat, 28 Oct 2023 00:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC9ECF8019B
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 00:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC9ECF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T6/P/dPK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 885D9B81E14;
	Fri, 27 Oct 2023 22:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C542C433C7;
	Fri, 27 Oct 2023 22:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698447292;
	bh=AAbhixexRBgU2mP2uZA4N/fZc+2gBeKHSi49XtAGO/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T6/P/dPKeM2YOJtS8zCh/In1bSRqhzUao/JdNVvEkOMOHiijogmKsP2zx5niseyUV
	 qnbxRyGLldv+aUr4aGbgtlCPQe7RELV7zDG3iMbsmg0WNzgKNLLKu5EqCd12BE2XOm
	 jKC5EKfW26gr6i15F6NI0E5hC7t4rKDYeDMw5dwHV2t8dJRmjE7/5d8F0ntvgXF3Ba
	 dSNA7DVJn2ZSfpTcprU5j/POvmWwc50FTnK2U+YH3lSo9/SPBtsu1PjY7UBYDobNo8
	 5++QIBUpmuyuCGpfiSrM3KXQudAIAbn6c58RVWix0mcMvZKEl0qKMAMezxGQ6s1RHZ
	 beDSGQQtFHaZQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: johan@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-Id: <169844729083.3013518.3783480503939987434.b4-ty@kernel.org>
Date: Fri, 27 Oct 2023 23:54:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: CCHTKYJSRXTX3XHPJJMZAMPZ3E5ZPRMG
X-Message-ID-Hash: CCHTKYJSRXTX3XHPJJMZAMPZ3E5ZPRMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCHTKYJSRXTX3XHPJJMZAMPZ3E5ZPRMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Oct 2023 11:57:45 +0100, Srinivas Kandagatla wrote:
> Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> to accumlate DC when ports are active but without any data streams.
> There are multiple places in the current setup, where this could happen
> in both startup as well as shutdown path.
> 
> This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
> generic code do the mute/unmute on trigger.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-dai: add flag to mute and unmute stream during trigger
      commit: f0220575e65abe09c09cd17826a3cdea76e8d58f
[2/2] ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
      commit: 805ce81826c896dd3c351a32814b28557f9edf54

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

