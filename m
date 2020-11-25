Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB832C4194
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 15:00:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE183172D;
	Wed, 25 Nov 2020 14:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE183172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606312815;
	bh=LNmu/IGbF7cIUWaCF12AenqQVuPL2EefReLbG5xe9Bw=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTOh14tA/Lcd3TRbTSkM8OW22XcP6JAc4ZOvLQ1S9zYg3MT1injR08Nl6apjO4pb7
	 MmXjbrBRsc3Nh2z/2JkTB+KYCmrXDs6kQsAssCib0pcChCD6uSN3QSwX/S1X/DXtM2
	 Agim7rWLOoKtiNZLovUfm1cRCu40Cg/cT/2t5FMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19EA3F80218;
	Wed, 25 Nov 2020 14:58:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4A0AF80218; Wed, 25 Nov 2020 14:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA4DAF800D2
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 14:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA4DAF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W6gauMvU"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED8912067C;
 Wed, 25 Nov 2020 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606312706;
 bh=LNmu/IGbF7cIUWaCF12AenqQVuPL2EefReLbG5xe9Bw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=W6gauMvUvzk1jHztuRFsaHcM7qv3mI4ygMrdvTxcmfjjPpj6HGAxy4lVztcpEWMvT
 xc2eczXK5/G8pBMZv1S+9u5kwt5l8KbvqfFMe6z5rIU//BYRe5FE0lpmIvrCnHQkzl
 ZNXHJnSM0xWA1KwuxR6RA9SJCFZ2AMXi5DNL1DPE=
Date: Wed, 25 Nov 2020 13:58:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam.Brickman@cirrus.com, piotrs@opensource.cirrus.com,
 alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, Vlad.Karpovich@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, wenshi@opensource.cirrus.com,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 james.schulman@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com,
 Luo Meng <luomeng12@huawei.com>
In-Reply-To: <20201123133839.4073787-1-luomeng12@huawei.com>
References: <20201123133839.4073787-1-luomeng12@huawei.com>
Subject: Re: [PATCH] ASoC: wm_adsp: fix error return code in wm_adsp_load()
Message-Id: <160631268107.29388.4656840004300163625.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 23 Nov 2020 21:38:39 +0800, Luo Meng wrote:
> Fix to return a negative error code from the error handling case
> instead of 0 in function wm_adsp_load(), as done elsewhere in this
> function.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: fix error return code in wm_adsp_load()
      commit: 3fba05a2832f93b4d0cd4204f771fdae0d823114

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
