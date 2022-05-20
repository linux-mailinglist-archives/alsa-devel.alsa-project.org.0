Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760C52EAA1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F13F1712;
	Fri, 20 May 2022 13:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F13F1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045616;
	bh=DbozWUA8l+/nc8nWGrNyayfGeTWLYFZBoyJhygSVS90=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEAZFNhZplV8ojx8lECqOJpmHbytMEtR7n8TBmB0RQ/R+tuaelBsDrjeRdSSkWNJo
	 GZRqR40TNRENFbXfZUpygri2T2BGSmjvJQokaasmnesAFLI5s/we8lykgEaIbfdPdv
	 2n+V+QdQz/ckXn0nC7fM599vzWaf4QvBmA3m/LbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C36F800F0;
	Fri, 20 May 2022 13:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E33ACF804C1; Fri, 20 May 2022 13:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D104F80153
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D104F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BCumOtXX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5F5761CEC;
 Fri, 20 May 2022 11:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D0CC34113;
 Fri, 20 May 2022 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045520;
 bh=DbozWUA8l+/nc8nWGrNyayfGeTWLYFZBoyJhygSVS90=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BCumOtXXJjMUuU8HP8qlOiM/Zn10Qly7EvKIPAhMPl8Nftlg8/T0Noa3BRCsTr0bn
 9zMVhTZONKIfQe7kWxEIasA5phVDb6eK0OQISR80TjzvLeyBX602fk6M/PcvdJd5xm
 7J2ZQytKph1qQW5qNTJ0qPwohdcZnA9FHs7hTMSxUonfM9WLgAgVXhn9c6fZttrLGr
 8YN86Y6WRG8Mf6ZYYYN0EmElK0uA5kf77B1wGojKA20AT6T6X5Wa2zVlqVTzQsfBAR
 XKk7nHVJr/dtXLMJTPpuvbtg48fLohXCP698knh5q1TXYhyiKsXLt8B2PJGALfR9wZ
 RSv4bSNlvJ1qw==
From: Mark Brown <broonie@kernel.org>
To: Vsujithkumar.Reddy@amd.com, alsa-devel@alsa-project.org
In-Reply-To: <20220516160619.17832-1-Vsujithkumar.Reddy@amd.com>
References: <20220516160619.17832-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH v2 1/2] Revert "ASoC: amd: acp: Set gpio_spkr_en to None
 for max speaker amplifer in machine driver"
Message-Id: <165304551793.45439.12289149064085038567.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Basavaraj.Hiregoudar@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

On Mon, 16 May 2022 21:36:09 +0530, V sujith kumar Reddy wrote:
> ASoC: amd : acp : Set Speaker enable/disable pin through rt1019 codec driver.
> 
> RT1019 codec has two ways of controlling the en_spkr.
> one way is controlling through gpio pin method the another way is through codec register update through driver.
> 
> Now Speaker enable/disable is controlled  through codec register updated by codec driver.
> This patch reverts gpio logic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] Revert "ASoC: amd: acp: Set gpio_spkr_en to None for max speaker amplifer in machine driver"
      commit: 6107fb660749507d5e02988151e45884b5423cdc
[2/2] Revert "ASoC: amd: acp: Power on/off the speaker enable gpio pin based on DAPM callback."
      commit: 17572892e3beefe68d0875ecfd015eef521c244d

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
