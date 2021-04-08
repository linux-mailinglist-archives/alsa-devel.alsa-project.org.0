Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05885358A60
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC1F1685;
	Thu,  8 Apr 2021 18:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC1F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901110;
	bh=bADBejaDDFUvPit3yESreAk5CCNK7QnwI7lBb+jFjuo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mV5rgDuFYejOeP0A/msb78SHzxyJJGZQLxEjcTJcELRf1tP/nAd7mptDcfgXHnqSx
	 PAoqw+Q18YNQDaUO2JsddUS8Ov+gpQiaDyw7JGZNuYEod3PtXdMz0f1l5IZ3NsteR8
	 dHdaDgDE9hlUq4KQjQ0E3ADNfuVS8m4LWjc1lc20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC88F802C9;
	Thu,  8 Apr 2021 18:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7ABEF804AB; Thu,  8 Apr 2021 18:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7ED0F80431
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7ED0F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V3PoMP8P"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DED42610A2;
 Thu,  8 Apr 2021 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900939;
 bh=bADBejaDDFUvPit3yESreAk5CCNK7QnwI7lBb+jFjuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V3PoMP8PWrYTANRipi8JY/moMuFySOsdM6qc0jJ40mGGWWL3w5S51fbPA9wWjEi2Z
 X/zD/laG2yXM3sy0IoPjtcy5ODU5UC73huouPRC3swZGw0skdiQ0raPkrESrmXhIgX
 m4dgbfa+EWmSm+UaXdszeMoHJEvwoCxKTcGibgJ0Lu72kGXVobcPX36v3K0Xzm+Bi6
 HlvqCSkia0jzef0oX2up6l0rvIX9iCD9QbDmEBGjkwCkWykmG4OngatgN9lpEYOn14
 oDdPh3suF7DtROY15rxmFznBTIZKd9sCaG6hSON8oyktgiQ1P1bYLEIkJmBvDSAREt
 V3hE7q7fMOPvA==
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ye Bin <yebin10@huawei.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: tas2770: Constify static struct
 snd_soc_dai_ops
Date: Thu,  8 Apr 2021 17:54:41 +0100
Message-Id: <161790012551.16915.15616439731032639355.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062646.803053-1-yebin10@huawei.com>
References: <20210408062646.803053-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:26:46 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2770: Constify static struct snd_soc_dai_ops
      commit: f2ec1ebb257155fb534cad390575d696dfd567fb

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
