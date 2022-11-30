Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751663D5F5
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 13:49:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644B016F0;
	Wed, 30 Nov 2022 13:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644B016F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669812576;
	bh=Ayte6uLLIrPFdwUeST0p7W4NcAcyN4PTRnbwPLLszyk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCWR736xQov8uKuz4RK4huDOVRXL/NeGxKK+TUaonr7rGrDRIlxjmUslEvyO8Hx+D
	 B76EEoWrXZVfUbU2C4BAyJ3CGV08eQPXUlVo8FhzIfFYSBENPvOGG2veud7gp+TNaH
	 lMqFw2sCvpo/8wPH8wKanHPDVuQ8lPqYwGdUJO3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40B10F80558;
	Wed, 30 Nov 2022 13:48:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13948F804FF; Wed, 30 Nov 2022 13:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A2FF80166;
 Wed, 30 Nov 2022 13:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A2FF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rKPBhpNm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58633B81B33;
 Wed, 30 Nov 2022 12:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDFDC433C1;
 Wed, 30 Nov 2022 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669812470;
 bh=Ayte6uLLIrPFdwUeST0p7W4NcAcyN4PTRnbwPLLszyk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rKPBhpNmJFVwU6Q/QOYtguDZuwRJfnPJxGuEMuF+J+xEO/Po4HA1Vqh50YYr2Egal
 ekIv6SSF+kw6TIdhwHwxQ1i0S1jA5wqLrZ7rQuQcjzWNtz/ipjMRCDI/wiBJAOAm+Q
 3FCu5H4cpe3GMKtg2bKh9aXFXcL14yhCEJFD0cil+YXo34OE6P5BhVGW8KEZujganO
 r9lQBnZSzxGeNUXpPpKMGufZxUjgmafP3phq4mgDYGEtaL94n+a6Ratv16YF3ccp82
 6Evtk/1f4LTR7GE+7zgkMFKF8CC+gDv+keIaapWgkeNE4anTMjPsBjmM50JL8wiZGf
 90rGj8H/QsD0w==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
References: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add shutdown callback
Message-Id: <166981246666.67172.3822012000949184770.b4-ty@kernel.org>
Date: Wed, 30 Nov 2022 12:47:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Sun, 27 Nov 2022 21:04:15 +0100, Ricardo Ribalda wrote:
> If we do not shutdown the peripheral properly at shutdown, the whole system
> crashes after kexec() on the first io access.
> 
> Let's implement the appropriate callback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add shutdown callback
      commit: e063330a77edbdc57a142a27a82e51dc1361ab9d

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
