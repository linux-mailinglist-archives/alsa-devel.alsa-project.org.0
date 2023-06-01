Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7488471A2FC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C74823;
	Thu,  1 Jun 2023 17:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C74823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634389;
	bh=j1B6GqZ6f9Zd5X+R4g+J68Lei5mv2+LyJ/NMxepU/1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xvcb8SEeoqCLrLA8n8tyEkuzGOZ/St2mg8Ci3Sjms69KGdMCaYfQyAsH2ou7bYQnd
	 0eqLcpF2aFmEmoLj3D9RstAPjTitW6Gw7F62gObztd/+NRmlZoU01RiXhf40IsVm4N
	 xr5ytRLsiFvrZwoHhfEIRzS1BV+tLuypRx0SfXM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55913F80570; Thu,  1 Jun 2023 17:44:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A71ECF8055B;
	Thu,  1 Jun 2023 17:44:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7EF9F8016B; Thu,  1 Jun 2023 17:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E67B5F800C8
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E67B5F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=am4NtIdK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57F10646B2;
	Thu,  1 Jun 2023 15:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71E8C4339C;
	Thu,  1 Jun 2023 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685634272;
	bh=j1B6GqZ6f9Zd5X+R4g+J68Lei5mv2+LyJ/NMxepU/1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=am4NtIdKTbfvWg6fiTkl7rSByUtsHgJTbc4bgyQlPp2CUhXJ/uqdnazoxmJYnpRre
	 mRd+55hioSHZFq0zczsTCJf4fU4j9RSuMklxljAYWPP2HkFmpu+42N22MqOr4b8cYl
	 XNG9mDguGgnIC0GARPlXCWfvJ7821kfOmjT06YFRgyATMOoTPeE49AvwX+E3MPG1rk
	 CDc0lMhC+gd25Kr8S3/K5Jd5KXG4Muw9n2rWbTwLkHIxOETzSLpbqxFsbnohy0z3Tw
	 by+hJB6eCfM5QcMxq0ZC9TBxtZaPb/OjI0eHvU4IGVE/6BvAsaFEYkSrjeAPp2CLYg
	 Q4E6JCGvUEZ6g==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230601124907.3128170-1-rf@opensource.cirrus.com>
References: <20230601124907.3128170-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Remove NULL check from
 cs35l56_sdw_dai_set_stream()
Message-Id: <168563427160.132600.8355964544027390403.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 16:44:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: DYM4QDSZAVWBSVV3L5UC7ZPL6RWY5AM2
X-Message-ID-Hash: DYM4QDSZAVWBSVV3L5UC7ZPL6RWY5AM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYM4QDSZAVWBSVV3L5UC7ZPL6RWY5AM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Jun 2023 13:49:07 +0100, Richard Fitzgerald wrote:
> The dma pointer must be set to the passed stream pointer, even
> if that pointer is NULL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Remove NULL check from cs35l56_sdw_dai_set_stream()
      commit: 524306c3764276ce6cc7509908934982ce167039

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

