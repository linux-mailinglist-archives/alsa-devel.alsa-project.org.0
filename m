Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972C2EAFA6
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 17:09:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4859D16C7;
	Tue,  5 Jan 2021 17:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4859D16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609862948;
	bh=aCLo2xhJZFJinAotkDQjeIIeunXHBJXvp+JElZ9J2cU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XCFyNdGPQGElsQqANj1XoGDiCBaRZ5mNoPOJ70r4rhba8r9sNeB3Qjrwuc3+RicwZ
	 jm2y+HFs6bGxEKbI4RFeEabWJvLB/2AfZIvlvyNhIlCZiBhIJzxYQcj6NIoJBVGIcC
	 YzLuBFeB8/LNKL+KqvpsD0VULeG7y89FJ7wogG84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E88FDF802C4;
	Tue,  5 Jan 2021 17:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66C0EF802C4; Tue,  5 Jan 2021 17:07:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 757BFF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 17:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 757BFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GADbFOyZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CCE422C9E;
 Tue,  5 Jan 2021 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609862841;
 bh=aCLo2xhJZFJinAotkDQjeIIeunXHBJXvp+JElZ9J2cU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GADbFOyZ+OkRLo7B5KKQk6sQOsr+q+2wHTbJ/yPZnlPABhEHOi0teeyFTpMXn1M0e
 C2PEoZLVgU+M11TSBhTLYrq/23bdP+i7DzJ0GJqBC+7x3sMRO6Xfp5QOZD1WlMfiAb
 7B7YAMnKI2UPSit1x8M39mJGBAsNXHyHVR/YdAqC8RHS9iGNt/pN116ydv2FPAPdjB
 T0u2I57e7FvU34A7n8O37bPHVp+3w5Eph2/y3MDL3OH+9+hKKaWGaK6EVTPVPEjN26
 QqxuTwEqAIaGYTdXMSrbhCfV0X6JNRB25LvvDEedyzlI1N+bI6CgDTaw0p5YbBqFWX
 iCUgQVhuJ6Xjw==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20201225030845.4138497-1-tzungbi@google.com>
References: <20201225030845.4138497-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: rt1015: re-calibrate again when resuming
Message-Id: <160986280837.50063.9380709468821926841.b4-ty@kernel.org>
Date: Tue, 05 Jan 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 25 Dec 2020 11:08:45 +0800, Tzung-Bi Shih wrote:
> Assuming the calibration state gets lost after system suspend.
> Re-calibrates again when resuming.
> 
> The rt1015_priv is alloced by kzalloc.  No need to initialize cali_done
> to 0 in component probe callback.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: re-calibrate again when resuming
      commit: d750570e048165c54a99703729438b2a4ccf379b

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
