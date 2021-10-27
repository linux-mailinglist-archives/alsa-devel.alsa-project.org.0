Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D113043CFBA
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:31:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E51E16B1;
	Wed, 27 Oct 2021 19:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E51E16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355862;
	bh=QsB0o9iZyLniecSH1J6KAGYPmw5EvswLCa0a3kuGrW4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RqoiJbYy9FQkTg9zyJeO16drDxFusCL9Cg3REbtE0AfVNaPyUVCimbx29LkPzSA5x
	 mln/YzTogd02QlVBiTwy7Uehn3hWs+faDiG+wkqcrdhIguzTi81zTri/Q+fKtA24ZZ
	 rZFLROrVz2Yc15z4EaTMlhmh3zy2AWi7Zm57h3qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B7EF8010A;
	Wed, 27 Oct 2021 19:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CF20F8010A; Wed, 27 Oct 2021 19:29:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18794F8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18794F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WQ7HIJXm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C33560F02;
 Wed, 27 Oct 2021 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355750;
 bh=QsB0o9iZyLniecSH1J6KAGYPmw5EvswLCa0a3kuGrW4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WQ7HIJXmQ2+MORKZl3R7A/w7XIl5BaHZshrFqk1Smo0fjiTSRjoX5PXbDGLjRGM9p
 NVYN0Qb/xG+HhYFYMv1z8ZSbG8xn//QdI2HaTVmxY3vz1r2BglzI9AetTcfVqxhmOc
 MSwbU17AECX9GKQwf+h5lScTjNgTXqc+fZGvefpWRMQ9bBrR1WXt5KYIwCAkHGWO6/
 J/cFafh+MqulN8bXThC30Yzx3whQlCPRmfm0VSpFaYE//L5UnWM6L8ODcCD3Fx2Grb
 cQegxGDcdHfWhYwtlyeQuJ5vaDlsHK7LOD9ocfkD6qqsksxQx988946Yl3XSVmYwVj
 45Ku0e9uPdNdg==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
References: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 0/3] Make genaral and simple for new sof machine driver
Message-Id: <163535574829.4012075.6799937823075242004.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On Tue, 26 Oct 2021 17:38:25 +0800, David Lin wrote:
> The series of features will make general and simple for new sof machine driver.
> 
> David Lin (3):
>   ASoC: nau8825: add set_jack coponment support
>   ASoC: nau8825: add disable jack detection support
>   ASoC: nau8825: add clock management for power saving
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: nau8825: add set_jack coponment support
      commit: c6167e10e76fb97d37613004046e66027b3a569b
[2/3] ASoC: nau8825: add disable jack detection support
      (no commit info)
[3/3] ASoC: nau8825: add clock management for power saving
      commit: 6133148ca08a097ed8c57d7f5a7826723273049b

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
