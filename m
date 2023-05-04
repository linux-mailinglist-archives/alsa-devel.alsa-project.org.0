Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70A6F63ED
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 06:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF34174A;
	Thu,  4 May 2023 06:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF34174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683173612;
	bh=b54NE5I89A3lhMM6mWdX+VclYU5RjljTIR3b1SP852c=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SJGwaAIkC4Cv/iiK+HJkwuDsfSHoxOm4ftCU1eF8yR8BfzFcLVMCKxLP4/nVDmbwl
	 u+BtM9Wo+l1PJAFzRheYXgJ5Z4jE5SflUstNTFAtV5Xc6ihszcHInfVFgqprm4SSQy
	 /LLbA//JF92GE2LJb9nY/5Kd6GshHfoliptJdxrs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31934F8051B;
	Thu,  4 May 2023 06:11:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FA0AF804B1; Thu,  4 May 2023 06:11:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B9FDF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 06:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B9FDF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j4/qpF9Q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A95063172;
	Thu,  4 May 2023 04:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912A1C4339B;
	Thu,  4 May 2023 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683173453;
	bh=b54NE5I89A3lhMM6mWdX+VclYU5RjljTIR3b1SP852c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j4/qpF9QvFt/ftaRBpo7fKmiW8ABOcsTWxVZdzmcI4IgcXlmW46wWp+xtsuCIqZlM
	 uVbAXd/kF2n5ZRURAsrIPZ3ys5vP+P79kInBFjWO/iAhz6EwSixDK8jTmaqmno6tgS
	 EFQAq+vaSGwOeu7nEX5UUNScAMW7dkitLLfH4xtNwzpUPpr2rnGr2SlNvPIj10GEP7
	 XWHALs6wHqYPhqPOOHym02kinLX+TuUQBQs59T9SFkjuDngf2fyMgPd2ewIv7XSzlD
	 7siwikcrM662/fCNOxEQzcdoooo00wY3P3g4+nXa6yaY7Z7adGMHvBs2nm4erDUcXN
	 hQLWuVbg/88/g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Andrey Rakhmatullin <wrar@wrar.name>
In-Reply-To: <20230501185134.34591-1-wrar@wrar.name>
References: <20230501185134.34591-1-wrar@wrar.name>
Subject: Re: [PATCH] ASoC: amd: yc: Add Asus VivoBook Pro 14 OLED M6400RC
 to the quirks list for acp6x
Message-Id: <168317345231.155442.10736020348986933324.b4-ty@kernel.org>
Date: Thu, 04 May 2023 13:10:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: GPV3GJM4EZE72CSYLHSORTNO4TLEBHN7
X-Message-ID-Hash: GPV3GJM4EZE72CSYLHSORTNO4TLEBHN7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPV3GJM4EZE72CSYLHSORTNO4TLEBHN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 May 2023 22:51:34 +0400, Andrey Rakhmatullin wrote:
> This is needed (and enough) to get the internal mic visible and working.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Asus VivoBook Pro 14 OLED M6400RC to the quirks list for acp6x
      commit: 4a1b5bc73e9ce8373d50fdb8f74badd2b4bf324e

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

