Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456816995A3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:24:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98CE6E71;
	Thu, 16 Feb 2023 14:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98CE6E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676553875;
	bh=zZ4rQNc8mPRkeZ0/8qJ2pJ5hmbNsF1z0HeQ280pKM6E=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QFq/wTYJZl30giX6ICZnlLzZXCQXJTCWGM9IjrILULaoccQ5YC722AM4bZhRlKW2y
	 PPZcZhXX+JqkU4bPPsi3hp4YLL3HBhZh+v2xYhKE21wlWBHLl9n550ntRWLsiJ6AWS
	 J2lSemavL24sQPONTcagNKiXXOJKIKp3+VKEydhs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 213F8F800E4;
	Thu, 16 Feb 2023 14:23:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5687F80171; Thu, 16 Feb 2023 14:23:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17D3AF800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D3AF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZUpV/cal
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3253BB827FA;
	Thu, 16 Feb 2023 13:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9643C433D2;
	Thu, 16 Feb 2023 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676553815;
	bh=zZ4rQNc8mPRkeZ0/8qJ2pJ5hmbNsF1z0HeQ280pKM6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZUpV/cal3CvprEvJANGAsyd4jjRMoj2iuceMPIdBzVvrvACNFdGcn7m9r7o9P+lbP
	 j2NdFaCR6W9mlUAa9529aKRKl5210D++z7f2doAAAuWDd6TZ2Tp7N05PaTpNSJYiLI
	 NbBHhn3/yv0yHLlRLV0mQ+tZVCclF5PYujt+jzgX+VOSyhr6PscPj9B2icQvQmBNTM
	 z2iRSqKptCLCSOenFzS/dse6BJwSD4bsumw9EH/spJm9k9/Vtl4OxJZyQMOWlEzGfX
	 BWjdTfauhtM9v+962YbyUCkUge/b8vunBFYUudx49t3PTC3sgR02iaiyNCdrsbnEX3
	 FEfim0Ag+tl/Q==
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
In-Reply-To: <20230215101045.21456-1-David.Rau.opensource@dm.renesas.com>
References: <20230215101045.21456-1-David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the IRQ process to increase the
 stability
Message-Id: <167655381355.3676286.5725030746001526408.b4-ty@kernel.org>
Date: Thu, 16 Feb 2023 13:23:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: KNMA6WQE3OZJEE7CWJPSXIGZCKQ5P2UE
X-Message-ID-Hash: KNMA6WQE3OZJEE7CWJPSXIGZCKQ5P2UE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNMA6WQE3OZJEE7CWJPSXIGZCKQ5P2UE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Feb 2023 10:10:45 +0000, David Rau wrote:
> Remove the sleep control in IRQ thread
> and create an individual task to handel it for Jack plug in event.
> 
> This commit improves the control of ground switches in the AAD IRQ.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Improve the IRQ process to increase the stability
      commit: 7fde88eda855952766a74026c181c6270b3392fc

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

