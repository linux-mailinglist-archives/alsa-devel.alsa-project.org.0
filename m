Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E294C617
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 22:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11D9E80;
	Thu,  8 Aug 2024 22:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11D9E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723150698;
	bh=3gMQ/W5MtQjyMsV0X0nPhRzuZIpjk6OuKMuGIcJFv6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=La0d14Tj0J2niQryWopFUvJUnYBQR+qUsolG8EWw3nGeC0TcWr4Eg/BhBD0LUsFv4
	 PI9D3YuySgY+IMDC4Dkip3iLwdFAz+4YeVXysaDGs37YJaAhW89X0oiuIZ5CbZ3sEO
	 R21fs+aBsBgjD1ZFh7SofTCWqZM9oKKnmoHl+50I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57082F8063A; Thu,  8 Aug 2024 22:57:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D327BF80634;
	Thu,  8 Aug 2024 22:57:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61D1AF80602; Thu,  8 Aug 2024 22:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 938C0F80579
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 22:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 938C0F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q2sQyGd3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50900615AF;
	Thu,  8 Aug 2024 20:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33533C4AF0F;
	Thu,  8 Aug 2024 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723150625;
	bh=3gMQ/W5MtQjyMsV0X0nPhRzuZIpjk6OuKMuGIcJFv6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q2sQyGd3xhLLhyJ0+0WxAsuxr5H53VpCEx19OqoMBm04uz/FRwH4OE25JGbUc1cGS
	 QIndHedZ4c/vG+zzq+Y6x8uCUbQw7wxshth79NsQtPzVu3BbBvxsY7dp149x+bwhiY
	 NKj6Yf2akZvpFq11I/xvJBhts4gM5GjXL9pXaAgjVTiqLC0O+fXPxktxefcIdrkBKX
	 XgYD/CpKWGHsg14aRouLFfys2kpoKflz73zAqa9NamjdUvhYtbGJAYDOHhLBS86AXK
	 /Yt3nEHgpNr5j9mr0JG53vZLwIp7tdHjAduaoruYjLMfwMnAQD0ypYpSc8IlJEyAjS
	 tr0YLjzpmXrQQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20240807025356.24904-1-zhangyi@everest-semi.com>
References: <20240807025356.24904-1-zhangyi@everest-semi.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: codecs: ES8326: button and input
 issue
Message-Id: <172315062082.475406.2464189744882534601.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 21:57:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: F3N42BK2PSYBG66XPITH2VSWVICKG7VQ
X-Message-ID-Hash: F3N42BK2PSYBG66XPITH2VSWVICKG7VQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3N42BK2PSYBG66XPITH2VSWVICKG7VQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 10:53:54 +0800, Zhang Yi wrote:
> TO solve button and input issue, We have modified parts of the driver
> related to button and input.
> 
> Zhang Yi (2):
>   ASoC: codecs: ES8326: button detect issue
>   ASoC: codecs: ES8326: input issue after init
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: codecs: ES8326: input issue after init
      commit: be942e3d20cf666f6174f47826914c3b5ea61d85

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

