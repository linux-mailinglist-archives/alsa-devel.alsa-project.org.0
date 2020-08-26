Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72389252F20
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 14:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122A31739;
	Wed, 26 Aug 2020 14:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122A31739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598446725;
	bh=ezcQ5dPmt0mrjFunCsvXBhAKE0liTK6c4bzI1vFds6E=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnv8LJsigFUKjIsyarElKyr9uLg2lYT1yIYP/gMMwFiJYW/879prhtMBH2hMCVx2E
	 5Sg7c6Y6vpY6M02CgRD+BkMfKEvR/zKCAIR/YouEADDvknOF30alfF7XhVpsDM0aLP
	 Cqwvhi/pXjMsn7b47W1DLIo5m6edl6/N7GaPHT7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8955DF801F2;
	Wed, 26 Aug 2020 14:56:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A601F801D9; Wed, 26 Aug 2020 14:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A9DDF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 14:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A9DDF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GZOAZ8PC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC5A42080C;
 Wed, 26 Aug 2020 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598446572;
 bh=ezcQ5dPmt0mrjFunCsvXBhAKE0liTK6c4bzI1vFds6E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GZOAZ8PCP5ZDmfWcn2NjveXt65gKa8T+7xoj/dat8r/0c35fsb1zkGnGm8zMcZNU1
 niuk7uhN9McGHBFzks29QgGzHc5xuX+Bh9Wp92XBVaGdBiQauJt7Zmqy4F2b0wcMC+
 QFi2sbLbSMf3jf24vlUtFME5tiHgXbB7vFlc8Q5M=
Date: Wed, 26 Aug 2020 13:55:36 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
References: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/4] SOF FW loader fixes and updates
Message-Id: <159844653099.37071.13873594783675405659.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Tue, 25 Aug 2020 16:58:50 -0700, Ranjani Sridharan wrote:
> This series includes fixes and updates to the SOF firmware loader.
> 
> Iulian Olaru (1):
>   ASoC: SOF: loader: Add debug box region
> 
> Karol Trzcinski (2):
>   ASoC: SOF: IPC: make sof_ipc_window monosized
>   ASoC: SOF: ext_manifest: Parse debug ABI version
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: IPC: make sof_ipc_window monosized
      commit: 76ab546cd8f0c64d4603b2faad4558c5b670561e
[2/4] ASoC: SOF: loader: fix memory leak in get_ext_windows
      commit: e9157a449aa3f72fdbded9ce780c666bf0951cf3
[3/4] ASoC: SOF: ext_manifest: Parse debug ABI version
      commit: 60b7c1ba289b8ebe4f275b0b381f711e5b60184b
[4/4] ASoC: SOF: loader: Add debug box region
      commit: e17b7389dcc4239b806cd8789a812ee1b8b7b134

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
