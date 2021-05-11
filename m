Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A447237A242
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2021C17AF;
	Tue, 11 May 2021 10:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2021C17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722183;
	bh=eEtBAlCzd+59ejK63RAyKXFMKRoDf6dGtGXy/1g8kRM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nhc8Sfrb0bDo2lwrO7ylVnde/r0fxQVJT7OaxehhXloeCH3BQCJEkflWBrmqHMTgn
	 NpX7tOOCt40sKlqlkiR02VWSH58t417QVm04tOf0Fdv7KNGA4O+8miknynPXX7Ne19
	 MXEqbrkT35GTZnC58eEm7x1vc3/RFCyZgO5k4Pr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9984BF8053C;
	Tue, 11 May 2021 10:28:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E149F804E5; Tue, 11 May 2021 10:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24056F804DA
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24056F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jx9WYSj+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44C106147E;
 Tue, 11 May 2021 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721702;
 bh=eEtBAlCzd+59ejK63RAyKXFMKRoDf6dGtGXy/1g8kRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jx9WYSj+aqHv7LtdfiOExF0K/TdQ/I+e5BrrKTQbtJZeYpncvauQDkrsf6YfoMxks
 gNin9AYrwHcDgOXkq4q6BcwVF7W4xrlhP6xAVXt2lAab1hru8I70I1bW1LYNo+1nBe
 ZoV7XzgWdKR4Vi+ciafH+07YkcO4muwwqkoAd2k+Z8+NWyIiDLYCSF5qd41t42ubmK
 XInSi8hlyAwIztw14M6E9wdJT7HWww/4tKcYdefTv488eKAgjORdvMhRsyMtw8KADH
 5pLq93pOn+WiAZggdo3dKl1J/dSSxjpTawK4mebWQSZVUhl0RrGU3BRRJh7zaYLrU2
 M9CnEg48YiISA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Remove unneeded semicolon
Date: Tue, 11 May 2021 09:26:03 +0100
Message-Id: <162072058169.33157.16301306834523283874.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210506022452.5762-1-wanjiabing@vivo.com>
References: <20210506022452.5762-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kael_w@yeah.net, Mark Brown <broonie@kernel.org>
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

On Thu, 6 May 2021 10:24:52 +0800, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> 
> ./sound/soc/fsl/fsl_xcvr.c:739:2-3: Unneeded semicolon

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Remove unneeded semicolon
      commit: 223875a6fb8e26bbde3de675552d27b62e3ed0de

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
