Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254F313DD5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:43:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB9E16A5;
	Mon,  8 Feb 2021 19:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB9E16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809796;
	bh=tss5CueiJnDL3MQdOcYvMImlJHBkgWHNZ6Ctf9Hu290=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JH3aocx1bkNu0SyfIa2MWNV74Jh7CEbnQ0/A/H7b9N3HRNwFFG6XFUxXkv7lGjar6
	 0zc2dD6CKGes9b0Dbt/SSwHLqBJSVOUCH61Sm43qOAt/O16YTwm+aJ1F/1pdcOlg2F
	 uNMcXEYWYby6dZB1BytUpSCAmSV6YbgCHOjV+Kq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F3A3F804AF;
	Mon,  8 Feb 2021 19:39:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12562F80431; Mon,  8 Feb 2021 19:39:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF222F80431
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF222F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rq0ciCbt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2355764E66;
 Mon,  8 Feb 2021 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809583;
 bh=tss5CueiJnDL3MQdOcYvMImlJHBkgWHNZ6Ctf9Hu290=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rq0ciCbt930kk0Bdzg6mM4FYlGg1vJNBIrVL3TVG/o2Ln1H4i8/58q4L/armVfnoc
 I05bNV8/n2VffU/DLgRQkyGPJCBwSVqROhTyTy/wqWdH4BxUDw/ZeHxxCNdtHfpXm8
 VKdsLO/nYcyy73qE6ZxvZzw+efT1Y5q2qih98Gwhs3j31Dk+8RF40SPfR6F7oMd0al
 Asbt7vBui0tlsCW/GPUsDwNh3qL/yiyrYGHexorcCBzuS5SxzWw4e/ADPts9zX6RoQ
 +fBJaTxhO8+eRA1uKnK4zh2QNY7lxEVPb/SgqTra2orA3/vYxgH6pJB+cRYvh29Gif
 kq5UfBNmIFOmA==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20210206142243.535544-1-festevam@gmail.com>
References: <20210206142243.535544-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Remove unused 'imx' field
Message-Id: <161280948304.10741.7239091426541749590.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 shengjiu.wang@gmail.com
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

On Sat, 6 Feb 2021 11:22:43 -0300, Fabio Estevam wrote:
> The 'imx' field is not used anywhere, so get rid of it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_esai: Remove unused 'imx' field
      commit: 40bd053bc8e18b68e877bd4cdea1b6938ddf5fdd

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
