Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 765CD22998C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 15:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB3B1661;
	Wed, 22 Jul 2020 15:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB3B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595425697;
	bh=85AN4VDFdMrFXJvqaJnVn/TtqZhMcEWbbnD9hw/UeHY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iKjRKqAiQF46TvJpun1mfVoegnZ56Rp/RHBBfa96y33EsjOSe7uvzZ1GEMJMF8bnw
	 5tQpYyNG+wTyuLTaTMRAzj4fGLb9YbN1dMf9bX4EacmbFqcu7Ks2WRhHCNtJC2R114
	 QtiokhrlTG4Q2RY2LEKcUi0wct4QOst7qzatvabE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 139BFF802C4;
	Wed, 22 Jul 2020 15:45:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A584F8028D; Wed, 22 Jul 2020 15:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43A37F801F5
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 15:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A37F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+aykGbi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68F5F20787;
 Wed, 22 Jul 2020 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595425502;
 bh=85AN4VDFdMrFXJvqaJnVn/TtqZhMcEWbbnD9hw/UeHY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=V+aykGbiBfpqqVnjU5MwPKzI5zLvBI/vKcAn9C2FltXL1mJ6snxB4o01qrsKAZ3TF
 bEgoq5os5GjZ6OS4s6AzJnagERdSAu4LMPPXtr4NhvCGJXuXBfBbriYw3u3VjvwbxI
 XfJ/Ktu9W+s4dR4uDNFCZKBnD+L1HypEhLv7Rvds=
Date: Wed, 22 Jul 2020 14:44:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200720012559.906088-1-tzungbi@google.com>
References: <20200720012559.906088-1-tzungbi@google.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for
 max98357b
Message-Id: <159542547441.19620.14879920387076219822.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org
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

On Mon, 20 Jul 2020 09:25:56 +0800, Tzung-Bi Shih wrote:
> The series re-uses mt8183-mt6358-ts3a227-max98357.c to support machine driver
> with max98357b.
> 
> The 1st patch enables left justified format from mt8183 audio platform.
> 
> The 2nd patch adds document for the new proposed compatible string for
> max98357b.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8183: support left justified format for I2S
      commit: 767ee388ab8aee021bbb5a34173c656f3c038a46
[2/3] ASoC: dt-bindings: mt8183: add compatible string for using max98357b
      commit: e3c3cdbd5ad65182e3803a2e1c33156c5ff48cd1
[3/3] ASoC: mediatek: mt8183: support machine driver with max98357b
      commit: 08145535a8321eb330fceb9e6542b51091f7d3c6

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
