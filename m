Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F68358A51
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2C6166E;
	Thu,  8 Apr 2021 18:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2C6166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901032;
	bh=h4A8xv/MNQfhumA+4ItLD4esOyC+p118rlAyNp6WzlI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNzjYGxmva3R5/5/pMW5pP9Lf4heY8LqvdmX3OQ0ayM9zpaYRZzGe0xSLWFrgxQsS
	 kMCV4VFXA7SDe590ty1O755UIwQj+yUUUxezS00JbsO/5NEspkIuZsTgkg3adX54kP
	 yM6mkrp2uyevQkvKzGq04ewdukt8NECy9Iw2/gDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D1D8F80423;
	Thu,  8 Apr 2021 18:55:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89608F8032D; Thu,  8 Apr 2021 18:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F35D6F80169
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35D6F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s1fB1pQo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BC536113B;
 Thu,  8 Apr 2021 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900927;
 bh=h4A8xv/MNQfhumA+4ItLD4esOyC+p118rlAyNp6WzlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s1fB1pQoHz0zdd895J8jOMuJInvOvp2zHsU/GDDu1+4jjEiPLxtOUHDvCttcgfP+X
 23a4YY+XtU3StPgPr6qQIPLld3Do/Cqh7pA1GtUF3ffUVxKBZ91KHjCsqrNeEL3EqS
 UL3WkvNcd4v9ULvTSxhU4tfJw7pOU8VzLVSw7y7IxSn3Zo9mpEhrzGwWl/v8tYi+00
 PIHtxelrMY+tZVP2LIoUvQuJnvAgPvJsXmABFQV92oBN5Fs+FbSSHwAYZPnl9mNdjC
 zEH7WlZODVq6ThUPG4RuQ9QpbdBBBhn7eXnALoZyGfZHtANpl9nRvFTbzE82WcbuZ0
 Zfj7wtz44zv8g==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/14] ASoC: simple-card-utils: prepare for multi support
Date: Thu,  8 Apr 2021 17:54:37 +0100
Message-Id: <161790012549.16915.13451581314570528791.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
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

On 01 Apr 2021 13:14:56 +0900, Kuninori Morimoto wrote:
> I want to add new audio-graph-card2 driver which can support
> not only DPCM, but also Multi-CPU/Codec, and Codec2Codec.
> And it is also supporting audio-graph-card2 base custom driver.
> 
> But before supporting such driver, we need to cleanup existing
> simple-card / audio-graph, because these and new driver are
> sharing code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: simple-card-utils: enable flexible CPU/Codec/Platform
        commit: f2138aed231c88d5c4fa8d06aa15ad19685087c2
[02/14] ASoC: simple-card-utils: share dummy DAI and reduce memory
        commit: 205eb17eddb473c3159743c7d3aaf68db37b7231
[03/14] ASoC: simple-card-utils: setup dai_props cpu_dai/codec_dai at initial timing
        (no commit info)
[04/14] ASoC: simple-card-utils: remove li->dais/li->conf
        (no commit info)
[05/14] ASoC: simple-card-utils: use for_each_prop_xxx()
        (no commit info)
[06/14] ASoC: simple-card-utils: remove asoc_simple_parse_xxx()
        (no commit info)
[07/14] ASoC: simple-card-utils: care multi DAI at asoc_simple_clean_reference()
        (no commit info)
[08/14] ASoC: simple-card-utils: indicate dai_fmt if exist
        (no commit info)
[09/14] ASoC: simple-card-utils: indicate missing CPU/Codec numbers for debug
        (no commit info)
[10/14] ASoC: simple-card-utils: add simple_props_to_xxx() macro
        (no commit info)
[11/14] ASoC: simple-card-utils: multi support at asoc_simple_canonicalize_cpu/platform()
        (no commit info)
[12/14] ASoC: simple-card-utils: tidyup debug info for clock
        (no commit info)
[13/14] ASoC: simple-card-utils: tidyup dev_dbg() to use 1 line
        (no commit info)
[14/14] ASoC: simple-card-utils: tidyup asoc_simple_parse_convert()
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
