Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762F2CA4CF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 15:01:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C597017D1;
	Tue,  1 Dec 2020 15:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C597017D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606831275;
	bh=SHp7eaAwZTN3BkgN+c7TZJwujK5lNNvfX/qySWd+RSE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSpYbYsJ1VUuyBSA4HUq0N4lGt39NX0WznO2Z5dCyAw8eSzgxTF8F7urBChfQnC7N
	 sk8W1w3ucZhg+eEKSdFnQ10uVfEhjMQHwCXqXhiYP1pDVeWGVagLR1yBHjZLT+b2qk
	 n86FI7zfdAS90NY8S9xYTaFep4YgUWeJ1lBrtGew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB630F804CB;
	Tue,  1 Dec 2020 14:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14A2BF804CA; Tue,  1 Dec 2020 14:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35B7F804BC
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35B7F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2AQ4EuJh"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B2252087C;
 Tue,  1 Dec 2020 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606831161;
 bh=SHp7eaAwZTN3BkgN+c7TZJwujK5lNNvfX/qySWd+RSE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=2AQ4EuJh02HKDNm7ukxhJyP1tv1y2ycLwyYZuhPEBF84sBLrHM9s/zdVt6k3tQYKr
 mIP/YhoczBEY5xSCUCU8wZxIzlR2xW08ZG/KhtWIn8vbuH2M9DfmdfW62G+65mLLvj
 pzcsQzqZp9pysisIKR7maQIvFerK32RH6R93k2sk=
From: Mark Brown <broonie@kernel.org>
To: thierry.reding@gmail.com, robh+dt@kernel.org,
 Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
Message-Id: <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
Date: Tue, 01 Dec 2020 13:57:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

On Thu, 26 Nov 2020 23:33:37 +0530, Sameer Pujar wrote:
> This series adds audio graph based sound card support for Tegra210
> platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
> audio graph enhancement series is already merged.
>  * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*
> 
> Following are the summary of changes:
>  * Add graph/audio-graph based schemas or schema updates for Tegra210
>    component and machine drivers.
>  * Add Tegra audio graph machine driver.
>  * Add required DT support for Jetson-TX1/Nano.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: tegra: Add graph bindings
      (no commit info)
[2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
      (no commit info)
[3/3] ASoC: tegra: Add audio graph based card driver
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
