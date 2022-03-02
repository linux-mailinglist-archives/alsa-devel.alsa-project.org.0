Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7D4CAB16
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:03:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B59D1DE9;
	Wed,  2 Mar 2022 18:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B59D1DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240634;
	bh=zQgX99RnmDfopMg14Npy7ylLj4lE4ZQcG0Wt4mJO/ns=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PKHUv5bZ9vAnML2ttVGXTpRntBc1qY5Y2BxGKaStgdjSHaN9g0TJIIDvFW2HePyDK
	 s4Lmg9mUzUNQhGdp9xmDQIbfsBwtbA0iwgmU+qPzyFDeAIOmy8ZsmrFJnX3XDwxU9u
	 S8qSDGT7Z3sevjKgiObIGPVSsIws1WlD3+9sdoMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F697F80535;
	Wed,  2 Mar 2022 18:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E6BEF8051A; Wed,  2 Mar 2022 18:01:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B1B9F8051A
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1B9F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z2zBthAA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E423A61922;
 Wed,  2 Mar 2022 17:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC051C004E1;
 Wed,  2 Mar 2022 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240462;
 bh=zQgX99RnmDfopMg14Npy7ylLj4lE4ZQcG0Wt4mJO/ns=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z2zBthAA3qQf62InUSodEhXBrKOBe0x7MWbBYY1wqRCTi32kpGGBma4gaacqrZl85
 721ybwPBYNV5JtBQXfisKS/iC3r6oRiXLxVX44c/xW5+YQwMlCdriDPjvtg4PhbzDo
 13LQt0llKBuSyFvPVk+ZuYxKNnwVWT8Vgu0gvG/J8C3D83c/f1Zg8PNOVwWNHoyfBQ
 fPVQ/kQv78TtNYNStBXD8WLEUhaQnYZoj8uuDyScjqI/zvVu42yQwWc5Wt8b8H8om4
 Mo6f0HJucb8GkjjH/gm/vjuyCoEnnQLEfkbomNTZDpEdKUc4QCb/FsLxgQ5l2/6B+W
 oaxyK+cVweUEA==
From: Mark Brown <broonie@kernel.org>
To: Zhen Ni <nizhen@uniontech.com>, tiwai@suse.com, perex@perex.cz
In-Reply-To: <20220302081502.25367-1-nizhen@uniontech.com>
References: <20220302081502.25367-1-nizhen@uniontech.com>
Subject: Re: [PATCH] ASoC: amd: use asoc_substream_to_rtd()
Message-Id: <164624046142.1145067.13335367262835814922.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:01:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 2 Mar 2022 16:15:02 +0800, Zhen Ni wrote:
> Uses asoc_substream_to_rtd() helper.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: use asoc_substream_to_rtd()
      commit: a2253ec7aef2c942630ecbe3380690bd3a704a94

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
