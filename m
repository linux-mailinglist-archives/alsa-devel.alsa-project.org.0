Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860B60505F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 21:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD8413E24;
	Wed, 19 Oct 2022 21:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD8413E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666207732;
	bh=BaWgxo5Jv0aX8oR628WzmwLZ2Zn7wKzjR8mCo9t1esc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjSLTo6WKWvmqZkE3a681aHA28rUFsFMG1w7XUbeBvGlAHPQafYAfXC6WflYnpkVN
	 Xj0PI7mOeWObNC5VuAdOP0jWrHQs1abcSUpxPmpWwSKrhPyAa5gqPIFfMQbzs6LYaF
	 3tjsqL3iNe9mC9qhE4z9rNm4SeOEkdeRJpk77OUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10344F804CB;
	Wed, 19 Oct 2022 21:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67101F804E0; Wed, 19 Oct 2022 21:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C398F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 21:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C398F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BsaBbQ0t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 473BD619AC;
 Wed, 19 Oct 2022 19:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781A1C433D6;
 Wed, 19 Oct 2022 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666207669;
 bh=BaWgxo5Jv0aX8oR628WzmwLZ2Zn7wKzjR8mCo9t1esc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BsaBbQ0tioH/1Bt0H77a/ulizMaOrbyN5P4+ct83l94V+nklQJFYN4NZi90S4sHBZ
 AlnhdpZOSlxf8UUS8bK8PxqQh5SOXbY7ylNU/41e4GFZ5FeOwX87Scoa3T1G5rPeK8
 ZyxFoRRZkyETKmS8Kgm+EFNRmTf65gCCGK9Yzvr9tshbbSwzv4Wn5mWG+6X/GVIZrs
 EWwdqHECN/Gjziw9rIUawHH60ZhrjNp2QJtcXRPxw0K7dCM3kYCTwlfebyrdoArcQE
 4eMXEh7SBskalgeqlv6Krc3W2ZtpGkADlS5MoqY344TvhX/6Arl2yZSKQTdPHvHnFe
 JOQGF5S9+pRjQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221017204131.207564-1-pierre-louis.bossart@linux.intel.com>
References: <20221017204131.207564-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
Message-Id: <166620766821.1753821.14813429512518319734.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 20:27:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Chao Song <chao.song@intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Mon, 17 Oct 2022 15:41:31 -0500, Pierre-Louis Bossart wrote:
> ADL-N uses a different signing key, which means we can't reuse the
> regular ADL descriptor used for ADL-P/M/S.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
      commit: 05de5cf6fb7d73d2bf0a0c882433f31db5c93f63

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
