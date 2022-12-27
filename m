Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC55656A5B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:01:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D286373A7;
	Tue, 27 Dec 2022 13:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D286373A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142480;
	bh=gE09O9kPmzTMcuuOFpc0l3Yqr1IL/aEE8PLijWmVyd0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PuvW+oBGWGSm6kUtHC8MdwmJe/8gT6DigKD9Kn6Emp5tGtQlDRvzucjoOr21VJrSK
	 kd8GSvSaOrWGOLCBJZwXPsg3lUg5hR0Ve/V+oj0fAeiDoESL0E1nbPfGHJ4phEbYhn
	 FlukBm8CzS4cPfVY+pWSHpROe3iPj3GJpHVHkFgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8ADF805B1;
	Tue, 27 Dec 2022 12:57:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17660F805AA; Tue, 27 Dec 2022 12:57:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 567DDF8059F
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 567DDF8059F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F7bFKeeS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBDB96106C;
 Tue, 27 Dec 2022 11:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED32DC433D2;
 Tue, 27 Dec 2022 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142246;
 bh=gE09O9kPmzTMcuuOFpc0l3Yqr1IL/aEE8PLijWmVyd0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F7bFKeeSsjwKyYLWc4pgKKe27V3dnvNnr1yd/uQkrp6HX8XsftMG7KDwW7guHM91f
 NII/9+tZf6ZMa+yo6RhP2Dou4QD4ElpmfurgrcZUswPp1aBAMJMpZ4i/aoObkEktCo
 s5mni2fSvrDYWxa9jwhUHekqU2WdhDe6o3vQrSeVqEYdy7Sct5c5sbxPQ8LlnaqURY
 y3Nko7GT3LHoocSFSKVRaoDiLP0rlExEnGxl7xg0mJa6Ucs7Lr3cRVBBSBhwKNH/Ue
 eGeZuBAURYETLc28vj0qTAHMqeh1vuR9/qYy0jRRIthwZZyDkKYi9U51T29IjFGZDN
 +fNSkCgOJOGZA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221216115435.28427-1-peter.ujfalusi@linux.intel.com>
References: <20221216115435.28427-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: core: Print out the value of sof_debug if it
 is set
Message-Id: <167214224468.82924.12765753486904968879.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:24 +0000
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

On Fri, 16 Dec 2022 13:54:35 +0200, Peter Ujfalusi wrote:
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
