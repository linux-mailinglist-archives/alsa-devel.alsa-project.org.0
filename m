Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C0540101
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 16:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197DA1717;
	Tue,  7 Jun 2022 16:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197DA1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654611220;
	bh=wqITvfZQAbzIEt22kT1iwFc2Z2749nKTBX84jfVXf2M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYa3vgWQei1HgHSjFUF0DOriQRD+cxUlSCIJmf3DtRxrrl8gfwfiY0ggC7vWyNoyE
	 3uxkqg13gHLNKAMQ4fiKdy9tp4Uy9UO2H8yHVV++jiH7YaztIRL2ildRaBp+6PIWj+
	 ivKIQcTqugcgw39klgQjtXJMzriQVaWOLE0K+DCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F50BF8052D;
	Tue,  7 Jun 2022 16:11:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3656F80535; Tue,  7 Jun 2022 16:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69087F80533
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 16:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69087F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EXGizF3G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE499B8201B;
 Tue,  7 Jun 2022 14:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D2DC34114;
 Tue,  7 Jun 2022 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654611105;
 bh=wqITvfZQAbzIEt22kT1iwFc2Z2749nKTBX84jfVXf2M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EXGizF3GqRSqsMgNTITqn3pZmO80cJuy3ttRTcPY7HIVYezOYZwC29sLZEky3fxXK
 MHYg61o8otPujsycDOoOOdozs4rWwzwpiQ0Qb6ynPxq2DtyB1ZuWpijcwYPq01Rv9q
 sLxRaF2uXTItWLKvFlztsNupL5qV4rW3jDYqNO6yJJomT9906twP/zv/RanQPma3Wi
 cCeVYJKTzXgLX8nll81VWwb3ZPzmAnOyT9BJ2diBRbnNAUig7hwC/Ouu8hA/491xuV
 to+Xe5fQb0QpPE/Hw/IxAPbubRwHYjtqAyYCfKPiQHb+EqZzr21Pz6ZrSoCUpjLjiR
 Eb27B1CyV2ieQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
References: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: AMD/Mediatek updates for 5.20
Message-Id: <165461110452.1597191.17446972426439813577.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 15:11:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Mon, 6 Jun 2022 16:02:07 -0500, Pierre-Louis Bossart wrote:
> Small patches reviewed on SOF GitHub.
> 
> Ajit Kumar Pandey (1):
>   ASoC: SOF: amd: Add SOF pm ops callback for Renoir
> 
> YC Hung (4):
>   ASoC: SOF: mediatek: revise mt8195 clock sequence
>   ASoC: SOF: mediatek: Add shared_size for mediatek common chip
>     information
>   ASoC: SOF: mediatek: mt8195 modify dram type as non-cache
>   ASoC: SOF: mediatek: mt8195 suspend check dsp idle
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: amd: Add SOF pm ops callback for Renoir
      commit: b585692fc937dc8f9d494078b5ffe2aafe31ec18
[2/5] ASoC: SOF: mediatek: revise mt8195 clock sequence
      commit: e53b20598f394e37951d6355f1c88ae01165b53f
[3/5] ASoC: SOF: mediatek: Add shared_size for mediatek common chip information
      commit: fd43dcbb859c85831a05e37287e1c5395f54aba8
[4/5] ASoC: SOF: mediatek: mt8195 modify dram type as non-cache
      commit: 0bf4276cc7883d65e594926c1159d4c0712d02e7
[5/5] ASoC: SOF: mediatek: mt8195 suspend check dsp idle
      commit: 078f28fee5aa417169d8e8906815c684beddbe74

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
