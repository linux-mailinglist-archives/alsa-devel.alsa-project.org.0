Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB353FC0B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16C41A23;
	Tue,  7 Jun 2022 12:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16C41A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598939;
	bh=tMS1gG3dXMPWf84lcdBNSw3MxsgI83j5BwdlSZTqOaA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8BMgUMniMPXTV7ZqqhMBM/L6FL6klT+n8e/XJjP1e4o3v6PNoggqDlDF00HIGZXs
	 BZQp+HJeQqGo94P8vwexPSRqHn9vaWHZ0WTxM7ehDgjOVWFaFfwcIPBvgZXQkyiOYh
	 jNsKiGMCizyFP8xWxGIpKeVEtDly0s5JnkMw0VO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 056F6F80563;
	Tue,  7 Jun 2022 12:45:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CB05F8055A; Tue,  7 Jun 2022 12:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE40CF8055A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE40CF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fSj1nLhW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3B986152C;
 Tue,  7 Jun 2022 10:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0A0C385A5;
 Tue,  7 Jun 2022 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598740;
 bh=tMS1gG3dXMPWf84lcdBNSw3MxsgI83j5BwdlSZTqOaA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=fSj1nLhWMxGdMrbyxQD622Xxcv9d4lhwS3PvmyWltkid6i7b3ugUjtTYNQ9Gc2VqJ
 7Nh/qd88jGvpD9J70u5ab46ybKz2OpUxLau3iYDBPrwl1Dj9UWVpld1nrLTgdwBLnt
 B/Kl3yGmPv/9zut2uRxca/zlmMg8QZf6D9YdhUOtNh73aWRctSII5RstzBKKqZ96vg
 u/qW2ZDK3NMvLxKL/mrvq/pusJ/s3sdPEVivGeUHDMEk4Ew1XYBdarVjJ/Rlqk+GYy
 TEqy3U6uNwiq/Y4JXILcrm06XtAp/1852GT+15LJ0aqrYowdrIsQyHPOCffmca/tNe
 ekQ2oT+q0CgGg==
From: Mark Brown <broonie@kernel.org>
To: cychiang@chromium.org, chrome-platform@lists.linux.dev, linmq006@gmail.com,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@google.com,
 Takashi Iwai <tiwai@suse.com>, groeck@chromium.org,
 enric.balletbo@collabora.com, linux-kernel@vger.kernel.org,
 bleung@chromium.org, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220603131043.38907-1-linmq006@gmail.com>
References: <20220603131043.38907-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in
 cros_ec_codec_platform_probe
Message-Id: <165459873804.301808.717161588235185866.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 3 Jun 2022 17:10:43 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
      commit: 0a034d93ee929a9ea89f3fa5f1d8492435b9ee6e

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
