Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79272E888
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2386EE93;
	Tue, 13 Jun 2023 18:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2386EE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686673829;
	bh=b/2NAxVPLjyTsQ54uD0b0Z8iQWQQ+kB19gD3AtEcAHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RU2Ndwd344UpNtD+UdXtMGGkQoab66WQtfX2+IO88U66ho1B5oD6hT7c1T5cuHguU
	 MM0KS8h4P9wD8iALfJ9bGIjqa656U92JIP/JFAhgfi3r9m2EvcHNyldZw27d6OCwed
	 kmp27ZfRCW+Bgjwo4nPsxfWpn2YRGUlUeMLOUCmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43AA3F8025E; Tue, 13 Jun 2023 18:29:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DF4F800ED;
	Tue, 13 Jun 2023 18:29:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85318F80149; Tue, 13 Jun 2023 18:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A5FEF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A5FEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dsgD/DjZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E61C0615D4;
	Tue, 13 Jun 2023 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A638C433F0;
	Tue, 13 Jun 2023 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686673762;
	bh=b/2NAxVPLjyTsQ54uD0b0Z8iQWQQ+kB19gD3AtEcAHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dsgD/DjZ8eOnZexUeVMG5J6CXAeEnUtf/IgstYOUe4zr+HygMtZsFXCprtm8lpyb9
	 KToIEjNthxomvWRhnHL2IFVWBAXK4jDC7l9yJ0hZA8pCJL6gGeNDqtmG+9joq4XVvu
	 ovi9WDleofwL35InbpNF13z749MNQeUOqHV8BWZt66TILdbNMDHrbhbr0Dl4F74AGg
	 pk6vMTLcoNQz2rxfk6L4Qxs0qPQcI5F5wdnLo3zF03mBlj6a3++P7/ZPAD3LtrySdk
	 X2a47haqxWkxSipqfgM1KVRdZm3b2TXtxq1zbbqcoVpo16Make33N/itU1dCEZtvgA
	 mjQqph3gie4pg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
In-Reply-To: <20230613093453.13927-1-jonathanh@nvidia.com>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
Message-Id: <168667376026.116493.5051777673041292813.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:29:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: KQLV5X7DECGRY7O5BLFDKO2VMV36IBBM
X-Message-ID-Hash: KQLV5X7DECGRY7O5BLFDKO2VMV36IBBM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQLV5X7DECGRY7O5BLFDKO2VMV36IBBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 10:34:53 +0100, Jon Hunter wrote:
> Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
> the PCM wait_time calculations and in doing so reduced the calculated
> wait_time. This exposed an issue with the Tegra Master Volume Control
> (MVC) device where the reduced wait_time caused the MVC to fail. For now
> fix this by setting the default wait_time for Tegra to be 500ms.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix Master Volume Control
      commit: f9fd804aa0a36f15a35ca070ec4c52650876cc29

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

