Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C1F7DC04E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 20:22:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5399AAEA;
	Mon, 30 Oct 2023 20:21:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5399AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698693743;
	bh=VUedzfdxgy8KBbjhQK+ZOsIQ4Ic1WozEOuqNGFrnlU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SuO41l+nvn5GBtqUVKOgrW2/qDkNGPJuJGt8QHlAZrN3ZIFUNXF44l7VaO6+2P7iz
	 8CGWjur6HUw/FqE2U+9Z8J+e3D6877VMfTD6hTXqs1qPFm3eHcGcSDZqOO8YrSU3vl
	 m3K/Nk6xLkUETpJ2a9y64lUqX9ROve+yoEWy3HrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EA83F8016D; Mon, 30 Oct 2023 20:20:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0137EF80494;
	Mon, 30 Oct 2023 20:20:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E24EF800FA; Mon, 30 Oct 2023 20:20:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22221F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 20:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22221F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JLfbXoVP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6687CE1353;
	Mon, 30 Oct 2023 19:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32663C433C7;
	Mon, 30 Oct 2023 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698693628;
	bh=VUedzfdxgy8KBbjhQK+ZOsIQ4Ic1WozEOuqNGFrnlU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JLfbXoVPqAgBQns9OtWJ5MrXHi4OtVNxl+FV/stJyYKKTCZy2/B/KuMnemTUxoVr4
	 hH6LTd0ndJMml6aO1+Z1zXEIskq3eGMYlpb/XgOOOld7Bf4O+rQjekXoI0xyFzT7IR
	 UIYWETF3hfvStCAD7dJqfGw6QXyu5Hz5/wFeYviwFuJjKJP9jOPuYp7cxvwnt3iTCA
	 WOzyw14MtFtqNczCSS/wxllmEIcdDFxCPxBAzsffKhLu+sAUNzluRVQ/AdD6TqBhVw
	 7IDnuNYPvlBNSELbUaHXyRHm30AtzFhaTZYk+tAxXZ4juyeH2S+gEVdzywyb3WMXzT
	 WuttfUk6oS+JA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 bard.liao@intel.com
In-Reply-To: <20231030103644.1787948-1-shumingf@realtek.com>
References: <20231030103644.1787948-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt712-sdca: fix speaker route missing issue
Message-Id: <169869362574.44249.14676954361072454697.b4-ty@kernel.org>
Date: Mon, 30 Oct 2023 19:20:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ZLKENT5FEB7IXL4D74MFQDE3RCB7OCKP
X-Message-ID-Hash: ZLKENT5FEB7IXL4D74MFQDE3RCB7OCKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLKENT5FEB7IXL4D74MFQDE3RCB7OCKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Oct 2023 18:36:44 +0800, shumingf@realtek.com wrote:
> Sometimes the codec probe would be called earlier than the hardware initialization.
> Therefore, the speaker route should be added before the the first_hw_init check.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: fix speaker route missing issue
      commit: 1a3b7eab8500a6b923f7b62cc8aa4d832c7dfb3e

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

