Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7E6E6BBD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 20:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB09AE86;
	Tue, 18 Apr 2023 20:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB09AE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681841406;
	bh=CXOYtsBMCLdNP3Hr98JNrBWJGbiewjsk+S8BD+mS85w=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AZ85Yg481cIP+hE0oyTBdYfgNDmz1DaczuKc1im65bk2YLFIlQwfYNKAEwZxksVKV
	 N2+iNzbQr7mE56gweyKIhTM1bnF4jfncC/xzW17NW8nWrlyrPfR8zSxRPHmyucQvkX
	 G1evRlic1+ICjy61EkJ7MmUFIY7boN8tGz8LOU9M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA18F80149;
	Tue, 18 Apr 2023 20:09:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D83F80155; Tue, 18 Apr 2023 20:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9819EF800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 20:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9819EF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tyfty+zD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4EC062038;
	Tue, 18 Apr 2023 18:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76ADFC433EF;
	Tue, 18 Apr 2023 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681841342;
	bh=CXOYtsBMCLdNP3Hr98JNrBWJGbiewjsk+S8BD+mS85w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tyfty+zDc4kXnAqvKvkA+n/AjbVCGCJBktGil2MiU6a0E5K6uiIoQeHuwZ3G2a+YV
	 0tCsrYa34bWNk15dIF7wN5ifK/RYwBbT3HrKArO92aHxTfxYoYYsSP+HeRSVYbmSe8
	 zaOehVV8miW7CzrAVgYnmXT3D1POfyF8xHiz6WreZ0ERE3oV7sOzWPdZFVYmFSpzT8
	 /Ccn3xLl9O2WOYjuQMDrPJImxp2BiQRDe7IkGVMW2ojR0hjOpR6YNpCEgt1qPTS/zz
	 hnK2pXUrtHV+B0ZFqecFpmw9YNvst6r4dX6kRQ2oaRVW7WC10/kGvXbe2HWnelnwl2
	 mzfj2bw5a+G6g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Updates for B0 silicon
Message-Id: <168184134118.119808.12469329412185790363.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 19:09:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: AHYVQ2UQE23AREXGJHCSIYONUJBZGMG7
X-Message-ID-Hash: AHYVQ2UQE23AREXGJHCSIYONUJBZGMG7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHYVQ2UQE23AREXGJHCSIYONUJBZGMG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Apr 2023 15:43:05 +0100, Richard Fitzgerald wrote:
> These patches make some small changes to align with the B0
> silicon revision.
> 
> Richard Fitzgerald (4):
>   ASoC: cs35l56: Update comment on masking of EINT20 interrupts
>   ASoC: cs35l56: Remove SDW1 TX5 and TX6
>   ASoC: cs35l56: Remove SDW2RX1 mixer source
>   ASoC: cs35l56: Rename mixer source defines for SoundWire DP1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs35l56: Update comment on masking of EINT20 interrupts
      commit: 16e5fc8ae793947d7dd0de63c7a613798f75c237
[2/4] ASoC: cs35l56: Remove SDW1 TX5 and TX6
      commit: 5ab28c78a125a724684958f4caf8210127d3f528
[3/4] ASoC: cs35l56: Remove SDW2RX1 mixer source
      commit: d3a4efb334e5f6cbb3f2741fa07a873a2a78b016
[4/4] ASoC: cs35l56: Rename mixer source defines for SoundWire DP1
      commit: d29a966b72fb370128096393961f2c456ff24e3d

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

