Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D36F4C78BD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:23:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BACEB18EB;
	Mon, 28 Feb 2022 20:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BACEB18EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076182;
	bh=/qQOB++KvvZ7sRy/B6gKIR06AjcperUnwullcN+5JlA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlYKQhjmk0wDNWbDHglHJr+DiUNqlDNrsoBXJ/iKuVnvlVsmcIio23ax3Jv65qPfc
	 TWadJJupznvNC0GsPbLX+dy2EFUlAgCPlcZCz05hHT89ecvjfhy10Sr3e0psjupW27
	 VBAQk2td4hSu2sAChwgAiy4ify8lG/6LMcNqS/qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45864F805C6;
	Mon, 28 Feb 2022 20:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A9BCF805A1; Mon, 28 Feb 2022 20:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9412CF8058C
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9412CF8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hUK/V96q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46AFB6100A;
 Mon, 28 Feb 2022 19:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6FAC340F1;
 Mon, 28 Feb 2022 19:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075746;
 bh=/qQOB++KvvZ7sRy/B6gKIR06AjcperUnwullcN+5JlA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hUK/V96q2sCL7N238gDDmPKfGcA9oUaxW37RccU/y8c69v2P5Cal68n2DWTu18X69
 +SCh+y54u/f6lnN04cVFim7bItVQnVQGyW3t75zVw5v7HNaY6prgn/5K0X/z/CGjXM
 V5PuBWCpq26n4lPG9pCKP0tCq5vLyT6P3EYmdxzORmrPgtNscxUqJQP9tvLYEldfez
 gbnjdoia9Z4c4HAT3IdCRgQsMC4O5qO6KSIpe9wfPxcw2m24cvUy74pxYFpjWZC/1U
 VgyeK+poVSr3+TCAbnWULb9lI1PfgSM1/ED6cwEVKbbpuQFaoVVeMN8DJc1Vlv5OvL
 0mTYFl3Aqkkew==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, peter.ujfalusi@gmail.com,
 lgirdwood@gmail.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
In-Reply-To: <20220228031540.3571959-1-jiasheng@iscas.ac.cn>
References: <20220228031540.3571959-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: ti: davinci-i2s: Add check for clk_enable()
Message-Id: <164607574441.3538791.1957643459988205698.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 28 Feb 2022 11:15:40 +0800, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it and return error
> if fails.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-i2s: Add check for clk_enable()
      commit: ed7c9fef11931fc5d32a83d68017ff390bf5c280

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
