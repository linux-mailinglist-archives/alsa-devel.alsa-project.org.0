Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A52703159
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6AF836;
	Mon, 15 May 2023 17:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6AF836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684163918;
	bh=wmpSL0MdWh+LcVPmb7jacOm00D221/YSKrxWkXliuo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B+hJFcbG/dj7EajWYRR3qIKn8PhKr+sOnvRKF7CQFhC7Z+ESbYT3IMDD2/co0+pkN
	 75SRzrpP5WpLmXAjdon1xA1P/MwoETrwNOEW8Ckr4Tu4WnhOAQrt0bAGnbbwHDO9/z
	 lefc+vUSjrK14xEYOlXEM8tKlHwYH4wQQoxnsZiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82556F80552; Mon, 15 May 2023 17:17:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F11AF8055B;
	Mon, 15 May 2023 17:17:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E034F80552; Mon, 15 May 2023 17:17:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85503F80549
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:16:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85503F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XHEo4QtO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19CEC61FC2;
	Mon, 15 May 2023 15:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437DCC433EF;
	Mon, 15 May 2023 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684163816;
	bh=wmpSL0MdWh+LcVPmb7jacOm00D221/YSKrxWkXliuo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XHEo4QtOS79gSfD+SsWr7+WRvXQ2e5XnVahU6gJlOcvS02Fxc2hspjCZ1BP6Y5RhP
	 sAPC8CtsD99Ai5wnmrsnO1c8CbB8bqdczVkCZvOGYu+BjQNjPUB8U5oCCrCXSQrrIn
	 aLAzOKQZUkjfOUjqLWjHN0wSOJAwUvkkWHJ3Qpv52onMAOqY2pzZXBCzAugWE/ebUn
	 UHGKDfVtT9EUFgDMpbaFKsM+lFmLcxvBB4pTYUM73kThb3kyfjYi9M5IK4YKvSb+VT
	 VCKwhirV5FWed18RqyotTYKrys0W4tMmwbW0UOgRZT90MtKfEDzTpczYc4ZHwPFcUy
	 f15LJbNzVeqGA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, paul.olaru@oss.nxp.com
In-Reply-To: <20230515104403.32207-1-peter.ujfalusi@linux.intel.com>
References: <20230515104403.32207-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Separate the tokens for input and output
 pin index
Message-Id: <168416381274.410886.13291607324181166040.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:16:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: GMDYXSZSMEYHD2YMC2KWOAGZ3VNVMN2F
X-Message-ID-Hash: GMDYXSZSMEYHD2YMC2KWOAGZ3VNVMN2F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMDYXSZSMEYHD2YMC2KWOAGZ3VNVMN2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 13:44:03 +0300, Peter Ujfalusi wrote:
> Using the same token ID for both input and output format pin index
> results in collisions and incorrect pin index getting parsed from
> topology.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Separate the tokens for input and output pin index
      commit: be3c215342956313845308e0e631341e62370a2b

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

