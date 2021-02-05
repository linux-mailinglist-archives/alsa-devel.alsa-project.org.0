Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729831121A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 21:18:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847F29F6;
	Fri,  5 Feb 2021 21:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847F29F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612556286;
	bh=qgY/DVuIqSludWLeA3R0K2D/h0Yt+L6hRa2j/mG7ovM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uD1XtINinnKuXBQLrsH0VxqZxjP6WbL5w9Zt65+q2kBFHodj4TvLiin7xUf8sOcMv
	 +lspvS7aKPxwt+Ft9JcXKgkjR0t9XgFkYqaGi9rdBMkKslgEvSGnwyLQsvTS5vTHqZ
	 xISo4MulpIXufVqAXRCG5I3f/EBoDTMX5z6vlC74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C39F80264;
	Fri,  5 Feb 2021 21:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32286F8025D; Fri,  5 Feb 2021 21:15:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31D59F80156
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 21:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31D59F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JHNd0zi9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2D1264FBB;
 Fri,  5 Feb 2021 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612556145;
 bh=qgY/DVuIqSludWLeA3R0K2D/h0Yt+L6hRa2j/mG7ovM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JHNd0zi92Uv88DwkPWRe87CobScKHeKGVO7+dGg3kVNKeTOjx+YLRINqFRKnfog51
 lYN6iYzA/2/ivVyELn2U7gAnD+J51SQhvZcMPsgqLf/Jlo39BV1Xxp4rWZ0o5XakBT
 C2akIFP5EmLdIdf4QfoxT1iQriryfu6XT5d8/skqfheNX9JtNP480VLQMt6VcuQvhp
 E5lDJ896C0lLyljjqpsgo5cC0Fo2HNhAvtOZYU93ga9OrxxWmBbsDNEq2vCy/ZDVxU
 odY7UZOO1Git0+yg7qzvBw7u8tCrcXKF6JxQvs1Zg3gEo9x2bf/ptG6Nu3i1TxPQy4
 deKcZTojy26Zw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210204130022.1646427-1-geert+renesas@glider.be>
References: <20210204130022.1646427-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,
 rsnd: Group tuples in playback/capture properties
Message-Id: <161255607745.56562.5489379179875398712.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 20:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 4 Feb 2021 14:00:22 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "playback" and "capture" properties in sound device nodes should be
> grouped using angle brackets.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas, rsnd: Group tuples in playback/capture properties
      commit: f08c74a3b52d126d053c741b906ee1ca2a4f3568

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
