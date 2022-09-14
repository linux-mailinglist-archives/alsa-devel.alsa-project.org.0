Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CC5B86FE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 13:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4981318A6;
	Wed, 14 Sep 2022 13:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4981318A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663153635;
	bh=gsGR7uK+L91dwepl01aajzxbTPAj28CNr4QvBuBbOZc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1G14G5rc3qbzmOHjijMnLCSM8fcyT9xqevyGfFlMnND+8F+xQuaSXrqrIz7EXlwU
	 yR/4moEhJ+DIn4TIChz6rMxFo5FVbXlFRbf9RzMfVo6tSCvDrdpIUoQuvS3YtmX3F7
	 KZjzgZhmNwGXXpluBoLScffmcCQfc5+O+4nbKCKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F4FF801D8;
	Wed, 14 Sep 2022 13:05:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AADBF8016E; Wed, 14 Sep 2022 13:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3DC7F8014B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 13:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DC7F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b9ZZcpIB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5D8061BE0;
 Wed, 14 Sep 2022 11:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD86C433D6;
 Wed, 14 Sep 2022 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663153541;
 bh=gsGR7uK+L91dwepl01aajzxbTPAj28CNr4QvBuBbOZc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=b9ZZcpIBGW+YRWtWA6iJZw/yJM9Pdf5dyjp8rj0g9HUACJikOfGtjb671ufB7eMEU
 bEO2bzcHnPfsreK5gugUEs7XD+vNyMD5F8ziE6IcvVTtsRR8b0sEikKFC2F69wQX5h
 0viMgSglWioQrHmgYxj5VE02hcsPhjj7PXNz+9wh+DS8aRSngA7a+xzKCByx472+rt
 2xHTcrCLo++71bfBiQTBOBOJOiS17kgPOft3ei88tBzqnTUgwiWMjl1em3CpFr91OA
 u1E0T4EwgavnwRB0M3B8gELOpNKQJsKHef1L4BDy8WGIp+b6FLa/atluvHNJJWCVOC
 Faf+HySCxIOuA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Judy Hsiao <judyhsiao@chromium.org>
In-Reply-To: <20220914031234.2250298-1-judyhsiao@chromium.org>
References: <20220914031234.2250298-1-judyhsiao@chromium.org>
Subject: Re: [PATCH v2] ASoC: rockchip: i2s: use regmap_read_poll_timeout to
 poll I2S_CLR
Message-Id: <166315353882.340317.4308348397044706944.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 12:05:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 14 Sep 2022 03:12:34 +0000, Judy Hsiao wrote:
> Use regmap_read_poll_timeout to poll I2S_CLR.
> It also fixes the 'rockchip-i2s ff070000.i2s; fail to clear' when
> the read of I2S_CLR exceeds the retry limit.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s: use regmap_read_poll_timeout to poll I2S_CLR
      commit: fbb0ec656ee5ee43b4b3022fd8290707265c52df

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
