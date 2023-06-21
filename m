Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F89738921
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 17:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 125DA74C;
	Wed, 21 Jun 2023 17:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 125DA74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687361421;
	bh=8sWjYA4N+fAraCJGgq/hNuwy2uwuyh5U7Ae9A1i5Soo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8gN6XIAFXt2Ur+TImlpr4T6DCYvFEcqOlKfDAYVHmNictMOUvfnz5mp9CBX9EWmT
	 l41jT+Le2pec2mshlanO3hRPl2aigZ5Zc43Z7ih1xHLSxuZaX1dG5AHiyuuelTBW+V
	 KtdsaPCo0EZSv63gfBYSx5cWDJNfbvECGL+Vt0zM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85E3FF80132; Wed, 21 Jun 2023 17:29:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F100F80132;
	Wed, 21 Jun 2023 17:29:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE38F80141; Wed, 21 Jun 2023 17:29:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DE76F80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 17:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE76F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WR6Npiob
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DB9661597;
	Wed, 21 Jun 2023 15:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69059C433C8;
	Wed, 21 Jun 2023 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687361350;
	bh=8sWjYA4N+fAraCJGgq/hNuwy2uwuyh5U7Ae9A1i5Soo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WR6NpiobZ/y7MqNA6DkkgIbDms6UHEZ/RkHeaaDm1xDhA4B12AM631tMtqXeax47V
	 KOf3pFJojygW1W3H+0PbJJ+K3N8a3FbVtnLd3UWZyP7SJwaFX2X64dZ09xFaPNS/m9
	 iMzwZCBIv0gjChdTWzGgqOJd1IN0NGGLAql/3PXYQUeMy7m8JOmyriYiwb+WbdReMC
	 Md0eutFCUySEBItiAujtPE1QvQDgbvrwlr4Ptkd6Fe+SK21ygXkNNh0G6LtrKat0XO
	 ffCpSSHaQJ7c0WaWLBl9i11+K+7oKwpEJ6hkJ5M7UzHW0g7BFpYK/wW62M4kmkREYX
	 HvRVb4chSgdJg==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 yixuanjiang <yixuanjiang@google.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230619033127.2522477-1-yixuanjiang@google.com>
References: <20230619033127.2522477-1-yixuanjiang@google.com>
Subject: Re: [PATCH] ASoC: soc-compress: Fix deadlock in soc_compr_open_fe
Message-Id: <168736134915.407715.9511058115081614816.b4-ty@kernel.org>
Date: Wed, 21 Jun 2023 16:29:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: JPO5ZXXWX2EDI7ANALJKIHFYYF5BFVTD
X-Message-ID-Hash: JPO5ZXXWX2EDI7ANALJKIHFYYF5BFVTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPO5ZXXWX2EDI7ANALJKIHFYYF5BFVTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Jun 2023 11:31:27 +0800, yixuanjiang wrote:
> Modify the error handling flow by release lock.
> The require mutex will keep holding if open fail.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress: Fix deadlock in soc_compr_open_fe
      commit: 2222214749a9969e09454b9ba7febfdfb09c1c8d

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

