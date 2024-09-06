Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF32C96F9D2
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 19:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06E186F;
	Fri,  6 Sep 2024 19:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06E186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725643108;
	bh=Ky5xr/sSBZDrAsjeERPVYHP6ien22+G0FdWFrSyqed4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lviHwFsHUhkHdaI4pIE040pd7Ax/b+FNswlA516Y4zBgkoVh2/mLLR7Pg+Ej0DKQ+
	 F6HzEniD71dM1GdWufKsxkc3dm9cfp+HnkgOkOLaMyy9b1C69isJ5iNGKebzY98eHp
	 3PRkfY5uGbfqLKfU9FPTxRxa3frWGJ1uIcFjuWVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 770F9F8014C; Fri,  6 Sep 2024 19:17:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB14F8014C;
	Fri,  6 Sep 2024 19:17:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3632FF8016C; Fri,  6 Sep 2024 19:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B8E1F80027
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 19:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B8E1F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TwZyGZ/k
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8910A44F42;
	Fri,  6 Sep 2024 17:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06C1C4CEC4;
	Fri,  6 Sep 2024 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725643068;
	bh=Ky5xr/sSBZDrAsjeERPVYHP6ien22+G0FdWFrSyqed4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TwZyGZ/kJZwVTbF34hv8KFQvjvlwnPKlf56HluWCSsUdm/oRqCiz1xPkpr9cE+FYJ
	 8eY+mxNorshQq+cx0UuXB3lzoxX/Y3Wn+gLXSsdKGjlmtB1XFbLYESfMiKgx8gpE6n
	 o4L7dmUGK9xQyCa8U1aYewIdWixlAgMVjZs3TlUd9q6Tri23KkcuNLtzQzkR1/tu6L
	 763EeB7gubteXdu+sIaXTzeZkZn0K/x2NYtwbfmhgIKYrwBijo8FcO1O8Ivc3NxHJE
	 jzqmDGHqkmq2rrTgrIGWoKPK4LXqSptUbP5kezNSKnjzAQ1tujgSgejhwGl2uOZeyk
	 jGvn0INNYylTg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 =?utf-8?q?Amadeusz_S=C5=82_awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o752k7gq.wl-kuninori.morimoto.gx@renesas.com>
References: <87o752k7gq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: makes rtd->initialized bit field
Message-Id: <172564306658.1104804.1518844336804506744.b4-ty@kernel.org>
Date: Fri, 06 Sep 2024 18:17:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: QUO63EHGMGLE75XYW6ZINO5CPVZVLPHX
X-Message-ID-Hash: QUO63EHGMGLE75XYW6ZINO5CPVZVLPHX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUO63EHGMGLE75XYW6ZINO5CPVZVLPHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Sep 2024 05:14:29 +0000, Kuninori Morimoto wrote:
> rtd->initialized is used to know whether soc_init_pcm_runtime()
> was correctly fined, and used to call snd_soc_link_exit().
> We don't need to have it as bool, let's make it bit-field same as
> other flags.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: makes rtd->initialized bit field
      commit: 4849b2f78020cf0e3ba67777aadd07c620c91811

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

