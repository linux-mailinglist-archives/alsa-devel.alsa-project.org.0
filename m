Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D74F93F5
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55130192B;
	Fri,  8 Apr 2022 13:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55130192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417151;
	bh=zoxU2hf0Wy8EncLKeCucJJOdIN0RECLbrZ8cjg0PWc4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrJhGH0F7VDrRyNI7FEH2DKkXanG18ViHUyT1RRaL75LK4Zc5HOPrT05wYKR6IGl3
	 sNOD3RA2ok8/PA+n3HI8lj+INpiSICXkhoF1af1EPArTRjjC4wUKgDPcNwpjTj8nxD
	 mARapZu4BZ5npT4HPTp8+LyBupMTOJPSoT87zGtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F042F804CC;
	Fri,  8 Apr 2022 13:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35B1CF80516; Fri,  8 Apr 2022 13:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 295DFF8014E
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 295DFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bLuN/llH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75D20B82A16;
 Fri,  8 Apr 2022 11:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C0AC385A3;
 Fri,  8 Apr 2022 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417050;
 bh=zoxU2hf0Wy8EncLKeCucJJOdIN0RECLbrZ8cjg0PWc4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bLuN/llHP4LqL8ba/Ivq4dPjNRZ3tLlvpDIAQnM6EDftQi2xsl35qDuMVdMAffjhJ
 2EYPHqmpY7uCcC/+rxJnXe7Ng44ZH7Tn/gDvmRcC2wHfXGRHUVDNT6ZoMtuIDOzQiu
 D21D2W8Hj8PfcFM7BVKvO3CR4yQAys2UYpZf9iRnp8rRUSnWziCdXMk/uyuVmzATZL
 MKD8qgcIG9YALNzk0hgUs8h72o0bp6A59xaWa40VKJqgU+kG6DIJfMnAEyAlpdMYOz
 UcL6BH08P7jVm5uVvv4X5GJVWIkWB6s74Vck2C92JoY/C1mP9WxJRBmmYVw8oh/LHa
 c5Dk+ksYRwdxA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220406191606.254576-1-pierre-louis.bossart@linux.intel.com>
References: <20220406191606.254576-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: cleanup dailinks on widget unload
Message-Id: <164941704820.1295287.16407013179365130768.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com
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

On Wed, 6 Apr 2022 14:16:06 -0500, Pierre-Louis Bossart wrote:
> We set the cpu_dai capture_ or playback_widget on widget_ready but
> never clear them, which leads to failures when unloading/reloading a
> topology in modprobe/rmmod tests
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: cleanup dailinks on widget unload
      commit: 20744617bdbafe2e7fb7bf5401f616e24bde4471

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
