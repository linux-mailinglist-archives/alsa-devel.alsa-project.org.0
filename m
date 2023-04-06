Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15B6D9E22
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620D1F34;
	Thu,  6 Apr 2023 19:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620D1F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680800721;
	bh=S25Cn7Ez0gk3IjAsgs0lYU5PY3NSakxpn1wMdYhpQ1M=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UNLNUVWsWu9sz9Lono4Ii3UU2RoBvoeCXG73w0lTn3HR+wn2MMZhMLiKLyOtGFJ7w
	 9Y/eswb5Qn+EcXhKNmXzunaCbXiT+ecwz1WEcsd01SlLo0WTAhBPcqnc+xHrvv664W
	 Pkzb2i9uNavXdTTbJ7imgcG89L0m9ibKcv3poFYM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5990F8013D;
	Thu,  6 Apr 2023 19:04:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD1E9F80249; Thu,  6 Apr 2023 19:04:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38DB8F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38DB8F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AEgj4RM3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0477A649B8;
	Thu,  6 Apr 2023 17:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8612C433D2;
	Thu,  6 Apr 2023 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680800657;
	bh=S25Cn7Ez0gk3IjAsgs0lYU5PY3NSakxpn1wMdYhpQ1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AEgj4RM3UCv+x/0THOLTJVEjuSm+LLYInLMh3Mpbk8NHb3IlCnRVCT55kBDcFeEEM
	 LcTdoBIcr02aOnyBNXr/7uF1pfrYnbhpmhAdd5Rd/7+6wGrgBBI7JaoT9sDXRb7n/+
	 qvxd/jNUrzNbFiB9gEILPk6oZ+KR4h3/RddUxq0D0+OKP1+ily4vOi1sZ0y8T0Jx5y
	 e3stkzvd+EYq+X5txlKsVJJEK8LsXxL5qCcop0igaAyhIp/UGufnOtV4ZMGyh7WG7K
	 sEivnbKG++Vxs3Aj0Etx5VSJdgBOnK9u6Sn+2agGszBhY3h36nnvTBj3aSG5mx1nID
	 yZ4pengdzID+Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 ryans.lee@analog.com, pierre-louis.bossart@linux.intel.com,
 Tom Rix <trix@redhat.com>
In-Reply-To: <20230406152300.1954292-1-trix@redhat.com>
References: <20230406152300.1954292-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: max98363: set varaiable soc_codec_dev_max98363
 storage-class-specifier to static
Message-Id: <168080065551.124805.6391471744469575073.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 18:04:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: MLQ34JTIREEUFMN6ESA7MTD7MDXXRV5Y
X-Message-ID-Hash: MLQ34JTIREEUFMN6ESA7MTD7MDXXRV5Y
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLQ34JTIREEUFMN6ESA7MTD7MDXXRV5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 11:23:00 -0400, Tom Rix wrote:
> smatch reports
> sound/soc/codecs/max98363.c:392:39: warning: symbol
>   'soc_codec_dev_max98363' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98363: set varaiable soc_codec_dev_max98363 storage-class-specifier to static
      commit: 80a4623eb1910d099e3d3de1564a6dfe16750e60

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

