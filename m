Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AC053153C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 19:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16A2AEA;
	Mon, 23 May 2022 19:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16A2AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653326819;
	bh=KfZyEZ50W08Vd9FA1iteyipx9RBSkm/JonM4Uu4wCfQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vjD7aeZq86sESqswXeyMxmWGk9p8P4REhvYG1MvmxGLjYtXCmRQAOVHozDwwnB5CG
	 +dnKjx4jeAZvi6dBxNUMYivqY1RftAxy7IHdtcJE/bGnsQ3mtH3TL3rQW1O5u3/v6L
	 ruC9WSSL+KTzLR7glkLMcmYCxT1bcY06KvMV7M7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57972F80272;
	Mon, 23 May 2022 19:26:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D21BF80236; Mon, 23 May 2022 19:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA92AF800E3
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 19:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA92AF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h5deFnDA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1CEBFB81201;
 Mon, 23 May 2022 17:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF00C385A9;
 Mon, 23 May 2022 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653326753;
 bh=KfZyEZ50W08Vd9FA1iteyipx9RBSkm/JonM4Uu4wCfQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h5deFnDA46dP6Iv9Tc6qKmq+/efjbau6furgkYN9jpQ8lXVroSfGW7Ii1uOHS/yX8
 zZTa7QKDDk/K6FTor1hsP2mhhIGst+I5njJ+Vx2NrCutJQWmRKpxOXY/cRVEDNY/ri
 GYC2QsPmis69dsuyuuC/EOKYRwS1QXGt8qTdn4/sC5NE6EXFtHRWcs5FFJkX+09zTb
 8s2wzvtFzQPad6fG7g11GevAHoXbFnlkE8VulE7kiGXNpDa7pZ7CPkSbTIyCxXr5XN
 /WzrXsSamE7VULpv/TN2rna/ohCncxLVaKv2/TWl/RuWGFiQf/CGRiO/ri2uRPlZ7L
 iDXXIFMscEHpA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220520210615.607229-1-pierre-louis.bossart@linux.intel.com>
References: <20220520210615.607229-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix BE transition for TRIGGER_START
Message-Id: <165332675255.2124944.10877512911286086803.b4-ty@kernel.org>
Date: Mon, 23 May 2022 18:25:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On Fri, 20 May 2022 16:06:15 -0500, Pierre-Louis Bossart wrote:
> A obvious editing mistake caught with a cppcheck warning
> 
> sound/soc/soc-pcm.c:2132:8: style: Variable 'ret' is reassigned a
> value before the old one has been used. [redundantAssignment]
>    ret = soc_pcm_trigger(be_substream, cmd);
>        ^
> sound/soc/soc-pcm.c:2126:9: note: ret is assigned
>     ret = soc_pcm_trigger(be_substream,
>         ^
> sound/soc/soc-pcm.c:2129:9: note: ret is assigned
>     ret = soc_pcm_trigger(be_substream,
>         ^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix BE transition for TRIGGER_START
      commit: f4d6aca0c80f09f4c780136a64ee039560a2c39b

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
