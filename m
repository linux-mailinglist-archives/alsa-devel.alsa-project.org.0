Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828A50A70C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87EF16A9;
	Thu, 21 Apr 2022 19:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87EF16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650561988;
	bh=Hm+I89eVrNyoJRbqZk91HLSchEvg3AO8RSEtWGOLKoo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6NCPaKuDOKJKFuYcgHJywj0sxcD9IFWrXXMHjule/FCgqO2RuNdg74Fca4gqGYVa
	 E+6R3UpaHBjEPP39NYplgMlzSPYyOGY6wWcer/hSeH8KOHwXB6D8H9W/N0RFZI9vm7
	 IE8P1/YWVDsVRS73/BcHIkVSRUVJZW41p22gd/xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF81F804FD;
	Thu, 21 Apr 2022 19:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B37BF804FB; Thu, 21 Apr 2022 19:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45420F80279
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45420F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dfp6quhO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC82A61E08;
 Thu, 21 Apr 2022 17:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D343C385A9;
 Thu, 21 Apr 2022 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561894;
 bh=Hm+I89eVrNyoJRbqZk91HLSchEvg3AO8RSEtWGOLKoo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Dfp6quhOYeuRtwn65OAUcbicpbFm9dCk/TRcoYo3F2AnU2dZ2xMcu/vrHPR1FxTlJ
 rtsb+fxjit/c3C5VK/dqYk2/pjhX65t/mS55HIwkK1u5a+0+lx6WK7Yv0JBvvNBM4+
 c7mh25GPsHFghTYwivjBKjq4+ab/sge/cR2osOb2Mo8q6GvwFdm6s8vkrYzoKznHw3
 zXM8li55buc9pBP9m/7f3M/GxdwfMUZf1nJr4iTVctng5j2MM9JXZILo1AxCUyYIl/
 PHEgPldmTCzr6duwXjf0g2EubiHqh+z8sShkX3M/W8Hga4oYgE7QC+INs+rdaFYW2p
 iHYWjRFV2zPRA==
From: Mark Brown <broonie@kernel.org>
To: steve.lee.analog@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <20220420044900.2989-1-steve.lee.analog@gmail.com>
References: <20220420044900.2989-1-steve.lee.analog@gmail.com>
Subject: Re: [V4 1/2] ASoC: max98390: Add reset gpio control
Message-Id: <165056189236.376935.16493956574599176087.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: ryans.lee@analog.com, krzk@kernel.org, nuno.sa@analog.com
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

On Wed, 20 Apr 2022 13:48:59 +0900, Steve Lee wrote:
>  Add reset gpio control to support RESET PIN connected to gpio.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98390: Add reset gpio control
      commit: 397ff024960634962af93e9e2775fc0e4fe7de92
[2/2] ASoC: dt-bindings: max98390: add reset gpio bindings
      commit: 68514c9f6aa676f98328844336fc4400244a8479

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
