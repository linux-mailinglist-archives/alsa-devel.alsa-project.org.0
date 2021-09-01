Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A613FE246
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 20:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E0F177E;
	Wed,  1 Sep 2021 20:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E0F177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630520252;
	bh=3L67LVXG3RetBW0+Au0YysC6Ac0wjuq3UwkXEFY4DSo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3jR6/AybG1IRz8bQOaW12095svPwfW6ojWSAHprzUv1ciydOY78Os6EEV9/jxfnn
	 SXFgvsmLaH3mS5Ay/FuXpBTyoS/Oh5+AHBKuZiSPpspc48dI38D3erNIPZ4BCx2EQ2
	 Ki2MiIMkNiyrIxAaRbJ9jExOiSFUh5DZC3f2DeGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06339F804E6;
	Wed,  1 Sep 2021 20:15:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57B92F804E3; Wed,  1 Sep 2021 20:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF1FEF80254
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 20:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF1FEF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fWvVE/FU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55BA3610E8;
 Wed,  1 Sep 2021 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520127;
 bh=3L67LVXG3RetBW0+Au0YysC6Ac0wjuq3UwkXEFY4DSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fWvVE/FUPAGe9f6U4fr7EPTzUZofW55UT/vXCXcjLEI4QnfG36ZeAvbdLkZ8Sok2X
 Es31UEQ5WSqSJ6b7L8pzJom9FQy+tQsyWS1JjzNmpeIVVACSSQLNVmUbB26KhuDn3X
 5E76ujvdIIOqDs02/bCMVHFQGLRVLyHrQBSBoJMvWljKgtHumyrZS9slYyMg5XbO/5
 c19F7O4bA+TnCaycPGRx+M2KBjeTWWw0y2eQaqNfhVBn2GM/MEoTBB6MoXc1vemB+E
 Y4uSLSi89oXErPlWzX1SxaD9ecyZrP+6HV7hmRzY0Q71sVL9S76T+ioHcNChGYXRnV
 64vxdd5bR1MBw==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Colin King <colin.king@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: samsung: s3c24xx_simtec: fix spelling mistake
 "devicec" -> "device"
Date: Wed,  1 Sep 2021 19:14:44 +0100
Message-Id: <163051912510.21630.1337130075674390913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210827185003.507006-1-colin.king@canonical.com>
References: <20210827185003.507006-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Fri, 27 Aug 2021 19:50:03 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: s3c24xx_simtec: fix spelling mistake "devicec" -> "device"
      commit: 2a6a0a03117ee349308ab77ac0925fdca8ef32f5

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
