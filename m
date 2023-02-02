Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 266306882CC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 16:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703C99F6;
	Thu,  2 Feb 2023 16:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703C99F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675352314;
	bh=Py0H+lR98VdNfeq5TJiyrbOPlLPA72osn5rSa82lGpo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FWWpWs3wRm7+I9j4qCax7Jvl661TZs71JPMJiZ/j3tXWVKQ+0BApmj2Rf2MFrlyCH
	 DE4w2b0IHG9ZX+VvZNYbrH0b6ttpNprXH35xlOU78lYtkwrNSuHRbSixaAmD0QnhJe
	 x7PIrfxGnHgEG13mVs/G5RzlCB20CUj0YEgiJyZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6DC1F80169;
	Thu,  2 Feb 2023 16:37:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06156F804C2; Thu,  2 Feb 2023 16:37:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40BACF800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 16:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40BACF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DfelU0cW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8ED77B821D8;
 Thu,  2 Feb 2023 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18B1C4339B;
 Thu,  2 Feb 2023 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675352246;
 bh=Py0H+lR98VdNfeq5TJiyrbOPlLPA72osn5rSa82lGpo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DfelU0cWLmnpu9pmhBNkE5BnsH4UoUpyeNEeW8/bszy/AIWZueG8cyAsePHLMS8XM
 +JtnYJ7QRIBH+6Imxqb1xXgtmdCQ6SkMCPbdvX97KqJG2w+2dlwCETLiOTU8hSx0yf
 UqXmyFP+xZnLqn8yCgiDqI6+B1gfZTlhe2GmkuCAlQdqutBPgdJ/F/J4jGLSx4ppLh
 4wkdXxs5TSsDEpy32cACPy47CzSTJTOHpH+C1lQQIZOP0EgWiuBTtEUf+wARCqjCff
 JtfkxmJ/lE8RGn7M1CIDQRIwkQxMt9ceYtewKh60tFZRoRVl4h2MX4yUXRNwC+xVpO
 9Nfze4ubFqg6g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <jkysela@redhat.com>, 
 Mukunda Vijendar <Vijendar.Mukunda@amd.com>, 
 Saba Kareem Syed <Syed.SabaKareem@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230131184653.10216-1-mario.limonciello@amd.com>
References: <20230131184653.10216-1-mario.limonciello@amd.com>
Subject: Re: [PATCH v3 0/6] Fix default DMIC gain on AMD PDM drivers
Message-Id: <167535224445.408582.16811199790062194600.b4-ty@kernel.org>
Date: Thu, 02 Feb 2023 15:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Pearson <mpearson@lenovo.com>,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 31 Jan 2023 12:46:46 -0600, Mario Limonciello wrote:
> It's been reported that a number of laptops have a low volume
> level from the digital microphone compared to Windows.
> 
> AMD offers a register that can adjust the gain for PDM which is not
> configured at maximum gain by default.
> 
> To fix this change the default for all 3 drivers to raise the gain
> but also offer a module parameter. The module parameter can be used
> for debugging if the gain is too high on a given laptop.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: amd: yc: Adjust the gain for PDM DMIC
      commit: 6d6f62c868a8ad9c451c22f9f20f08a6149f8487
[2/6] ASoC: amd: yc: Add a module parameter to influence pdm_gain
      commit: 02ea45d10fab99040c87d0267656930accb91e3c
[3/6] ASoC: amd: renoir: Adjust the gain for PDM DMIC
      commit: 47dc601a067d9a79989310c8a1f93ea390ae9ead
[4/6] ASoC: amd: renoir: Add a module parameter to influence pdm_gain
      commit: b7d8d4ec80ee380a82d6748c1d4e9fd89ce6e595
[5/6] ASoC: amd: ps: Adjust the gain for PDM DMIC
      commit: 99ecc7889bee68fdf377f328c21ad0f953f8b05e
[6/6] ASoC: amd: ps: Add a module parameter to influence pdm_gain
      commit: 5579a966229c3365d0e2c91e9a96fc40e293dffa

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

