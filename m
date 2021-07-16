Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B690E3CB972
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 17:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394511693;
	Fri, 16 Jul 2021 17:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394511693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626448134;
	bh=+ughgdT7PQsxP8d/yuM4LkU674j7Jk0PcAMExfuRTV4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e43+O5KhM8DOy5jcpayDm6eDFFoFK+F2AGAvFS2stLKJfRsBInRfBH2EdQ2vDpsPz
	 oBzJjD1UDhF6AgP6wFTtS433XpdQvnb0FBpMrV/aJ5T7rffexmTFeFrKYzGMyN+3Ci
	 RVbPJaYE2tHdQcgnanju7H03Tj2KG6b1e1XwveTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E151F80253;
	Fri, 16 Jul 2021 17:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 201E2F804E2; Fri, 16 Jul 2021 17:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2214F80424
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 17:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2214F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rvDYBTNI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C734613BB;
 Fri, 16 Jul 2021 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626447980;
 bh=+ughgdT7PQsxP8d/yuM4LkU674j7Jk0PcAMExfuRTV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rvDYBTNIxGOZjUbFWtMOFIOFD25sfOMLHu+4np/Jxp5IWrlGJC4SX2FRir96+6Ub7
 Q3I8OEad0K2ZC+qhJRDCKcFVulh3E7Sp6Tm4Qy256bK/pSKUCdFgEHRj60kQfuWl7R
 5XxPsOf7Mq6wO0WAFJRt4m+OZz0nbrotTLrqKKDNCEGCGGp0hvmTFk5EnSFW96iZib
 3rjgJDvUb6TFLhIXebTSslrygm2yB3yI8e3vaOZvgNgBhy2FXjeWBHqeAVGFy1Ze1O
 Vsx3OVF+aeiZE7HC+MV9GxaGZ+B8wlATnQRlC8NX5Ko26ydNu/kpExE5uBdhaCq2wo
 isrHnmtHZNDCQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: soc-pcm: add a flag to reverse the stop sequence
Date: Fri, 16 Jul 2021 16:05:32 +0100
Message-Id: <162644746764.25983.7997176464978252855.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210716123015.15697-1-vijendar.mukunda@amd.com>
References: <20210716123015.15697-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 nartemiev@google.com
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

On Fri, 16 Jul 2021 18:00:12 +0530, Vijendar Mukunda wrote:
> On stream stop, currently CPU DAI stop sequence invoked first
> followed by DMA. For Few platforms, it is required to stop the
> DMA first before stopping CPU DAI.
> 
> Introduced new flag in dai_link structure for reordering stop sequence.
> Based on flag check, ASoC core will re-order the stop sequence.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-pcm: add a flag to reverse the stop sequence
      commit: 59dd33f82dc0975c55d3d46801e7ca45532d7673
[2/2] ASoC: amd: reverse stop sequence for stoneyridge platform
      commit: 7883490cba002121a5870e786a1dc0acce5e1caf

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
