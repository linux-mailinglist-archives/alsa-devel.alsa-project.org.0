Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6EB774ABB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 22:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0908B844;
	Tue,  8 Aug 2023 22:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0908B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691526877;
	bh=F1XTR+I0k29ZZvLNdhXum1tX9rQSs38dNQCgSwARryg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AS0JBxlWNJ5lsQLIP/4ZsEpGcip+79RT0LkEbL3+or0fomnWs8Ig+fFSPpYy7Cwrn
	 4cnXQ5W5V948m+fphYyz7enTJgJs5aeRhAhrORff+/zUl7HJyWCwN1s8h0WW8ne/NX
	 InSUoAu3xGwUsMm0LeBkMOYsqlNfihMCFsuOzxM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5826DF80553; Tue,  8 Aug 2023 22:32:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2097F80553;
	Tue,  8 Aug 2023 22:32:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A1DCF80538; Tue,  8 Aug 2023 22:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1BECF80107
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 22:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1BECF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OTVpoe08
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49B9B62C82;
	Tue,  8 Aug 2023 20:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A732AC433CA;
	Tue,  8 Aug 2023 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691526762;
	bh=F1XTR+I0k29ZZvLNdhXum1tX9rQSs38dNQCgSwARryg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OTVpoe086xhiYZZm/8m1jl2AAPaII6lcv1S1qoT1mIRUburKGpfuPlbttQmlStkoI
	 uoz18i6/n/Y7stJIdZC3kVS8+kNRIY5RsyJdHaPJylYCnAFvFBeVT0Tz1TzXfbkerQ
	 7YURPC/fULbMwEUOWMIiu1kII/vzebYUVTFVyBjnaRXihTDSf27EgJdaO3g5JPBntZ
	 afOrJTVOX2kVsNM76I6yEmRWoA0YKkRAWG7RbT6AbRxRi7Wcg6e2qpq4E/1UsOYGwR
	 dHt7zsJl174Q2H6xB2x4QCm25rSsONxvoInVidyCHU1jtAu58hrxWfHWN7ktB6rVtW
	 61/WAAyAWr3Rg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 01/12] ASoC: intel: sof_sdw: Printk's should end with a
 newline
Message-Id: <169152676039.192712.4979142474408353677.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 21:32:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: TM5H5XZMLW3B6TK4KYE43UWU7NMG7UDA
X-Message-ID-Hash: TM5H5XZMLW3B6TK4KYE43UWU7NMG7UDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TM5H5XZMLW3B6TK4KYE43UWU7NMG7UDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Aug 2023 14:20:02 +0100, Charles Keepax wrote:
> Add the missing new lines.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: intel: sof_sdw: Printk's should end with a newline
        commit: c307ca16c9bffc18dbf37ae64c71d935a2923c3a
[02/12] ASoC: intel: sof_sdw: Remove duplicate NULL check on adr_link
        commit: 3003ea9cb7bd6399ca9962e0b3dd0ac58b151c2e
[03/12] ASoC: intel: sof_sdw: Check link mask validity in get_dailink_info
        commit: e1cfd5fef3d6eaf0ddbc54da70ddf54462b23592
[04/12] ASoC: intel: sof-sdw: Move check for valid group id to get_dailink_info
        commit: 87608d3e9de18331c5d3c9ecb915b0ff3d03c089
[05/12] ASoC: intel: sof_sdw: Add helper to create a single codec DLC
        commit: 92e9f10a093529f85b7557b0627531728d89afa2
[06/12] ASoC: intel: sof_sdw: Pull device loop up into create_sdw_dailink
        commit: c3d7e29ad82ee689b1adf5ea7806b9d06eb098c0
[07/12] ASoC: intel: sof_sdw: Update DLC index each time one is added
        commit: 0e82229fb74a26cfaf6ae3772cbdefdb643f98a5
[08/12] ASoC: intel: sof_sdw: Move range check of codec_conf into inner loop
        commit: 59736ca62e1eeb4466ace99e167cbe7a0f9bc0fa
[09/12] ASoC: intel: sof_sdw: Device loop should not always start at adr_index
        commit: f3eb3d45fdfd693dc004e664544f978ae8d38f48
[10/12] ASoC: intel: sof_sdw: Support multiple groups on the same link
        commit: f82742dd479dfec7dc6a30a84f165a258c51ce09
[11/12] ASoC: intel: sof_sdw: Allow different devices on the same link
        commit: 317dcdecaf7a42febb78c564df15fd817bf720b2
[12/12] ASoC: intel: sof_sdw: Simplify get_slave_info
        commit: 7f5cf19703ccb05ac4965d1cfc1422e38bec93aa

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

