Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421022115E6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0891168C;
	Thu,  2 Jul 2020 00:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0891168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642267;
	bh=mxx7Gg/ZIeVDV4tXevq1kBD2WMrxAhSo/UjofIGOOwU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anXJI1IRVG95qHF4umy5Y2ZveVYEwPEeO/rD9JLFy5SdYGbcwNbsyRnhtYZ9ExRc/
	 cbutyNYzmK6kYfhJWyn6WuFGzPYVNTqYqHlD7xEbucNlBMZQdn4+YewNRYNs/for63
	 XY3VYzU0tOh4H1v+S0a1Y7mWNNCylD7Qn8TAEaM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD8BDF80229;
	Thu,  2 Jul 2020 00:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC169F80217; Thu,  2 Jul 2020 00:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6F0F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6F0F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="04e4khGI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D78220780;
 Wed,  1 Jul 2020 22:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642157;
 bh=mxx7Gg/ZIeVDV4tXevq1kBD2WMrxAhSo/UjofIGOOwU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=04e4khGICYM7F2fV318l7QGiET8eig6XK+gokuFooZFgBJouu8gJBd14/TIBQ+mpv
 UblTZxZI4UIzLu5D+bDdMao2CAFWavi/aJo7FRezwwFJsbLKP9Ot1rvINT9cGhR1eh
 xjrE1pqQI/7VEA7Ht2y6mPk1Zc4zXv7HCyhsAZf4=
Date: Wed, 01 Jul 2020 23:22:35 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alsa-devel@alsa-project.org, tiwai@suse.com,
 Xiubo.Lee@gmail.com, timur@kernel.org, lgirdwood@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1593525367-23221-1-git-send-email-shengjiu.wang@nxp.com>
References: <1593525367-23221-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
Message-Id: <159364215575.10630.16163829958912302210.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 30 Jun 2020 21:56:07 +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.
> 
> For internal rato mode, the rate of clock source should be divided
> with no remainder by sample rate, otherwise there is sound
> distortion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
      commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0

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
