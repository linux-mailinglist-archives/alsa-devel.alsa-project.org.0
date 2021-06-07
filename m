Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE439E70B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 21:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1804B1671;
	Mon,  7 Jun 2021 21:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1804B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623092569;
	bh=TqvQgPLw+SRotU9+5VQHB7MXw6yubtkFMcOggx44GO0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDKjHErQgK9X8jz71YnWK0+kbLmiaCx2ho7Vp7tm2uGt7qW7Ug9fJ4181FPBsrpPg
	 ZHN4BcUvv9ShG9efsDQSGR8/7nJj9xCD65v8Cqn48G4VHXeOy/EbPOBuglXGcS57pv
	 7QmEAMzaGZg6wehs+VZo0k9rktkFXy9mvwNRQv94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72ECCF80276;
	Mon,  7 Jun 2021 21:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE297F8026C; Mon,  7 Jun 2021 21:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D25F800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 21:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D25F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cr2uIJbb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0142361205;
 Mon,  7 Jun 2021 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623092472;
 bh=TqvQgPLw+SRotU9+5VQHB7MXw6yubtkFMcOggx44GO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cr2uIJbbpwj/zEHb8m+7IoQF/jDT1shTGqf1/prag2tGdzKoioJkN78TxtLSTmpHI
 sjHdskydyxDYAzhs8QTQn/YWW2so3TfQ557R9YJQlwTHqqsWCTevuHuF3+uSyE160A
 CeexD5w1Go8PsWhx2+RQQPOXrGMl3qwHmxaFYSKFrdIispdaGgwKkSzZmb2BhDHAde
 Qr+zr2tiCTV4j2ZXVQ+hZlzhmOMtfyqfDPkLdN30nzxfNW/1wEMUcA81vzTZAMHTpW
 jAOtBbQoKoOYhQVnggmuZY+ip2PpxsofQRIXsV8KK4V0/Xc+mJQvtBVzTEiCwflQM2
 AHZv7MxxRMf3w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: rk817: Remove unneeded semicolon
Date: Mon,  7 Jun 2021 20:00:44 +0100
Message-Id: <162309220525.30523.10384429738666319055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1622802209-45031-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1622802209-45031-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, tiwai@suse.com
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

On Fri, 4 Jun 2021 18:23:29 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
> 
> ./sound/soc/codecs/rk817_codec.c:49:2-3: Unneeded semicolon.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk817: Remove unneeded semicolon
      commit: 54f6731394520d706c3133aab17aa90434bcf1aa

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
