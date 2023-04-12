Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAA6DFBBF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0AF107C;
	Wed, 12 Apr 2023 18:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0AF107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681318124;
	bh=70QQ0piJA0rb40fo7kUyhJ0BI51kGHGC938Dnjp/T/I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=T4Fw6rclzvES/q3MSwbFtpVzkyJKP4ypX10zISuZHaOVCPjTZHLxL0OznBu5FXmbO
	 +sCC/qHKfFP3M9ePO1HUoT0eT7bzFTSLZKDX5stjeqypV/SSINDaQUSDwf9StYjaF3
	 KUuU1AcLYqkbucbeT0ykAx/9SBK4q9b3VifVbDqY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE16F80557;
	Wed, 12 Apr 2023 18:46:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 715AFF80552; Wed, 12 Apr 2023 18:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBCEFF8049C
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCEFF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JCU7FJQe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9EF263758;
	Wed, 12 Apr 2023 16:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6AFC4339C;
	Wed, 12 Apr 2023 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681317976;
	bh=70QQ0piJA0rb40fo7kUyhJ0BI51kGHGC938Dnjp/T/I=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JCU7FJQeLkerkeVrWpYaAarFDRD/zNBVtyreSJIbJvB2cXWWYyGNXXS2z5XCrNsP8
	 abLuUrHpp8ccomcoNROhjqlZzDCktlX8q4rrDsKQ6CTR4X7ifncQHe+2ZccODtvWVF
	 VO04DbgX0eGigHxWhTlrI+TFxgZDW55y4dWIzRrsePM94WqAgkOt8AkH53tvvzrosj
	 OCs+1opFmYj8gjvMYYwT8Eu+bSX+/5vM7RKfIiaxYvyG1tnbXjSpOjmk+Ti6xYEzFe
	 hHR3I7Bg8W8+fhyXKg5Omxk4BOjB02TW3gfFcwbYiHXQa1OvIkRNsYLTaoY08D7wvR
	 ghx4xpLERbvPg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>, alsa-devel@alsa-project.org,
 Baishan Jiang <bjiang400@outlook.com>
In-Reply-To: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
References: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks
 list for acp6x
Message-Id: <168131797478.93781.3828822970192052748.b4-ty@kernel.org>
Date: Wed, 12 Apr 2023 17:46:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: 7QDKAMJL5KST4AZVK5KGOLIDTEEF52JI
X-Message-ID-Hash: 7QDKAMJL5KST4AZVK5KGOLIDTEEF52JI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QDKAMJL5KST4AZVK5KGOLIDTEEF52JI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 16:40:43 +0800, Baishan Jiang wrote:
> ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same
> microphone problem as ThinkBook 14 G4+ ARA.
> 
> Adding 21HY to acp6x quirks table enables microphone for ThinkBook
> 14 G5+ ARP.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list for acp6x
      commit: a8f5da0bf4d85a6ad03810d902aba61c572102a6

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

