Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA1602A2F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02999C3C;
	Tue, 18 Oct 2022 13:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02999C3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092714;
	bh=EO5hPshGGBHiFaHBKiOjtX+wVrq1cMA7Ob1kzX2IeQA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bz4H8TwTP0svXWseQPreWjcE5Kg9s+M34x8avdFNPVVXmTmLLNIHTc5iCymAb3RMr
	 Wzcjb+WI5lcrO/+qg0V91vlSsDM50QyTsfqYNlBNwqYTgmZXvMTCIPi5SDOqFR/KTd
	 WpZxtB6kGAcpA1wPzo86jZHxacX+UKaNXgKqJT+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02734F805A9;
	Tue, 18 Oct 2022 13:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B776F8059F; Tue, 18 Oct 2022 13:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82DA9F80566
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82DA9F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BOt7ASQD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D0C6B81EA8;
 Tue, 18 Oct 2022 11:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B9FC433D6;
 Tue, 18 Oct 2022 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092514;
 bh=EO5hPshGGBHiFaHBKiOjtX+wVrq1cMA7Ob1kzX2IeQA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BOt7ASQDe6Ct4Bes/agdN3BKa3Qy5i86UMyBwcOi86h+GSsoz7hrLS/liFkDU9u+f
 QenJBDEemTLX/EiWu0IFyIO41lH6cD/6xH5Ib89cLirW7ys/gZRE/B6Kd0Zu1BjVhW
 5hUbDFl1nujWYcNCGlwjkBq40PlNi/TA1hS3EVBXxUhx+JULWYykIGPOIqEdYM5lMk
 ckL0MhhjpdRaapbJtszjHB6zS2TnsuhAxscVV1NW9N/CvVt3o0OVC1tyrn/Q74wRi6
 EsdW3wdy3nTvwH19rBPnuBO83h8yhww8PQMNBY0vHHsNvah7qmuglvwwnfnm0RHNT+
 M5/347LKwoKQg==
From: Mark Brown <broonie@kernel.org>
To: Siarhei Volkau <lis8215@gmail.com>
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
Subject: Re: [PATCH v3 0/7] ASoC: codecs: jz4725b: Various improvements and
 fixes
Message-Id: <166609251307.155136.11548088283059583394.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
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

On Sun, 16 Oct 2022 16:26:41 +0300, Siarhei Volkau wrote:
> The patchset fixes:
>  - Line In path stays powered off during capturing or
>    bypass to mixer.
>  - incorrectly represented dB values in alsamixer, et al.
>  - incorrect represented Capture input selector in alsamixer
>    in Playback tab.
>  - wrong control selected as Capture Master
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: codecs: jz4725b: add missed Line In power control bit
      commit: 1013999b431b4bcdc1f5ae47dd3338122751db31
[2/7] ASoC: codecs: jz4725b: fix reported volume for Master ctl
      commit: 088777bf65b98cfa4b5378119d0a7d49a58ece44
[3/7] ASoC: codecs: jz4725b: use right control for Capture Volume
      commit: 1538e2c8c9b7e7a656effcc6e4e7cfe8c1b405fd
[4/7] ASoC: codecs: jz4725b: fix capture selector naming
      commit: 80852f8268769715db335a22305e81a0c4a38a84
[5/7] ASoC: codecs: jz4725b: use right control for Master Playback
      commit: e6233ee25059de0eeac6ed3d9d49737afdbd5087
[6/7] ASoC: codecs: jz4725b: add missed Mixer inputs
      commit: 616c291820d155cbad258ecae5c7dbca2c01f07f
[7/7] ASoC: codecs: jz4725b: add missed microphone widgets
      commit: 4b192aa09b3c3615c79f8c60704a2efd15e500d0

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
