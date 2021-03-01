Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA6329545
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:39:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9316C1686;
	Tue,  2 Mar 2021 00:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9316C1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614641959;
	bh=OKydMsGi2kOOCi5NWNCxVzfr+l8o+583tQ3XJ7DjMbc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIKFJbhAX5oHTk6uyuBPI/yXFwhB6u+gMhTveF88t7BgEjKPZ/x/P4EDt/g5MPb5F
	 TNXBuXX3hyRAdD8aocAkqxT8pYn3q5nONIjahNEoYSJjDrSpST7u0pChsRYD9nWFU2
	 KfFGJTATEBKPf4OtpnWZdMlIy7GZx46eWRwufuZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0BC6F804AD;
	Tue,  2 Mar 2021 00:36:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB8C6F804AC; Tue,  2 Mar 2021 00:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51207F80475
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51207F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aAgKMHzz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 459A16024A;
 Mon,  1 Mar 2021 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641774;
 bh=OKydMsGi2kOOCi5NWNCxVzfr+l8o+583tQ3XJ7DjMbc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aAgKMHzz15l90tuH2BwyfRzZKhCJ7ky9qrCmntzjbMsPtvJ8FS7vlCuvXqqhRK7VD
 uhtrm72yof88kfscqcR4kqNIyTvNmXYCfI5igcNht5/IKB/fNvFD2okVHvab1wrgS0
 7HqbnvAEeCQEXI0a9CiJdZaWSP6gb2V4z8t0H23Rmo9l94OiSB5UDX0Qb8VVBq1es7
 OgzwyGJqQc8yNBLmRLa6jjliXAZ2DoJTHOkRVsMPSzrEUCaVryqTFg+jtFS6MoITND
 YATooBczH8DIMg9Guve5HX3WX4hba2VZ+F0PZk2CstQtpK9KimP+7eY5Yn4IiRlwbW
 k8uS5tvJsV+6A==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/6] ASoC: samsung: remove cppcheck warnings
Message-Id: <161464168095.31144.10124667274915778506.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Krzysztof Kozlowski <krzk@kernel.org>
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

On Fri, 19 Feb 2021 17:09:12 -0600, Pierre-Louis Bossart wrote:
> No functional changes except for patch 2 and 3 where missing error
> checks were added for consistency.
> 
> Pierre-Louis Bossart (6):
>   ASoC: samsung: i2s: remove unassigned variable
>   ASoC: samsung: s3c24xx_simtec: add missing error check
>   ASoC: samsung: smdk_wm8994: add missing return
>   ASoC: samsung: snow: remove useless test
>   ASoC: samsung: tm2_wm5110: check of_parse return value
>   ASoC: samsung: tm2_wm5510: remove shadowing variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: samsung: i2s: remove unassigned variable
      commit: b832fa1ce0826a915a9e1fe533fc86a1cf5ae8cd
[2/6] ASoC: samsung: s3c24xx_simtec: add missing error check
      commit: feb45eb2ecafdfaca5b82f27997e717ae3c70323
[3/6] ASoC: samsung: smdk_wm8994: add missing return
      commit: 1e4a9fcffd56b73acf4e706465be2df261da83de
[4/6] ASoC: samsung: snow: remove useless test
      commit: 4ff97b8dc7e6a3c5caf733ebad4efaf018829142

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
