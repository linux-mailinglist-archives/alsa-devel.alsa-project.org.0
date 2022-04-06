Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6ED4F6004
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 15:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE9A11725;
	Wed,  6 Apr 2022 15:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE9A11725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649251867;
	bh=l3divZWw+E9A2Yng2WHTTF7Ibc8GkDmAmP9AmSHkIaA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLy3yn2+ND+OX46KcSrKjsCqPQ7bnsEfjgZpPq2Hyi6ShwqBom3DZAJUBpG9QBIXw
	 jBpFPDJBDQP/s1O48ksJSU8tE0PbYw2gO9VxPLvFBe45+u+5ccClAmyXKC1l2joNt/
	 +BEDf2KnFgxeI+Wwj7ukY/U3syv4DctXOA/k2Sz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 943F1F80529;
	Wed,  6 Apr 2022 15:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4440BF8051F; Wed,  6 Apr 2022 15:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A567F800D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 15:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A567F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="igR6KWLH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF39E60B86;
 Wed,  6 Apr 2022 13:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C00C385A3;
 Wed,  6 Apr 2022 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251728;
 bh=l3divZWw+E9A2Yng2WHTTF7Ibc8GkDmAmP9AmSHkIaA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=igR6KWLHQZ2sB82z8sva1vGQ9Rhoj+O/eAap7EEG6bra0gFhrrmoJint3XuTZKfca
 XkwTf7BnoE/Ona40Y8ZUYAK2aKbbgQiFEd07ySFZl/TUwyne/i0YmNZsavmI0ZbOpQ
 mI4m/h9IacwI/GJ272sdj/YVcPr+LiD0NTQbgfXw7xGRocrG1o+e3ldH4QgZVSSA4Y
 jTWS441ZPh7O16YKEp07332UhHHI88kL6eqjmJtOnQLs6sEFTQNBMbh9DuMaYWcVBw
 WStCOuLC/mtyBFdRFQUoaoSo7bdb/43728TNve3YPOqv810EiZEIQm1IvixtbZ8YLY
 4ICQTxx9+j0Tw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tiwai@suse.com, linux-mediatek@lists.infradead.org, linmq006@gmail.com,
 ryder.lee@mediatek.com, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz, alsa-devel@alsa-project.org, rikard.falkeborn@gmail.com
In-Reply-To: <20220404093526.30004-1-linmq006@gmail.com>
References: <20220404093526.30004-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Fix missing of_node_put in
 mt2701_wm8960_machine_probe
Message-Id: <164925172592.83821.12895758301254596551.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 4 Apr 2022 09:35:25 +0000, Miaoqian Lin wrote:
> This node pointer is returned by of_parse_phandle() with
> refcount incremented in this function.
> Calling of_node_put() to avoid the refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Fix missing of_node_put in mt2701_wm8960_machine_probe
      commit: 05654431a18fe24e5e46a375d98904134628a102

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
