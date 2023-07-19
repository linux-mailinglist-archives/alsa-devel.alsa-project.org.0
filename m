Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD5759CCA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 19:49:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC283203;
	Wed, 19 Jul 2023 19:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC283203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689788946;
	bh=eCinvZYUH/JC1KKDwH42gcUrbZIde3UQTwfcSlixCaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ut1rgTYkjlb8nhyNNfpsccCufIBQIH3CZGKiXEBZkq3osSXaD4jjguJP+GE8j8pCc
	 OuzP/0/RKccV3ZXqif4WThY7FbUrfDUz4FFr4nvJsbXgHNsgDGo78LoJABe6CrXyMZ
	 NgZ9188yJeGLgnUPjMakGnFSpeiEucIXnCsd+630=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BD68F80553; Wed, 19 Jul 2023 19:47:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A640DF80520;
	Wed, 19 Jul 2023 19:47:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12A26F8047D; Wed, 19 Jul 2023 19:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CAEEF8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 19:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CAEEF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jj9gx+ck
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 95CBB617A2;
	Wed, 19 Jul 2023 17:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC17C433C8;
	Wed, 19 Jul 2023 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689788834;
	bh=eCinvZYUH/JC1KKDwH42gcUrbZIde3UQTwfcSlixCaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jj9gx+ckIzm7lTs3PzLxN4ngYBtS/+aKA4qtJcxa54BzJjaxIF7eYH9XaoENcQMO/
	 ghb7JBRhRu1eOkix/LTK+y8IV7ZdCfxQkUjsTFopKVygyPcKZNLKn7N0e8KJ6lDY+S
	 yuQcC164lNTw58l6WPFuWUe0HOonS/cSDM9F83N057ekEp+RUTFdsDxJTBR3UV76uA
	 87/Hwkr+NH3liqvCALC53Tc3cTMH1Dkhca2bF40CgBgIpHal7H8BhtKozTVVdC3xjM
	 trcLMeZXhswfc+YkFnnqAqXEtciSAOvKpWY1B239fRXg08QsY+esMGTHl8W97WLuPS
	 COPvfKGzmG5xw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230706064123.29790-1-trevor.wu@mediatek.com>
References: <20230706064123.29790-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: DPCM used FE and BE merged
 parameters
Message-Id: <168978883184.125745.10740530088863632779.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 18:47:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: SOZ3BRF6PYKDON7AXYGLLOWPB4AVU63W
X-Message-ID-Hash: SOZ3BRF6PYKDON7AXYGLLOWPB4AVU63W
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOZ3BRF6PYKDON7AXYGLLOWPB4AVU63W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jul 2023 14:41:23 +0800, Trevor Wu wrote:
> To ensure that DPCM takes into account the backend hardware limitations
> when user space queries the hw_params of a device, we need to add
> dpcm_merged_format, dpcm_merged_chan, and dpcm_merged_rate to the FE
> dai_links.
> 
> This patch includes only stereo FE dai_links, since multi-channel FEs
> may be reserved for specific purposes. Therefore, it may not be
> appropriate to consider BE conditions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: DPCM used FE and BE merged parameters
      commit: 30019d220cf9ec4df4e5f5d9082baf5519516018

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

