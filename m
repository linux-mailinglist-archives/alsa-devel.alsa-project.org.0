Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C195411856
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E27B616AE;
	Mon, 20 Sep 2021 17:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E27B616AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632152119;
	bh=8BrvNywnL/2fizTFpg68l//vyzBPBhEWeaGUMITqrRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PpQ0hqcng5Crf79+TXAZTxTy3+J7NbRwOIP1qVZ0xEfNtJJf897D5yBCS2xiGev/T
	 Gs0Bz4jA1m6+zC4efVYjayu0R06Vz9pCKHa2Fx0rjvzhohJNW3I6lWcag13Kkyvl2v
	 Aij46fxgV6Kkr+1p2UqPHfkW3ICb9aMiHCEIF9E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4912DF80508;
	Mon, 20 Sep 2021 17:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84FA0F804E3; Mon, 20 Sep 2021 17:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1DB6F8025D
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1DB6F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RP3R7lsn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0863F61159;
 Mon, 20 Sep 2021 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151917;
 bh=8BrvNywnL/2fizTFpg68l//vyzBPBhEWeaGUMITqrRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RP3R7lsn7smRECTj02UEz2ApNXU3sjarbt1Sk+JzBJpFEuqSrNQKPYycY9IfONZG2
 EhljzTZvaXMdKWrPuDpytZKdrALkRuoSY7HIikNDk0xJJqgUkse+bZ3affVNDX6b2l
 w+FvAX5g4kNKlK5/k+PyNoW0PsD3V29kdDBP3teY3Igp3mca/hmT/IFcw8RFRkFuBf
 iMGkGLi3QOK2/4NZ/hu9lZ0kwke49nbWTLlxaZdNCQZuUBn72sOdygdEk/AqmoEuG/
 aeowRqgyxzrTOexhvOsyq1Z4hsygO0eFcSAkSH5wCnpGnnBhIbfjtOrNWRB6ySYqi/
 BPJKn8XmyTFmQ==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: rt5682s: make rt5682s_aif2_dai_ops and
 rt5682s_soc_component_dev
Date: Mon, 20 Sep 2021 16:30:51 +0100
Message-Id: <163215150720.38322.7115113856653513250.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631955726-77693-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1631955726-77693-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>
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

On Sat, 18 Sep 2021 17:02:06 +0800, Jiapeng Chong wrote:
> This symbol is not used outside of rt5682s.c, so marks it static.
> 
> Fix the following sparse warning:
> 
> sound/soc/codecs/rt5682s.c:2848:39: warning: symbol
> 'rt5682s_soc_component_dev' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: make rt5682s_aif2_dai_ops and rt5682s_soc_component_dev
      commit: cf21e114f6f44fdb06b7ceaaee5f2c360883bd74

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
