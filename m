Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A687F7761
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:14:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F12C3E7E;
	Fri, 24 Nov 2023 16:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F12C3E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838862;
	bh=c1Tbhzd/q6lLjvGR7G44hGQX/17WpWR8SqeEb+GEy1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DpOkjyWQZknuVpZ7s02+LP9VKBKx0J9OVlvewcTFqxFCf0QyPEkjshX8hVKdc2jhU
	 YT5C25WSweynW+hJW2iyeIH81PN9GxrOIwv8LvcD2H6jKx/QGf+eefYIIpK4GFtDC8
	 wAHOZ84K0RUrKEUvkT90rusuCr2cfCKtDVTO1pUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6401AF8057B; Fri, 24 Nov 2023 16:13:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8670BF80579;
	Fri, 24 Nov 2023 16:13:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66887F802E8; Fri, 24 Nov 2023 16:13:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31225F80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31225F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AdFqrZ8o
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED13E622E6;
	Fri, 24 Nov 2023 15:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E67C433D9;
	Fri, 24 Nov 2023 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700838815;
	bh=c1Tbhzd/q6lLjvGR7G44hGQX/17WpWR8SqeEb+GEy1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AdFqrZ8ofF7rHyRBdhRItur3FG86R0iTSbuAZDNg1IvBZgCgs+AKrTjwF32sh2TIj
	 Flyzzxr0pZxjQ99nhZ4wowUJeq6rAfYWKyzJpWd1BSwq9bJnh61zlbnY1LSF5gDbeY
	 07zaZhWu7bK6oLPtPP0rUiUjQs4TUHGTBI1QBHkcCjoiLHmXIByTeKqBNBxhdHGRXE
	 2HZTbfyQRLVpq2uDTT+ukmPDPaxdJtH2XVG0wypqguFHZknJW0SqUAaT/MTIufkePd
	 ow/oUOFIRlUKtSp1VEVk2Knr6xC5zC16YuLKPixGAIiFMiURQp1zsgUgHqzFQuiKoz
	 CtL/bQ1eCwUuA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231124124032.15946-1-peter.ujfalusi@linux.intel.com>
References: <20231124124032.15946-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Always register the HDMI dai
 links
Message-Id: <170083881136.2597788.15143097357794274199.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 15:13:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: NA7FOGRTREOSTPI7YPUFOLPIBJ6TYEDL
X-Message-ID-Hash: NA7FOGRTREOSTPI7YPUFOLPIBJ6TYEDL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NA7FOGRTREOSTPI7YPUFOLPIBJ6TYEDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Nov 2023 14:40:32 +0200, Peter Ujfalusi wrote:
> The topology files for SDW devices require HDMI dai links to be present and
> this is granted under normal conditions but in case of special use cases
> the display (i915) driver might not be enabled due to deny-listing,
> booting with nomodeset or just not compiled at all.
> 
> This should not block the non HDMI audio to be usable so register the dai
> links unconditionally. The code has been prepared for this and in case of
> no HDMI audio the link is created with dummy codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Always register the HDMI dai links
      commit: fba293488ccb1902e715da328e71aa868dd561f6

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

