Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A84D6967
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:23:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693611902;
	Fri, 11 Mar 2022 21:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693611902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030231;
	bh=ij5VNrvsFSwVimJAGBzflRTGoXGWzMpxgzmX4BZ5YPM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wmub031o8Lv30ko84rHxRcxQU/52bGpVrKcX3FHAKmdGTY9ermXcabvEBYN68Msr6
	 /Q6IGUsxQ29YO9StagZcZVrn+FW+6icfc4zeAFQxtwC8vH7Sg1zfV7uB5l7Sb8W7zf
	 nkIQF3mFk/5vbugHdmo2chtR5MT9BQnDtQkpf06I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3FC8F802D2;
	Fri, 11 Mar 2022 21:22:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CC8EF80238; Fri, 11 Mar 2022 21:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCFD8F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFD8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HHNaw7dT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4024B82CF4;
 Fri, 11 Mar 2022 20:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7A0C340EC;
 Fri, 11 Mar 2022 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030158;
 bh=ij5VNrvsFSwVimJAGBzflRTGoXGWzMpxgzmX4BZ5YPM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HHNaw7dTrZhU8k9UkXkpKfOG0tJZfuBuqv9Cnw/jdFmXn7Roa1c5D0seA0jWQQE3+
 PPperXekmJv4dIX8v++kZu5+di4c56v490qAun1wq/d2+gvDWT42ko/5Hck3Ac9VF3
 5hroXOwdq3hyDD+PpEvHbgi7iDGJea/QZ2BPhuxIHTAhiTRPVQchCF3adPou0k2X0d
 KCaRlbsFteozlEa0juMWWUChr1gWNL0Py1EA5ReWQuqsP5ireRzSV4ZvjOe5Ka6+e9
 pby/qGRugO9UdzPT6P3j4XCQnHSejOORcX8XORNW+iuIhmeMhyQW5JafYtRWmCx4rr
 9NnHSLA9zMqYg==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org
In-Reply-To: <20220308072435.22460-1-trevor.wu@mediatek.com>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
Subject: Re: (subset) [PATCH 0/5] ASoC: mediatek: Add support for MT8195 sound
 card with max98390 and rt5682
Message-Id: <164703015624.264137.9730451216130586080.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

On Tue, 8 Mar 2022 15:24:30 +0800, Trevor Wu wrote:
> This series of patches adds support for mt8195 board with mt6359, max98390
> and rt5682.
> 
> Reset controller is included because mt8195 etdm is used to play sound via
> max98390 before kernel boot.
> 
> In addition, the common part of machine driver is extracted for
> simplification.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8195: add reset controller
      commit: f67084148dac015d059c64f25e57abd0ab18946c
[2/5] dt-bindings: mediatek: mt8195: add reset property
      commit: ee7f79a81a27c47088fe0af95788621644826d91

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
