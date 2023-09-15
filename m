Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7EE7A1E74
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A70A4D;
	Fri, 15 Sep 2023 14:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A70A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694780428;
	bh=6YVE3iCIWno5okMUOV41O3afQTfTiJAZ31jAZPRBmf4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=grglfQSnlAZTZH4qcfqDqe2y+Wo28SBQuWpvS9T8hVKEVyPIUDgFhdQLv6gZyKYLN
	 4rEYZwXrQX2t9mqqHeuLZ/spRandwfgkkiGA/3x4aU5PUx+7EKxvEtzs5+CZbGlYDt
	 Zy7udzPXCIGG1nKNLk2fiFHi8OjKjSBTg8qDnF1U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD184F8055B; Fri, 15 Sep 2023 14:18:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DB6F8055A;
	Fri, 15 Sep 2023 14:18:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D986CF80425; Fri, 15 Sep 2023 14:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3B90F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B90F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bssTNE0/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A2A261ED9;
	Fri, 15 Sep 2023 12:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACF1C433C9;
	Fri, 15 Sep 2023 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694780316;
	bh=6YVE3iCIWno5okMUOV41O3afQTfTiJAZ31jAZPRBmf4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bssTNE0/gbU5yNCIeaa+JqN9gPIA1yISyawLCREj862dvRJvg83GmsmQH6tRtQsRp
	 nzaW+1egpE49va6/skEaCbYrYqXbY4+3zZ8qRbUpFFLdHMpiM15L38u0DnjbBpKTrW
	 PjCkxRME4/r5zowFFyMDXL6ECR57/OwI0lLsiZRXjbr+/G+15zl5peXKLU4SyI1Uvi
	 dM7IiazUy4qqs/3iDXoR8w8T3b4B4vsPapDsnvXa+hdLZbn9es4tEWCPqfM6D0EOu1
	 eS9+OM7ASdbK8s9z2cMkqUGRdLJ4HllUYwVvhOotlVrS8SORURidR12kuMSbD3+P9s
	 Imm/OrUJ7H33Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com
In-Reply-To: <20230914124943.24399-1-peter.ujfalusi@linux.intel.com>
References: <20230914124943.24399-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ops.h: Change the error code for not
 supported to EOPNOTSUPP
Message-Id: <169478031365.22068.18253852397893670307.b4-ty@kernel.org>
Date: Fri, 15 Sep 2023 13:18:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: ERL743CTH6TIP6KTGZOPY62CESE7BAEC
X-Message-ID-Hash: ERL743CTH6TIP6KTGZOPY62CESE7BAEC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERL743CTH6TIP6KTGZOPY62CESE7BAEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Sep 2023 15:49:43 +0300, Peter Ujfalusi wrote:
> New code uses ENOTSUPP as per checkpatch recommendation:
> ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ops.h: Change the error code for not supported to EOPNOTSUPP
      commit: 353bc9924cb1b7176fdc4ebb3610306398f41c94

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

