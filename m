Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD86989B0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 02:11:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9FE84C;
	Thu, 16 Feb 2023 02:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9FE84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676509880;
	bh=CLxgvvve9og1cYZR7tzc8NisOq0EVCJzqM3j00w+GMk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P4xTUFbMNnu9bd62sXYyn4BGvPYqKyp4chXqaAHKWpMoWVdta0/nU4tlqP/dVlsmT
	 Gy1mJt5BUH0D+3P9wUQwAJcXtgSuJrRsGCxehni6M10Pp/8lV/sCyIziXIquDCU9oR
	 +qVxTSSMdDNA4LeP+IEDXOPuv8oOPY2ACEebqBJg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F688F80496;
	Thu, 16 Feb 2023 02:10:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EED6DF804FC; Thu, 16 Feb 2023 02:10:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83E3EF80496
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 02:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E3EF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KhFwyZr8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D2E4B824E4;
	Thu, 16 Feb 2023 01:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC05FC433D2;
	Thu, 16 Feb 2023 01:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676509794;
	bh=CLxgvvve9og1cYZR7tzc8NisOq0EVCJzqM3j00w+GMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KhFwyZr8ZeBQpyFjSqclLU+LukmBr5iengkv65ncdRPVCYQfRa1bGIYmbf4G+fV4P
	 ijd/DINCvS83OsaSMNsF3VJjas27bibniojy0lqNFrFNXui3MWcwHrOzIHV9qydDXL
	 odn5iMDyWlv5F39siQgYZHjTLsm6S6xsEK8jUPVq02uA5QieZdZjZebUfbq7Zkl6kN
	 /Eo22EcrRjLagPIPAyp+jiSJ9wke4zHDZihMQDNuWmm+37sUcwetrLvAYRgQWgetTl
	 iPe2h6hlq9/SLg+oZHouznK67jPg89Aqmw7u4Jw+uRdjZR6KEpND2POcKjGaD19/gP
	 Y991AFtvkcqCQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20230215105818.3315925-1-ckeepax@opensource.cirrus.com>
References: <20230215105818.3315925-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: cs35l45: Remove separate tables module
Message-Id: <167650979263.3620645.17342543857239200742.b4-ty@kernel.org>
Date: Thu, 16 Feb 2023 01:09:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: QJSELC43OXYQUPHAGWFJKWMI3QA5KL2N
X-Message-ID-Hash: QJSELC43OXYQUPHAGWFJKWMI3QA5KL2N
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJSELC43OXYQUPHAGWFJKWMI3QA5KL2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Feb 2023 10:58:17 +0000, Charles Keepax wrote:
> There is no reason to have a separate module for the tables file it just
> holds regmap callbacks and register patches used by the main part of the
> driver. Remove the separate module and merge it into the main driver
> module.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l45: Remove separate tables module
      commit: 4dac6f5abc02ffeeb10459c575aba2343363d4ee
[2/2] ASoC: cs35l45: Remove separate namespace for tables
      commit: 926505cf14258376c3cd244e891c7d739a2a049a

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

