Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC752EAA7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F711749;
	Fri, 20 May 2022 13:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F711749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045692;
	bh=UhFND29rKzFNk/PM3lmGrodeQwn/fNPjQBAAKBp20gY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTgZEMeyNh64v7qe/I3+fcI4S58ARmt82BFLuoJvdTHbi25T+zfW+gyRKA3BKCWbo
	 410rbbecCWrghSRvULNtEKzotHn4am/GBY96nNBeylhFReLJEXCIHgjZVEJIhkgjWZ
	 SunuuDhgt75/A5Rp486JrSF3S7HJK7yGJc9thLnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44983F8052D;
	Fri, 20 May 2022 13:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF1E0F8053A; Fri, 20 May 2022 13:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6FD6F8052D;
 Fri, 20 May 2022 13:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FD6F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qYqeBTUN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4066C61DAB;
 Fri, 20 May 2022 11:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B16EC385AA;
 Fri, 20 May 2022 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045529;
 bh=UhFND29rKzFNk/PM3lmGrodeQwn/fNPjQBAAKBp20gY=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=qYqeBTUNoNrIVAwTHKSCHB3plxVJLKocoriVJmA4aOa7hh3BcI12PHAdCbTd4+ih7
 orY0T+lvoqnSV587qMOMU8jApzkpzW0m5sQ15uJxkoEfCSNxrgUEad0krHecwGmnj0
 3tG6DvV+kxmPB6Ic9xgJT0dxoDNkTgf4cz0TRWgz6D6Swn+XmuTLJbAER0y/Am5cDn
 v4JtnIe17vTWVc0pr+B0sHFCSET0ozsA9ZrBWfesyTASYP8bQ+DaDRZVrjiYP8WSho
 XoSgPkp09sgS2m1HXPcdPHFusSNmURAWfoHzgphCFbiKJoXilhxDiAE5DmiU7WhCxl
 JBLRGl/oEvUcg==
From: Mark Brown <broonie@kernel.org>
To: yc.hung@mediatek.com, matthias.bgg@gmail.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 peter.ujfalusi@linux.intel.com, Allen-KH.Cheng@mediatek.com,
 kai.vehmanen@linux.intel.com, geert@linux-m68k.org, yangyingliang@huawei.com,
 wanjiabing@vivo.com, sound-open-firmware@alsa-project.org
In-Reply-To: <20220518125902.13407-1-wanjiabing@vivo.com>
References: <20220518125902.13407-1-wanjiabing@vivo.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: remove duplicate include in mt8195.c
Message-Id: <165304552575.45439.1697552885187311521.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 18 May 2022 20:58:57 +0800, Wan Jiabing wrote:
> Fix following checkincludes.pl warning:
> sound/soc/sof/mediatek/mt8195/mt8195.c: linux/of_platform.h is included more than once.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: remove duplicate include in mt8195.c
      commit: 0f653c95c4f4b6b623ce8bd995002daf8032bfc3

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
