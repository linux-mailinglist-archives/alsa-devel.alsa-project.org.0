Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A7A656616
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 00:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29C6265C7;
	Tue, 27 Dec 2022 00:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29C6265C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672097801;
	bh=cdWsqz3AZs5/eCG45Y48E8p1TPGlHkbcy1fGr5dWAoo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ehDXI0l9JkaIyhe357OHoxhQF1XhDVH9WHB1Dx5Am7UMptbs1KFp12SFlV2ubL5W8
	 yGsSGWse78y49ZwWozBgcBElOe2oVaNEBqwvtohxzVLavGRmv0ObeX+pJotvnizd2r
	 40ZOW7Qnc41Tppwj+17MHTBGKLNIyfnEZJOr2dQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E4B9F8055B;
	Tue, 27 Dec 2022 00:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BDFFF80538; Tue, 27 Dec 2022 00:34:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CD9FF8052F
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 00:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD9FF8052F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PfGTxixU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC5F0B80E02;
 Mon, 26 Dec 2022 23:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4F7C433EF;
 Mon, 26 Dec 2022 23:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672097654;
 bh=cdWsqz3AZs5/eCG45Y48E8p1TPGlHkbcy1fGr5dWAoo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PfGTxixUNJlJritGJZSylGP0eA8iapZ6Jtt6maVITxDAwj8SlY7XMaAu4k+nuhrXR
 1/e587/aj05bEV7W1MQSdV9FFoTwFyiGadbLijDxRI+ANnvNtGCV3NLqqNz1ymcCQw
 56Fm3hfE0KZtceT2pk+rqv4mdOsQJULwvzU1frWlTGW2WnYG4bU6YPiQ8F0I5o9IjO
 OTeKfcIa88+zmxzMX6P8jA627htCAN1UWMCHCdBFbD+85qy7gAypAiXHh42/pCeqCN
 ySQnXsU3v2Sw9LZ7AJjxaZTgoybXKqaXimOiQWvqWM1xnOwijmePDYXjDmyvcFvPAZ
 QeTpU0qwsSJBw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221226010917.2632973-1-yung-chuan.liao@linux.intel.com>
References: <20221226010917.2632973-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: soc-acpi: add configuration for variant
 of 0C40 product
Message-Id: <167209765249.330820.6973319260133235949.b4-ty@kernel.org>
Date: Mon, 26 Dec 2022 23:34:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Zorro.Zhang@dell.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 26 Dec 2022 09:09:16 +0800, Bard Liao wrote:
> Support configuration with SoundWire RT1316 amplifiers on link0 and
> link1, and RT711 on link2 for headphone/headset. This product does
> not support local microphones.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi: add configuration for variant of 0C40 product
      commit: 896c3dc21f1e84cb2f60d54572fc3377eb57e004
[2/2] ASoC: Intel: soc-acpi: add configuration for variant of 0C11 product
      commit: b25a31b463391cc47a654594eb154ebf5dd0d60a

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
