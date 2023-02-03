Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99D689C65
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A0AFA4A;
	Fri,  3 Feb 2023 15:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A0AFA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436290;
	bh=1KMtwbnXdWhNLG3cfZylZhMYnvmgO9XpgLmbJY/5rx4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LMV+dCViFfFReqo4o3shtZJwt2KxtGaz9EUucorAikuE7IVV1/9R80JQZOJQJ3oMS
	 5vfDITrGUZ7FCH+7auMcVqiz6YP2mpWWTN9tj2p38GdIh05X4MvdNFv3+jsL5pC6/E
	 N+cGspRNV0m2x5oaAhW9A3j16MQOcaee1522dfPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C54F80552;
	Fri,  3 Feb 2023 15:56:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67607F80519; Fri,  3 Feb 2023 15:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D267DF80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 15:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D267DF80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RgQMKp+A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B09AD61F45;
 Fri,  3 Feb 2023 14:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E09C433EF;
 Fri,  3 Feb 2023 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436168;
 bh=1KMtwbnXdWhNLG3cfZylZhMYnvmgO9XpgLmbJY/5rx4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RgQMKp+AVUBdWOoxiOjPwpnJ2AkIN+rLkjy6eaLdjp2GJtkbSEbg2lodoCxzBToEz
 zBEQrgC6F/jmBfo7GfTE3v6jUWabDRgg/O1GLv9NwvauEJAd0YHEzIGkLvq3NnJLGG
 kCcMizhUALyml2sBIJlF0wWCyHK1Ld6xvwvokT4BUtSKDsIukh8VHjKIjz8WrF/76Z
 SZM17GKpoFnaYw8ycOg6BMKjxeNdfGD8WthWObpOOT8PqbIs1zS3bnkuOxmDwdMK/r
 sKoKz6AJmsT+MSsScP8KIiasQjlgiyPAd5DFx1uMjQyV3loveg5akixk6tQIWTC2e9
 2Lzu4Frt7XXyg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20230201165626.3169041-1-Vijendar.Mukunda@amd.com>
References: <20230201165626.3169041-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: update ps platform acp header file
Message-Id: <167543616571.928818.6092818579559496073.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:05 +0000
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
Cc: Mastan.Katragadda@amd.com, Sunilkumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Mario.Limonciello@amd.com,
 arungopal.kondaveeti@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 01 Feb 2023 22:26:25 +0530, Vijendar Mukunda wrote:
> Rename Audio buffer and soundwire manager instance registers.
> Remove scratch registers as these registers can be accessed
> using ACP_SCRATCH_REG_0 register relative offset.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: update ps platform acp header file
      commit: 96ebccb2356da5f28726746e53719c5f494e08a7

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

