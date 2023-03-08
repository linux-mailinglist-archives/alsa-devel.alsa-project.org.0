Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D476B0A20
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:56:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5331860;
	Wed,  8 Mar 2023 14:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5331860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283792;
	bh=/em2VSzvL8Hw1oG0OZOpRYF3vUohjWAYUUDf7XT3rhE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U6C04CbzWjadmp5VDs8vy4WU39rGYYbsbmiT9ssv6wCBSt1nMyo2azTRyzsrkop8D
	 ws4e/8/PK1WD4GvP3sNJZo1A3guITwBBimvDFCSNKdgWZyQqziF0KSDE+wpSVn9KZx
	 4QD5vvgDOrgfMNF8dmUXy+KjvGL0v63huCrEi5Zs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35747F805A0;
	Wed,  8 Mar 2023 14:53:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E050F80551; Wed,  8 Mar 2023 14:52:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADD8CF8052D
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD8CF8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R3ua5DxB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6277761838;
	Wed,  8 Mar 2023 13:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDEBC4339C;
	Wed,  8 Mar 2023 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283566;
	bh=/em2VSzvL8Hw1oG0OZOpRYF3vUohjWAYUUDf7XT3rhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R3ua5DxBNrtqjhzhpngXgA36gZoeW/vzkqba6I+A0GQ8Jc7979xO/IvlWYsrZkWDb
	 mqDfhoZgOjXp2duPRWrMK9C9LFKb+jU05eYQr9kXXdo11sePEU7CEN4RRci0zMDdXy
	 AAFFdWI2Xj+9m1Yx2UIBk+PpjZmzzU/85MnDjm+LJgC3jxU3X0rsq1MkNfOKY6IPh/
	 eAExBfuGqhHfYujG2rscvVaDWG92icz2WqFLO4TwSQApnnHGhhMfJ+O0yO4PTRaVE+
	 Y0A5D7tS3aQs+EkYIl3mpVuIJMfU+HGOYDq9nOSdgB7ymjZjux7fVYzEX18o2YTFeU
	 bWo7h1n633PwQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307114815.4909-1-peter.ujfalusi@linux.intel.com>
References: <20230307114815.4909-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix error handling in
 sof_widget_ready()
Message-Id: <167828356449.31859.14992192552897386254.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 5PRN7RJMKPDW43DM6FRYTXUVSM4DDZL4
X-Message-ID-Hash: 5PRN7RJMKPDW43DM6FRYTXUVSM4DDZL4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PRN7RJMKPDW43DM6FRYTXUVSM4DDZL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:48:15 +0200, Peter Ujfalusi wrote:
> Fix the error paths in sof_widget_ready() to free all allocated memory
> and prevent memory leaks.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Fix error handling in sof_widget_ready()
      commit: 6ba8ddf86a3ada463e9952a19b069f978a70a748

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

