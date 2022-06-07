Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE253FC7F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18ECA17BC;
	Tue,  7 Jun 2022 12:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18ECA17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599351;
	bh=ju/thgHaZCbsHEzLfcSKTct+dzcKTeAOXbp1o1LwCQM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GWmNbsWKJ4Jm4AHmlbHd+7V9Cf43YdYZUE5Rc+SEd2GX4r5FtWmQQVztGeEoSMHoe
	 0dHerQb9OSh4X23Qh4GhNcmUwQ2Oe1my4l0t3/gRaINrgk4sLkkrZ2CT1MQuHjZQzx
	 NyToJ/uGYFTXdNvjg6orppLGz8weS5iW5LI1a+WQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5F02F80159;
	Tue,  7 Jun 2022 12:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA5F0F800ED; Tue,  7 Jun 2022 12:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA3B3F800ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3B3F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L6xt5hVu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF6C5B81F03;
 Tue,  7 Jun 2022 10:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269DBC385A5;
 Tue,  7 Jun 2022 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599294;
 bh=ju/thgHaZCbsHEzLfcSKTct+dzcKTeAOXbp1o1LwCQM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L6xt5hVuwzBV7LAzSmGLfvgwJXVojmrbNxtvGFtE1f00OM1L+m2M2H8tTgpqdJybB
 MuIxhN4w+yE53pJAtHEGe5qYxtlpvlQoSOSCbOytRga9WyZsFN9X8csn2xp/a2tco9
 abxMo71A1hiHKx541Ql2ZTZrlkKU0P/52J/0HMyeCT2kVw4JcfCPScWx9bDe9U3r5/
 C2VMduevRuenRg2+veqMhAMsdnjXpbYkdm/Vrv1gEfiow3X93mnPC/Z7yO5L0pXwem
 YvPEQQHuWA4d60dOGdJO6sjX1ICbHs9EqDmyo0bYJ7w1VDCHd0AkQ0TEKsQFkbin4L
 2IFfCXBiYkciw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, vitalyr@opensource.cirrus.com
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 00/26] ALSA: hda: cirrus: Add initial DSP support
 and firmware loading
Message-Id: <165459929286.399031.12191464826134197101.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:54:52 +0100
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

On Wed, 27 Apr 2022 16:06:54 +0100, Vitaly Rodionov wrote:
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
