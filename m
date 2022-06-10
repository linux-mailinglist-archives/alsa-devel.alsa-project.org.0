Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5B546C40
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 20:23:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0C7318EC;
	Fri, 10 Jun 2022 20:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0C7318EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654885386;
	bh=yEAAXCEqcQVHO5K/f+JF29UarljBadFTFpcNW5TXzP0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBqVKjWyM3hYS6Ot7RLuENC+uX2pAX58HsArUfDMG7ItBy/lBJCKWTOE2ZKGWP/G3
	 e8r+lsfEHWagEocgndGfdP9aOHorgZcTOB47PGrgcdRsRXIbQjDhnckpvL73bMwXCl
	 RhWIErBqRO1Am813Zp6e/T2JqC4H4FmJRQCwiT6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08427F80515;
	Fri, 10 Jun 2022 20:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB274F804D8; Fri, 10 Jun 2022 20:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FEDAF804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 20:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEDAF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mvZpjfBW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89453621E6;
 Fri, 10 Jun 2022 18:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F12C3411C;
 Fri, 10 Jun 2022 18:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654885286;
 bh=yEAAXCEqcQVHO5K/f+JF29UarljBadFTFpcNW5TXzP0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mvZpjfBWRXyIGIZk/C5pZN8s8yRBnL359oekoHQdrA64kCCCEy2v/e2gQBxifRHzC
 ChL5Vb8BWzUhkgHLWVIuTdrWIE6FPq6yy6rqn6d05yUzmIw0+Cgs1Y7Q/3mZYSCpRr
 6fBXGzFOXMN3uQ+wLh9h0Q28lJhWjSDF0hQqNMzN4U6M/VqpKfobs3iN0z8cs3bc0R
 yLXK2p5vdCENDsuDV3C3FrqDQWUqYGtNvhWXjNcZxSigz8ipxyx8HEcxukA95LCxeg
 iwyWlB0zrpyXDi8MCwysSxXtGRNPOHvHSC7c3zyY4x5hzn5gEt96w2KMBoLnu8tXTT
 rGpZJkV9XhPHw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20220610124420.4160986-1-amadeuszx.slawinski@linux.intel.com>
References: <20220610124420.4160986-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Remove unused hw_write_t type
Message-Id: <165488528458.2064162.9796208189773872151.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 19:21:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On Fri, 10 Jun 2022 14:44:20 +0200, Amadeusz Sławiński wrote:
> Commit 81da8a0b7975 ("ASoC: remove codec hw_write/control_data") removed
> use of hw_write_t in struct snd_soc_codec, but it left type definition.
> Fully clean it up.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Remove unused hw_write_t type
      commit: 81eef68f3bb78f5b3dc29032ffd804a4a2d7aaf0

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
