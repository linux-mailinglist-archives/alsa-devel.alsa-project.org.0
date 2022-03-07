Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32C4D089B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:40:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616131768;
	Mon,  7 Mar 2022 21:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616131768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685643;
	bh=IczVIEqb6AaHEk7+JrFH5QdDCzyGgkNzceWdxmxtv/k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7R2OOTfPJNcbvgbA2/lqLVyztDuTUmfNUR9Ei+SFVo8fCJdBY07WGkmC/W/wNanb
	 fbD2g3aFout5Awe/3ZPtUcSnKLLDNd4yWzyGVoL+sSckgA2p88LF3J7IWEIrYzkvDK
	 qezMIx4UsxAiwlaHJe2Z3zfg4OeJpcpH5MFWe6Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD65F802DF;
	Mon,  7 Mar 2022 21:39:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC771F800E9; Mon,  7 Mar 2022 21:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 274ADF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 274ADF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fsMsdlYS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCE47614F9;
 Mon,  7 Mar 2022 20:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE90C340EF;
 Mon,  7 Mar 2022 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685535;
 bh=IczVIEqb6AaHEk7+JrFH5QdDCzyGgkNzceWdxmxtv/k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fsMsdlYSr9NuIGcpaFoZyCrdVV/y2+FHkSIONOp0ga7XFSp3QXshse3Af8Ekd++xu
 yaD6x78uG8IpiOZ4yTRLz/XgE8qhuPPsF/ra0ISOKmVRbgvJJ5PbFxjHRj9Wqk5RKD
 Z3jqWdNmvzlXkt/23YNoLS4Oitl9xt5uRFIF4IcnXcQkVFljQb1osqHz61DhBIcS79
 BGZA03BzbIF7qKY4f5fMjXDSd4N19wqmx48Z5z3x4wSeKFF/rKvVv1i3jxzpqDs8dC
 uHUsnvD9apPTHzkTh1uXLhv5m6I6Hiyknh/bfIhTHZtsXCYYL4QAan6f5fwGDStC4v
 8p848uoMaQ/lw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 00/20] Support external boost at CS35l41 ASoC
 driver
Message-Id: <164668553317.3137292.18136754541525028176.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:38:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

On Fri, 4 Mar 2022 15:07:01 +0000, Lucas Tanure wrote:
> Move the support for CS35L41 external boost to its shared library
> for ASoC use.
> This move resulted in cs35l41_hda_reg_sequence being removed,
> and its steps were broken down into regmap writes or functions
> from the library. And hardware configuration struct was unified
> for its use in the shared lib.
> While at it, some minor bugs were found and fixed it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[02/20] ASoC: cs35l41: Fix max number of TX channels
        commit: 16639d39bdf577168d3fe34315917a94365c8d19
[03/20] ASoC: cs35l41: Fix DSP mbox start command and global enable order
        commit: 5e02fb590e83684f63217f93a9cdeabd6a925f9c
[04/20] ASoC: cs35l41: Remove unnecessary param
        (no commit info)

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
