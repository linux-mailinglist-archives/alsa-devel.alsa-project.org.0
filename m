Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C76BB464
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:20:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60D251251;
	Wed, 15 Mar 2023 14:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60D251251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678886434;
	bh=+GTqSVMA+Yjl4iqOP/9lOHJk/AJVvCcYwWCiLeendcs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aIqEQED+/UVWeeRbTDNTjnz++DNdb+Yffq6MYIO3FIWPYE1e0yuuiIF0WaFTTew9+
	 GB08nD81j8vEyarUeK1tRH/8CnWk/+0D3Mz8n6uvKxcSIeGljI9gk8XYOoiheqnWFx
	 husXxOw1pZJDR9RlBhz1VMEM+7qxczQlulN8iOKA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC7DF800C9;
	Wed, 15 Mar 2023 14:19:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38842F80482; Wed, 15 Mar 2023 14:19:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C556CF800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:19:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C556CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bt0hXkRX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E37961D84;
	Wed, 15 Mar 2023 13:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CF6C4339E;
	Wed, 15 Mar 2023 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678886369;
	bh=+GTqSVMA+Yjl4iqOP/9lOHJk/AJVvCcYwWCiLeendcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bt0hXkRXGvk9zDBHIIsFcKM/Ppdzw6qLcH1E4cNAidsnV+7zRhuiaTUmycde/TZWT
	 tobGM5oCKgU6MifLaORNF5NmBys5iZcAoC8eqkOYmHRF9GI0PLrC/Ru2KrllOmqzCl
	 F5gfd34UP/x4jKhL0xTZ1rqaLRC7TAn3f2fylxkO5xTkOTLOMU9DYWI5ugWm/AlkXx
	 gcNWAT1ys1i/nIR60ZsrjhoBUnW/9Is4UPiRM6syT0TW+tA8bcZA5gN5cWXoc+QWhx
	 UKhfEyY82bK37DW6JADHS0xrrjfhjgCs/ZMhKWfRMKywm3OKHfiUXfl1TXEN0JyUzT
	 PdY+EDTTUZGGQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wn3u64e6.wl-kuninori.morimoto.gx@renesas.com>
References: <87wn3u64e6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-dai.c: add missing flag check at
 snd_soc_pcm_dai_probe()
Message-Id: <167888636886.25434.3956364869846749147.b4-ty@kernel.org>
Date: Wed, 15 Mar 2023 13:19:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: QHIVOUGYDGGX5MJCTV6ZNJRYPV5GEPSP
X-Message-ID-Hash: QHIVOUGYDGGX5MJCTV6ZNJRYPV5GEPSP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHIVOUGYDGGX5MJCTV6ZNJRYPV5GEPSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Mar 2023 01:43:30 +0000, Kuninori Morimoto wrote:
> dai->probed is used at snd_soc_pcm_dai_probe/remove(),
> and used to call real remove() function only when it was probed.
> 
> 	int snd_soc_pcm_dai_probe(...)
> 	{
> 		...
> 		for_each_rtd_dais(rtd, i, dai) {
> 			...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dai.c: add missing flag check at snd_soc_pcm_dai_probe()
      commit: 5c5a7521e9364a40fe2c1b67ab79991e3e9085df

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

