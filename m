Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E715E434A12
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:31:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC6416F1;
	Wed, 20 Oct 2021 13:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC6416F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634729470;
	bh=42x4PGFADwvGZVixkPIeVrvSgoB8AbaatJsgOjYBdaY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKPOaQGDO0mxnHMKsd9XK5MaTyXIAz6pbi44gk0jvcgJOlQkv4r4JyLPP8Vs+iMJo
	 l90shug/e/sJRb/mllmZKjSSVU3LA8Mfh+JFU9fdR6yTEuxWQ0gsUY6c0H+HwFl+5j
	 Z0eYQRGi9VjSkmlBFOx5mb5cUD1fSrFwbDNEbKmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A161F802A9;
	Wed, 20 Oct 2021 13:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4ED0F802E0; Wed, 20 Oct 2021 13:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B89DF800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B89DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TL2dMFoR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EDA461212;
 Wed, 20 Oct 2021 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729335;
 bh=42x4PGFADwvGZVixkPIeVrvSgoB8AbaatJsgOjYBdaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TL2dMFoRvijHDYElQPdlK+1K7gKue66cm65gZaQx1vGycZKBN8QdTj/pl3tF7vRKR
 sVHcafdxdsArYF6ZfS4IXFbjvavunQ0SopwTuvyN7zuXi37wB68nb/hB6C19X2zy2A
 BZ5SUlBbYBXaCx1jf2B0r8u3WKNw+zPa7lQIOQw0oQumRwQq/85Pr37sIyECZ0QVMP
 GjnPVy2GgZZ1FQL5NgXSFGdcvSgjVCn/P06lRmupfzuWCXNxltAc5RjH0AQKi4yMV3
 O0Bke+0MF6igIKzlzuCLFBl/DVEAp5rWs0LHlhcJNFuTLbmjQf+mzhN4X3aXhba59p
 q+KIU5DOzoPPw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] sound: soc: tlv320aic32x4: Make aic32x4_remove() return
 void
Date: Wed, 20 Oct 2021 12:28:38 +0100
Message-Id: <163472931363.2896549.12018108884717517601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015071113.2795767-1-u.kleine-koenig@pengutronix.de>
References: <20211015071113.2795767-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de
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

On Fri, 15 Oct 2021 09:11:13 +0200, Uwe Kleine-König wrote:
> Up to now aic32x4_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: tlv320aic32x4: Make aic32x4_remove() return void
      commit: 0f884099a57516c0f1b66aa29e03b9265b242fff

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
