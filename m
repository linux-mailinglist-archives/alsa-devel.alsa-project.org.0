Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF291C47A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 19:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572FE22A5;
	Fri, 28 Jun 2024 19:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572FE22A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719594466;
	bh=e27XHNkDKL+1iM5Es0V0iOZAvaQKSuK2qw+eY90lBwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L8lJ/YOPB1H00YUL0ZyAwF8FQXz6d8x4/PINifNR0OUYkksYWKKiTk/KFJ8hetfdv
	 qWo4ILkxLrtMsaKdRH+gWmrDNdLVJxV/5h4ihPKVYPwfv89kd31WSlsbzdoaOoQbXm
	 XHJGqzFQM5nAz+6sXJEKT/egFJ8+wv2X5dDps/sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EB7BF805B2; Fri, 28 Jun 2024 19:07:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B17DF805B0;
	Fri, 28 Jun 2024 19:07:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F8BF80495; Fri, 28 Jun 2024 19:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66D90F800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 19:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D90F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mL08k6Gc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9394062227;
	Fri, 28 Jun 2024 17:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A63EC2BD10;
	Fri, 28 Jun 2024 17:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719594419;
	bh=e27XHNkDKL+1iM5Es0V0iOZAvaQKSuK2qw+eY90lBwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mL08k6GcCT+4je9d6lZuRBvtQ8Wz3szpKS6lcx8BrLMPCG8jVTC3H/ibrV5cMoasO
	 Xuevxmm3VBZRSBdwc4i0E6pd/HDUXUSBf2IQXxK983cGXRUsWP2flbuNon+hLk9in4
	 XBJYx3zTyfkn2gjqTRmoWI72W6DiRwGgA3iSe3mrYwO8LXPyeyU+JTqXzh43IH1vIa
	 DerwazdUZKt+fjxvp06Ul3pA4ev7QAEDf4mLHoImEvNj5Fruo48HTdTHe6fOxpUMGJ
	 99TvEMyysd51Mc1jlgADKaknkG/5Zm61VwM1k937zF5mUjTtNYsQ1JCnPRcyt5IzSC
	 ih70G8rwe0vew==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240628120130.2015665-1-jbrunet@baylibre.com>
References: <20240628120130.2015665-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: soc-utils: allow sample rate up to 768kHz for
 the dummy dai
Message-Id: <171959441829.130075.12252644545432851916.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 18:06:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 54S7Z2AFAJOB2BGR6XJ2DPRWVDPLCLNN
X-Message-ID-Hash: 54S7Z2AFAJOB2BGR6XJ2DPRWVDPLCLNN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54S7Z2AFAJOB2BGR6XJ2DPRWVDPLCLNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Jun 2024 14:01:29 +0200, Jerome Brunet wrote:
> The dummy DAI should allow any (reasonable) rates possible.
> Make the rate continuous for dummy and set range from 5512Hz to 768kHz
> 
> The change is mostly cosmetic as dummy is skipped when setting
> the hwparams.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-utils: allow sample rate up to 768kHz for the dummy dai
      commit: 4adf454ff62883ee64b0b9818b951f34aa078d5a

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

