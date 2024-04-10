Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C28A018B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 22:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320D92999;
	Wed, 10 Apr 2024 22:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320D92999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712782588;
	bh=0WYBVqUQGlOFYyjVjE2osoofygiFLNbiCtHVQPVQu4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kIzNOKYQdfwwB9+ul4mToLRksMb03uyZnKZ5e6eg6qnvPCNEKISRgYiEBy2icMV73
	 Arl7HXZ4z8e7jM8S+2AhAfiKPj79m+DU/+qB5FSCsb5aaf++uWkFXhPu7xOg1s1DCV
	 kDucua5QhB2DkooNt37b6fVgGjRWI648A0mriJHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1B4BF805B2; Wed, 10 Apr 2024 22:55:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D9EDF80423;
	Wed, 10 Apr 2024 22:55:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28AF1F8028B; Wed, 10 Apr 2024 22:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88ADBF800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 22:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88ADBF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TE/fwInJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0608C61EDB;
	Wed, 10 Apr 2024 20:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92322C43390;
	Wed, 10 Apr 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712782540;
	bh=0WYBVqUQGlOFYyjVjE2osoofygiFLNbiCtHVQPVQu4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TE/fwInJJNLo+8+zEovfg9Yn56tMOFWPy/MhjARmjwfHXzKNwCFJmIia2V4/0WkiH
	 DuWBqTZs/AodA4+xnh4Pqmfovx2BV7buW3XpL30p61A/0SC1YjSqEBNTbQDgwIiLEp
	 3M/JEpf6fABvQsdUJfevfHgNNdksq7OtU2rzQg0+HJlblCC8dEB6wJ+xG3Qft8+PqI
	 yyTvx7HyH69REQMeyeAroYr27aPUpKr90XtP7aD5aBH4TwCS+tFbOIQbpD1XsdDbCe
	 9aprvXG6JZnzfRR25Zen+cFEOlS+Uv7ZO8JlJLMG6Mtrsy5LAdI/3yE/Pbkk81iX4C
	 LMwqK1U89D31w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240410160833.20837-1-rf@opensource.cirrus.com>
References: <20240410160833.20837-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Include array_size.h
Message-Id: <171278253931.69181.5426734835911028247.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 21:55:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: PFGOLDYPIO4P7UYLNAUSME5CHK6WSCGE
X-Message-ID-Hash: PFGOLDYPIO4P7UYLNAUSME5CHK6WSCGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFGOLDYPIO4P7UYLNAUSME5CHK6WSCGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Apr 2024 17:08:33 +0100, Richard Fitzgerald wrote:
> Explicitly #include array_size.h for the source files that use
> ARRAY_SIZE().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Include array_size.h
      commit: 28d31ffac3d3ef6d60c4eb392a47d5e19dbb15e8

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

