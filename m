Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ED56BB465
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA066125A;
	Wed, 15 Mar 2023 14:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA066125A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678886484;
	bh=3djw40rUw+nNpWOAp6TWK8VOxJM0awfRn9QjEkHNKHU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=keqJjAX2f2BjZKlhWxiZARpFjlVrcxpR2xN6pJ66WAOp92JrwnKydVUFnRT2IFcyy
	 0W2sAVo/1ZHY401FHy819pUnjOZBXP6KCvIrjC9rcgBJhOJmLa9kuLxwA0MZbtvshm
	 nAsS/Upc6Yk0S/2+qBthZ6iELx/eUvhLcffc1oHU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66FA4F804B1;
	Wed, 15 Mar 2023 14:19:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3575F80423; Wed, 15 Mar 2023 14:19:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62E7BF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E7BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p4mBqVpm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4424561D78;
	Wed, 15 Mar 2023 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55B2C4339B;
	Wed, 15 Mar 2023 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678886368;
	bh=3djw40rUw+nNpWOAp6TWK8VOxJM0awfRn9QjEkHNKHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p4mBqVpmQqEMVYVJfpmuIorD57kG3lYxffPv8FymWpo+oa1igyr9QmzShnpRkmQjr
	 vUcbNL2SrLmsLfttD/qAkP83LbDvzTLCP+ZgFJ+vlpDkpj+ayiv9IyqhVi+PXTeD9R
	 p5Rb6yfIoyAhcubaB6aPioQT17mW921CqMT0mF5INNZqY4xNVM6A0ckFvuECsO6P1N
	 AupXtcFddWgsJzkScqnIio8WCUMa3CsufmGXHG9F/1DeTjngoc881sED5Ns3bE8sbL
	 9Lku4MJXOK5zUofRkbF7LF9BE38dCCHJjHqSjeEi2Llwli+U4o4oCylraGLzAozTYE
	 lIUBVexzbta2g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/2] ASoC: mt8192: Address spammy log messages
Message-Id: <167888636565.25434.17339984677925115588.b4-ty@kernel.org>
Date: Wed, 15 Mar 2023 13:19:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: QJF27YEQNLFVMQMGKO5QLG5U6OVRQY4I
X-Message-ID-Hash: QJF27YEQNLFVMQMGKO5QLG5U6OVRQY4I
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJF27YEQNLFVMQMGKO5QLG5U6OVRQY4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Mar 2023 17:29:05 -0400, Nícolas F. R. A. Prado wrote:
> A couple commits to make the mt8192 sound driver not spam the console.
> 
> 
> Nícolas F. R. A. Prado (2):
>   ASoC: mt8192: Remove function name log messages
>   ASoC: mt8192: Move spammy messages to debug level
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mt8192: Remove function name log messages
      commit: f147ca85d6ecaf65106d1650f3c2e8afacbc833f
[2/2] ASoC: mt8192: Move spammy messages to debug level
      commit: 5f2a53c0687b151c2ecad19995108b40df76ba86

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

