Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13855C036
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 12:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19654E0E;
	Tue, 28 Jun 2022 12:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19654E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656412377;
	bh=ZsJrsMQjZ4r9bY/qw6CSC8P3WOviim42PDUT+zI3/RE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k2GWndfLTcUTB4lxzUf7PeVfRNo5EBmNufqTUXP24ZB+wwOB2Ujcq+JGYXgSKk3zK
	 1pCG2R6NqzO6T6+uzgPed5b4RxdezJBnnBI+B6Pn+yH4KdhH7uuSW1DmYYQZgeJ4yn
	 IQVvIljtILqTsT/Qx1+nrggJdtAFw/4EceS43SCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC70DF8049E;
	Tue, 28 Jun 2022 12:31:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2953F8028B; Tue, 28 Jun 2022 12:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6521F80163
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 12:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6521F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jHwLb/F2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EC3B6191A;
 Tue, 28 Jun 2022 10:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C1BC341CC;
 Tue, 28 Jun 2022 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656412277;
 bh=ZsJrsMQjZ4r9bY/qw6CSC8P3WOviim42PDUT+zI3/RE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jHwLb/F2Gyn1FAYko4v2KVxR7of29E6qZReF/KZG0/5OudbeqiU9t4znFy3uRyv9E
 rPl9JKYQ9rS/kX4tXVACcMtN+pgt+e/MELhEt0vd2MgMSRORnsnn7/DFrlAOTbqt/I
 TDlhc570+LOVL3p5aiC8aZcfKj09Y3a6R3Xq/QkMMs4AFbU6R+m1MaIK64M8BcKYDt
 ThR2feqOesBnJoFRSFXcTFPfanB9TyPivDNH9MPhKQmXw8YStQX1A50NpFczxavPgL
 i0NNzIe827BIGbDtlUROyIBLmkK4prso+0J0nLUb4XvIFVoYcpPob8yyr5V4RbILhn
 WtW642EXV0k+A==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, devicetree@vger.kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, krzk+dt@kernel.org, shengjiu.wang@nxp.com,
 robh+dt@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
In-Reply-To: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/7] Add PDM/DSD/dataline configuration support
Message-Id: <165641227438.254424.553872611116511612.b4-ty@kernel.org>
Date: Tue, 28 Jun 2022 11:31:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Fri, 17 Jun 2022 15:44:30 +0800, Shengjiu Wang wrote:
> Support PDM format and DSD format.
> Add new dts property to configure dataline. The SAI has multiple
> successive FIFO registers, but in some use
> case the required dataline/FIFOs are not successive.
> 
> Changes in v2:
> - refine the commit subject of patch 5/7
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: fsl_sai: Add PDM daifmt support
      commit: c111c2ddb3fdfca06bb5c7a56db7f97d6d9ea640
[2/7] ASoC: fsl_sai: Add DSD bit format support
      commit: 4665770407de8af3b24250cec2209eaf58546f8a
[3/7] ASoC: fsl_sai: Add support for more sample rates
      commit: 0d11bab8ef3e5540dfba111947dbd8dcfb813150
[4/7] ASoc: fsl_sai: Add pinctrl operation for PDM and DSD
      commit: b4ee8a913e617a2d0f19226225bc025c8640bf34
[5/7] ASoC: fsl_sai: Make res a member of struct fsl_sai
      commit: cd640ca20095ed3b9306981f0064313a54fd4568
[6/7] ASoC: dt-bindings: fsl-sai: Add new property to configure dataline
      commit: 6b878ac2711056dd07c712caf89f58449cf5a592
[7/7] ASoC: fsl_sai: Configure dataline/FIFO information from dts property
      commit: e3f4e5b1a3e654d518155b37c7b2084cbce9d1a7

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
