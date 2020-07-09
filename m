Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B6C21AA2F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF7FC165E;
	Fri, 10 Jul 2020 00:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF7FC165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332124;
	bh=X9jrVdpxYr/DSxHd+vKioxvT64X2cVBTnZXlPLeMq+4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LawEOdiyhoaZ5p2JXJlDsxMnOIQw2mu3P+aUd8MibZWl5npjz7YgavstD5DT3hT8i
	 USvxu0W5qGEWJFttm4Rb37SYFLj8cHQPf9qvMkBHghL5wc3PaKqHjkMu3GyOeF9/VS
	 FXX+CMt/RJ9xJ1S3dm68WHNC2tZoRSBD8lM2yvTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D00F80257;
	Fri, 10 Jul 2020 00:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B22F80255; Fri, 10 Jul 2020 00:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31169F80117
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31169F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="z/LrGWBG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C24820672;
 Thu,  9 Jul 2020 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332005;
 bh=X9jrVdpxYr/DSxHd+vKioxvT64X2cVBTnZXlPLeMq+4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=z/LrGWBGscb3Y4QXphwUuPVkviZloN5d9ynk3D3ZAmE+HWjFpAA0yDAM8Rei7q5bJ
 eRjJet3+eo5yjq8tIaFOf61nxvJCNkeyFgj6mAWV4z36l5kArP8DzLrI1uyrXK34fR
 cbka089qF7Mwxk+YnsvAk6k9pxyRS/dqf+zZs43Q=
Date: Thu, 09 Jul 2020 23:00:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Nuno Sá <nuno.sa@analog.com>, Jaroslav Kysela <perex@perex.cz>, Oder Chiou <oder_chiou@realtek.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200709010359.GA18971@embeddedor>
References: <20200709010359.GA18971@embeddedor>
Subject: Re: [PATCH][next] ASoC: codecs: Use fallthrough pseudo-keyword
Message-Id: <159433200030.57213.4459453830029311407.b4-ty@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 8 Jul 2020 20:03:59 -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Use fallthrough pseudo-keyword
      commit: 3e146b55a4f5213b5da0f243813efb380fa7f84d

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
