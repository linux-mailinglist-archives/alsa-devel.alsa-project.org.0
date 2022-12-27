Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AF656A3D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 12:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC385716D;
	Tue, 27 Dec 2022 12:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC385716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142359;
	bh=MzTBZPhvIlkVLSghjEdmDKumVOn249Gk5zXs/ZFSXvI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PRypcoTaRUa6ll2daMRt+9MOsCgoZc0OhJwcTz7YLybBkCcYtI8wfJz9cvHr8uOLM
	 AFa6BRCfwlBUidGKTaNMlMmEWDdesj6OKmdxe9lYP44xw3el8RLy3zOS+8hWbiBB8j
	 jcAUR+LpNVBtvzLeAaM7298quIIxz+62+kaFSKWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D6B0F80543;
	Tue, 27 Dec 2022 12:57:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9947BF8053C; Tue, 27 Dec 2022 12:57:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13EFF80539;
 Tue, 27 Dec 2022 12:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13EFF80539
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FgrIU/q2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86D9D6105C;
 Tue, 27 Dec 2022 11:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BADC433D2;
 Tue, 27 Dec 2022 11:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142226;
 bh=MzTBZPhvIlkVLSghjEdmDKumVOn249Gk5zXs/ZFSXvI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FgrIU/q2N0hYGtnLrjbAb9BJ5teGWt2wSML4rR+qtRl3yb//ATNp2Ormexkl4HSTi
 8XNFdu72Z6B3LiUwbSHDCX4c/jfO/W2+BU7rZ2gSykyJt4HpmOhtLhHBLu0JXyuHXU
 ebjzzfCOhpEB824FdmLeFkm27LKfHL4ZYDOAYW5fK0P5XyiC3qbPky1geDEokqtNnR
 cgD+15bB01/zGLvb3lKkkQArK9/jqjDZBoF1m6LAIEmGFs5JIHPSmjVqWk7hrQFnpi
 C7iAaclpqzc7hULCr9iuhTUFKphnWXkaWrJrWLscN7q0ZDNfVTULdybSvJvKdRK7Qs
 BFVWAO2hQlMqQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
In-Reply-To: <20221213071640.3038853-1-Vsujithkumar.Reddy@amd.com>
References: <20221213071640.3038853-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Enable cache for AMD Rembrandt platform
Message-Id: <167214222145.82924.15119219694173833192.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:01 +0000
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 13 Dec 2022 12:46:37 +0530, V sujith kumar Reddy wrote:
> Enable DSP cache for ACP memory
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Enable cache for AMD Rembrandt platform
      commit: b5ba646142195d63dd1aae69bc15457fca5aeb78

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
