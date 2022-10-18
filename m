Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1099602A28
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F4239BFF;
	Tue, 18 Oct 2022 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F4239BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092605;
	bh=pI36XOkkoXboW1diIWhOh4jcI962SNyYxN1ABYije7U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msIslwH7C3AOziX4Rv5PIdizWF6dYlWuMG23Ix+wN6stMrBfv9Vz/8d0We2nOrPdc
	 KqDCYerMvFnFLd7g8fCnmD2kHMCaoIhu0eTSB55pHkWR78CCIMXpCS1p8f5Ob+Hk0x
	 Nx8UYQq+NKNq9HUmDWG8jE+fDj2xYW5UrnZFooXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E464CF8054A;
	Tue, 18 Oct 2022 13:28:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79FD6F8053C; Tue, 18 Oct 2022 13:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5B6AF804E0
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B6AF804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DjsY5NGS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A31BA61531;
 Tue, 18 Oct 2022 11:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A290C433D6;
 Tue, 18 Oct 2022 11:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092501;
 bh=pI36XOkkoXboW1diIWhOh4jcI962SNyYxN1ABYije7U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DjsY5NGSNOLccv65O4yqW40NUssLaHumEw+oqIdgMXmc05jZgxYd6sr5BVPLdy8yq
 lza28V6sN4N2ptonfgqcPc43f1vegrfn6Pz1UDXf7OJSe1SxWSA+fuE+b9mQAXqDPP
 qWmdb+ljLdmmRPbDHA9Cjj8cWmYlFuhjl/DXW8+hHD+v0GanQRtujHn5lemv1xhY9v
 hCwchU3wtDug0hHt/tw3hhK9ymh6aTjX2NJnSzKxrywCsJAjF71lzfeS8xS0QM1j+M
 XQiGDBDVQEtOls1HC0D6DnWmlwA8Qy+m/XCLwoOR6514tZXZ8AvLK0BOI/SJB/+V2x
 yUF8vYJsbbPLQ==
From: Mark Brown <broonie@kernel.org>
To: Siarhei Volkau <lis8215@gmail.com>
In-Reply-To: <20221010185423.3167208-1-lis8215@gmail.com>
References: <Y0P/u4pJT8rup8Za@sirena.org.uk>
 <20221010185423.3167208-1-lis8215@gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: codecs: jz4725b: Various improvements and
 fixes
Message-Id: <166609249915.155136.16491946248695409974.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:19 +0100
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

On Mon, 10 Oct 2022 21:54:17 +0300, Siarhei Volkau wrote:
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

[1/6] ASoC: codecs: jz4725b: add missed Line In power control bit
      commit: 1013999b431b4bcdc1f5ae47dd3338122751db31
[2/6] ASoC: codecs: jz4725b: fix reported volume for Master ctl
      commit: 088777bf65b98cfa4b5378119d0a7d49a58ece44
[3/6] ASoC: codecs: jz4725b: use right control for Capture Volume
      commit: 1538e2c8c9b7e7a656effcc6e4e7cfe8c1b405fd
[4/6] ASoC: codecs: jz4725b: fix capture selector naming
      commit: 80852f8268769715db335a22305e81a0c4a38a84
[5/6] ASoC: codecs: jz4725b: use right control for Master Playback
      commit: e6233ee25059de0eeac6ed3d9d49737afdbd5087
[6/6] ASoC: codecs: jz4725b: add missed Mixer inputs
      commit: 616c291820d155cbad258ecae5c7dbca2c01f07f

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
