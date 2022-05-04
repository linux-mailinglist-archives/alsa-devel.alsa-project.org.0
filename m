Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5351AF70
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 22:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3113C1772;
	Wed,  4 May 2022 22:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3113C1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651696739;
	bh=MhaXkcCYVV4yXHPmCqSqrqc+KqDCZa4fRVvXSNkprdQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CIk+OTbi6nMOFzfvDD3woqKYuvDcmL/PoXDo5qIOiWDRDZiY7+O+j5V/fag0UZpym
	 yaCFU6kn+f7Tpf2ygov6hoFGFKYd9ijrH9//eE1NX1J9MKG5SUifyScAimzarjHvPH
	 b5xugbdKZ7tS1VP/XzbtJ0dzYa97+Z/KJKrPOAMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636DBF800D3;
	Wed,  4 May 2022 22:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 685B4F8049E; Wed,  4 May 2022 22:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4AF1F80141
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 22:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4AF1F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gt0aywyq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A72A06178F;
 Wed,  4 May 2022 20:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAF9C385AE;
 Wed,  4 May 2022 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696623;
 bh=MhaXkcCYVV4yXHPmCqSqrqc+KqDCZa4fRVvXSNkprdQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gt0aywyq4GFWecTCEeVm65qTaUaPrEQpKz39dH1/ojlUu8I5SqlQ4wMJ+X8eGpITe
 FrIjU3XZ8uY2VVBhMwBlNFWVjRMBU6x4N3+rZPfIFbYqaJu6ec8HFNPJSlW6NBot0j
 7VVo8yQ+91rt2fOVmqIDqkOHc3livI9UZFcnz8W9uqxMnAiZdkPv2kFliPp0dGovdT
 tq1f8nVkCPtcCamU19YmxLhfACXCWblLOTsk6bFlEXL0CD2eLMyfkzhL5lSx/JIyCY
 Z2+M7DkpI/GcjRlv9sroGVCfAHGv1noVyxxYGvpk3+gqS8IoKVXFIfN91b/tppA9pn
 pslGtKTnpid0A==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220504102831.10071-1-peter.ujfalusi@linux.intel.com>
References: <20220504102831.10071-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3: Remove the ipc3-ops.h header file
Message-Id: <165169662122.1744642.16025534398868254252.b4-ty@kernel.org>
Date: Wed, 04 May 2022 21:37:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Wed, 4 May 2022 13:28:31 +0300, Peter Ujfalusi wrote:
> Only the main IPC ops struct should be visible outside of IPC3 code to make
> sure that the code is correctly abstracted.
> 
> Instead of keeping the ipc3-ops.h with only the high level ops struct
> declaration, put the ipc3_ops to sof-priv.h and move all other ops struct
> declaration into ipc3-priv.h
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3: Remove the ipc3-ops.h header file
      commit: f80beaf6f2b1eb55fb1b2128a43e0a0c9c4d19de

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
