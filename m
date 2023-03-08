Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8D6B0A05
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D4ED1816;
	Wed,  8 Mar 2023 14:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D4ED1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283660;
	bh=1tZY/XORFIX9T6cMEG1p24MzYs/516rkOd6Cll+biuE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bfzh8B6DTfj5gzzokxm+lh9BmIWoM4lgpTttEcuj7qnbBWrnCDe8EPFprr/tQv9u2
	 q+q74R74eaTnPje/TVyvlOuLZ9ywLuhPxh3sbPOnY2bjWqHCqF9iGbBV+fk0t0s413
	 Lm/+WlkDgh8+wIvo08hS6UEzbk8cKLVtgUj5VRSY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEC6F8051B;
	Wed,  8 Mar 2023 14:52:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73AB9F80482; Wed,  8 Mar 2023 14:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72FB7F800DF
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72FB7F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NgtAV0LK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA9BEB81CB2;
	Wed,  8 Mar 2023 13:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC5DC433D2;
	Wed,  8 Mar 2023 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283546;
	bh=1tZY/XORFIX9T6cMEG1p24MzYs/516rkOd6Cll+biuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NgtAV0LKBWyRh2LbcqvSaen9TfGCg6pbpJgNx44B9Yc4ykLcqO4vJd9KqPXo3vY3b
	 PfX6LIYL678mlvQKbH9/iU/39V6HBpczhDi7lJ84un43orj4FrHP2qYdfIU6Axioed
	 JRG5nt+uNyeWwPvp0BFZ5dKd8ZGcCM20u/6kY6QcIY8FSPzUA17B+xh0bD2m+Yeycq
	 DvsCfgMXQYVcv866dwUA50immteWMO9MzRyIZiL23LumqUjdehoXDx0t0zdIfYUPs5
	 VAQCbSQzAtHcSCS+BsqxF9T/0uevaM4YZNifQJfgKamotaChhL/70R0xh7SRXuNxvP
	 RtntstLGSWuPg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307115018.5588-1-peter.ujfalusi@linux.intel.com>
References: <20230307115018.5588-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: loader: Remove log prefixes for
 snd_sof_run_firmware
Message-Id: <167828354460.31859.11923350005052522167.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: RJWASRNDAU65EPBCAQQM4AZTDSO3MY3B
X-Message-ID-Hash: RJWASRNDAU65EPBCAQQM4AZTDSO3MY3B
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 cujomalainey@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJWASRNDAU65EPBCAQQM4AZTDSO3MY3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:50:18 +0200, Peter Ujfalusi wrote:
> Prefixs are unneeded since log level explains the same information
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: loader: Remove log prefixes for snd_sof_run_firmware
      commit: 611fddf58862a9e77ae300605b2c00d54e973b1f

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

