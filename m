Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DBC4AE1D0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 20:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317CD17EC;
	Tue,  8 Feb 2022 20:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317CD17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644346907;
	bh=1mcCtBiuqycT/4Sq8i/nPEkH2hUOHwb1CFcWPHrjEMs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAO1SPB58wVDOJZv07MwieNDGHvUUrp1pPt6uiX8XqtsE0sCucmpSkXsFo33kcAqc
	 56y5kgWVsKBk+gXh9wxXIMRRTtVL+uyDFFND/1VM4wBn+IotyPEHHIAEoldHmczTdN
	 Vjrl4I0lb8AwgPWUbngHTYero4o3d6jtENDcDIxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E0BAF804BC;
	Tue,  8 Feb 2022 20:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC3DF8013C; Tue,  8 Feb 2022 20:00:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0916EF800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0916EF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E2lLpG+X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C93F5614A9;
 Tue,  8 Feb 2022 18:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AB9C340ED;
 Tue,  8 Feb 2022 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644346796;
 bh=1mcCtBiuqycT/4Sq8i/nPEkH2hUOHwb1CFcWPHrjEMs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=E2lLpG+XWMeIY3zp5ODGZPQq/oUO/ixucn9b5/122kdNmr3g7Z5vY8lWKqvnX0+Rx
 spX78mL6Tf3Z2OWlM0alXwt29gdhNoGmgh2VYtJJtmep9iAaybXOsAirAcF7TzpXcC
 HQUunkSoOk8L98rkewylAMj7V50o2Jk8g9FADnW8fI5M4A/jJk9N6KtfZS+3hPRxix
 ZJm6R294ivoEQ4l8Qj8Ue/WmU1qQOp113sdzFnpNvosP/clOOhPIcFQWQD7RYHNQSc
 DIzG+ZFs/V0okJkeR/4E+ezXbBp1qMu9Zh400RlAAm/XoJqtylgrfM7BVYdEhptTIW
 oa079tQnvJ7SQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20220128123623.23569-1-peter.ujfalusi@linux.intel.com>
References: <20220128123623.23569-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: dma-trace: Change trace_init() ops
 parameter list
Message-Id: <164434679417.1135369.8548285160328863390.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 18:59:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 AjitKumar.Pandey@amd.com, pierre-louis.bossart@linux.intel.com,
 vsreddy@amd.com, ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Fri, 28 Jan 2022 14:36:21 +0200, Peter Ujfalusi wrote:
> the DMA trace implementation on AMD platform assumes that the stream_tag pointer
> is pointing the stream_tag member of struct sof_ipc_dma_trace_params_ext, which
> is true at the moment, but it can not be guarantied and a change in the dtrace
> core can cause out of bound accesses for AMD.
> 
> For this reason, change the API to pass the struct itself which will remove the
> assumption and makes it clear from both sides what is expected to be sent via the
> parameter list.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: intel: hda-trace: Pass the dma buffer pointer to hda_dsp_trace_prepare
      commit: 91e716b2a4f997cafb017c04351c2751fc820637
[2/2] ASoC: SOF: dma-trace: Pass pointer to params_ext struct in trace_init()
      commit: bab05b508ebfde32a14880696a13820d54510fcb

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
