Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58232F1AEC
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 17:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E7F170C;
	Mon, 11 Jan 2021 17:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E7F170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610382599;
	bh=d7ibISiOjskDoplEdo0K/B0QYlx60pHLpzeD6btxHgU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e1VYiJfEpzNgwOnNJWgVQPpP756y12uzarcUluyJcocBK1DmL2sAP/BpfMxF2GjhF
	 z3pjeTEB1qmLg3+lyQh0amp65bDVOkVRJzw+RcrvX3zvzv7rP7YzwWoz585Zv4W/jL
	 dN797LPsSZWc6pWiD4k7ysA7mb5UQ2NG/eFlWoc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D21D4F8016C;
	Mon, 11 Jan 2021 17:28:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9577F8016D; Mon, 11 Jan 2021 17:28:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 588C2F80113
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 17:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 588C2F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gi3JkZF1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED8D022ADF;
 Mon, 11 Jan 2021 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610382497;
 bh=d7ibISiOjskDoplEdo0K/B0QYlx60pHLpzeD6btxHgU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Gi3JkZF1zM9lYcpwpsaV3PT8N3hehKhEAKMs3TF00jdNQFcKwweA1ntAHgQW6btDQ
 7eTdT8Jc5tESy4MqvG0E16gMg3/K3lMSucQmzdTwezL8hZt/A5yyTTC2VlU2dSUqz9
 4LzetsBggkXKwp33gAmerbX2MRz5MyLnAXt1fyVu3sYgLDfbiQC5aOaIZbqUz544nA
 KzrnYEwlsmvtPhDIn/V6Khp0gs2XNfOPnSz715lExBSZaehMmf0fMUWJi4hH8E2ABM
 6giypKF/PLqL4/pHOudZH0EbdtJvguCdRwAB5oP9PLVrC6ijGH0GfHhPRhojjNVLJp
 fbT2rnSfFFbJg==
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>, 朱灿灿 <zhucancan@vivo.com>
In-Reply-To: <X/wfXQFxeMLvpO+1@mwanda>
References: <X/wfXQFxeMLvpO+1@mwanda>
Subject: Re: [PATCH] ASoC: soc-pcm: Fix an uninitialized error code
Message-Id: <161038245911.32701.8532839434260700973.b4-ty@kernel.org>
Date: Mon, 11 Jan 2021 16:27:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Mon, 11 Jan 2021 12:50:21 +0300, Dan Carpenter wrote:
> The error path here doesn't set "ret" so it returns uninitialized data
> instead of a negative error code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: Fix an uninitialized error code
      commit: e91b65b36fde0690f1c694f17dd1b549295464a7

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
