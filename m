Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBBD72082A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 19:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C4E207;
	Fri,  2 Jun 2023 19:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C4E207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685725866;
	bh=FFfbYJAeWVlemuy55YRw4ykuDglzPT/JaLEPqPbT6qQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n0YahV07AD5Fk+Z927Bhcn/9Q7R89e6Nw14uSU9iIa0f10l4QAqKa3xC+uh1yevun
	 jxG0Sj/RTNetiTWges5HmZadZcub8IvLAYzjeBpceihQCdZ3VXg9k+1+XIkGgCupBW
	 pnmaByLeYxMsbpufVRPPuWenvNC74pxfxH/KGCvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C661F804DA; Fri,  2 Jun 2023 19:10:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ED44F80132;
	Fri,  2 Jun 2023 19:10:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 936E6F8016B; Fri,  2 Jun 2023 19:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11CA1F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 19:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11CA1F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=coreVa5A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACE9661789;
	Fri,  2 Jun 2023 17:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACDAC433D2;
	Fri,  2 Jun 2023 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685725801;
	bh=FFfbYJAeWVlemuy55YRw4ykuDglzPT/JaLEPqPbT6qQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=coreVa5AwxkjU4f992ggWjolW7fV/ntma+BDJMVAnLt8XKsXaJ/Jre5aYaA0WaLRW
	 TVIv5LKzC5y518KFJ7VFxI+x7SP5HLfSY72ToqC3eFc/C3do0nIHGd4QWedjB4ad1G
	 wjtlzoZImKq9iaIWLMUt5gXBaIYWGX8d9w3rthF0ItGy+Nng8LCNpjNBPHop8B6VEM
	 ACSTKSuj/7L1kNkbW3zdwet6isLENysj+NEZtLjvSUxcLhNjpZQOQgRAKPeqZm7h00
	 5DFhGs/D1TGuvezU2/a+OWvJTRP2EtoqsySXgPV8RcozZQAlX7QZz68Z/y0wIlsPjD
	 JCGdgWaERJ1Bg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230530103012.3448838-1-chancel.liu@nxp.com>
References: <20230530103012.3448838-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable BCI bit if SAI works on
 synchronous mode with BYP asserted
Message-Id: <168572579859.93025.4040527745876774020.b4-ty@kernel.org>
Date: Fri, 02 Jun 2023 18:09:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: LK4MEJVPI3HFXY25LNO3I7BZ2IQIUPDD
X-Message-ID-Hash: LK4MEJVPI3HFXY25LNO3I7BZ2IQIUPDD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LK4MEJVPI3HFXY25LNO3I7BZ2IQIUPDD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 May 2023 18:30:12 +0800, Chancel Liu wrote:
> There's an issue on SAI synchronous mode that TX/RX side can't get BCLK
> from RX/TX it sync with if BYP bit is asserted. It's a workaround to
> fix it that enable SION of IOMUX pad control and assert BCI.
> 
> For example if TX sync with RX which means both TX and RX are using clk
> form RX and BYP=1. TX can get BCLK only if the following two conditions
> are valid:
> 1. SION of RX BCLK IOMUX pad is set to 1
> 2. BCI of TX is set to 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Enable BCI bit if SAI works on synchronous mode with BYP asserted
      commit: 32cf0046a652116d6a216d575f3049a9ff9dd80d

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

