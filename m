Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC6656A5D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F94373C3;
	Tue, 27 Dec 2022 13:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F94373C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142511;
	bh=qzDtipgE+9sohMGcEQB+zL7TsMbL15rCYtAT70uF2G4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bQM8nMQOe76R1h8j9HdHVz8wVWZ5D3la+Pdukf7LtjB0yBSa75YJZp2UEygC+FnBs
	 AQsZFN7rmmI7nKyS8Gbm5oTLFFf2f7KhXlP0GLbFnozgDT3Urr3t7mwGBUgKhQqcqT
	 +rtt8CwhbVeUjIjSFVLvZ1KMS0cO7w3LNRwXIOeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F20F805BA;
	Tue, 27 Dec 2022 12:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D536F805AC; Tue, 27 Dec 2022 12:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A37F8059F
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A37F8059F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vodk7Nx7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 558C761086;
 Tue, 27 Dec 2022 11:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE67DC433EF;
 Tue, 27 Dec 2022 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142248;
 bh=qzDtipgE+9sohMGcEQB+zL7TsMbL15rCYtAT70uF2G4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Vodk7Nx7VwsTwtRYX2mSkOdHTjthhmfc81mido2yrHqAzXS4pNni34fztq3qDiKMB
 Umzl7OqcH/eK0ON2tMDPgMYVLTbe7J7ODoPJGAN0fgpVE/7GcqoDcTe1ObWdEhlzI4
 ufE4WU4cgJB7OWvUOSRT4Jwfc/yIkwO/OGQ133y1xwlOqhAp0pSePpUJy69ygFXeiM
 3In78h13xLnTVO3JgVRFyUKq3g02ObKHesyes2Wg5mam94luCtMChAPOqbua2Ugqqy
 tQTDp4oJIlOYEyexNr0uEumEW9gIEgqcVKIUeR86RZ8EO2HM5LUk9Oc3FjPPThkDXi
 jOVR28mWYRatg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221221111750.20283-1-peter.ujfalusi@linux.intel.com>
References: <20221221111750.20283-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: core: Print out the value of sof_debug if it
 is set
Message-Id: <167214224656.82924.332736050056900428.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 21 Dec 2022 13:17:50 +0200, Peter Ujfalusi wrote:
> The sof_debug value is set by the user, developer intentionally.
> To save time on figuring out what value has been passed to the kernel by
> the user, developer, print it out if it is not 0.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: core: Print out the value of sof_debug if it is set
      commit: b2f7b9320537affe44efbb0a1e0aaff05974ad8b

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
