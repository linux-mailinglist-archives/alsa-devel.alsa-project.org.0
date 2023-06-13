Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E44A72E840
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A205EA1;
	Tue, 13 Jun 2023 18:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A205EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686673217;
	bh=6FwMGf4LB3ApfYVehtth1U7HnqszwAx3/yQs35NOUhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WUI83OeDSYapzQixqACZN2LNhgJVylHWn77X71H7WlR/exIy5MoxGjDJ/17vLYnJf
	 vYXSEEJB58VsSW/HABlK2+A5S3hUdK+7yY1la6yK3PxghhUrtVlLVg0BpOs5LITCZ4
	 Gs2yIXrojqf5OAr6BGvKtpZcSluYWt9mbuBnioL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D526F80571; Tue, 13 Jun 2023 18:18:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 291AEF80551;
	Tue, 13 Jun 2023 18:18:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C53F80563; Tue, 13 Jun 2023 18:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71563F8025E
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71563F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OvmsdoT/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FB7263140;
	Tue, 13 Jun 2023 16:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FD5C433D9;
	Tue, 13 Jun 2023 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686673091;
	bh=6FwMGf4LB3ApfYVehtth1U7HnqszwAx3/yQs35NOUhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OvmsdoT/f5zzOhWMOWyEg/F+Fr3DARNksRh08zQWqjW5MGmk5sRZUCTKyBZ2V5Lg8
	 3fpBcDiQlK1guDNq6IlXi2JZazkPv2y4MASkFpryFY3c3cWrVLBAKBk/cwMcYTNYZi
	 SpR+zVOq8mlnXHjTpY3KfXA7TIjSMjWfWsv1ab3OCgtK5KXKryQF/D11z2x9eSzl4p
	 JB3Hr3RfsHtwunD+HlmvMqsLYppz9pxep2D+zHgTnYIGlAN/3CU6YAhiSBh5ajfMgh
	 yWhcDU4/rwwipPC9IqL6yNN9Tc4IDrh8wapNETD0avtrZ3DvQWDTeycCLSdqe3G8FF
	 DAtoJAY+Egnsg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org,
 Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: inux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 nicolas.ferre@microchip.com
In-Reply-To: <20230613095454.38696-1-juerg.haefliger@canonical.com>
References: <20230613095454.38696-1-juerg.haefliger@canonical.com>
Subject: Re: [PATCH] ASoC: siu: Add MODULE_FIRMWARE macro
Message-Id: <168667308914.106697.3402127120082765699.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:18:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: GBH75FPNAQQCVCN44B7TTYSXI4PFWKW7
X-Message-ID-Hash: GBH75FPNAQQCVCN44B7TTYSXI4PFWKW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBH75FPNAQQCVCN44B7TTYSXI4PFWKW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 11:54:54 +0200, Juerg Haefliger wrote:
> The module loads firmware so add a MODULE_FIRMWARE macro to provide that
> information via modinfo.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: siu: Add MODULE_FIRMWARE macro
      commit: 82a28d5aa582a98f40ab527af08c66556dd3d310

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

