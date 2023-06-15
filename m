Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA2731945
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 14:55:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D9D82B;
	Thu, 15 Jun 2023 14:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D9D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686833709;
	bh=wnmThzC+j9lDdLEcAD0pIRR1CHiL1hMaMBlNZUalJNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZ/Sx4PUHece6wtpTX7NtxLHQDGGfy8HKPOTq5PybgUK68GRor06KsqqPIpKjv4nA
	 5S9hrNmmxGfdm56BsT9pxDc6QYNDRatC01qMyTqxezg5zX9kCq/6+iTan5tOIsvqlO
	 y5RyVw382GGFEFlcLm9XFU18walqg8dcuqM1I4fk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA6D0F8055A; Thu, 15 Jun 2023 14:53:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE81DF80548;
	Thu, 15 Jun 2023 14:53:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3860F80155; Thu, 15 Jun 2023 14:53:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65702F80130
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 14:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65702F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WGIECeun
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 332CF6210F;
	Thu, 15 Jun 2023 12:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF24C433C0;
	Thu, 15 Jun 2023 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686833596;
	bh=wnmThzC+j9lDdLEcAD0pIRR1CHiL1hMaMBlNZUalJNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WGIECeunQM85OLmI7FiAai4P3eIZRjxFZ4CK3Ps0buQMgcQd5ry8O/NHW9iSRv/Sh
	 QacPXyvJ/DErKB+Ao8vbDfUSSHhoFU92Kv2PGHFfF1CTH8Qu9fNWo52fDzIYkz8xi3
	 t4LH+p9dJcrRxHbcm6cgaL3pBtUWffnY9M0AUfjSt0h3kHSp+Gs+4P5zw5a8/e/5XK
	 GTZRxBDTJygYGDvMYCTIqilUKpiojrb7Ptg12dAfVN51g/mcCgPSrAU/3f8lIeUe6u
	 c1BJYm832NeOQNL7KLBpYvHJH70yFsJPaSB6mGFsE+WQANoHBmmlxXLNdH9vJ34zSq
	 //6XB/RsZgqtA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bkhhxpc6.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkhhxpc6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple_card_utils: remove unused
 cpus/codecs/platforms from props
Message-Id: <168683359508.543460.8904351812277422730.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 13:53:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: RKFK2QLK4RUTS34KPEGM2SPEZ63BIFBS
X-Message-ID-Hash: RKFK2QLK4RUTS34KPEGM2SPEZ63BIFBS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKFK2QLK4RUTS34KPEGM2SPEZ63BIFBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 05:32:42 +0000, Kuninori Morimoto wrote:
> simple_dai_props has cpus/codecs/platforms. These pointer were used
> for dai_link before, but are allocated today since
> commit 050c7950fd70 ("ASoC: simple-card-utils: alloc dai_link
> information for CPU/Codec/Platform").
> We don't need to keep it anymore. This patch removes these.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple_card_utils: remove unused cpus/codecs/platforms from props
      commit: 45b4ad53d4840d92681060c11fcd4f55b1c2f246

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

