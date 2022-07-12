Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13502572283
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A291816FA;
	Tue, 12 Jul 2022 20:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A291816FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650288;
	bh=nGOKuStphhti0Q5Aqqk68PdUBxY4ccy0ayZhVjgTheM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGpj6qvxsbQ2vm3vKsk9rHpYHImN64Im8qnHCKv+oVzmb3FKUNBA1E1oIEobQWbWF
	 u7h+EbvWrYbf/mYKyh9XPL1rWJsANp1mAe7jaLIaqaQiKiedFZdzGPKl7uxzhLSMCP
	 BjX6DjfiY5WjIHvOZ0g/rXV/BhzvNILvlWp2dD08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD46F8055C;
	Tue, 12 Jul 2022 20:22:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85FBDF8055C; Tue, 12 Jul 2022 20:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99DB4F800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99DB4F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OB6LSpXa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 703DC61A6D;
 Tue, 12 Jul 2022 18:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDBFC3411C;
 Tue, 12 Jul 2022 18:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657650149;
 bh=nGOKuStphhti0Q5Aqqk68PdUBxY4ccy0ayZhVjgTheM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OB6LSpXakBJG6ZGrxu1Fzu/5rq6xuI1NZU9/Y8VBK0MeRS+Fg9lmNQeRw1c5416Jo
 M5r8Zk0si1o2aa01Jv+eKzrCtHHC4O4AK7UMCWrziHb+eA2i1r5kNJD69yr/aD0y/a
 NQgxR8TvnE1j8T76CZhuJRdWppb3BtHrsP1raikjVlOtFhbXh/W50dGQnVLNjC2lTO
 +jM4ykc68XKthBTHjXYs4McSp79JicqJfRewimUVUiR4c3fterV/HP79SWwyExYMzF
 qi/nlG+FF9CrsoZaNqLH81+0RcfXPk2E/jjOBxKgsFYudoLWG3vg69PVn/EqXLdmi3
 zQ/kKS3l3pU6w==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
References: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: hda-dai: No need to decouple
 host/link DMA twice
Message-Id: <165765014817.502248.6303361350167270148.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 19:22:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

On Tue, 12 Jul 2022 16:16:18 +0300, Peter Ujfalusi wrote:
> There is no need to decouple a decoupled stream twice.
> Keep the decoupling in hda_link_stream_assign() only as it is going to be
> executed in all cases.
> 
> Drop the outdated comment from hda_link_dma_hw_params() as well since the code
> has changed around it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: hda-dai: Drop misleading comment regarding dma_data
      commit: 402355e6cdbebf15f2c40cd9469b924c97b94b32
[2/2] ASoC: SOF: Intel: hda-dai: Do snd_hdac_ext_stream_decouple() only once
      commit: fbabebfb26a8130c10fd91cca687bac87944580d

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
