Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EF89E230
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 20:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443FD2BC1;
	Tue,  9 Apr 2024 20:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443FD2BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712686144;
	bh=d4cAaxcXhbECSpPwboNbBXskrJZKONBbneYV3oJtUB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PIhiFqH2vXSuXxm9wULS+v+hvNrT1/zAqv5QMKWN/pVKtUsakG6Sv5dk4itSvKN1x
	 wpGWQHBJxwctq6BEc1fNx22Wk9Jqk5oVKmZmeRxqMzl/RrttR7yI3WOslXbn4++WtN
	 7WcmsOuRq/QmHYZ85a5Tg+hqh8JyFmD/8hPyfXZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4CB3F8058C; Tue,  9 Apr 2024 20:08:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F3BF800C9;
	Tue,  9 Apr 2024 20:08:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DD27F8026D; Tue,  9 Apr 2024 20:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EA2EF80130
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 20:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA2EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FMgh3cQM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E410CE2317;
	Tue,  9 Apr 2024 18:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2E5C43390;
	Tue,  9 Apr 2024 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712686098;
	bh=d4cAaxcXhbECSpPwboNbBXskrJZKONBbneYV3oJtUB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FMgh3cQM+X7awvvPTq9vflbt5f2HX8xKgtlHjd8WydnxYnn/TR9WD/HGbGFXjP+dW
	 swaJ4HKm/QJsGVAvLhIbjHqCv8sl0ydZ0KPDVJgM2kiZFUEQJDyuYVYYC0BUTuzEJB
	 tPGjbWatqNA1WleUC04kmUryH+3VJN22x88R6iOTVBjh+isCZh2U7q+hWBsHbXFVTz
	 qlqD6kdpSNj0GoAlC45mt6LcckYL4PRvw5LQbqMIJzTJ/74/txFxZUQxPTQR9BCjSl
	 uRsZRHPQGljitHdRqVUnIKgMXke2UzA+YKGVrZQDdgx+f5qMyn+9oifniKWy1ZnwDX
	 kBjU7PkOE5Kxw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
 albertchen@realtek.com, nico_cui@realsil.com.cn
In-Reply-To: <20240408091057.14165-1-derek.fang@realtek.com>
References: <20240408091057.14165-1-derek.fang@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt5645: Fix the electric noise due to the
 CBJ contacts floating
Message-Id: <171268609596.62778.13422449986488140101.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 19:08:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: WYORNJUTA2U7TYEVRX2WWIOA2ZJTG5JK
X-Message-ID-Hash: WYORNJUTA2U7TYEVRX2WWIOA2ZJTG5JK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYORNJUTA2U7TYEVRX2WWIOA2ZJTG5JK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 17:10:56 +0800, derek.fang@realtek.com wrote:
> The codec leaves tie combo jack's sleeve/ring2 to floating status
> default. It would cause electric noise while connecting the active
> speaker jack during boot or shutdown.
> This patch requests a gpio to control the additional jack circuit
> to tie the contacts to the ground or floating.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5645: Fix the electric noise due to the CBJ contacts floating
      commit: 103abab975087e1f01b76fcb54c91dbb65dbc249
[2/2] ASoC: dt-bindings: rt5645: add cbj sleeve gpio property
      commit: 306b38e3fa727d22454a148a364123709e356600

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

