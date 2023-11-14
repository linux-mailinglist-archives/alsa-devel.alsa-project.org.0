Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C27EAF5B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 12:41:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FB9AE8;
	Tue, 14 Nov 2023 12:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FB9AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699962086;
	bh=R5WyeVjyLoujfJPYPy8XhiJaSQmDifeaT8me+y8BsG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k2N0/vEVIlFyMyIx4/XFJeOljd4im5uTS4uu28U8/JiV2Z6OgbsFLxYXhxGQfg0KJ
	 kZOeM+CGVjddcmMqFGDuyAm7mmRHTCAe65qmPu673yfsa0qd2gqkdyZNtO6KgQdrm9
	 GwGgi2nvdeBKZbAUxY5Q+iz1Nb7cWO1hsBF6Ydbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC8E2F805A1; Tue, 14 Nov 2023 12:39:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80263F80578;
	Tue, 14 Nov 2023 12:39:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A60BF80587; Tue, 14 Nov 2023 12:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 939F2F8022B
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 12:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 939F2F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d2NmGNh6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BB3ECB811EF;
	Tue, 14 Nov 2023 11:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C6EC433CD;
	Tue, 14 Nov 2023 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699961954;
	bh=R5WyeVjyLoujfJPYPy8XhiJaSQmDifeaT8me+y8BsG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d2NmGNh6KSNWC8YGusiyPDIsxabVPJkngcfe4S+5sbpxqFIjhPfn70tc0Y+OJlc6D
	 f2p4dxpJbrzZQBgJjR69VZw6Nn1u1JslOrkaa8Cn601adZuKG4Ckw1SHCjJ0BzyFDI
	 XPjP+ix70+GO5zVaA94PLD0TZhltaLidaJYo2IF8KVmj3v+0mgUSXxoaUNaPizkGa3
	 nddmZ+ON7cfnMy0chqSXbsQZ9pLkJ/+qrKXVPxPy4wiL0KBS9SnF7DG+1VFJyZeVI6
	 9M1w3rGAOvSrkRU/RLG72ve6KzaPTtRzB8pWCRJS9TuZIPQ6dvAEtGOg43NZOG2JqL
	 Jf6Isw4cbfSkw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
In-Reply-To: <20231113155916.1741027-1-ckeepax@opensource.cirrus.com>
References: <20231113155916.1741027-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8974: Correct boost mixer inputs
Message-Id: <169996195207.29934.7895358286232527637.b4-ty@kernel.org>
Date: Tue, 14 Nov 2023 11:39:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: K53TE7BTJ2AMVVON73BVIVJYLCZILOBJ
X-Message-ID-Hash: K53TE7BTJ2AMVVON73BVIVJYLCZILOBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K53TE7BTJ2AMVVON73BVIVJYLCZILOBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Nov 2023 15:59:16 +0000, Charles Keepax wrote:
> Bit 6 of INPPGA (INPPGAMUTE) does not control the Aux path, it controls
> the input PGA path, as can been seen from Figure 8 Input Boost Stage in
> the datasheet. Update the naming of things in the driver to match this
> and update the routing to also reflect this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8974: Correct boost mixer inputs
      commit: 37e6fd0cebf0b9f71afb38fd95b10408799d1f0b

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

