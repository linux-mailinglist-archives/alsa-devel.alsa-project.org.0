Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0253FC80
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D221AC9;
	Tue,  7 Jun 2022 12:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D221AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599359;
	bh=xbOX5mYkYBdJEqOXhSxMTeZkmlq7lnOk2/ZsAiL1Tyo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lVH+nHT0ccU3C2Sdt0W89sNa76ydABv72whvBACgqSU+5r1MgkrdiISotfwEuHJsn
	 OwdNEaa2xKEqPUyVSnHL/rWL0EDH0a5Iw+qNQKg6L3AZ6kuM7hffU+bJFIkJc709ep
	 VO4p4HFhG9x7oaJ79DFl8Bxz0Eem6G6oz/vOkVsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 663C2F804BC;
	Tue,  7 Jun 2022 12:55:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50867F80159; Tue,  7 Jun 2022 12:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D430BF8013F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D430BF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qyplBmBS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D3C3615C6;
 Tue,  7 Jun 2022 10:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDA9C34115;
 Tue,  7 Jun 2022 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599296;
 bh=xbOX5mYkYBdJEqOXhSxMTeZkmlq7lnOk2/ZsAiL1Tyo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qyplBmBShWIbJyMIvseP/yZMDi+AHH5oxkL11uIwH2u7nYCWOVENTQ3eAH3XMTSc2
 ll9493erhcvy7CTionMdJK/T8tZ2IZfo+cal/sJs7oO12Tk0C8nAU8gv7rMGiUhgp6
 e4/Bvu3xaBJoT/ZxqRvDDX/0qE59iDOxGZ4DqO2al8t3uVNmxO8NFD61BPSNoHTYdR
 +QtrF2NmVd47US0OMol8d3hmlSF/5JXLmOh8j9lofcWRwUU89xLoIH9l2DGdNqIDk1
 3ZxHm3wT+G7FMfTW8ffgvlaXAdI6vEBWiGRHf2uIe+AnPuzTRe2TlkTeGhtQFndJMZ
 0gfUYZkIqkG4w==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, vitalyr@opensource.cirrus.com
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 00/26] *ALSA: hda: cirrus: Add initial DSP
 support and firmware loading
Message-Id: <165459929457.399031.11506855716693117654.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:54:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 9 May 2022 22:46:37 +0100, Vitaly Rodionov wrote:
> The CS35L41 Amplifier contains a DSP, capable of running firmware.
> The firmware can run algorithms such as Speaker Protection, to ensure
> that playback at high gains do not harm the speakers.
> Adding support for CS35L41 firmware into the CS35L41 HDA driver also
> allows us to support several extra features, such as hiberation
> and interrupts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[06/26] ASoC: cs35l41: Move cs35l41_set_cspl_mbox_cmd to shared code
        (no commit info)
[07/26] ASoC: cs35l41: Move cs35l41 fs errata into shared code
        (no commit info)
[08/26] ASoC: cs35l41: Move cs_dsp config struct into shared code
        (no commit info)
[18/26] ASoC: cs35l41: Move cs35l41 exit hibernate function into shared code
        commit: 94e0bc317ad241c022a6bb311b3a28b4d51ea8b6
[19/26] ASoC: cs35l41: Do not print error when waking from hibernation
        commit: 97076475e2fdf471348b9ce73215cdbceeb4390f
[20/26] ASoC: cs35l41: Add common cs35l41 enter hibernate function
        commit: e341efc308e5374ded6b471f9e1ec01450bcc93e

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
