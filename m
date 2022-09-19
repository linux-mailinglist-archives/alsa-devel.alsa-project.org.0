Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D679B5BD7EF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7549715E5;
	Tue, 20 Sep 2022 01:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7549715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629165;
	bh=fGg6E9FCNvaTOObUeMg5v1oGFhDvQ2Kc20+ZlyFSc1M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJuSEC44rj01F9MJ/iXE6LSBAYsm0JtP0qLf7qA623uM7HMclK3zIldMHhhXMzgR3
	 9suiiXKoAyrg8OvTFTsCdGC8GaB1uzfUZS3tQjQy0TF7qhB8d3qYNu4w7vP54rXIXb
	 orSnONcOGh4QAEyzGoDX3SWLbsuAhUvmiMLRNdeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A443F80571;
	Tue, 20 Sep 2022 01:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF7CF80570; Tue, 20 Sep 2022 01:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E58F8055C
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E58F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UNS6n4OO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 958BEB821D3;
 Mon, 19 Sep 2022 23:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5AAC43470;
 Mon, 19 Sep 2022 23:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629001;
 bh=fGg6E9FCNvaTOObUeMg5v1oGFhDvQ2Kc20+ZlyFSc1M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UNS6n4OOipDphqkdMrjnKHJi0bdvtrayMAchNDlSy9L5c2wqcvqmTRV9DlEvdoZE5
 7LHHV7OR4yNZgMBBQX32DMHhM6QAI3ei4zM81fLVNIVUqJjo6nTpaVcspBF4P88eGI
 HyR3aJ2NFTC7eCfUj6RwqeghHE5hoeVGlOBjzX4hdGiDAh6kaT+CRErMEohGtaEkyk
 N6DaXMRAAFHPWSNHf2E8c8rTjF7fpraOKLWJEl8DPF9lKXG5ZDSp7AzjMlP3681VDd
 JFfQ7NnroGAAOQXsz/N3uQNY/DhJKNq0jLywA8E3R+6AR5DRpOZC61rxoXf0ifFE2F
 gyy5aXGv7YSHQ==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916062320.153456-1-ye.xingchen@zte.com.cn>
References: <20220916062320.153456-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_nau8825: use function
 devm_kcalloc() instead of devm_kzalloc()
Message-Id: <166362899710.3419825.5805063205687175019.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com,
 yung-chuan.liao@linux.intel.com, akihiko.odaki@gmail.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 yong.zhi@intel.com
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

On Fri, 16 Sep 2022 06:23:20 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_nau8825: use function devm_kcalloc() instead of devm_kzalloc()
      commit: b60200d760cfcf49c260a47fc28956cef116674f

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
