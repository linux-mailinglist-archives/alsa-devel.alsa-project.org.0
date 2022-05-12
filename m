Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 633855252A4
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 18:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2BF41AD7;
	Thu, 12 May 2022 18:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2BF41AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652373226;
	bh=h9Kzf5/SsxRvY1gZjEU/igSn6fpGqPvspFpuVtnK7kg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbhDQWb0duqjaZy73vEHfscVoNsYdNAPHsFGZLUwUdK6D9oWOK9vj+CNgLvgz9dZN
	 uloJH5FnWHZKHLbwLtLrqrL/w4vRLF9jpe9zoFvDG4VjZuusO/XDieDeH2etYt0VB3
	 UJvcZxw+oV5eSoNm8dkA/Ix2OBJif/2TOIrwoU08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179CCF80510;
	Thu, 12 May 2022 18:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09CA6F80254; Thu, 12 May 2022 18:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54743F80254;
 Thu, 12 May 2022 18:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54743F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rTvb2kyn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D8AE61FD7;
 Thu, 12 May 2022 16:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF14DC385B8;
 Thu, 12 May 2022 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652373115;
 bh=h9Kzf5/SsxRvY1gZjEU/igSn6fpGqPvspFpuVtnK7kg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rTvb2kyn7eb/9ukf8eciK2lLPwcjnxvnLxM9dpZrft3IfljA2cbtJluyjuT1n1jMH
 Vs5Z4tv+Rd2RZrxL7VXxSkWZ4BaBTUlRRlSE5dG4xrPlZDH5cbEYevBxXMCyayeVBR
 oNUTzQbIH59naXSQ6qj7RePOy56WOl9xIpp34+pKlUKS1sp1GCAHunQUjRI/PBidi7
 k+Hv3ggAN//z0IzCVH8Job6hYYLQWQcKYjS+otsDnTMTx5gI4hoaAHeMlFK3oWoEY+
 BwC2p8UaLodULQvI4znXS1LHvZqvdXSKPGJu8379wV0PW19mYGDNgIIgiLd6xSBQ8x
 46WYRbHyyoYew==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, tiwai@suse.com, zhengbin13@huawei.com,
 linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 sound-open-firmware@alsa-project.org, perex@perex.cz
In-Reply-To: <20220512013728.4128903-1-zhengbin13@huawei.com>
References: <20220512013728.4128903-1-zhengbin13@huawei.com>
Subject: Re: [PATCH -next] ASoC: SOF: amd: add missing
 platform_device_unregister in acp_pci_rn_probe
Message-Id: <165237311250.1053236.5667344558272155246.b4-ty@kernel.org>
Date: Thu, 12 May 2022 17:31:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: gaochao49@huawei.com
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

On Thu, 12 May 2022 09:37:28 +0800, Zheng Bin wrote:
> acp_pci_rn_probe misses a call platform_device_unregister in error path,
> this patch fixes that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: add missing platform_device_unregister in acp_pci_rn_probe
      commit: cbcab8cd737c74c20195c31d647e19f7cb49c9b8

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
