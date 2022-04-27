Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B75124F0
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7A4844;
	Thu, 28 Apr 2022 00:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7A4844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097024;
	bh=IY0o0JQjJacIE2ovn2gR2lFGDKZkKSs+XQT3Zmn0a74=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ies8cRE8LDdS6mO0dhatfyZDWxlcCvPr5Xy6a/7ZbEawnNeoHOkUl+K0wZn2DHVAF
	 qY4lDqWU0Wtsa0IGP4YOe4XH9V5BaEp5BMkbPmSHavCEDhQyAGEF1TC9Vy8x3hwxrG
	 v8w8UohEHL6KFCJFphb+iD7pzpUYL6mo5zcx2IaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B309DF802BE;
	Thu, 28 Apr 2022 00:02:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29E38F802BE; Thu, 28 Apr 2022 00:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED7B7F800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED7B7F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uwrrJYbE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7105C61E0D;
 Wed, 27 Apr 2022 22:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96143C385A7;
 Wed, 27 Apr 2022 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096952;
 bh=IY0o0JQjJacIE2ovn2gR2lFGDKZkKSs+XQT3Zmn0a74=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uwrrJYbEeOmiukrfE58mK2zJIpAh1rbeP8ecfM2WmAWWfGP+bjH2XL9XuP5UuCqq+
 kjrUYDopLYKH9SbXby3AP3vNJZh1MBJcfT0iq69It5uG6dghgJaf9pBGdA6nFUVtGw
 spOiZolLjH0BjRIS9M3LgOsDLoyfhW3b/8iE3IQIxodRase6ktlK3ppfquziXYNR+m
 FvBsd2IDFxZ3b1t+a1q1i1eLtq/jDm0w8YYeO90zdAWGQJVY5BfEbp4kyguB843fV9
 EJWjrpa7sBaIDeGAPjjvNmofYHdK+d3VTGH5H6Lm2m8HBVQE2DS2iByM0eyH2YsYiz
 /lXlQzDtWPN9A==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426183357.102155-1-pierre-louis.bossart@linux.intel.com>
References: <20220426183357.102155-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix NULL pointer exception in sof_pci_probe
 callback
Message-Id: <165109695133.498174.1172123703678827025.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, ranjani.sridharan@linux.intel.com, AjitKumar.Pandey@amd.com
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

On Tue, 26 Apr 2022 13:33:57 -0500, Pierre-Louis Bossart wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> 
> We are accessing "desc->ops" in sof_pci_probe without checking "desc"
> pointer. This results in NULL pointer exception if pci_id->driver_data
> i.e desc pointer isn't defined in sof device probe:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000060
> PGD 0 P4D 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:sof_pci_probe+0x1e/0x17f [snd_sof_pci]
> Code: Unable to access opcode bytes at RIP 0xffffffffc043dff4.
> RSP: 0018:ffffac4b03b9b8d8 EFLAGS: 00010246
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Fix NULL pointer exception in sof_pci_probe callback
      commit: c61711c1c95791850be48dd65a1d72eb34ba719f

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
