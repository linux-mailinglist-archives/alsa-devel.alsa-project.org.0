Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8343851E
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 22:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3191670;
	Sat, 23 Oct 2021 21:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3191670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635019217;
	bh=6RYOjNhOqePoqMrCgzEd2gm+t+nWvwhsZ3euwxjtfQU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoG4w8gyBGusUfuRF24tc/nUUBmu2xOkMi+FqWWFs6krJwPR+/7oVFnOz/t3JESsm
	 9xQOYVvPkmVOoq7PcI+loqRnbPabxP1szVH0WK4ToJoJiwzVb/yu19bTcfBt5Lgzpn
	 O60YIvV1qhhDqgET6dzwVCpyAChvWgcpGD4RgjdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3630EF8025C;
	Sat, 23 Oct 2021 21:58:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8248FF80246; Sat, 23 Oct 2021 21:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E46CF8019B
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 21:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E46CF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nhYww2XP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31A4E60F4B;
 Sat, 23 Oct 2021 19:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635019107;
 bh=6RYOjNhOqePoqMrCgzEd2gm+t+nWvwhsZ3euwxjtfQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nhYww2XPm2pLDBSD6l3I/eOlM9DOqSkHqQEKy8dKtr6+OUSLVde8PJHwm7ucipHJ5
 x0SHPREQMOaWppWgNZp5ILctUJAfwuEDzl/eukvMgDN9FeWPBpZ12Shu6JgJIzmKw/
 yncDRK6Dr11Q/m23QTZc4D0ucYMlweEfVaWjR6sBzsQPE1yExKK0KNSySeK0PiMcQq
 jc7ZNyEl2m8urfv81VhmvE8F6nG0Q/R3duVX+9sRqZX3B2vnw6TPut9hrDVVVZd7ze
 HHATLGOGWrvXdAdIeq/JX27H/MRjRmd52ImOT07isGBo9EF5OjM+AFfyAt27AdOzYG
 DtnxukI1nTmEg==
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 0/8] ASoC: Add common modules support for ACP hw block
Date: Sat, 23 Oct 2021 20:58:07 +0100
Message-Id: <163501902839.919045.6650764358822175726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mark Brown <broonie@kernel.org>, Sunil-kumar.Dommati@amd.com,
 Vijendar.Mukunda@amd.com
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

On Tue, 12 Oct 2021 12:49:31 +0530, Ajit Kumar Pandey wrote:
> changes since v2:
> - Fixes Kconfig description and indent.
> 
> Ajit Kumar Pandey (8):
>   ASoC: amd: Add common framework to support I2S on ACP SOC
>   ASoC: amd: acp: Add I2S support on Renoir platform
>   ASoC: amd: acp: Add callback for machine driver on ACP
>   ASoC: amd: acp: Add generic machine driver support for ACP cards
>   ASoC: amd: acp: Add legacy sound card support for Chrome audio
>   ASoC: amd: acp: Add SOF audio support on Chrome board
>   ASoC: amd: acp: Add support for Maxim amplifier codec
>   ASoC: amd: acp: Add support for RT5682-VS codec
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: amd: Add common framework to support I2S on ACP SOC
      commit: 623621a9f9e1a2f4bf1c69d066b7de3de2b12df6
[2/8] ASoC: amd: acp: Add I2S support on Renoir platform
      commit: 58c8c8438db45fb22b8d855645e2d4d15ca9ee72
[3/8] ASoC: amd: acp: Add callback for machine driver on ACP
      commit: e646b51f5dd5e92bcb159cb932aa540451ac803f
[4/8] ASoC: amd: acp: Add generic machine driver support for ACP cards
      commit: d4c750f2c7d44b5b39e197308bc3f510205bba4b
[5/8] ASoC: amd: acp: Add legacy sound card support for Chrome audio
      commit: 9d8a7be88b3365e4df6bf983b9af5399f9c81491
[6/8] ASoC: amd: acp: Add SOF audio support on Chrome board
      commit: 9f84940f5004e1d29f28b85294d4c3b683ff3ff4
[7/8] ASoC: amd: acp: Add support for Maxim amplifier codec
      commit: cabc3acec02a3fb63efaba8ac892b54e823cd111
[8/8] ASoC: amd: acp: Add support for RT5682-VS codec
      commit: 8b72562668481894239e145afd2f651a7f83a728

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
