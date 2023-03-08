Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63E6B0A0E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B20D9180F;
	Wed,  8 Mar 2023 14:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B20D9180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283686;
	bh=ItS8X4AoeRuIoBBX/czqfgxqxNMtPyoFJUXbc1Y0XE0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OuimG5CkoN93mi4Jg/iXaNRz3BJ5SX5l4cFJU4AehzPT3WKnZyNQ5kjrD5nFfbDTY
	 j1RovseftFHg0VCl09UeqBQ+hU4ara6U7xNHtvB/yvYpMPYh4oCJBuB8ON3ldzHSsQ
	 cQGVqaxIMmWXqyaCdq4XkFEVzq8PoJUhcSLZUbPc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 068D7F80548;
	Wed,  8 Mar 2023 14:52:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F3E1F80431; Wed,  8 Mar 2023 14:52:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6125BF80236
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6125BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BvkwL3O7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB5316181B;
	Wed,  8 Mar 2023 13:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F046CC433EF;
	Wed,  8 Mar 2023 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283549;
	bh=ItS8X4AoeRuIoBBX/czqfgxqxNMtPyoFJUXbc1Y0XE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BvkwL3O7OGogCZx3uL29M/HjtYCJ4ZVAazSQKSu4TZ1z+z0pzameD5qVKE++ZmoHM
	 S9K97fb81Av2wwp71f5RZyxaJNxadIVYMaV1Q+ZFcIZsYR2GBpKgRe82m3onWH2UDU
	 i8zq+JHRNSIlwD1Bv1rKyMyFKAulPxQFJ8cjDSCJp+KOCOY3QXqOKHlOIPn2y1hkNG
	 doOluWw588ri215asub/3hZAxjEHZIBtKpzhI0lvJ3nvVO7ZS2pC9AWAhMP9BZVjyS
	 8KOlfWaECCx/6i2kyjNxC9G12z83RI6Vlu7lu3/n7u4mcj4SKLNWFOdKr2k7FBHEFU
	 9s8eYFmDsebWg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307114639.4553-1-peter.ujfalusi@linux.intel.com>
References: <20230307114639.4553-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: Fix broken early bclk feature
 for SSP
Message-Id: <167828354664.31859.5223340750732481127.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 35IX3PL67XEIYSHSPUMYOSZTXI4BETJG
X-Message-ID-Hash: 35IX3PL67XEIYSHSPUMYOSZTXI4BETJG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35IX3PL67XEIYSHSPUMYOSZTXI4BETJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 13:46:39 +0200, Peter Ujfalusi wrote:
> With the removal of widget setup during BE hw_params, the DAI config IPC
> is never sent with the SOF_DAI_CONFIG_FLAGS_HW_PARAMS. This means that
> the early bit clock feature required for certain codecs will be broken.
> 
> Fix this by saving the config flags sent during BE DAI hw_params and
> reusing it when the DAI_CONFIG IPC is sent after the DAI widget is set
> up. Also, free the DAI config before the widget is freed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: Fix broken early bclk feature for SSP
      commit: b66bfc3a9810caed5d55dd8907110bdc8028b06b

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

