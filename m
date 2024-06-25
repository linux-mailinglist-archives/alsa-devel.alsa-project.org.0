Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D877916BC1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 17:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDE083B;
	Tue, 25 Jun 2024 17:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDE083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719327935;
	bh=x6PiOVKBL/VRTyNl3kxAorSe69knhY64lihvUcTKE/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XHg+vwHQuSWfQB8YEgbX9rCiB9kKkJWr9XOlAqM8v3GVdC+ieHvZybRWrhMPaExHH
	 IWRK7wXuAP94LB1tAvhCTWgEVmEQJMycqXFJEdSUBxWq9ftPSUxowtRT4eRsY9S2SY
	 fOz0J3gAZ/0KLmUBq4g2ShUAKRcjrH6rgDWo3T64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF3FCF80589; Tue, 25 Jun 2024 17:04:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1909CF80603;
	Tue, 25 Jun 2024 17:04:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A502F800ED; Tue, 25 Jun 2024 16:59:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FD22F800ED
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD22F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jrq9S2Je
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3F2ACE1ACB;
	Tue, 25 Jun 2024 14:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C24C32782;
	Tue, 25 Jun 2024 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327244;
	bh=x6PiOVKBL/VRTyNl3kxAorSe69knhY64lihvUcTKE/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jrq9S2JeYg6qD057OpL9jY3ZletVuxC3sA4DKCYsqyg6DNLaJu7tnnIPOrwpCZbk9
	 oTTJm/bmlvPfUctVgczafiquv6WtemADFCxbkwu8/PYxFtoOqOK4yvPWflPmsA3rSV
	 ifRbws3FUiF5ln+TWrMRUtswvV5Y7djdFjWSDANwNMOxot3DDOlOgYSVTyIrzzHlkJ
	 ilaFFGHKoY6TjsB1/l3F+x2l9hRhfSnZathUtsJvBGU/VdtiIDOBsPCiCbSnQfvd72
	 6Whz+OREdYLnBP46QW/ctBsJjLOuYl1+LOxivxzkD7gDJbo62ziRJKSxhgGSUDjRer
	 XQM1ZR4Ft/EFw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20240624030607.4307-1-zhangyi@everest-semi.com>
References: <20240624030607.4307-1-zhangyi@everest-semi.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: codecs: ES8326: Solving headphone
 detection and
Message-Id: <171932724322.283378.1009779697136689899.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 15:54:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 7BFAWRHP4GVYFNBQYPTNGBQSGYXSBEKM
X-Message-ID-Hash: 7BFAWRHP4GVYFNBQYPTNGBQSGYXSBEKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BFAWRHP4GVYFNBQYPTNGBQSGYXSBEKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jun 2024 11:06:03 +0800, Zhang Yi wrote:
> We propose four patches to solve headphone detection and suspend issues.
> And there are several registers that should be read-only registers. So
> we create es8326_writeable_register, and set these registers to false.
> 
> Zhang Yi (4):
>   ASoC: codecs: ES8326: Slove headphone detection issue
>   ASoC: codecs: ES8326: codec can't enter suspend issue
>   ASoC: codecs: ES8326: Minimize the pop noise
>   ASoC: codecs: ES8326: regcache_sync error issue
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: ES8326: Slove headphone detection issue
      commit: 4eed78198b30c4c5975e454e7b1e6e25a7ac7353
[3/4] ASoC: codecs: ES8326: Minimize the pop noise
      commit: 7e7dbdee96cbc660e7e8d3d9d7a512acaa6ca69d
[4/4] ASoC: codecs: ES8326: regcache_sync error issue
      commit: 34fa846f52f9fbef8aa262d3b39e71188e8dd884

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

