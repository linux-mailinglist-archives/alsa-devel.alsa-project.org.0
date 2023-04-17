Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E098B6E50F0
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 21:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8953DEF;
	Mon, 17 Apr 2023 21:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8953DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681759807;
	bh=gq/1qS4m8rGuzV0F8LWV+FZB7SceFZsTlDeryzz5vAU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VW+/cMcKVj5K1dNQJKPqhGEn23cXb63nKcqJjVhSkJNXssDtrPkbJDaF1SSyBZEyr
	 rW1y/26ucEJoQIufcf+HbMLfsihHaTE8TcsWPjoBxxCyxgoemcXeXrACC4Id9DZVQl
	 YO+M6qnZXO99rMeZHTquHmqqsop5in6RGYK+ubSg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5786F804F2;
	Mon, 17 Apr 2023 21:28:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A283F80269; Mon, 17 Apr 2023 21:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68662F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 21:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68662F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TubngRzR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB22E6285A;
	Mon, 17 Apr 2023 19:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D0EC4339B;
	Mon, 17 Apr 2023 19:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681759692;
	bh=gq/1qS4m8rGuzV0F8LWV+FZB7SceFZsTlDeryzz5vAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TubngRzRdKO6qWoae5IMWTBQZvE7wuV5Zmgs4WQfsI2e3RBKNmyQ/LXrJwsgmkS6n
	 CWye4DzzPn9WYYIZZr4Pwe0H/cm2UYPjOqi8vbhUNvaod3oL/vgDddw8qZhl0Aq7ao
	 OkVrMit1JY0VqS/Xz7JbqncClRS1j5lAM9TIOQgGtbOXzGhRNajWMsug6ELedPX13i
	 F3Jcw5nzwLgdjioWBRYUM3b/AC87GqCWwZAJOCrfkZ8JhfhC1RZdck5/pw34fcbxvi
	 kniJFMViuYP5bJ9nX5L0kTfBpGK30TJbhG2am6NMIzotYd6OOVeR3PeHlaj3AzE90d
	 TwiwSwbsOqAig==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
References: <87edoxx3wq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: cleanup mutex lock
Message-Id: <168175969132.1283403.6453839618623845019.b4-ty@kernel.org>
Date: Mon, 17 Apr 2023 20:28:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: UQUWU5TMOENA5TGRGNXPHSDCNIDFTVRB
X-Message-ID-Hash: UQUWU5TMOENA5TGRGNXPHSDCNIDFTVRB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQUWU5TMOENA5TGRGNXPHSDCNIDFTVRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 00:14:51 +0000, Kuninori Morimoto wrote:
> ASoC is using many type of mutex lock, but
> some of them has helper function, but some doesn't.
> Or, it has helper function, but is static.
> 
> This patch-set adds helper function and use it.
> 
> Kuninori Morimoto (3):
>   ASoC: expand snd_soc_dapm_mutex_lock/unlock()
>   ASoC: expand snd_soc_dpcm_mutex_lock/unlock()
>   ASoC: add snd_soc_card_mutex_lock/unlock()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: expand snd_soc_dapm_mutex_lock/unlock()
      commit: 4a778bdc7afbc422bd513c4f1cd7a9faf4bebaab
[2/3] ASoC: expand snd_soc_dpcm_mutex_lock/unlock()
      commit: 38e42f6d6c6702bbfc633fce9b579fb80cec2d59
[3/3] ASoC: add snd_soc_card_mutex_lock/unlock()
      commit: 0f3b818486796ec8895fa4ccdf15edb759bff40a

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

