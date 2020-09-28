Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4927B56D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35BF1845;
	Mon, 28 Sep 2020 21:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35BF1845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601321853;
	bh=BsXKWSu4s+YcxxERLVTSYjv5y7Zks6n3V7+kJsb3bbw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ClC28jy1OQmyuJhkOX1cqjcsA4qtTICJJh9jvSAVKag4jaVSeT7/KuFH3M0zQdCMd
	 u5I1MtzwMNJfO+1x6YgLmFSOR7sXBXmA7XWshyt77yvm4evGrXJzwt9SlwMDokeduD
	 1UPJ+/zp6YTtd/xpXf8n8nmAdbXvgT08mSVO9KfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92214F80247;
	Mon, 28 Sep 2020 21:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23FE1F801F9; Mon, 28 Sep 2020 21:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6377F80115
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6377F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P7XicuHA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A5182075F;
 Mon, 28 Sep 2020 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321739;
 bh=BsXKWSu4s+YcxxERLVTSYjv5y7Zks6n3V7+kJsb3bbw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=P7XicuHA/iSQk1m1xETPeweXYvFwdngvjD/KndXNvoKvF0Gmxi4/zxJc5BcVg31cx
 qkXyxOycqAfOf1VdeywnVyWZRfTFVh7RbEWde3z5Yn2rSqZiktRGvUGHeLLV7Za6hW
 5s9+SNyl9jSG/IQg76v30Gj7ZOPW4BAvUaByQUx4=
Date: Mon, 28 Sep 2020 20:34:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
References: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/2] regmap: add support to regmap_field_bulk_alloc/free
Message-Id: <160132168199.55254.1303533504124900914.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, rafael@kernel.org,
 gregkh@linuxfoundation.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org
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

On Fri, 25 Sep 2020 17:48:54 +0100, Srinivas Kandagatla wrote:
> Usage of regmap_field_alloc becomes much overhead when number of fields
> exceed more than 3. Most of driver seems to totally covered up with these
> allocs/free making to very hard to read the code! On such driver is QCOM LPASS
> driver has extensively converted to use regmap_fields.
> 
> This patchset add this new api and a user of it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] regmap: add support to regmap_field_bulk_alloc/free apis
      commit: 95892d4075db67fb570a5d43c950318057e8a871
[2/2] ASoC: lpass-platform: use devm_regmap_field_bulk_alloc
      commit: 44e755fb54feda74e7af7c2ddc04cc23b64ee39c

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
