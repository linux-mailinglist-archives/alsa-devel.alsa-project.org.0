Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45010486B35
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 21:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA6711AB2;
	Thu,  6 Jan 2022 21:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA6711AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641501085;
	bh=/HeOpyMdXJEm0oJ6Rb/pWakA0Uu7ogZ2rdPbVlKI3hg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3MHDKn+1oplqcHmbhXl/rPwmGPmKbn6R06amprBBu44Da7taLC8j0tKe5r+B8//6
	 S5Qc2sWTqqR5iqUUzJgVr2h2AV/yDvtfZZC5fuoJ2k+46QRcqVyTXPB7xLN3XPSRuj
	 0GsVS9V/RJ//n/G6fvfDluqDSDvwrhjztp/0x7AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B1D8F8051D;
	Thu,  6 Jan 2022 21:28:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEF17F80517; Thu,  6 Jan 2022 21:28:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AF4EF8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 21:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AF4EF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pp7rwB+l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2932861E1C;
 Thu,  6 Jan 2022 20:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60040C36AE3;
 Thu,  6 Jan 2022 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500902;
 bh=/HeOpyMdXJEm0oJ6Rb/pWakA0Uu7ogZ2rdPbVlKI3hg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Pp7rwB+liL//1RFg9Fhzw5ISNYvnCdxiYgkFVq56vKyd9GFwvMuRK2Ru2pu8jRBHg
 pMf8s88ooC0x26yOTxwvpjRSnno4PyGLYgPAblEEUjOTgwXQb/eiuTwOpenXQrxhgV
 p5BiTTOAu8P7Tn+yJUEbe83TetluzlpDIwg9Y3I0lVYz3PoaMqR0WqLn10GkvjLwvu
 QpMDvKs7aq8Aw87Letr/v0B21CvWpCMKQlSWW90Q4W2WvC7PqssQfE8hi4UryR0InP
 Uv3JGWU3lhOP+zyiSe2HlmA8sy9Vqxc/xdNorYqocYD5xNz8K2u1akiNTxvRo/f08U
 vwPHIQjFxCpTQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220104033356.343685-1-y.oudjana@protonmail.com>
References: <20220104033356.343685-1-y.oudjana@protonmail.com>
Subject: Re: [PATCH] ASoC: wcd9335: Keep a RX port value for each SLIM RX mux
Message-Id: <164150090010.2243486.16272491720524163841.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
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

On Tue, 04 Jan 2022 03:35:36 +0000, Yassine Oudjana wrote:
> Currently, rx_port_value is a single unsigned int that gets overwritten
> when slim_rx_mux_put() is called for any RX mux, then the same value is
> read when slim_rx_mux_get() is called for any of them. This results in
> slim_rx_mux_get() reporting the last value set by slim_rx_mux_put()
> regardless of which SLIM RX mux is in question.
> 
> Turn rx_port_value into an array and store a separate value for each
> SLIM RX mux.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd9335: Keep a RX port value for each SLIM RX mux
      commit: 3b247eeaecfefe35ecca1578b0ed48be65bc6ca3

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
