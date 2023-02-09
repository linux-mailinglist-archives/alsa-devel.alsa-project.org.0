Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA04A691069
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:38:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B7AA4F;
	Thu,  9 Feb 2023 19:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B7AA4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675967890;
	bh=gnD//W34OrUvbABbvW+58k084t2zW9miLQ6Hz78yBtk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GOm2L6VCz6cGtu8HrXKlOhSyzPJroYhLYwB7hw5cSP4bFGi8TWOUEhN+FXt7V4VYr
	 x4AB2BqiFV5VRXzzo+6QehQV0oI+ViSNOgepghRWxd/DAM8q3+/7q6GkRfRTOIsFYe
	 8HDIKPiWKcloAEfkQWT+RCCFOsJl3K7Ism8P/rMg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03916F8051F;
	Thu,  9 Feb 2023 19:36:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4EB3F80027; Thu,  9 Feb 2023 19:36:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACBE5F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACBE5F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y99RGxMM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 997F461B8C;
	Thu,  9 Feb 2023 18:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78952C4339B;
	Thu,  9 Feb 2023 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675967777;
	bh=gnD//W34OrUvbABbvW+58k084t2zW9miLQ6Hz78yBtk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y99RGxMMLmwEE/1uq+gZEE4On5g8ggvWvb6OJfvXzj2y4kjbEuG8dGJqJbZnM4dje
	 lrQT3x4X3CiSkU9KCUEs04EoJkIkykf3rRgcbo4xFyYfbzpP6yI5bWeV/+b2V17zBQ
	 JVlktiDz23fMHMRnl47RSUVtb2WFdeCwL5JwhMbZR0vTPQHULEPLtiUo4+Wlr8fudv
	 9S6Uh+KwXsGm5lkly4ft1KNE8KeJHSCg74kyc/RV0Adb6flwXQQgduoyeLw7cp/WGZ
	 LFeAV7BeP2j++Q741q6eeWt+GzKO/2v2DeaN2K3Z3/KxDg165iplw4Q0CgHBr4Y1rN
	 +2FQQD28lOodw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
References: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4-topology: Configure copier sink
 format
Message-Id: <167596777514.879652.5974777454589984102.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 18:36:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: NWHS62MB7JXARIEUZIPS6HVH7PFCZT5E
X-Message-ID-Hash: NWHS62MB7JXARIEUZIPS6HVH7PFCZT5E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWHS62MB7JXARIEUZIPS6HVH7PFCZT5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Feb 2023 16:21:21 +0200, Peter Ujfalusi wrote:
> In a course of creating complicated topologies where multiple output pins of a
> copier is enabled, we have discovered that additional configuration needs to be
> sent to the firmware to make the use cases working.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Print queue IDs in error
      commit: b796ff3bf03fd8c838ddd2709ded15865e4af4a4
[2/2] ASoC: SOF: ipc4-topology: set copier sink format
      commit: 11f605633b33cdffd4ffe3b8e1e89590e8f521e7

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

