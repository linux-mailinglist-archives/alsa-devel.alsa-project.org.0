Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF0656639
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 01:16:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D87E166EA;
	Tue, 27 Dec 2022 01:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D87E166EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672100159;
	bh=E8xcs/VT6+9pRsaFzSWc18bwtFt/o+JHlqz77G0mbGE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Dd06gC9rrRnJvT9L4zHh6Ukj9rOGA6FresUtMFoc/TDy3GHN2uxUTCmexUH4Sk4Ge
	 ESxIlyA2IvPCvgIDC1lncir388lP/zcDb+Dv5I1ir0SEXwwoDtDdc3GW2vxEUDNj3G
	 hzLAywkLQRTtwgHblXS3c2iT2mAvI/9W6pxa3aos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB02F8027B;
	Tue, 27 Dec 2022 01:15:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2356F80310; Tue, 27 Dec 2022 01:14:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42933F8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 01:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42933F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P4cBpcuW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C482B60F06;
 Tue, 27 Dec 2022 00:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DB5C433D2;
 Tue, 27 Dec 2022 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672100095;
 bh=E8xcs/VT6+9pRsaFzSWc18bwtFt/o+JHlqz77G0mbGE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P4cBpcuWeyqoi77x97CIb1ss2bFVMKhY73/GUySNGwKUWqH8lONnLd2UZcJBxrbzC
 1eyu0Le3BYSbbcJKKeSpLgL5woqwNFK0GNvp48S83AcPOTss8DPi+2kjK8az78dotE
 oOCEx/zG/KX8XulCQBkoqvg+skeIZAcvLRWR1bTUCLN5a5Q1baoghR4jZlkKVqIZub
 c2UiVtME9j9rfQTUDkARvdzBX3g3czC89SzaMSKDcL5yVPKcZAADqr6HPcRrZwKbuK
 W/NgHFTCbtZvigg/05pZEEbBU7BPZDTW6ULQ11HAfTGXh16SXgz+Qn0ZLp40v/TI9c
 VRjD7cSKFYSJA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
References: <20221215185347.1457541-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Fixes for suspend after firmware crash
Message-Id: <167210009423.553759.17739795224754159406.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 00:14:54 +0000
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
Cc: tiwai@suse.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 15 Dec 2022 10:53:44 -0800, Ranjani Sridharan wrote:
> This series contains 2 patches to fix device suspend after a firmware
> crash and another patch to allow reading the FW state from debugfs.
> 
> Curtis Malainey (1):
>   ASoC: SOF: Add FW state to debugfs
> 
> Ranjani Sridharan (2):
>   ASoC: SOF: pm: Set target state earlier
>   ASoC: SOF: pm: Always tear down pipelines before DSP suspend
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: pm: Set target state earlier
      commit: 6f95eec6fb89e195dbdf30de65553c7fc57d9372
[2/3] ASoC: SOF: pm: Always tear down pipelines before DSP suspend
      commit: d185e0689abc98ef55fb7a7d75aa0c48a0ed5838
[3/3] ASoC: SOF: Add FW state to debugfs
      commit: 9a9134fd56f6ba614ff7b2b3b0bac0bf1d0dc0c9

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
