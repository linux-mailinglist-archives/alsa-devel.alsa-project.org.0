Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885186DDD94
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 16:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6B5F00;
	Tue, 11 Apr 2023 16:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6B5F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681222805;
	bh=CRz1qKpKwD8iOnTccK2DJ8nejiS+LrBWdZansG+v2EA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XtB0nWak6QVESiBlp+RosgixCu3vpE19WWA8ElO713jmnLPeXUXmoGpaEkcnPahTb
	 zgQhqbAqig0IVWPBvemO6zIwxk3Lolv3//YWJ3EkhIvN1odJRDfw0kOKGJ8QER+L98
	 Iosvd9b7fLbQaJOlGD4BfaO8WTQisiTn4xImoB2g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B63FDF8032B;
	Tue, 11 Apr 2023 16:19:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59DD8F80448; Tue, 11 Apr 2023 16:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D36F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 16:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D36F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ts4sT5p2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B38F46258A;
	Tue, 11 Apr 2023 14:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76958C4339B;
	Tue, 11 Apr 2023 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681222744;
	bh=CRz1qKpKwD8iOnTccK2DJ8nejiS+LrBWdZansG+v2EA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ts4sT5p2+hBzUiZXcfVFsOx79tgIGcMH1lo+o6Rs1Ct7XWGHd/ynTuAWO1yazDV8h
	 m73m6+/csj4UjqarwfQ76oOBMoCF40nOdoTe3dtlgHJOH2fAiQ7n+v6hrdYs9mqlW3
	 5HIQSZRaerGGJFiwwOq+EAjY/UqVDLKoKjbPdth1fomaiHyG887M0vEtOZye6hcUrQ
	 JjMUBDv0SAnvEfUumaO+aO+Q+wtuX7u5MdbwHPdgCv8lazawaxFMSM67bBzHv9oUlH
	 8YK00fregUCzwove319mBVhj26tc8L5x0OnIEOgbsOZO0WpHV5YYpIPgj1IoKZpdyy
	 wGhtVG2+lfvzw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>,
 Aashish Sharma <shraash@google.com>
In-Reply-To: <20230411003431.4048700-1-shraash@google.com>
References: <20230411003431.4048700-1-shraash@google.com>
Subject: Re: [PATCH] ASoC: mediatek: common: Fix refcount leak in
 parse_dai_link_info
Message-Id: <168122274119.54453.4476599786792187877.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 15:19:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: GM3JCVCD2AYNJIL7GROS6DPUP4CNTGKK
X-Message-ID-Hash: GM3JCVCD2AYNJIL7GROS6DPUP4CNTGKK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GM3JCVCD2AYNJIL7GROS6DPUP4CNTGKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Apr 2023 06:04:31 +0530, Aashish Sharma wrote:
> Add missing of_node_put()s before the returns to balance
> of_node_get()s and of_node_put()s, which may get unbalanced
> in case the for loop 'for_each_available_child_of_node' returns
> early.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: Fix refcount leak in parse_dai_link_info
      commit: beed115c2ce78f990222a29abed042582df4e87c

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

