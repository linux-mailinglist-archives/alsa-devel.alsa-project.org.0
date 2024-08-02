Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A829462FB
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 20:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE96D37F6;
	Fri,  2 Aug 2024 20:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE96D37F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722622911;
	bh=G7JBKRrOhMKLRs3Q0JQ80dT2AI5Js5oqFIMYQMzMrO4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qtwp8r7SJ6vdVOYEZ9IX7K1K+gZHGkwAboNwCgb7NSQLliTv13HusUj4Kxzw++Vnv
	 fjZENvUQDgffV/QipPFV1SADbkx55D7z3MR6+Wcixl6fCOsVEnK96umRxg4qiqppxz
	 aeGdvxwP1aXKby8SvqMs1525jm3Mk4soNao5suxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE7FF805B2; Fri,  2 Aug 2024 20:21:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B300F805B0;
	Fri,  2 Aug 2024 20:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0610F80269; Fri,  2 Aug 2024 20:21:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08452F800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 20:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08452F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WYgLr98n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B72B62B15;
	Fri,  2 Aug 2024 18:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4490CC32782;
	Fri,  2 Aug 2024 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722622867;
	bh=G7JBKRrOhMKLRs3Q0JQ80dT2AI5Js5oqFIMYQMzMrO4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WYgLr98nhqiJFVNGCB1MZMWgG4GkCmgKRbVTkOmG0lBdFgdX0MsWcKTzOXvjlAvCe
	 bWSE9XgSayIl6Ucd8yI+YnAPO77jvLOPcdTnYOAhsf6KZ2/cu0Ewc091xADQIWJDrl
	 PAicMD4Y3/qOHXSI9oWPY8sMwZrnA4b931YXg2QjcTroB4TM011XR772JlvSi8MQXD
	 eSbyBNEq56uH/7ReEU2apiraTDAhw7tq7JQrwmfJQwEPZY2rm8+u8yzVDsAuCQ8ltU
	 VCaTecLrBFC/Ph6JHZM2/a0ovN/7EFq/fKpNnh2/kwk4GH0u4cCfBJwlvAg4sO+mgF
	 ZxleD+1KV8MUA==
From: Mark Brown <broonie@kernel.org>
To: jonathan.downing@nautel.com, piotr.wojtaszczyk@timesys.com,
 vz@mleia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Yue Haibing <yuehaibing@huawei.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240802101044.3302251-1-yuehaibing@huawei.com>
References: <20240802101044.3302251-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: lpc3xxx: Make some symbols static
Message-Id: <172262286392.83468.2866189640414967072.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 19:21:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: UHIB5TN3NM26WHZF7TDIKZD7X2XJDWQC
X-Message-ID-Hash: UHIB5TN3NM26WHZF7TDIKZD7X2XJDWQC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHIB5TN3NM26WHZF7TDIKZD7X2XJDWQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Aug 2024 18:10:44 +0800, Yue Haibing wrote:
> These symbols are not used outside of the files, make them static to fix
> sparse warnings:
> 
> sound/soc/fsl/lpc3xxx-i2s.c:261:30: warning: symbol 'lpc3xxx_i2s_dai_ops' was not declared. Should it be static?
> sound/soc/fsl/lpc3xxx-i2s.c:271:27: warning: symbol 'lpc3xxx_i2s_dai_driver' was not declared. Should it be static?
> sound/soc/fsl/lpc3xxx-pcm.c:55:39: warning: symbol 'lpc3xxx_soc_platform_driver' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx: Make some symbols static
      commit: a1c2716738b7ba9e912e04872639dd39c72baa35

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

