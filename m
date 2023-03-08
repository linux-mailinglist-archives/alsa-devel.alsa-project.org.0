Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8006B0A1D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3705183E;
	Wed,  8 Mar 2023 14:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3705183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283762;
	bh=XZ3gjffanwa0YmUFZJ5T+iAzYG/1HibpIUh4D9E5AZw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hkl/NBxsL9wl/GS5SrMKk2smKA5v2EBqD/NHmhDZdrhEM1XO4vSbcrDIfRWTy1Fo/
	 u0MVcdMsH9lmov5eb9qSZKMr4RMkSzeepiKd6TSgRptAlTsibHrRy0SUOMXvidBX6q
	 I4Hns3RvRvAD34s5WuxQWPn6hoYB5X+WFscGogoo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 032B5F8056F;
	Wed,  8 Mar 2023 14:53:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82B7F80534; Wed,  8 Mar 2023 14:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C0D5F8052E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0D5F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ACk+QOMN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C182A6181B;
	Wed,  8 Mar 2023 13:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5225C433EF;
	Wed,  8 Mar 2023 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283562;
	bh=XZ3gjffanwa0YmUFZJ5T+iAzYG/1HibpIUh4D9E5AZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ACk+QOMNfbaD+4IHyAQlkCB5OpKArCoR0Vdmbr1UdGU3P0xBKRqsiBq8cafxQMCfW
	 mDIdVxDFff6Dw9UMOn4Q4ooyG4mbXywOwQzfytYZHBFiDNxQN+0JduxgjVufVS2rTE
	 F+ZJI82wCpAjOAr5T/YlEGsb2rOpSa8twsY5IGc+57G7Y6XNU7A76E+Tp8YPQNiDJA
	 5AWL4ipODny4WTIWmkXRmCvbzSMeTaqT2goFX1/OCsTQwChQVYA7e8oKmb+T80w1Yi
	 nWn3R3PBmy5Kxf5k6xX1SgWrMIn0FKtU2LulswD5dsUNlOao6GfkFY8RikSYaRv9mt
	 9bEmZBnVRvCUg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307095453.3719-1-peter.ujfalusi@linux.intel.com>
References: <20230307095453.3719-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-dsp: harden D0i3 programming
 sequence
Message-Id: <167828356052.31859.21282240398977451.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: BD3FPQZLGULB3KIJF4OJ7PKOAL2EGT73
X-Message-ID-Hash: BD3FPQZLGULB3KIJF4OJ7PKOAL2EGT73
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BD3FPQZLGULB3KIJF4OJ7PKOAL2EGT73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 11:54:52 +0200, Peter Ujfalusi wrote:
> Add delay between set and wait command according to hardware programming
> sequence. Also add debug log to detect error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-dsp: harden D0i3 programming sequence
      commit: 52a55779ed14792a150421339664193d6eb8e036

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

