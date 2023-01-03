Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BB65C74D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 20:18:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EF1162BC;
	Tue,  3 Jan 2023 20:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EF1162BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672773501;
	bh=rHCesJ+cl5D0m6koH1aTaI1S1JP4QlOBXoCX2LsSXr4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d5wqH5vYu934EKJ0I2olrhRn9GPZoIpGvm8xeJpQYFQBkXSRQixzQUGth+9RigFBM
	 ImRumtqhINt1iacAK6m1VfykaJ15wXjdurLP+b8LJuo9LvEl5G4XI9C3Gr3nowetD9
	 f+evw6As7yr6j4Tisll7cXYHrSjJQg/cZFszzhm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636CEF89633;
	Tue,  3 Jan 2023 20:00:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14314F89630; Tue,  3 Jan 2023 20:00:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790F4F8962C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 20:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790F4F8962C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cTnXHpSy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9E915CE12B2;
 Tue,  3 Jan 2023 19:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E434C433D2;
 Tue,  3 Jan 2023 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672772436;
 bh=rHCesJ+cl5D0m6koH1aTaI1S1JP4QlOBXoCX2LsSXr4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cTnXHpSyIEdGcRaodXG6vuQlwK3BlDoYkOCL5PJ7r+AEH6Q0vwEHT9gryvePz0b6W
 ndlum+j8MaFUZzyTsyjTfupr8k+C1eXaJxOfpGWqIF/s9evyoh8/a8Y4ansZQ9ak9d
 zq93zRzzTEtj+ZWL7d8mii3sQIDN2AakkxqmGaJ8yBhJz094Je+jznLVShktIUgwvN
 CrN7n2nQkgVKb8ST8se1YZRroEJYcvFwVIDoPkbt5Xxqz+gnZSRwKSSAuFIF5nndIs
 gi1e7eGxa2nv4ASv9HKBukSZ7BxNLGmx4nny7xedxpqxE8m4/wJeav5PSl98fxSjBQ
 ZJ/X8NiL5W1gw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <20230103073704.722027-1-brent.lu@intel.com>
References: <20230103073704.722027-1-brent.lu@intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_ssp_amp: remove unused variable
Message-Id: <167277243396.325583.15307745179196438624.b4-ty@kernel.org>
Date: Tue, 03 Jan 2023 19:00:33 +0000
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 03 Jan 2023 15:37:04 +0800, Brent Lu wrote:
> The variable becomes useless since we moved the snd_soc_jack
> structure from a static array to sof_hdmi_pcm structure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_ssp_amp: remove unused variable
      commit: 03178b4f7e2c59ead102e5ab5acb82ce1eaefe46

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
