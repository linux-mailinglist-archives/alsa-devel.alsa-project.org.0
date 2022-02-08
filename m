Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546014AE1CB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 20:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B398B17E2;
	Tue,  8 Feb 2022 20:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B398B17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644346872;
	bh=5W5fPk5O+OhCfuvFpEPNFTFJHSo3n34jghpGXLn8aa8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vjr0frc606DDoxKZmpJVd/z7G0mmmHcjki8d2Qk8nkxjQkJ5u1/VvWNCl1XCqB4Vm
	 3RqU4OVNchQVZ4H1NADPQkX/DwvSIUHPDkwN09Dd9JzHH01EKNI/c+l4KC6zXT/vVz
	 GEN7y6+n7FWjrZKNWP6Mk0/KYWHlfTOrQbz5trFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19CC7F800E1;
	Tue,  8 Feb 2022 20:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01ED6F80154; Tue,  8 Feb 2022 20:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A380F8012B
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A380F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jAAFXZ3u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 342D8614D4;
 Tue,  8 Feb 2022 18:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BD2C004E1;
 Tue,  8 Feb 2022 18:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644346798;
 bh=5W5fPk5O+OhCfuvFpEPNFTFJHSo3n34jghpGXLn8aa8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jAAFXZ3uwrzI+tSd+DT22vrWw6TWL6e9qJ2AJDbBmJx6PHfFpL1DNaAPhe7KwSTNS
 oeng1Ngy5J8ihJpwlwbrYoM+InbF3Z+pi1kxLsm6O/eEjyYEvBWU2az1Jg32Cv1tua
 q+lV9OFEuF9HUYM6c5xPQoy/mbUlBCuFQTIk8rU06o1OXK+TXumAs4stZtFde2gFFn
 HSo7tGTlH/yT7WLTmp7K5ZjCCBLezK6vKZgahIIzPtHovYjUTNCwR5dBsszBsvmTNm
 1EnKiM7fp0mGLTPkFDM0MvJhp+CDz++Cxx7L55snhDct1FHuNUtLrts8vPMbAvvcXB
 EIjnLXOVwt9qQ==
From: Mark Brown <broonie@kernel.org>
To: kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220120143741.492634-1-daniel.baluta@oss.nxp.com>
References: <20220120143741.492634-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v3] ASoC: SOF: compr: Add compress ops implementation
Message-Id: <164434679640.1135369.1129624363357940675.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 18:59:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: paul.olaru@nxp.com, cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, linux-kernel@vger.kernel.org
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

On Thu, 20 Jan 2022 16:37:41 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Implement snd_compress_ops. There are a lot of similarities with
> PCM implementation.
> 
> For now we use sof_ipc_pcm_params to transfer compress parameters to SOF
> firmware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: compr: Add compress ops implementation
      commit: 6324cf901e14c6662be508f30485e0f09c54694d

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
