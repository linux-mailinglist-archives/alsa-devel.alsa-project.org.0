Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08A572284
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:25:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944CE16D5;
	Tue, 12 Jul 2022 20:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944CE16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650302;
	bh=C2rhacqCp1pKnkgrfxEegnBu5iOnykXAIF50U1eA8Hw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AvPsqnxC/73juLcXXQpi0+PVXcidLbVHHVmEGRebdYsqjl/U2oK1/PDTD7bXmGG1w
	 2ANxrW8tJqgl+iMRlvOZG/cT1Dqsqfa+2UdHgyPbO6oJIlqNtYUUm7N646seohVTnx
	 rK6JtQNgaQJ5FwX6bOC8jRpWbMrh60RrBE+pNPwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80164F80567;
	Tue, 12 Jul 2022 20:22:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC0CFF80566; Tue, 12 Jul 2022 20:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 707D2F80558
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 707D2F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HchhSp5u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABB32B81B94;
 Tue, 12 Jul 2022 18:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55023C341C0;
 Tue, 12 Jul 2022 18:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657650152;
 bh=C2rhacqCp1pKnkgrfxEegnBu5iOnykXAIF50U1eA8Hw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HchhSp5useKHMKkM9XPqSOOip9mwqfM9Ws4NK9H9PSwE9PE3dpST00Efj2fPuRMJn
 ALtnnRuBIAibwm5+m2CNp2zwAEcB9HAWmxi583ShrC3MD1zEvD/GhWKXSVymf2yeht
 MA51TfKVPgwHxtP75hEFTtFQ3HMfn5Ac05fafKOwi2fSYLltcxRO/sHILMMefJSbfc
 x+wnb/4koMZ2S6DNHa8d3e8iWw0+lfUouuHU2MYQrhx9Z+4ZHbhlKSzm4b+sWxIkeG
 Bp5Ps6rqh3Y6Xo+oS/ferBSDydo+xVpby0srENR6getmBUKi3kvr2RfzH+9JbIoPkD
 X2aqzHeuMC8xw==
From: Mark Brown <broonie@kernel.org>
To: daniel.baluta@oss.nxp.com, alsa-devel@alsa-project.org
In-Reply-To: <20220712141531.14599-1-daniel.baluta@oss.nxp.com>
References: <20220712141531.14599-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/4] Extend ipc stream parameters sent to DSP
Message-Id: <165765015006.502248.16563043573406286114.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 19:22:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, linux-imx@nxp.com, yc.hung@mediatek.com,
 peter.ujfalusi@linux.intel.com
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

On Tue, 12 Jul 2022 17:15:27 +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> We need a way to send extra parameters to DSP firmware. In order to do
> this, we introduce ext_data array at the end of ipc_stream_params.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: compress: Dynamically allocate pcm params struct
      commit: d5770daef62d2e4d33015089bab392ef867fd35a
[2/4] ASoC: SOF: Copy compress parameters into extended data
      commit: 3f70c360d484466da7420f395d4675ca02436e32
[3/4] ASoC: SOF: compress: Prevent current kernel running with older FW
      commit: 246b135fcdba57a4e77a702580391ae1942c1e3b
[4/4] uapi: sof: abi: Bump SOF ABI for ext_data_length
      commit: 75b5b7a1ccf606281c4afe365a57ccca486641a2

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
