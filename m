Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BA3A7DE5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 14:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB4D169E;
	Tue, 15 Jun 2021 14:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB4D169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623758936;
	bh=/daMUTS8B/5YNsD/HuXDLshXDtUc1JGW3xyBGeJw/yM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMrxz7gMZDjKjKQlrXred8D6oAdp4A9k+suD7cRXfjb1moGy7XAxrS5eUF8BPbUjc
	 O/AXbrUtu4qQimeoSitb0ixr/iEKOJ8kGaU0b939XlPtfbTJMLv+a4Q6P2WbBKsDkH
	 qYj6R466aplM2vYcuMSsiqZJi5jbt/jAUcx19hHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF45EF804CF;
	Tue, 15 Jun 2021 14:07:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2809F802A9; Tue, 15 Jun 2021 14:06:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DBAF8016C
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 14:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DBAF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hkVDK9KW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6AE66140C;
 Tue, 15 Jun 2021 12:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623758811;
 bh=/daMUTS8B/5YNsD/HuXDLshXDtUc1JGW3xyBGeJw/yM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hkVDK9KWawPhP92D2ldhtMc+k8ajdcN9uO0ANsOwNPl9XCIVuM4zjCqpMCAq7udOb
 Uo9H5kL16cqzDCAnmHjb9p0H8vzYsizFRmjuT68SX0688y5IU3Q5OYXBWZAfKhxhMj
 DPFk5zozzj2Aai8BLWobghkX0HPN8uvUkJ8ctHlS0h7Lh5Q6YurnTZ7/WxID8u32mX
 /HH8P0Fpkg5qB76uJd590AVzepWFmabjJmDJ9ryN29WEsxTSpGXVB4zzQHvvdSHTL6
 PNsS2wkVlvLUP9Y9mPw8DSa0vtc4wC8x3ri5ff/LIzu41z1vz0WdLrblD1yG+YId/p
 COE1EBQEcqqcg==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ion Agorria <ion@agorria.com>, Takashi Iwai <tiwai@suse.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v6 0/4] Unify NVIDIA Tegra ASoC machine drivers
Date: Tue, 15 Jun 2021 13:06:26 +0100
Message-Id: <162375817572.30661.13025882740801686844.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529154649.25936-1-digetx@gmail.com>
References: <20210529154649.25936-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Sat, 29 May 2021 18:46:45 +0300, Dmitry Osipenko wrote:
> This series squashes all the ASoC machine drivers into a single one,
> this change was suggested by Jon Hunter. It also sets driver_name and
> components string of each card, allowing userspace alsa-lib to find
> UCMs at predictable path.
> 
> Changelog:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tegra: Set driver_name=tegra for all machine drivers
      commit: f6eb84fa596abf28959fc7e0b626f925eb1196c7
[2/4] ASoC: tegra: Unify ASoC machine drivers
      commit: cc8f70f5603986a99e7775f3cc4a10d337b82a4d
[3/4] ASoC: tegra: Specify components string for each card
      commit: c16aab8ddc645f129880a266c1626b07b41f7c55
[4/4] ASoC: tegra: Squash utils into common machine driver
      commit: 8c1b3b159300cc5ef6ba0d4b039ef68e766d46e3

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
