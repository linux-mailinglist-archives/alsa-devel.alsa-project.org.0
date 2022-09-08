Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB115B1D81
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E691714;
	Thu,  8 Sep 2022 14:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E691714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662641089;
	bh=KYuVY123Cpl8CxTz+5p+dI15zTz6ObZlPIUI10xbMao=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DA82ubTH0qyXFrFt3m/tbO65qSAGSMrR3DSlrW63fKOvyDExKS9jNwUbt/+7pIVIy
	 2IsKHqNKRC5HDh+7qc4N3dTs3wbPZl2SlB31fx5MwHp8JbX+kb4jozqKNLe77K3XSx
	 vwsJc65O9yufIeyYefkmd7vorj2YmsqkXhpTJ5kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D87B1F80538;
	Thu,  8 Sep 2022 14:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10608F801F7; Thu,  8 Sep 2022 14:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E41FF80217
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E41FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DkF7OJLE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FC78B820F4;
 Thu,  8 Sep 2022 12:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC039C433C1;
 Thu,  8 Sep 2022 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662640967;
 bh=KYuVY123Cpl8CxTz+5p+dI15zTz6ObZlPIUI10xbMao=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DkF7OJLEODK0xiBmbwIgSpN8SyM6Gp34q9jY3gmSZiuaFv6oc25h+Ql91Le0oKHkJ
 N3TJQjCET0S3nC+rNCqAkeIKpASgg5N//wdIUkCNOgE1L2JyH6PBkQg1ZiMRZPh3e2
 9XlvJejsqavnk58UChjiA9YqYTW2einx+RwMz5jRcHB/9npax16lHOn1MeENDZTzhW
 T9EObNI4dBKzbyKw8B7s+CBYt8VqICTn1d6e9wrLbGs9ecr/Wu0K+auE8bPrnTdBtm
 8MA/HKRz8gsF3rQLApM/J/U/SdZenDEX5mBr/E+kALfOAY+wM1skfMAh/qwHFltyfD
 zRjUbcIRqPOsA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
References: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: soc-dapm.c: random cleanup retry
Message-Id: <166264096648.88408.6637109403568759158.b4-ty@kernel.org>
Date: Thu, 08 Sep 2022 13:42:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Thu, 8 Sep 2022 02:44:39 +0000, Kuninori Morimoto wrote:
> These are remains of my previous cleanup patch-set.
> [1/2] adds comment why kzalloc()/kfree() are needed on snd_soc_dai_link_event_pre_pmu().
> [2/2] is adjusted to [1/1] patch.
> 
> Link: https://lore.kernel.org/all/8735d59zt9.wl-kuninori.morimoto.gx@renesas.com/
> 
> Kuninori Morimoto (2):
>   ASoC: soc-dapm.c: add comment for kzalloc()/kfree() on snd_soc_dai_link_event_pre_pmu()
>   ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-dapm.c: add comment for kzalloc()/kfree() on snd_soc_dai_link_event_pre_pmu()
      commit: 6ef8443fb1ced148417d830894240a097ba79a03
[2/2] ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
      commit: 59a1063dcaa5c9450dc1d221679418747bf086fc

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
