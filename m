Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F514C396F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 00:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E521AF7;
	Thu, 24 Feb 2022 23:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E521AF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645743647;
	bh=CO5/sGueBwwMRa9A9zjBVB4qVAii3ODAKpYKxMTzJNs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TY8/qikEmVCBK3oljPDayPn12JY1lwGla42aZlcfriMaiKwh6H1hJqOjzGT5aaPGO
	 dNkvX2RHPy0m8tFeSS+zzCQbIGgbmQoMxIId4Tj5ZAHSfA1/rSh9kcgsyaDjDGOoPS
	 n8pCO2OZXZuWNZ7R5is7JjDPh5ppaJplyTpYQAoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D16C8F8051C;
	Thu, 24 Feb 2022 23:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24EB9F80511; Thu, 24 Feb 2022 23:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB3FF80118;
 Thu, 24 Feb 2022 23:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB3FF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CjpXndFo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F74B61BE7;
 Thu, 24 Feb 2022 22:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12217C340EF;
 Thu, 24 Feb 2022 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645743533;
 bh=CO5/sGueBwwMRa9A9zjBVB4qVAii3ODAKpYKxMTzJNs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CjpXndFoGzZhD9Sl2oj4fVvfks3oGDRE6wAdLl7AwbQFYd2513T60wygKB378y4LI
 sDRqzhBOm6syyd+NiOg/VzgJOUHZq3WIEX+MZ1G8X6cAtfxfGN50+gwyQXHq3S2b3u
 puk2yzPBWTj7kpxWnCVFRzBLXOyvcW8uEOKtPeZShQajcNTC8Sey79SM7Mc+DgzDYL
 rmvCRtqZb8V0mGeKKl9YouLyXXlVrduAqrzpfosxhR0HjUeFBK5E7Ex7DPIFeGani+
 gDuPZruaPrAtFa88yGRWJhyMdIRxp8qf4c8cQYkSucROhAH2IKhWhPhUw5PNFq/v8v
 gKqDAKRpYz4Dw==
From: Mark Brown <broonie@kernel.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <20220224182818.40301-1-ammarfaizi2@gnuweeb.org>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
 <cfe9e583-e20a-f1d6-2a81-2538ca3ca054@linux.intel.com>
 <Yhe/3rELNfFOdU4L@sirena.org.uk>
 <04e79b9c-ccb1-119a-c2e2-34c8ca336215@linux.intel.com>
 <20220224180850.34592-1-ammarfaizi2@gnuweeb.org>
 <YhfLCWm0Ms3E+j4z@sirena.org.uk>
 <20220224182818.40301-1-ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH v3] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Message-Id: <164574353079.3982297.3715467450133041074.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 22:58:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Fri, 25 Feb 2022 01:28:18 +0700, Ammar Faizi wrote:
> From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> 
> Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
> -ENOMEM because it leads to a NULL pointer dereference bug.
> 
> The dmesg says:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
      commit: b7fb0ae09009d076964afe4c1a2bde1ee2bd88a9

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
