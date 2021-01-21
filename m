Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F282FDDAC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F310C189D;
	Thu, 21 Jan 2021 01:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F310C189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187884;
	bh=q2ZTBy/GMJKRUdA87t2kPuxFQS8sPWRWpmZxf4B5WZw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=avgF0wY7dve06UlXx8fchOrH+IZoAw2giYvxS6lOtcZ9V/KhqtYCAnCC6nYfiGLTE
	 HOU6UG+dXBQuf9ciDocSBQDxNfr+7vup9g1dDE3S84Fo6BeajOTuB+SmV+F3yyt9GD
	 XuwNKCHwWHcAJZZP1rFOQTAHZRzYXHV+pw3T0+NE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F2DF80507;
	Thu, 21 Jan 2021 01:07:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0E9CF80508; Thu, 21 Jan 2021 01:07:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2858EF80507
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2858EF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g2+cM8NW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96F5523731;
 Thu, 21 Jan 2021 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187638;
 bh=q2ZTBy/GMJKRUdA87t2kPuxFQS8sPWRWpmZxf4B5WZw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=g2+cM8NWD1hKgEPNQrvsuKvIAvkCC+K0aLHdyDPTSjm7q1b69lV904geZC9cnNIBK
 H8Hpm+KBO2GbwUbfwKvWBePgmlBYcSV3H9hyLFAfVC0OQ7AAaBCm/BYRJPsBT4SjmO
 VZUvFT4vHZ+06rT7DkgySHrWf6p257TkbnCw/g5xVOgfUqd1ygUWaaPxRBSfyAyUin
 IogOaPW8jcLTlo6sUhsi7rqykapkWUWqN/5ShkgzJeeowCdjSPFiEVU9sOjtFVXj61
 T6dnemTJJDqnJy2pt76eqigPi5Qdqiy9PRYz2lOWBEALC4I0ne8ts1NqyIuX7SI36w
 udU2Tr9OIaeOA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Sameer Pujar <spujar@nvidia.com>,
 thierry.reding@gmail.com
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [RESEND PATCH v6 0/6] Tegra210 audio graph card
Message-Id: <161118753483.45718.690579581482519791.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
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

On Tue, 19 Jan 2021 14:58:10 +0530, Sameer Pujar wrote:
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

[1/6] ASoC: dt-bindings: tegra: Add graph bindings
      commit: 9e0f86fdcdab6a0e183ad4ec2410453985b4cf3c
[2/6] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
      commit: a9f22c03a8ac5d21ce7a9b9307d9654c963a1f9c
[3/6] ASoC: tegra: Add audio graph based card driver
      commit: 202e2f7745437aa5b694de92cbd30bb43b23fbed

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
