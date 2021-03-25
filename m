Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B997349861
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:39:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3276F166B;
	Thu, 25 Mar 2021 18:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3276F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616693992;
	bh=Uxmmi+0qdWUpMbfTRzNtO3NjAHFifMiK7mFSLbTOZRs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hTYh8ytjZR6dJ8Z+mSv91gj29yntOX+lqDLZdO0p+OlWFRIMq6xnzH7shx+Q4VabP
	 Ga4UfHtKj6VFEhY1+HPy8N71ET39rIfegRc+9bRgU4jP0pWiUgsebjA4xkNVZoSXTt
	 ltmWLSN+iSBHgzGGwnX7MqGJB60o/3sqKVfTmEHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15A5F802E3;
	Thu, 25 Mar 2021 18:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4152BF80279; Thu, 25 Mar 2021 18:37:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66781F80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66781F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JU4tRQ9y"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E65561A2E;
 Thu, 25 Mar 2021 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693843;
 bh=Uxmmi+0qdWUpMbfTRzNtO3NjAHFifMiK7mFSLbTOZRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JU4tRQ9yciuam6CCcpQCTtFCMmnQRMjgKSsLMBKu/KKBSln/8ZvkIRCOO4uWROMYs
 cSQY0F4OzE8zp+/7B3cs2CQDNRnX49IGWnOT2IJe9/F6kHqySgzlGf0h8YDpan9GvC
 ttY3BEneqsb6iQBN2rRyy30gC00gVk+KB8PNKMN6kBjcjYma/siNvsf/7/IEK90Gst
 meQ/ymj5DcaW5PI364IMM9wWLD2THdQk58ybTiLkJqy5lvyhwLJEX2ZuxXrrE13f9b
 YFHD6Nz6eYA4o/eIo9oYGD5wpTbELkuKIARrr+2GgbpCMZcVQguh9Pcq0icgupwkrd
 vAdvkfLy9g4AQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: soc.h: small cleanups
Date: Thu, 25 Mar 2021 17:37:02 +0000
Message-Id: <161669370550.41585.15128047189451743525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <875z1jaopx.wl-kuninori.morimoto.gx@renesas.com>
References: <875z1jaopx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 22 Mar 2021 11:47:54 +0900, Kuninori Morimoto wrote:
> These are small cleanups for soc.h
> 
> Kuninori Morimoto (3):
>   ASoC: soc.h: add asoc_link_to_cpu/codec/platform() macro
>   ASoC: soc.h: fixup return timing for snd_soc_fixup_dai_links_platform_name()
>   ASoC: soc.h: return error if multi platform at snd_soc_fixup_dai_links_platform_name()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc.h: add asoc_link_to_cpu/codec/platform() macro
      commit: 4da40cb9955c63c3aca02be267faea4abbd2c649
[2/3] ASoC: soc.h: fixup return timing for snd_soc_fixup_dai_links_platform_name()
      commit: 4a50724eb0ba96b849f4a0c8da28b2b796859f9e
[3/3] ASoC: soc.h: return error if multi platform at snd_soc_fixup_dai_links_platform_name()
      commit: d908b922c71791568384336ccc3d12a8cbcd1777

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
