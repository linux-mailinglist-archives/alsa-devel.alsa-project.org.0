Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D560455E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F4B81C4;
	Wed, 19 Oct 2022 14:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F4B81C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182849;
	bh=Lo8tvxGIOYo47DnL+wzBI8+oasH0jlAOV1i9YkarM04=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOmfvyof9bA3h7G5W+cvXxqX3hpuFhZtD2JRefhYIoh0Ch2x9LOefQK8UiqG1KMl2
	 5coUX9liuwjh557w2KbEv+Bkf9NxsqNPTNwYkqORXQvJctkxU7GGD3aOwMuE58kBWh
	 JIyk8smKZc6IgsqACdKdWvLM79uqtPY9SI9X/+dM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33979F80535;
	Wed, 19 Oct 2022 14:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E88E8F80528; Wed, 19 Oct 2022 14:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB49FF804CC
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB49FF804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HcEnWO5c"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C958561753;
 Wed, 19 Oct 2022 12:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3354CC433D6;
 Wed, 19 Oct 2022 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666182741;
 bh=Lo8tvxGIOYo47DnL+wzBI8+oasH0jlAOV1i9YkarM04=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HcEnWO5cJfDdoi0h94TeHGJtxzV/9fp8Tb2FDgVaospRYjNhF8cvUC3B49+cvLsQ3
 pLS3Ygqzg4zoW941xlcWQTnK6uo0epJRPFBG+XuM6foBK1OYpcYOk15IwmPAu3OS8f
 24dpZMe0gnf6ATMZe2WfN2d9QmLz2uJHCThWqJCQbiLYzirCJu3Afgi7fKxpDQRhs/
 /hdys4pkOb07QMxWiKoTeB4bZL/15Ow9ffAF0+xcFgUPuKf0iB2Ivmg6P/h/G3yqLZ
 9H173NGb42K3X+gevrbGBohn5/gaubqIIJ0KeIkExfORlzdeWUsZ0BgidVEf+eDkAx
 Cmj87oYNo4yvg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221017204054.207512-1-pierre-louis.bossart@linux.intel.com>
References: <20221017204054.207512-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: add quirk variant for LAPBC710 NUC15
Message-Id: <166618273994.118898.13332719077942259973.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:32:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Mon, 17 Oct 2022 15:40:54 -0500, Pierre-Louis Bossart wrote:
> Some NUC15 LAPBC710 devices don't expose the same DMI information as
> the Intel reference, add additional entry in the match table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: add quirk variant for LAPBC710 NUC15
      commit: 41deb2db64997d01110faaf763bd911d490dfde7

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
