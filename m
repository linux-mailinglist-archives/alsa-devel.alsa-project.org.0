Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68A50C491
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 01:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB47176E;
	Sat, 23 Apr 2022 01:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB47176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650669588;
	bh=x71Ime0hUF8cE078z5HY+z/9w9dZVwvIVxA6K5pAhn0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T6SsPt/JDQg/2oz7S/a2klePuIQa4c3TFZ1vyCETWjwj1bWs20B4v0lHfnE7sffy6
	 lFLxjd8TJzxufaBkf+bYRr72t8pEbmJK2KDnl63OS00cMckQJyML2D5UaAB5SvLsH4
	 Yx5TAAVK7BItIB9KwyNV/ZaYpTgtpVby6CuWCyTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA103F80516;
	Sat, 23 Apr 2022 01:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F4AFF804FB; Sat, 23 Apr 2022 01:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25FF8F80249
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 01:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25FF8F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="APRsmFHI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8D9061856;
 Fri, 22 Apr 2022 23:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5AFC385AA;
 Fri, 22 Apr 2022 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650669449;
 bh=x71Ime0hUF8cE078z5HY+z/9w9dZVwvIVxA6K5pAhn0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=APRsmFHI2RSfuqTJ1XWTP3oH3yR67GWHdE08ZQrACk7j9cd4WmRlutCw0gDYbEdvl
 f/V3j3c7n6XGZ45IB2wVvUnzVBB49ztt4Gk7bM09540BwkpajgZWVstPyW5BcqR3t2
 p9d9E93rOleCLiikQ4ww7Cet9tP2nrNRKVoxjrtahgiRqZdJO+cRojNMxXK4VuMEU3
 /q1LXbG+8kXNx3R/EBGh2GITY/VmIR084fCecWUKslQ6q2q2RkgpCcUhKMw/69dfVG
 IYTQmHdKneYRDZardj2BnWRJw77gKxDx1HcQH/N1wS3a/53B7MXjVbDJdireki9os7
 jrSEXVZZJNDnA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421201847.1545686-1-pierre-louis.bossart@linux.intel.com>
References: <20220421201847.1545686-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Check w->sname validity once in
 sof_connect_dai_widget()
Message-Id: <165066944777.12937.17480827112152470546.b4-ty@kernel.org>
Date: Sat, 23 Apr 2022 00:17:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 21 Apr 2022 15:18:47 -0500, Pierre-Louis Bossart wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> The 'w' (struct snd_soc_dapm_widget) is not changing within the function,
> there is no reason to check the w->sname more than once as it is not
> going to change.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Check w->sname validity once in sof_connect_dai_widget()
      commit: 14bdc7b2f9ea0d3f86beed93079ce40a7ead57ac

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
