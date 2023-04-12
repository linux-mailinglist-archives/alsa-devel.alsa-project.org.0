Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF976DFBBB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:48:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F496107E;
	Wed, 12 Apr 2023 18:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F496107E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681318100;
	bh=BxX3A3+QcMTgiJrOfxOMYktRoDe9+HI8F2/cJ/qvsKk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t5KNaEfQnjoIenCfaETQq6H0VvyHEQupwIILLCBVN/hKmkv0WdnuWq+ZBvvguc6fa
	 GneEiimEfbms78mVtk5PGd0Y02M1/+ofysdhG3Gr02pVDLoDJcVupqGf7ExSZw5P2B
	 cimXeaWRWQKKzZNa2/E5bLrD4LHcESInPlQ7Mo2M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC582F80549;
	Wed, 12 Apr 2023 18:46:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C301F80533; Wed, 12 Apr 2023 18:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DE31F80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE31F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ulib6p0z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 275BC6123A;
	Wed, 12 Apr 2023 16:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D2BC4339B;
	Wed, 12 Apr 2023 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681317974;
	bh=BxX3A3+QcMTgiJrOfxOMYktRoDe9+HI8F2/cJ/qvsKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ulib6p0zEHSchuyxnKbhSdO2Vd89+JgYsU28UNpL3nGuZriS8UAXETwu8+6T5nNnI
	 sMwuI7n+I954JXtvYrF2dwuNFgnlPPKGL8VcXvQUfL806IWRXQA9sICQjxaY6t0pVu
	 Ds7TErf6+TvE+8c5aK6sC19A3LBanf7OXYozfQwSeqZ7YJnFW1cvCIA2MXjIYE2rNB
	 aqKG4UNrCtyEkAnmbWGjmxFdGxgR5F8yR6BFLRoW5kh4RgOydzeXyqXq7EgSVvZqFF
	 2TcPDDj/6s7UnJDejTEdm/VZQfepcDjwafpO0oSd8LjVfSWE8bFq5tR1apMoReTzia
	 XI/3KMJGF4mKg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
In-Reply-To: <20230412091638.1158901-1-Syed.SabaKareem@amd.com>
References: <20230412091638.1158901-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: Add check for acp config flags
Message-Id: <168131797043.93781.9548675938995241210.b4-ty@kernel.org>
Date: Wed, 12 Apr 2023 17:46:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: L7LSLLN2DIPCJ7XQJYP5EXCH7KXESBFK
X-Message-ID-Hash: L7LSLLN2DIPCJ7XQJYP5EXCH7KXESBFK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 vsujithkumar.reddy@amd.com, ssabakar@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7LSLLN2DIPCJ7XQJYP5EXCH7KXESBFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 14:46:16 +0530, Syed Saba Kareem wrote:
> We have SOF and generic ACP support enabled for Rembrandt and
> pheonix platforms on some machines. Since we have same PCI id
> used for probing, add check for machine configuration flag to
> avoid conflict with newer pci drivers. Such machine flag has
> been initialized via dmi match on few Chrome machines. If no
> flag is specified probe and register older platform device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Add check for acp config flags
      commit: bddcfb0802eb69b0f51293eab5db33d344c0262f

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

