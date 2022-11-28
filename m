Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8E63ADF7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A2DE0F;
	Mon, 28 Nov 2022 17:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A2DE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653605;
	bh=c//u/goEy2+6CBwrRyPBaqKCYYXMEw7JVHoHN1qUyhs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GvKXDMkm7M+N00O2EwiYCaQrz7MzCBiFfYWjjKhdn+eTRfQfk4MKH+xLrueL2PTXJ
	 7cSEp10+4iFtSs1RymN2FJd7qo2CjDJesEB/VaX8ok1Lh5ZOMQNgJl8vy3GRmnUtZY
	 QS81pGAfBgVh50ifBN1OSqJlDMwdsxFckRiJSsFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2787FF8024C;
	Mon, 28 Nov 2022 17:39:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CC77F800B6; Mon, 28 Nov 2022 17:39:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92105F800B6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 17:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92105F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qgknX0V6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3E5161053;
 Mon, 28 Nov 2022 16:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB08C433D6;
 Mon, 28 Nov 2022 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653541;
 bh=c//u/goEy2+6CBwrRyPBaqKCYYXMEw7JVHoHN1qUyhs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qgknX0V6B3AAGc+vD6AHAWUV9spUz3GcAQXvw8x6IJuH7HtwQ+hWQyqozMBtNH6l1
 VVbNaFWWw19kH4I0QjZjAOYmeUnkAqu+M8PoZeKYKj5B+BB8wTvgstikpwzB3d7tr7
 uSGC6ZT8E2kk10n0pPTM1xFsXTzTPIacERkRQbHFA5dlBdmbfUPBhv0s1XtRCGgiCe
 6zCKY+zDdN9N6qLgDwHTvCc0Knb6aM9qqyy7QJNKHrs4UBAGMrlgKybWEtbU33Prky
 GiK7/os4L30uJqhznB/qvVG05XOw/hJNGISAZxuMJ8vd/KQD9aJcyvfDdgDvrJv7Iu
 SZnlt+uHKoXBQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Pavel Dobias <dobias@2n.com>
In-Reply-To: <20221123153818.24650-1-dobias@2n.com>
References: <20221123153818.24650-1-dobias@2n.com>
Subject: Re: [PATCH] ASoC: max9867: Implement exact integer mode
Message-Id: <166965354016.629583.751028886711064959.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kernel@axis.com
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

On Wed, 23 Nov 2022 16:38:18 +0100, Pavel Dobias wrote:
> For 8kHz and 16kHz sample rates and certain PCLK values
> the codec can be programmed to operate in exact integer
> mode. If available, use it to achieve the exact sample rate.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max9867: Implement exact integer mode
      commit: 082d3c998c7b5ee91472c12d2d7dc59d4d1ddec6

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
