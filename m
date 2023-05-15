Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81820702B2B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D70847;
	Mon, 15 May 2023 13:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D70847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149113;
	bh=erY1V269dM84aVQvYzrgV/m6HbCdOblSOqyYSO4UOqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z7NwLz1flpzi5hTYvMnDug7WqbnoyXfTueiHRdJeyPa+Z+wUTL4s4Oo2J0sp7HJEn
	 mrg8+wIWr5eVuJzu2UnBoXuOwtQ3gM5flnoGFgN9BM9kOj5vfS4UnPQ1M5JVYl6aAa
	 sLF5PFgm8NEEQvBRG92KIGjNg5YkZBtUrOa4+CZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E340F8057F; Mon, 15 May 2023 13:09:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60146F8057B;
	Mon, 15 May 2023 13:09:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81677F802E8; Mon, 15 May 2023 13:09:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7FA8F80272
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7FA8F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VusDJmU3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98A206229C;
	Mon, 15 May 2023 11:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2B5C4339B;
	Mon, 15 May 2023 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684148981;
	bh=erY1V269dM84aVQvYzrgV/m6HbCdOblSOqyYSO4UOqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VusDJmU3xcFdnhzHPLcfaqQoPIwYi4dK8kQ3iHe0YhVrVVr9iB2NXYQIZZr7YS9zx
	 qtnluCOS2A5Utxttk/a+EiC24VubeeifFgs0v+BoJRKEy1OtHbtzfJGkaX95UpFbZh
	 0+zbMmahh07/RTYnArgrd53HRxTdQrC+UWzVd/rv/vZb+6lKTpTYKDjEouAxcL0XBh
	 oZWF5uLLrg8LqYAu+Cg70CKkLYrU4+Wwfahk/4SfoSJ1PX0DnNlYPlAKJN8B4Hbvrb
	 w0UAi+lxqNfEubu3Z/3myJfudYAb9+V+i2Uekv16mHebhQH641A6ta2MaKXFkGzyj2
	 HnaWJZVY6I+cQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 cujomalainey@chromium.org
In-Reply-To: <20230512104638.21376-1-peter.ujfalusi@linux.intel.com>
References: <20230512104638.21376-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: pm: save io region state in case of errors
 in resume
Message-Id: <168414897948.394037.14052321590456601179.b4-ty@kernel.org>
Date: Mon, 15 May 2023 20:09:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MGGX6UMMLMYNNKPSO4OJRCRVNY4OKCNU
X-Message-ID-Hash: MGGX6UMMLMYNNKPSO4OJRCRVNY4OKCNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGGX6UMMLMYNNKPSO4OJRCRVNY4OKCNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 13:46:38 +0300, Peter Ujfalusi wrote:
> If there are failures in DSP runtime resume, the device state will not
> reach active and this makes it impossible e.g. to retrieve a possible
> DSP panic dump via "exception" debugfs node. If
> CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE=y is set, the data in
> cache is stale. If debugfs cache is not used, the region simply cannot
> be read.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pm: save io region state in case of errors in resume
      commit: 171b53be635ac15d4feafeb33946035649b1ca14

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

