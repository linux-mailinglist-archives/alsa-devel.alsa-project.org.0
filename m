Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1924DB990
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:39:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F947185B;
	Wed, 16 Mar 2022 21:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F947185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463155;
	bh=ckBpUYs7lGZ5xVv8erHYOiifWXqrkP05DbKl6A1MzhM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6IkLicyYi7iqd+IX2zEcENZK/JA3T6lABD3e0oBT1K+a1KBNoQMJqefu7bne//q9
	 voK+mjTtN5SUuK0mH0P7YUpkeGoDHy/ZZznWPQlpiS/nF4CDnpEMNflQ1b6OYzc+x/
	 sHihJ+/8vz5g3u/K8BvLJEh9qY1C5iTdKxnNs9G0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990BBF80538;
	Wed, 16 Mar 2022 21:36:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 214CCF8053D; Wed, 16 Mar 2022 21:36:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A93FF80535
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A93FF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JlAvFFQ6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A30261470;
 Wed, 16 Mar 2022 20:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE3C340EC;
 Wed, 16 Mar 2022 20:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462962;
 bh=ckBpUYs7lGZ5xVv8erHYOiifWXqrkP05DbKl6A1MzhM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=JlAvFFQ614+Y/9z+uHoovLZ2D34RImM7vhHicpisrn9mUPgCs9dCoMeHHKvh16Bu/
 DkENs9F6KIeRQE3xK6lpuU3jupIggS3otE8qqEkaGREzYqXv7w6QvSjVzuixD9LSnn
 IJTyofcFBkLLVJ/qbQn/vab/ZPvr65w4lLKBSINAtFORVtwofyzJuU+BQ1Sk9STkBf
 QFBbQOXVKU4KKanwvPOJrHRCQ6FmRvK5+WEHgkC8ZhY8hcRcCLHb3O2N9R3jVcw2LI
 LRjolW9TpyjYCVjyKy6Mzi6VBL9liP3znV7LQiWMci4I3gpL+/pGmRtdbaMm2Hl2Uw
 Q855HmIPnIyyw==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Bixuan Cui <cuibixuan@huawei.com>, YC Hung <yc.hung@mediatek.com>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Trevor Wu <trevor.wu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220316084623.24238-1-linmq006@gmail.com>
References: <20220316084623.24238-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix error handling in
 mt8195_mt6359_rt1019_rt5682_dev_probe
Message-Id: <164746295912.1220201.14496447901680691673.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:59 +0000
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

On Wed, 16 Mar 2022 08:46:15 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error path.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix error handling in mt8195_mt6359_rt1019_rt5682_dev_probe
      commit: c4b7174fe5bb875a09a78674a14a1589d1a672f3

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
