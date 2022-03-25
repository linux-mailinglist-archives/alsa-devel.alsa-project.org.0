Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB444E7AA7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 21:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A422416D6;
	Fri, 25 Mar 2022 21:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A422416D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648240343;
	bh=FycWHzxQ04zpxhwqUWo2/O94K5XkFQApiHddF1z90ZE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzAlfxmX3RanMA2YgWCarbTkxfraZiecE1FkCu5oZNDRMDAILEKHxjmh0RkmRyCoo
	 k93IgUYpkKN+Pihdi/KH16aRlsjiY4WkRw247zCZmRkzEnsw2mMEu6y/qt1ssLrWaX
	 9EUlQ2YQs6jFJkn3upWxB9cKjwbruRlmS5jDi5QI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD57F800AA;
	Fri, 25 Mar 2022 21:31:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78899F80162; Fri, 25 Mar 2022 21:31:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E01AF800AA;
 Fri, 25 Mar 2022 21:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E01AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VMLwv2SX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 748F161D2A;
 Fri, 25 Mar 2022 20:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B2EC2BBE4;
 Fri, 25 Mar 2022 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648240267;
 bh=FycWHzxQ04zpxhwqUWo2/O94K5XkFQApiHddF1z90ZE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VMLwv2SXI7sAXxmLr/JFAGsqzoi0PtHhpxK76sdkI15a7cxecBooiIWGO/BqUrPHK
 UdSGBGsqdcmjfwTZ7OGatDtj4n+jguuqkGrFYoR9jHSuicSFN9E74N5uWG65t+f21y
 Aq0hC2/umicnKXIAQqOkrabQPeB86YZ7g4enyx3mtMxzv7ZLGbTAD4Kl7EyF4sWM6n
 AIo25j2R3bicQ84ZtIrF3GZVQztxVb6I/id6MDsAmuuoNmq3hyWnZIrmEs1xI0jq49
 n/R+fambkh8ZI14RBFKZIJtGi1I+n3UrI3z2vNSqlUTl6B9WXbyun1s2hJmNCzLO2R
 AHtLNl6Tek+Aw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, tiwai@suse.com, perex@perex.cz,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, Zheng Bin <zhengbin13@huawei.com>,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, daniel.baluta@nxp.com
In-Reply-To: <20220323092501.145879-1-zhengbin13@huawei.com>
References: <20220323092501.145879-1-zhengbin13@huawei.com>
Subject: Re: [PATCH -next] ASoC: SOF: Intel: Fix build error without
 SND_SOC_SOF_PCI_DEV
Message-Id: <164824026450.2684178.16201590071915953774.b4-ty@kernel.org>
Date: Fri, 25 Mar 2022 20:31:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tangyizhou@huawei.com, limingming.li@huawei.com
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

On Wed, 23 Mar 2022 17:25:01 +0800, Zheng Bin wrote:
> If SND_SOC_SOF_PCI_DEV is n, bulding fails:
> 
> sound/soc/sof/intel/pci-tng.o:(.data+0x1c0): undefined reference to `sof_pci_probe'
> sound/soc/sof/intel/pci-tng.o:(.data+0x1c8): undefined reference to `sof_pci_remove'
> sound/soc/sof/intel/pci-tng.o:(.data+0x1e0): undefined reference to `sof_pci_shutdown'
> sound/soc/sof/intel/pci-tng.o:(.data+0x290): undefined reference to `sof_pci_pm'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: Intel: Fix build error without SND_SOC_SOF_PCI_DEV
      commit: 664d66dc0a64b32e60a5ad59a9aebb08676a612b

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
