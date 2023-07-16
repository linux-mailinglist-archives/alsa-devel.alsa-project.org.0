Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA61754EAC
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 14:52:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82066DF4;
	Sun, 16 Jul 2023 14:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82066DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689511976;
	bh=NT/Q09rhluS8L9Ka3lzCZxUHc07k1JJlwspZfH06+ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qpa4kZ5JJnjRzczF0JsCLfbmzqgj569viIasDZXDIDWnacWx4jffz2kUML7U+SDuT
	 LxLRY+9KtsW/uHW1AXklLDIE5OLwdiez5arJXMkZUwCx6rUtEf3rHRiRAqbP23hHfA
	 bRvlOa81k/gna+D0vn64ZfyHdSgdPKbfgwdDDdps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D0BAF80568; Sun, 16 Jul 2023 14:51:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2421FF8055B;
	Sun, 16 Jul 2023 14:51:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84414F80564; Sun, 16 Jul 2023 14:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66563F8055B
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 14:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66563F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fALiWLEu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00FC260C97;
	Sun, 16 Jul 2023 12:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A32C433C8;
	Sun, 16 Jul 2023 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689511885;
	bh=NT/Q09rhluS8L9Ka3lzCZxUHc07k1JJlwspZfH06+ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fALiWLEur/R/dICF3VxalAXgliFRc6IhELI71dYX6C01Q5KbczJFHPYzhLa8DrsRn
	 M5aEr7p1QGLbqFh2weD8gg7nB5wO+sUJWT3LxBi1msWwcpu97H2kKSi5kzB5oCl6xE
	 0Jw3m7nXysmaYtcnuUpK1bLHpenbCYgmgv/WSRTtJef5IPEk+M+buWFmtULkPG7Va2
	 cV1Q43/6k54KAuu5mmJeTzbnFz/gPkmpVDdb333pZIjR/D/13YFPnllhJfWfUA0mIr
	 o5JouRSXgZZuNdlwRwccC3LnvMe8q/r7dqLjsOyVR7bqpfBbG3VnWu7DGKOLH1Ceu7
	 nLgnpGf3Oj4pg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Yang Li <yang.lee@linux.alibaba.com>
Cc: tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230713065106.21564-1-yang.lee@linux.alibaba.com>
References: <20230713065106.21564-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: amd: acp: clean up some inconsistent
 indentings
Message-Id: <168951188373.111741.18081933032544174557.b4-ty@kernel.org>
Date: Sun, 16 Jul 2023 13:51:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: DZXAJCUA6JSBPH7ZSYWZHI3YSPBHJTTN
X-Message-ID-Hash: DZXAJCUA6JSBPH7ZSYWZHI3YSPBHJTTN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZXAJCUA6JSBPH7ZSYWZHI3YSPBHJTTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 14:51:06 +0800, Yang Li wrote:
> sound/soc/amd/acp/acp-rembrandt.c:283 rmb_pcm_resume() warn: inconsistent indenting
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: clean up some inconsistent indentings
      commit: 6d2a87ddd9c2488732ca422476a9417ca312f75a

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

