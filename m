Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F27397950
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 19:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 666BD16E8;
	Tue,  1 Jun 2021 19:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 666BD16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622569242;
	bh=Xsmxi6pliJ+0XI319VNWPGayFdynnWrSCxNqFnsI1zM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIF3hhEzXplfcvOq6qNyjqkc6i8ZG8Foul3kpaghm3NBGe3xWFt234WOs1C7ujWnh
	 6xCfPA3KXXiGWBxBpdb+A24Rf8jO8/YBDfIBQTJhMuMzVSVOmuGz1Z2SC7LItB15eI
	 bhQv3eUcnJ+KNqmsBLPM8+UXkG4v4liIXEgNcTQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF8EF802E7;
	Tue,  1 Jun 2021 19:38:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD7AF80269; Tue,  1 Jun 2021 19:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45A79F800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 19:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A79F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YQ72IIj8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82C6261042;
 Tue,  1 Jun 2021 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622569130;
 bh=Xsmxi6pliJ+0XI319VNWPGayFdynnWrSCxNqFnsI1zM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YQ72IIj8L3JWpnM/iXhHY4YSRkCUONKb09JIohIQ0O2qxXQJD6JISxKxrjUviu6Ft
 GaraFajh/iSvB+L0PTQjCT0hFfdT4MMrnMVQQm/WzmgdpQvsnCfOkm//DP0RfnmUh5
 v6N1CyfiIva8vp6KT87RNAx2SB+gFMS5PTtVOa/oxc12p1D5m/tDwAfrlRSU+e0mVz
 jKdmjmm2WKuP5jEr2NfcG2TG+68esvILamaX2HU491Rd5cuZhZy78G3deyjNjKUQCI
 fU/tmhTU0bpmLgplsJfXh/a5kU+WGnlhCTfPbBKZ9+ENroZn+jOhUg4fZVq7+1Z35H
 qMblq8T7ziyjA==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: Constify snd_compress_ops
Date: Tue,  1 Jun 2021 18:38:08 +0100
Message-Id: <162256892744.19919.16377116740112548750.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
References: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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

On Thu, 27 May 2021 01:10:08 +0200, Rikard Falkeborn wrote:
> The only use of the static and global snd_compress_ops structs is to
> assign their address to the compress_ops field in the
> snd_soc_component_driver struct which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.
> 
> Rikard Falkeborn (5):
>   ASoC: cs47125: Constify static struct snd_compress_ops
>   ASoC: wm5102: Constify static struct snd_compress_ops
>   ASoC: wm5110: Constify static struct snd_compress_ops
>   ASoC: qcom: q6asm-dai: Constify static struct snd_compress_ops
>   ASoC: SOF: Intel: Constify sof_probe_compressed_ops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs47125: Constify static struct snd_compress_ops
      commit: 44b9f90705bb580a9616ecd5498dd30943c1f1ce
[2/5] ASoC: wm5102: Constify static struct snd_compress_ops
      commit: b6f5d62e7afc398c375855c0d8105e5561f9fc37
[3/5] ASoC: wm5110: Constify static struct snd_compress_ops
      commit: 4127a3a541ac35360cb45909944747d61c606f0a
[4/5] ASoC: qcom: q6asm-dai: Constify static struct snd_compress_ops
      commit: a8048051d7ce2349e4cda28954ded733d6c42028
[5/5] ASoC: SOF: Intel: Constify sof_probe_compressed_ops
      commit: 7db43da8c0990bb1276d1b7b185b1b9f9be6dcbb

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
