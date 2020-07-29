Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF62231FA7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 15:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6CC616F5;
	Wed, 29 Jul 2020 15:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6CC616F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596030863;
	bh=CiATFAX2ENWtL7XGl9y/KMHm4CWjbPuuZ50kAWq9B10=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWyG05r4eiAqdmFTxasRm8J6XuBxxadh/1ktUaZiCyN9xLT2QPd8PaAY+g601wm8U
	 owK1AK6c9YvwQnaw6OiF036Bgd/4zmznhZX0Nd0/RfsH7tbsYlqvYQkMpW2obOU0AZ
	 w9Jv5DFzy1gPexApasEIJKQ+6KfCinHbjKdHFVOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDDFCF801D9;
	Wed, 29 Jul 2020 15:52:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99283F801A3; Wed, 29 Jul 2020 15:52:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB794F80125
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 15:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB794F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UDJLImNE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE98F22D2C;
 Wed, 29 Jul 2020 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596030751;
 bh=CiATFAX2ENWtL7XGl9y/KMHm4CWjbPuuZ50kAWq9B10=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=UDJLImNE4Xj/OlhPe4563hYtrS8TlH+R8bnJLI4807Xs7LrHfNCLwyCVpUldjJtq2
 M/mTkvncT4sultxlZnB9PX6ZGV2LXR59QEjxhKDUb0/ANLT13Odivzt6Rht4dOqTz/
 3F3jpc8J1T80+YrZWDK8cuXG18jtccFiWAL7OFXo=
Date: Wed, 29 Jul 2020 14:52:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <20200728164339.16841-1-dmurphy@ti.com>
References: <20200728164339.16841-1-dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix various style errors and warnings
Message-Id: <159603073223.46331.3803625262961660773.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 28 Jul 2020 11:43:39 -0500, Dan Murphy wrote:
> Fix white space issues and remove else case where it was not needed.
> Convert "static const char *" to "static const char * const"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix various style errors and warnings
      commit: e5448d7ec656e6c5ed59f4adfc979742fd1f9b07

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
