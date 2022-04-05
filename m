Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9C24F2980
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D4417C8;
	Tue,  5 Apr 2022 11:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D4417C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151322;
	bh=1E6UPt1+5XL6Dw5BhQTnm2f6j13hSa6vSN1R8TrP9M4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJKChGI4SiRTIDgfK0AeRtxfWc/oBzTO1uqAcFWFebSaygfv4BLUBiHqvemsOdBxe
	 3Z86hq4Lt0NE+SeYewW0bsIczMjH4rC0FyVBAIg5easAvcnTrTT+nfuiQuSwe2schM
	 XR7A79ARut5dAukQRsARXGupQezUkmimDoJL09dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0789EF8055B;
	Tue,  5 Apr 2022 11:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA3D9F8055A; Tue,  5 Apr 2022 11:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40F98F80558
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F98F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UA67/1Tl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE34E6165C;
 Tue,  5 Apr 2022 09:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA9EC385A7;
 Tue,  5 Apr 2022 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151091;
 bh=1E6UPt1+5XL6Dw5BhQTnm2f6j13hSa6vSN1R8TrP9M4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UA67/1Tl6FysJvQlhz3zTowW0JwF4aUwTfA5SKaKKz/DPCYrFvP2iMJkrjc7oqskq
 tQjWELsiiWrzgJdQ6I8nBsYZg/4kqL765VDWzGlVNfVRXGYGy4d2HpfhGPV26woru5
 KcZU4S/WjNYoV9OkoHuADMkP5qozXK3EaLiePYaQ0tvldrIN/1XeyHMh936lFDLn5s
 Dfksj207GRRk8WuwYMn6pzu35URi5LS7G7WPOcEavvE54Q1lHvZJTpHHLCfy2S1hfh
 JQtv11gUyQxmCMqU6P7UptAeobwzW3za/eGX24pHq0kvLUVi4vTH8f4E0eytaKNoNS
 RI3Bcr4/ZNNjA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: topology: Cleanup patches
Message-Id: <164915108967.276574.4319376218535549999.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On Fri, 1 Apr 2022 14:01:54 +0200, Amadeusz Sławiński wrote:
> Following patches contain minor changes, cleaning up code to be easier
> to read.
> Clean up few loops, to be simpler or altogether remove them.
> Rename some things to make code easier to understand.
> 
> Amadeusz Sławiński (6):
>   ASoC: topology: Use for loop instead of while
>   ASoC: topology: Remove unnecessary looping
>   ASoC: topology: Return bool instead of int
>   ASoC: topology: Rename SOC_TPLG_PASS_MIXER to _CONTROL
>   ASoC: topology: Correct error message
>   ASoC: topology: Rename soc_tplg_init_kcontrol() function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: topology: Use for loop instead of while
      commit: 395f8fd616086310c40ddc4e9686440f147d5c00
[2/6] ASoC: topology: Remove unnecessary looping
      commit: 0db627c4f5df704d44699ed27dd81caa6d782a17
[3/6] ASoC: topology: Return bool instead of int
      commit: 4fad3cc6eb962a6fe32ab9fb9d30b08a88298f63
[4/6] ASoC: topology: Rename SOC_TPLG_PASS_MIXER to _CONTROL
      commit: 5e2cd47a36b386080e7a29c1efbb0247ed6ed365
[5/6] ASoC: topology: Correct error message
      commit: 34b310451cbf4dedcee56b4534085c20203c6b53
[6/6] ASoC: topology: Rename soc_tplg_init_kcontrol() function
      commit: 430791dd9207271099002b65aa65fd5e6aa31236

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
