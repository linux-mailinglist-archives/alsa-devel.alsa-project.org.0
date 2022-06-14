Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06354AE46
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 118DF17C9;
	Tue, 14 Jun 2022 12:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 118DF17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655202406;
	bh=cN29pCVu1fdFS3tkH1//D2VHMIqIZryyXy+3UpwRphg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thTl/g3BtiuLtOZvbt4XhjyxlE67VQNoX+Vs3li46l4lV3QcC6BEyqSNWeaMT9qTq
	 27QNPbt06QciGkJ9h9wLZCesAAoVFCFbrNYk2dHc/yapC4ysTaSbPAcjKZ5htsrTrm
	 kEsHO+6AAp33rdY7lrFtAl4uE63c7HzjnV0k4e5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13231F8051F;
	Tue, 14 Jun 2022 12:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0334AF80246; Tue, 14 Jun 2022 12:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85CD8F80137
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CD8F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tg3uPwlP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20AC2B8184A;
 Tue, 14 Jun 2022 10:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD418C3411B;
 Tue, 14 Jun 2022 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655202310;
 bh=cN29pCVu1fdFS3tkH1//D2VHMIqIZryyXy+3UpwRphg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tg3uPwlPEcST66oS7WoXuS6WbTiOJ9LpvOECob7L3DZ2rIkqKP+9iPFzK+EN0xUjr
 RX7e15KNGTSf7D3UwX6puyQHzo/TfNLBsXaYcC0qma3VVakwzX8A3h+Ah36foVPz4S
 muh2uf9zappxGG9QHbQ/tfFQbN7YAxwIeIF12cFx6Imvh87EwEkzutSv+iCbttkm5h
 c4MYWo/eTa2KKa4fvatAMz1l2RNQw1tibcwuKxrfhVlV+pQRVCQFio6vljvD6RXndv
 zky/mpA8/nvbMOcz+JH69nSYSZQRyja6Ye0ReCbqIrIbTDR10HIzuqXCo3Rz6Gt8m9
 ev0rVDQWave9Q==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220610214504.42974-1-pierre-louis.bossart@linux.intel.com>
References: <20220610214504.42974-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-dai: enhance debug messages
Message-Id: <165520230949.3607327.2834763347940935898.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Fri, 10 Jun 2022 16:45:04 -0500, Pierre-Louis Bossart wrote:
> The same message was added twice for dai and link_dma, remove the
> latter one and add dai name and direction to better understand
> problematic sequences.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-dai: enhance debug messages
      commit: 519d1130b66e000ce363ad82c0d61ae36a5392dc

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
