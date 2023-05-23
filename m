Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CC70DFD5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC196C0;
	Tue, 23 May 2023 17:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC196C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684854124;
	bh=SJG8pNz16g+uS5f4lfIw55vzqhqNY51+DK0nTErnOFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c0ntdAjWfS6RY0Xt2/r13Arr1lmgrui/nyIyXHT89JAkNP4iLst8+SZIVZhfx4S0e
	 SNvgtPo2i32pVaHBUFju/zcF+G3hREICSs2q8adpU96DdlBVAqfk0Te3AJrEU5ENb1
	 pmz9aU4eiS2O+cOXsrF/8O8VMOc84alsk+JnzlCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F388F8055A; Tue, 23 May 2023 17:00:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B3C4F80249;
	Tue, 23 May 2023 17:00:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B72F8024E; Tue, 23 May 2023 17:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 204D5F80249;
	Tue, 23 May 2023 17:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204D5F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XFiiZRY7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E14CE60B5F;
	Tue, 23 May 2023 15:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A697CC4339B;
	Tue, 23 May 2023 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684854009;
	bh=SJG8pNz16g+uS5f4lfIw55vzqhqNY51+DK0nTErnOFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XFiiZRY71/IPZWJm0AG+8snf83HhwVo9AVIJbulXokRZ7z6Kp/FN6IJyDmeFINlUD
	 vPn0QsGrVte7o27sXs09iRPh47mZeAxYiS7vhr3MY2olA0TSARE1FODQ+LjTk7bK0L
	 +0AXB0c2D4dDKTthvCVCPYkQWr1SPmK5eWWoMLikJf9LrB+V5xVq63LHxofJincs0w
	 TVgS8o6oobnl2EynRHK6qIgwIsv3m1jykq7wmE1BDTr94xI/X1cWCjrh+EhtFtHQEG
	 qBk4CUyOG0b9xV67Qu3vTiIPijnDry/x+RLglnhgR2yOxm26QLFdCkc/63CPzOjo0b
	 rfTw1x+X2QlgQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: vsujithkumar.reddy@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 akondave@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230523072009.2379198-1-venkataprasad.potturu@amd.com>
References: <20230523072009.2379198-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Add pci revision id check
Message-Id: <168485400339.197206.2399071297846045748.b4-ty@kernel.org>
Date: Tue, 23 May 2023 16:00:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: VUE3GI2LLBAIAPDVL6DMERJDWBYBO2JX
X-Message-ID-Hash: VUE3GI2LLBAIAPDVL6DMERJDWBYBO2JX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUE3GI2LLBAIAPDVL6DMERJDWBYBO2JX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 12:50:01 +0530, Venkata Prasad Potturu wrote:
> Add pci revision id check for renoir and rembrandt platforms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Add pci revision id check
      commit: 1d4a84632b90d88316986b05bcdfe715399a33db

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

