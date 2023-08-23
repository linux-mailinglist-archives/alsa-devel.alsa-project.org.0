Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21807785D3B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 705D13E8;
	Wed, 23 Aug 2023 18:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 705D13E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808089;
	bh=MjJ78APs4nHACIMIv6Eznanwwx/xp3HSffo39PEGkLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m8lOuyX6V+XUbfJqsIlYHY96WfB/uMRA0lOmd1RpB8ytnp7NJQfBsn25N1yj0OrEC
	 sOkZKBJNDTNMHUIiuMIdezV9LHpDRsjGggCynjO72Y9DSHIo4HBPR9oPMECI2Lvg3K
	 yi73aZbTlDfEBd/vl4y+zmyXy+3RNvgGN+n4tsbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D290F80553; Wed, 23 Aug 2023 18:26:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BE2F80536;
	Wed, 23 Aug 2023 18:26:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C10BF80537; Wed, 23 Aug 2023 18:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BCB8F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCB8F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=naClsm80
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8202961F35;
	Wed, 23 Aug 2023 16:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF7CC433CA;
	Wed, 23 Aug 2023 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807976;
	bh=MjJ78APs4nHACIMIv6Eznanwwx/xp3HSffo39PEGkLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=naClsm80YD7oHCWwv1RWWUoEU9YM9rlrMQY8UOwMqM7wPbnCqSP9qGwq056tWdymk
	 8t4uMB1gcqjD87X2cJQeSpXIz/6tOVKVrNHrxmnZsAyCEe8gPaD7k28Y4QbtQ/NDch
	 YOVepeLHur/3iHdPjGVuIyprai0wl2T+QWqMsT1eChkAwDTrltdJ8N2l9vtpJf80Gl
	 BHCIln2RMs/G877RCJTvewgQvuvWrGIih3QwkwhR7ej8+fyreXayBqIdBPz7i6WLYl
	 rZ6spsxHNETyfJSM2XS28TkIfkNkNgdNkDVZhWQxXxfdwtngt66OTFcVvuaYsW/+1g
	 ZzONVi9IuDgoQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
References: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
Subject: Re: [PATCH] ASoC: Delete UDA134x/L3 audio codec
Message-Id: <169280797490.53791.2553554158977527260.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 17:26:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: BS3CH5EWMLL6536N2ZNU23CR74QHPJDQ
X-Message-ID-Hash: BS3CH5EWMLL6536N2ZNU23CR74QHPJDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BS3CH5EWMLL6536N2ZNU23CR74QHPJDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Aug 2023 16:17:57 +0200, Linus Walleij wrote:
> This codec was used by the deleted S3C board
> sound/soc/samsung/s3c24xx_uda134x.c.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Delete UDA134x/L3 audio codec
      commit: 6dd11b945951315ba4986844f20e83a0c27c1d38

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

