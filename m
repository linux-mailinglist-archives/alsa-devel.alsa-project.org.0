Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4535A35A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8A0116BB;
	Fri,  9 Apr 2021 18:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8A0116BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985753;
	bh=u+yMz9sTai8LTSnsmwKVcgcxO9gvfLc4Y4/q7OTEhCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gla8o05yYnWk9JQzI/uo+OCOs0aHtDmiAavj1LQLlDGxJeE1WXzdbJm8tbZUxAnUD
	 4ZMtirEz3T/754C1/JQS8wxUCfUIhkawe0S6x5K+NEOlkIzzmnfwLWMKY+TNSg3xpu
	 HpSegeV+wENVTgmRYHoWietzIjU8CscnE8qfSrTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20827F8050F;
	Fri,  9 Apr 2021 18:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1F8BF804F1; Fri,  9 Apr 2021 18:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E04CCF804DF
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E04CCF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dWIQmAab"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BEDA611AE;
 Fri,  9 Apr 2021 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985454;
 bh=u+yMz9sTai8LTSnsmwKVcgcxO9gvfLc4Y4/q7OTEhCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dWIQmAabbDh/HcS3qeAwu1qmsH5h200FJgIG7BN1GaQYkZ34d5kdTMmXCHJo0jeC6
 Aq9BcYdYl+4DO/QplmAjHiOpxjDzRHQKT8W2VJfRZw66Mm7ax3GAb42DVnh2App4av
 tLcv9xOD7rWPCfF0GfvKetcqosm/y9bhvSCBCOdPvxtuQ0i9JL8n/z92fYtTJn3hiC
 1Opab0gfQgW9AaCtU0cI2w+DPMTHZBkXUDXEn2w0azKA1W02E5dr5F5ef/xJKWHP+T
 rhq5L0zYbXlexveaRmkwdBcpkuVXqnyR8Dke49h2KFfDPIzgp3LEXv8sE4pV12Yne0
 pIwxSQ3xUIBiw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Ye Bin <yebin10@huawei.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: rt715-sdca: Constify static struct
 snd_soc_dai_ops
Date: Fri,  9 Apr 2021 17:22:59 +0100
Message-Id: <161798344184.47643.14354986986103091724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062654.803538-1-yebin10@huawei.com>
References: <20210408062654.803538-1-yebin10@huawei.com>
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

On Thu, 8 Apr 2021 14:26:54 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca: Constify static struct snd_soc_dai_ops
      commit: 1f34084cc85d654a542c547df6714dae8a32d3c9

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
