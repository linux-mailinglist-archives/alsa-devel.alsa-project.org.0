Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135503EEE70
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 16:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C882822;
	Tue, 17 Aug 2021 16:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C882822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629210264;
	bh=hr5UEOBW5fqZ7nZASduCw+ZaMHxciFlvvSDGX39MS54=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoQyey+UP9wuUV9GNYyS7RlJItlkSHb+zDarlyiRH8bEvF13hOgl8bNqJc986vLMu
	 wIp+Mi5FUIBTgMtb9K+SMofwisP8jR2qQW0rlR6ehdueqbZa+Wj2ekErIF0TNUa5wo
	 2AfPJvVaQ73He64SfV2b/e+2mPQPb4suEuVltUlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 288EEF80111;
	Tue, 17 Aug 2021 16:23:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A0BF804B0; Tue, 17 Aug 2021 16:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0597DF80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 16:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0597DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GKno8M3j"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E2E360F5C;
 Tue, 17 Aug 2021 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629210183;
 bh=hr5UEOBW5fqZ7nZASduCw+ZaMHxciFlvvSDGX39MS54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GKno8M3jE2vpGkGi1kpXDHzQyyx06xSoyFMV+LdQuDwlQcW8eAlwKqQMIf4DAk+rz
 iCqyWOJC+CvBEKQOKPcf3jnA8g6QTn+h6WspN5SNBBkdZ6UYYE2GnT1oJs6InICQeg
 4qIFu5cB68of3eChVXVfADG1ZIovGy+fV+h3xOrl/Ha60ZPfcv15jWuO0iah9yLl0S
 nX6LVWR729RtbTok38oSOJtSRiUQDqZaVrFz6HUkADauyPfMAsKqKH4JWyurk6HeXG
 MbxLxqvUpLYs4UUXesYk9/wlicS/AqHK/rRaOXTG4FQkUhfK6MfLCBc7hjMXD3LrLo
 onLwPklbm9VEw==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Use cfg-lineout:2 in the
 components string
Date: Tue, 17 Aug 2021 15:22:34 +0100
Message-Id: <162920984133.3104.8157769461708473655.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816114722.107363-1-hdegoede@redhat.com>
References: <20210816114722.107363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Mon, 16 Aug 2021 13:47:22 +0200, Hans de Goede wrote:
> Use "cfg-lineout:2" in the components string on boards with a lineout
> instead of "cfg-lineout:1", this better mirrors the speaker part of
> the components string where we use "cfg-spk:1" for devices with a single
> speaker and "cfg-spk:2" for stereo speakers.
> 
> The lineout is stereo by default, so using ":2" makes more sense, this
> way we keep ":1" reserved in case we ever encounter a device with
> a mono lineout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Use cfg-lineout:2 in the components string
      commit: f8043ef50acaeb396702481bd2701066bac8a2bc

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
