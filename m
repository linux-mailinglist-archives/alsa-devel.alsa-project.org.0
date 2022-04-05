Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D534F297C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC87517DE;
	Tue,  5 Apr 2022 11:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC87517DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151248;
	bh=IOSYXfJ51+obZ0DPubnnqwWUEVpRPJNuHWU0Ke67zD4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiBnG1vobgTYbUG3aJ9/Z05qd8Hqd5cXjBzqsBkUvvS2mV87xMBHnEdbvrCWRBdwW
	 br0eM+fDKFZOT56HHcV0PipBFh7BOZ8CgqlgmsGirA4Kmu+rOfsl3qsLoIEH/UYkjV
	 nnnx46pAtGNm+qNK718lbpiSqj7lLVpGf00ANX60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A5EF80536;
	Tue,  5 Apr 2022 11:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F07C7F8052F; Tue,  5 Apr 2022 11:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B454CF8052D
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B454CF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HFPs++2y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 463B66165C;
 Tue,  5 Apr 2022 09:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B0DC385A2;
 Tue,  5 Apr 2022 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151074;
 bh=IOSYXfJ51+obZ0DPubnnqwWUEVpRPJNuHWU0Ke67zD4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HFPs++2yuz+7jArezb8F7EwiXxL5nG/fgaIwrMSS61ULIS9+ExTy5aPAa5ETnObMB
 P4IaxeEgdZPW3/k5T/Nz8P3F8oBsA+unDOOEeRR50R37XM/LwPg/CFm56UKDKxj/f3
 VeiHXUtHnueZq+etK9fyA6UVxhB3oWVdcdW2sE7jzMySQ2OhLlYLFFTn0CLs6LHlfJ
 stH4ng5nN2j5a/mAtrfpenNnsi7Dcs4hXFCDgWwHwhlLcQPzlWh6EJWdQAtjh3rEdW
 IXWf2z+Jidsysk9IuEGMRAzzCgNT64bpo9jziqWMKz9Mvus1eMHLUay7GUgOZROU2e
 LjqyPtWM74vLg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
In-Reply-To: <20220328053338.21441-1-derek.fang@realtek.com>
References: <20220328053338.21441-1-derek.fang@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt5682s: Separate the regulator consumer controls
Message-Id: <164915107270.276574.15918118218792649202.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Mon, 28 Mar 2022 13:33:38 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Control the regulators separately instead of using regulator_bulk to
> accord to the timing request in the datasheet.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Separate the regulator consumer controls
      commit: bc0505bdfb85fc2eb8767c7eb5aec556e176cb41

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
