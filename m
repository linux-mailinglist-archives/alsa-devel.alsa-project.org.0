Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160E35A33C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211361697;
	Fri,  9 Apr 2021 18:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211361697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985601;
	bh=4ZmVfJ5ykqH5Uf8odNUAdm91J9+g4LRpPY6KYKiFzCg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMYH+KiFL2cgyUDn5J3DKdT9ccjElBKjMfJNlJBPwU9BZLiAB71rV4Du63r2Qlbe4
	 CxgNVqT+QoPF2GbZ47flntV5YdsmK+ceL5UTb4ZTNp76LUspQPw1UU6QCIiqvjkbn3
	 JkPG3Nb/8y07nKdmCyxCW+r7oxcq6scdRj2+dxyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B351FF804B1;
	Fri,  9 Apr 2021 18:24:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA79F80168; Fri,  9 Apr 2021 18:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48AE3F801F5
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48AE3F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CxVgRwFF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F09A9610C7;
 Fri,  9 Apr 2021 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985434;
 bh=4ZmVfJ5ykqH5Uf8odNUAdm91J9+g4LRpPY6KYKiFzCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CxVgRwFF3WQnS1uzeS+3wcypONI0f8Fqwiro1lvv9kvv7nKDfi0xweW5xkHuuvxc7
 BK9kJDwKadr7PgV13wu6Q2IFPd1gCmDPeXpDAuED0PX4cesJOh0lk2t9PRdqA93h4N
 VKWvaDyHh8W0bb1bjgxIEqJeJRbBTQx0bg4VBX7ChcqfqIRAQxkV0g5Rigtm0E2atq
 U7YeCoRJB561XTkxg2FkKt2cW99wMVTmyuj26KjDxG7xpqcfxvrGkZB0O92OBIAIuJ
 7Lef1zmon34ViPYTECM21YRVNdoUeuJgHpPL2uciw11eC0FMzKWnQc5qwRRH7lnb41
 HJ7CIWqUWqt5w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Sia Jee Heng <jee.heng.sia@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ye Bin <yebin10@huawei.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH -next] ASoC: Intel: KMB: Constify static struct
 snd_soc_dai_ops
Date: Fri,  9 Apr 2021 17:22:52 +0100
Message-Id: <161798344184.47643.15716261435220368367.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062653.803478-1-yebin10@huawei.com>
References: <20210408062653.803478-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, 8 Apr 2021 14:26:53 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: KMB: Constify static struct snd_soc_dai_ops
      commit: a457dd92d14acdf3dd64285f04ed9225d14d195a

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
