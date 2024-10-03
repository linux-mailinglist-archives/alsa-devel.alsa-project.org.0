Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4298F188
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 16:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0670584D;
	Thu,  3 Oct 2024 16:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0670584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727966103;
	bh=nnPP8bWPDyT8v9Qdnjq4i8N7ZoiPh70nuxYZUnnynwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WpRKLtuhdBOu4EjTVAwK9lFW4L+3EM46rEZcplphO6qLf0vOQxTYjYWr/UYSc+G8x
	 kt56WqY/cax/ksF9RJUGThnw0qA7Jnn+1fOAfzVpM+zqGLY6l0VjBCSe3l1GRi45pk
	 kGLkiYabppPIkbVNBLAXgY/NDuOcnuLA7u84uJAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B924F805BA; Thu,  3 Oct 2024 16:34:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4346FF805A9;
	Thu,  3 Oct 2024 16:34:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9655F80517; Thu,  3 Oct 2024 16:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61F15F80107
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 16:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F15F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ELXU7+SB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6D645C5B44;
	Thu,  3 Oct 2024 14:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0243FC4CEC5;
	Thu,  3 Oct 2024 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727966061;
	bh=nnPP8bWPDyT8v9Qdnjq4i8N7ZoiPh70nuxYZUnnynwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ELXU7+SBjMYGEban/p/w0N/aEX8UOeiARoBC1YJXJHmGCn8sdBPBE9ykH8ADKOfW5
	 VPMiI4iDJmcLk7RvNG7Hk9cQUBPIk+VwRYcG8+7mXlt49Hg3oWqC5GDK3QuH2Subu9
	 vnIJP9nhTRpXG97J3tMz4vftfUf2DIILt4x7Xw+VcoueGTvJC2uAroPUfRiZWC+vcv
	 JsNB4+7sOZvwflnmXzx/DynAA0Ho3KzDjpO7qR0N+20dEYZajqkIJ8QnlHcRZzsryI
	 zEbKgAB90WjT6jahRK2cWX2GWCxJ0vE2/iSUey/8vbL2DSr4o2twdh7FED+43YJZ2c
	 dCq03J0R3H79g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20241002151436.43684-1-masahiroy@kernel.org>
References: <20241002151436.43684-1-masahiroy@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd9335: remove unnecessary
 MODULE_ALIAS()
Message-Id: <172796605971.115923.16568830906477882779.b4-ty@kernel.org>
Date: Thu, 03 Oct 2024 15:34:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
Message-ID-Hash: BYSQWOBYE34GCQLIXDIDPQOWPVWPXCIC
X-Message-ID-Hash: BYSQWOBYE34GCQLIXDIDPQOWPVWPXCIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYSQWOBYE34GCQLIXDIDPQOWPVWPXCIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Oct 2024 00:14:34 +0900, Masahiro Yamada wrote:
> Since commit b4b818305578 ("slimbus: generate MODULE_ALIAS() from
> MODULE_DEVICE_TABLE()"), modpost automatically generates MODULE_ALIAS()
> from MODULE_DEVICE_TABLE(slim, ).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd9335: remove unnecessary MODULE_ALIAS()
      commit: 6061483d7141db3a805f8660eae23805af02d544

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

