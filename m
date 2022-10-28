Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF2611ADD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 21:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929A7E11;
	Fri, 28 Oct 2022 21:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929A7E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666985139;
	bh=8//h+tyapzLVTU5tcVVz+UK6ke4W6O7sJMkE3L3lUk8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=krnNdytdZG9nzEXTMkCEH/DkbmM7KeGO1GryYNu8K4zmbGoJbZCSBxxUQc3pse2RV
	 cEDLUvajLzUhaLWvtevFW58xUsfgz/62kES2FXX3IveYQ2O1/vSMcG5WMCaT3LDlNC
	 IMD3p/XobfyL6RMzRNqUdbCkr6nBK+plaUtJ0hY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA80FF804DF;
	Fri, 28 Oct 2022 21:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84934F804BD; Fri, 28 Oct 2022 21:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8C41F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 21:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C41F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qGYXPELW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82C6162A26;
 Fri, 28 Oct 2022 19:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10082C433D6;
 Fri, 28 Oct 2022 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666985053;
 bh=8//h+tyapzLVTU5tcVVz+UK6ke4W6O7sJMkE3L3lUk8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qGYXPELWt1WeG5WS5xiF4ANqv504+Qmpmexgb5MJ0+Tbw96ZjDDin0TDTx5WVS9HH
 PbtDss+cIJqBCI8nxoLqg6KAAAEXNLikkmpPa5ILBEmp7ivYs/16L/mdKWxwJ5ofwr
 P9tuk+pc/xMdQwpEkZ2x94DsDEo0ziBHmRsdzb/ep0t58Y6i1d81YuXItIRBTSDcmb
 4wzNtylYIF3HZYEJVBaPc6D5IADdnIKd9xSJQbEwjJ4526gbzkhlFRrJyKFvgC2vnv
 tybvYLcKOXhAKH0u79/ftl+uHpDyHwl9noRxiNK0pvwt9hIP8UMIhCk3sN/ldsDIyG
 rd501z5oOs8Cw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
References: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/9] ASoC: qdsp6: audioreach: add multi-port,
 SAL and MFC support
Message-Id: <166698505174.1386510.10315804075480658283.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 20:24:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

On Thu, 27 Oct 2022 11:27:01 +0100, Srinivas Kandagatla wrote:
> This patchset adds support to multi-port connections between AudioReach Modules
> which is required for sophisticated graphs like ECNS or Speaker Protection.
> Also as part of ECNS testing new module support for SAL and MFC are added.
> 
> 
> Tested on SM8450 with ECNS.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
      commit: af7ed7eb70e8964514c706f8498623a2a3696657
[2/9] ASoC: qdsp6: audioreach: remove unused connection_list
      commit: 5b488e80078f09bbc197d766babf014dd52c30bf
[3/9] ASoC: qdsp6: audioreach: update dapm kcontrol private data
      commit: 1c87d3817b74b895933e9940b9de09b17c674b9b
[4/9] ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections
      commit: e4977b91cff8b00cdeb310735ef34fa4dee9485c
[5/9] ASoC: qdsp6: audioreach: simplify module_list sz calculation
      commit: 4efb98e9635b9919f2cb72cddae97b7231cf96ef
[6/9] ASoC: qdsp6: audioreach: add support for more port connections
      commit: 03365d6a58c47b3a3f2f964d0777493e293d7da4
[7/9] ASoC: qdsp6: audioreach: add support to enable SAL Module
      commit: a934afdbb022d5a7b1d20251875ecefcaf48536a
[8/9] ASoC: qdsp6: audioreach: add support for MFC Module
      commit: cf0de67d954db21002fd7521364f2ac89aabae35
[9/9] ASoC: qdsp6: audioreach: add support to enable module command
      commit: 6648a6dcfe40ae8c5e7cb5c1d7b9e59f010e285d

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
