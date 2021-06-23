Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E93B1E64
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 18:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F044C165E;
	Wed, 23 Jun 2021 18:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F044C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624464681;
	bh=a9fb1OmIXyYRR5DVn5i5LpyVNuUaMJ+ArHKgLjEbbVI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AA7pv2jcV+KmvDS87ek42zlEEQyB2wTmYBKmuOGhgjNLYNSvuum9n7u2PTHqp1HUT
	 l+eFdgDkb5JibkIcmKXBKgB+I4Rkftf4M3M4A6T+DVXbfnkxkCNsGSa2e+12oDrqaG
	 07eVWNb1bPygak9D7iXxi+cHhG/FZWj5z8039ttA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52146F801D5;
	Wed, 23 Jun 2021 18:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E96AFF801DB; Wed, 23 Jun 2021 18:09:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 873CBF800E1
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 18:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 873CBF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z+wuDago"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DFE8611C1;
 Wed, 23 Jun 2021 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464584;
 bh=a9fb1OmIXyYRR5DVn5i5LpyVNuUaMJ+ArHKgLjEbbVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+wuDagoFRZ3WUE6QB5L8Le5X0PH+ELlnERMWCNQaThVvJw0klcde8MUTITQKnHWZ
 /Y+tii8ugW/X49vAIHr3TJjkkEbRuDwjTGGF8KBTDmHVVsIRWaEVpDLY3E3Vc17Thb
 hugjO5XEZ1xXApJ6f/iWNz+x6grKOxCP4P4PpqW1hwDK3DxZPfpfxXwnDIRnSj2cM8
 wk3Kb0rvC9fGNdYCttXkfyLlbJMGtsXDs8DLEOC4yxgOS35fP0UdtvpDfakoH4thcB
 AE9l6YTFGE8WZP1Ah5xhzZdIeKSoGOzJMwnXeH4+l9CLpdTyO/2oGgTgtGpBH0sxKk
 m+Yh5tyFj1qgw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Claudius Heine <ch@denx.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 0/3] ASoC: tlv320aic32x4: Add support for TAS2505
Date: Wed, 23 Jun 2021 17:08:57 +0100
Message-Id: <162446397756.55213.16376816348258130032.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617085230.1851503-1-ch@denx.de>
References: <20210617085230.1851503-1-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Thu, 17 Jun 2021 10:52:27 +0200, Claudius Heine wrote:
> this is v2 from my patchset that add support for the TAS2505 to the tlv320aic32x4 driver.
> 
> kind regards,
> Claudius
> 
> Changes from v1:
> - clarified commit message of first patch, which add the type value to the struct
> - removed unnecessary code to put and get speaker volume
> - removed 'Gain' from 'HP Driver Playback Volume' control
> - fixed rebase issues
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: tlv320aic32x4: add type to device private data struct
      commit: 688d47cdd9344b1485eb28c2a7aa99743ed529a3
[2/3] ASoC: tlv320aic32x4: add support for TAS2505
      commit: b4525b6196cd7f83eba16d8679a55f8bb9571052
[3/3] ASoC: tlv320aic32x4: dt-bindings: add TAS2505 to compatible
      commit: 8e0eb2fb5c0732a6fa53f2df7079754152857c24

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
