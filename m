Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E79714089BA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9D3166B;
	Mon, 13 Sep 2021 12:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9D3166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530819;
	bh=/acizGQpjVbb5W1sMXX4iA7exId4RJz4UuLDmCHSWzo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOh5WGqTYFBELcttEe3Zgb90OFugnAOu+IUJQAwsua92laeatTogyj2/4oYXuVsuq
	 syp0CA3zMybG67spFTEIx5hLRRFGoKoQoNFhsZMmI8GkZTsUCE9Q6axb/9WjWXpj6M
	 Ag0pHYXevC45tFizfAwG6ha9L7mKQjqZYWH6k/BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72868F80539;
	Mon, 13 Sep 2021 12:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3C92F8051D; Mon, 13 Sep 2021 12:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BFF2F80511
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BFF2F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F6TvK4B4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81DE161056;
 Mon, 13 Sep 2021 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530512;
 bh=/acizGQpjVbb5W1sMXX4iA7exId4RJz4UuLDmCHSWzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F6TvK4B4I+8fhHkwCXw2nwKMzALK/t98a7hcdi3nBHhqo2rAU+fopM70wRIFncoEz
 EDb6uxC2Ln6u7zoDo5bMmvBiSyEsV/krsHSylK1WrC3QlvZ/EOJ5IKtYCnNp0m+ybC
 vwZBkFBItqnRxsBeICBVHsVDpmetRPSm7JqUZLwCYZMeMpVE85iAKVQo7pmS1mN5o0
 bwe+0WWOqbV8A7CIwbNvzhPt3ciCXn4W+K95uxO2fMLNLy+EX5t2lDbLZ+T1mmPa4e
 wujxw70KU/CXuIZpF2L1gBcDUAY5bVDucCcEryAhZBwNxeL/9DjYkMLx/pq5sbeS+X
 aeXqlBbq77g8g==
From: Mark Brown <broonie@kernel.org>
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] ASoC: ti: rename CONFIG_SND_SOC_DM365_VOICE_CODEC_MODULE
Date: Mon, 13 Sep 2021 11:53:27 +0100
Message-Id: <163152996582.45703.13424902578308324245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901164009.1546967-1-masahiroy@kernel.org>
References: <20210901164009.1546967-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=EF=BF=BD=EF=BF=BD=EF=BF=BDter=20Ujfalusi?=
 <peter.ujfalusi@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 2 Sep 2021 01:40:09 +0900, Masahiro Yamada wrote:
> Kconfig generates include/generated/autoconf.h to make CONFIG options
> available to the pre-processor. Symbols with the value 'm' are suffixed
> with '_MODULE'
> 
> Here is a conflict; CONFIG_FOO=m results in '#define CONFIG_FOO_MODULE 1',
> but CONFIG_FOO_MODULE=y also results in the same define.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: rename CONFIG_SND_SOC_DM365_VOICE_CODEC_MODULE
      commit: 0f3dd4e09addc00d5b87761793b08927e7903181

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
