Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F552CF779
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 00:33:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAF7618A5;
	Sat,  5 Dec 2020 00:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAF7618A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607124808;
	bh=WWpc58cptN/CPaaBQ693MgYfMNMsskbv9++KpRXvVdM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hE9CCG1POuT7DwudHj0QrwwQb+/O2NRerlbxzxdDZ+C8LJr06EFnVtmlpVwMpeoKI
	 GKiaXT/XXm3P9OQ/LK6RUHfnSfLqU7zqrygPrBuGdZ5T5Qpx4dZ7+uOn5bQxUSccCq
	 I54NT1ZefY0sBAvdVvxAOMojgGQC4lY2DHcDixhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF74F804D8;
	Sat,  5 Dec 2020 00:30:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E93F804D6; Sat,  5 Dec 2020 00:30:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F052F804CC
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 00:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F052F804CC
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Patrick Lai <plai@codeaurora.org>, Arnd Bergmann <arnd@kernel.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20201203231443.1483763-1-arnd@kernel.org>
References: <20201203231443.1483763-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: qcom: fix QDSP6 dependencies, attempt #3
Message-Id: <160712460214.7629.13610030760770322456.b4-ty@kernel.org>
Date: Fri, 04 Dec 2020 23:30:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Ajit Pandey <ajitp@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Takashi Iwai <tiwai@suse.com>
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

On Fri, 4 Dec 2020 00:14:18 +0100, Arnd Bergmann wrote:
> The previous fix left another warning in randconfig builds:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && COMMON_CLK [=n]
>   Selected by [y]:
>   - SND_SOC_MSM8996 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: fix QDSP6 dependencies, attempt #3
      commit: b1b8eb1283c90a953089d988930d7b6156418958

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
