Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204962115FE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B586F1677;
	Thu,  2 Jul 2020 00:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B586F1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642453;
	bh=Q3eRPK687CJ1TD+vPYTtpnTYTLgMFnwzqhQyWhTTvfI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgFa7JtDkcc+lylWHMXQlmwK3SvFnG+n1ab8OIYpqjDhPxJNA/dSYsGyfWzk6ibDC
	 jiLFJxe92A633MBYgD4YEVKYXCw2RaeXqNEeI67ZctFAatuCv/y/zdIQ0hO94ngp4m
	 J77nofJAxI4yeDQVtasgaIdZhhEuZ1ncXAmNGY2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1542F802E8;
	Thu,  2 Jul 2020 00:23:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53F6DF802EA; Thu,  2 Jul 2020 00:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AED84F802E8
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED84F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AU0bGnUM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9E2620780;
 Wed,  1 Jul 2020 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642183;
 bh=Q3eRPK687CJ1TD+vPYTtpnTYTLgMFnwzqhQyWhTTvfI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=AU0bGnUMeN653PjKqibdORxjLIr7pxXQi/6VJBzTn6KMk+xQNnfrQsFccxC9l4eEt
 aC/T/aY2uhNS5CNEzSdTzfNFXX9qzBvokTqKf4PiCb3jn40gmzDLLgV5jpDvRk20Jr
 ZAegaSYwl5SVbPfbutZW3TWnFnXh6BNlZb/oYFr0=
Date: Wed, 01 Jul 2020 23:23:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20200630224459.27174-1-festevam@gmail.com>
References: <20200630224459.27174-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: keembay-i2s: Fix reg descriptions
Message-Id: <159364215574.10630.17562111847021411509.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 jee.heng.sia@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 30 Jun 2020 19:44:59 -0300, Fabio Estevam wrote:
> intel,keembay-i2s has two register regions:
> - I2S registers
> - I2S gen configuration
> 
> Describe these regions accordingly to fix the following warning seen
> with 'make dt_binding_check':
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: keembay-i2s: Fix reg descriptions
      commit: 9308a3c92642cddb9ef89cc4014282cf14f2e2d2

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
