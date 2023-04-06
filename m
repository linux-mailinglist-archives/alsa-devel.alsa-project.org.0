Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B276D9BAE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C050EF3;
	Thu,  6 Apr 2023 17:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C050EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680793530;
	bh=33vqUxRIpdpTIDv6WnFlP2Rag1D22LhV1VRJ3Uo6ICk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FAx6ImOlUPRvW6XYWK0rCL3uLXIvqXArFc0Q6lW8dje3AgQ2cuD6heYx//ArcCxNc
	 Yh69OjdHjGgb7gjtd+ttJzVTOZQNBLZjV/ypGMOIFfnYA9ElIVUS3PcyxpN+AWWrzz
	 ssDLzDYc6CRU1oh8jXXyi91LmNIRHY5hIwDbLU5s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FCCF8052D;
	Thu,  6 Apr 2023 17:03:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1F85F8052E; Thu,  6 Apr 2023 17:03:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F8BDF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F8BDF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VIYZGmAU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5A2160EC7;
	Thu,  6 Apr 2023 15:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1495EC433D2;
	Thu,  6 Apr 2023 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680793415;
	bh=33vqUxRIpdpTIDv6WnFlP2Rag1D22LhV1VRJ3Uo6ICk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VIYZGmAUkPRAdufaC71TJHIapDebSn7OCiJFDqbFd32T6Dz5psrOzmWU2VSrtRU3O
	 7/JUJ3SydHe0UkQe5jiKBwNMONgmQ+sV9JXK83wO9526gRBOfUMi0DSrfRojUq/CVa
	 9XaiBSHmJeDUXsRny7Lr2SdsGhreFs1/wQGY7+kdho45vDd+hhfmccmhfkyDeuQDS3
	 sRkuYotI58OpG/RlSbM+jIEa89yORzVSLxiulv85/wuEQvahAT79aZLraqJD+IjIGf
	 nhjpMM7E2mHsKtcMxSf0ZuwqCQxpE1sxHGZmKXdQMBhZj7eIPkPiiJScx6U9Ypi9Cz
	 7MtMuWtubRBMQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20230406085535.52002-1-shumingf@realtek.com>
References: <20230406085535.52002-1-shumingf@realtek.com>
Subject: Re: [PATCH v4] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic
 topology
Message-Id: <168079341266.66286.15067359243978973036.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 16:03:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: SXRWTHVWGSPVZVSSOYQGFK3BAFRLOZO7
X-Message-ID-Hash: SXRWTHVWGSPVZVSSOYQGFK3BAFRLOZO7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com, bard.liao@intel.com, Yijun.Shen@dell.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXRWTHVWGSPVZVSSOYQGFK3BAFRLOZO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 16:55:35 +0800, shumingf@realtek.com wrote:
> This is the initial codec driver for rt712 SDCA (Mic topology).
> The host should connect with rt712 SdW2 interface.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic topology
      commit: 63a511284c9ea72696a5dd0a2d2721bdef19f774

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

