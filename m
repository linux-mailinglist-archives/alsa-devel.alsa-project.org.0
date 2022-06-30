Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC98561ED5
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 17:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E90516D1;
	Thu, 30 Jun 2022 17:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E90516D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656601880;
	bh=xPBVEhqQBU4s7hwKhqo56wNXVbf1Ihg751/zhNw33v0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjI7xe6GrMZ0Ua92dFE/AAc/HZuqqQlOYQTnR/t0LTs37a3UsQwEObcrhajFvz7OP
	 eF5VtLehd0FHzHcsa+SkQCpaVJsQeqJxmreCHOWKv7+TuYN1K/6cyPmlnQPy8JjP0Q
	 0kLPH7xEr4okEPXWVz1CYkLZvzK2f5MG3V6kX2mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C18A6F804E5;
	Thu, 30 Jun 2022 17:10:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A083F800F5; Thu, 30 Jun 2022 17:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 953A3F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 953A3F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BfbSq6jP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 933E3B82B73;
 Thu, 30 Jun 2022 15:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2E1C34115;
 Thu, 30 Jun 2022 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656601813;
 bh=xPBVEhqQBU4s7hwKhqo56wNXVbf1Ihg751/zhNw33v0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BfbSq6jPatzjO3BxBHoMUY56dVzgVmLU+gFleqKxO5kkZQ1Q6iPdsr2s9EclFo1+5
 zI/60Ag9N9xtrQYr4Jp+aa9irp4MZGS4ZS92zJsnrvDvxClxOIg1aImmBHDVm1CIrR
 Xu/waQ0Ow5H2j4e2EplqYILfdG+ZzNjhI5SnvYpnN4kaBB2Z6gm/GCz1Lnz/l7fEgM
 B728YFHgdd3pqwIKPl9QAGN+QfHIGFdl/nbRJ9kw2HRPbFUUlO4v+DVn1oumKzMZnx
 SwpqIdlPN4xFskZtQYfw7Ow3zNUVQNMpOECqCTX6FTfPBiU4KoW4B14KKGRtB2KppL
 +wftcdn4fp9Ow==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
References: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
Message-Id: <165660181165.664251.8953758833473555278.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 16:10:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: povik+lin@cutebit.org, alsa-devel@alsa-project.org
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

On Wed, 22 Jun 2022 05:53:41 +0000, Kuninori Morimoto wrote:
> Current ASoC has fixup both snd_soc_of_get_dai_link_cpus/codecs().
> I guess cpu was copied from codec, but it is using "codec" naming everwhere
> in "cpu" function. It is strange, and thus, error case will be issue
> (It should call cpu function instead of codec).
> 
> This patch tidyup it, and try to cleanup.
> [1/2] is for bug-fix,
> [2/2] is for new feature.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
      commit: f3762ddfa24068cf67bc395cb80a7928306ad1ef
[2/2] ASoC: soc-core.c: share code for snd_soc_of_get_dai_link_cpus/codecs()
      commit: 9cc69528188a4e3eb24370f6c05a92791ac249ba

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
