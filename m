Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92D76EFC8
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 18:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488C86C0;
	Thu,  3 Aug 2023 18:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488C86C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691080900;
	bh=VFJ1bf0AHCEbDnDRiBEgNEEgb3tqaVrFtFbqBlQF1Jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iNIhcGaN+uZZ5QpKMDdI8WuZy2wjiLcGA2iQgBknApvWXGajl9f9NX7AaVrnuklpC
	 fV02cQDBMocW72bFw+2v1wvWrnzIyhoWJgk4N+xfw6p0zCuu48MH3yKnFTnhgUGgZp
	 HEUf2p18b9bhWvgqv9hLKSIv0JR56avxCSnrQSAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18674F80425; Thu,  3 Aug 2023 18:40:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FD8F801D5;
	Thu,  3 Aug 2023 18:40:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FC4F8025A; Thu,  3 Aug 2023 18:40:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4A11F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 18:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A11F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jXrIcou/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47CDC61E2F;
	Thu,  3 Aug 2023 16:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12232C433C7;
	Thu,  3 Aug 2023 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691080809;
	bh=VFJ1bf0AHCEbDnDRiBEgNEEgb3tqaVrFtFbqBlQF1Jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jXrIcou/yNvIPBXif/mS6luiH22zfzXvljOXuJFLZq1A5fZLz/YVWqC8qLkZYNEU/
	 J9LoWb9k9KawjboKBYPzHyoXai51JUegCYlVhsZGxqT80KhnHFa8R+zbHdFM4tcP6q
	 SX0pQ4hRAlv5vQOb0Vf5VdcC3PgcSKSwkIlqDYW/v/OicU0/BJW8nrWd7GPXqLuUqT
	 tN0dc2ocgr57cAKzJ9IBbk5vYtuWTZ8OMVxFsFoQTLqLIL8Jkc5JXV2AWpA2Q7nXiL
	 pDjFLZU8CtT3+k11eh7YwMroG6fntz8IPIwhXq2MRqH8OD8UlHx5EjSnIJW1l1H9KJ
	 ioIXzAAOhNH5A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com
In-Reply-To: <20230803072638.640789-1-daniel.baluta@oss.nxp.com>
References: <20230803072638.640789-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl: micfil: Use dual license micfil code
Message-Id: <169108080679.93395.2068713603234427453.b4-ty@kernel.org>
Date: Thu, 03 Aug 2023 17:40:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: ZNSJO4QLM7NGE6S6HH4GT3RJGPX3VKEX
X-Message-ID-Hash: ZNSJO4QLM7NGE6S6HH4GT3RJGPX3VKEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNSJO4QLM7NGE6S6HH4GT3RJGPX3VKEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 10:26:38 +0300, Daniel Baluta wrote:
> We need this in order to easily reuse register definitions
> and some functions with Sound Open Firmware driver.
> 
> According to Documentation/process/license-rules.rst:
>     "Dual BSD/GPL"	The module is dual licensed under a GPL v2
> 			variant or BSD license choice. The exact
> 			variant of the BSD license can only be
> 			determined via the license information
> 			in the corresponding source files.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: micfil: Use dual license micfil code
      commit: f803ec63686dec863a33cad87218d7d99c4b5e92

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

