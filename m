Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05E47F016
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 17:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D234B1817;
	Fri, 24 Dec 2021 17:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D234B1817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640362784;
	bh=2uH7mH8oGbK+ACkY2KT3Qtp9cnR6xVZp/PRiSZfd42k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjYshNFABk6djWd57a0qOtTo3kEXRnMOE3qIRC+exV6kqR3G5fcF/slrF7RnZLu3+
	 KmfPYMgQpDGAx8JNeuJf/3PL5G1JG72PtbCrGgYpoe+LjZP0nd/MX3MV9Hd5idBbLg
	 Bj0KCD9vXucVjb8INgfdF2KBn25H9IEsrz4SjoFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307D4F804E4;
	Fri, 24 Dec 2021 17:17:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31FD2F80511; Fri, 24 Dec 2021 17:17:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F08EF804E6
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 17:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F08EF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X7ci/SSW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00B7DB82331;
 Fri, 24 Dec 2021 16:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8546C36AE8;
 Fri, 24 Dec 2021 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640362653;
 bh=2uH7mH8oGbK+ACkY2KT3Qtp9cnR6xVZp/PRiSZfd42k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X7ci/SSWlbVKTlAqNRx3U1GxuuvcCpO69n22EEqaT7GAXWEzxoYC/ovDHmKZcnHBX
 QVZrZn82+Ae1Y7MLY18VuD9XJFx6VtnVWYsge3lijTpoWl8+JTOLlQvvR/sMRFts5F
 qLrellKiB5TKT6bbhX2VPukK20iA7X3pT5QC612Xdl2WFwAEe68ZTsIyrs8xhk7SZX
 ROIX+EODVm+CErDyA77e+cV5wfRos4z9jiqTDdB0vuFWAwKuIZYDdDoC0RJ4VGLp8y
 k/q6tEv8ameWH3M7z2mn7VdvhyUSV871V1hEMCvSCUzWmfMKHku9icjQJ31cft7m8y
 cBl4Z1r43fO8g==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20211224064719.2031210-1-tzungbi@google.com>
References: <20211224064719.2031210-1-tzungbi@google.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: fix device_node leak
Message-Id: <164036265260.3720027.15119723749705753132.b4-ty@kernel.org>
Date: Fri, 24 Dec 2021 16:17:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com
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

On Fri, 24 Dec 2021 14:47:15 +0800, Tzung-Bi Shih wrote:
> The series is a follow up series.
> 
> The 1st and 2nd patch follow [1] to fix the device_node leak.
> 
> The 3rd patch follows [2] to reduce the log verbosity.
> 
> The 4th patch cleans the device_node related code on MT8195.
> In order to align to previous platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt8173: fix device_node leak
      commit: 493433785df0075afc0c106ab65f10a605d0b35d
[2/4] ASoC: mediatek: mt8183: fix device_node leak
      commit: cb006006fe6221f092fadaffd3f219288304c9ad
[3/4] ASoC: mediatek: mt8173: reduce log verbosity in probe()
      commit: db3f5abe68ea5ea39d84e6af4f0f2ce5d5e2daf4
[4/4] ASoC: mediatek: mt8195: release device_node after snd_soc_register_card
      commit: 082482a5022780d42180a394fe6843e71fe963d8

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
