Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915B253831
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 21:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1264317BD;
	Wed, 26 Aug 2020 21:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1264317BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598469591;
	bh=JmBM+nkl0t+UofWg4Gi1xS0o3nBQu5RONor3hOBJoqE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CFsYxgkhzNxIG0MmKzslhY+chsqZzH7pxJ8MJBZjpxPDGrxnq1IUCc4VzXq/MG77v
	 RIzzVa64Nc8fNTCR/SKD4CaKzlJkdUNAKChgb/JrJWfdkiTgtKDRhYqxi/QqiMBzB9
	 ftSU6eyXt1L9oWR6yEl1sygdDtt0dOnAVRe9b+rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E97B0F80257;
	Wed, 26 Aug 2020 21:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 820B3F801F2; Wed, 26 Aug 2020 21:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7D6F801F2
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 21:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7D6F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PNJRCD+c"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D43552078A;
 Wed, 26 Aug 2020 19:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598469441;
 bh=JmBM+nkl0t+UofWg4Gi1xS0o3nBQu5RONor3hOBJoqE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PNJRCD+cKqy2Mvyvk8mEF8MpHMrU/Fy/KvJ4bIblOU22Mdh+2ISANcpiOOK+il/Fo
 mXvPO7D2WwrBryg83KPXAjKWyZpqsbNG52DuxZZ7gq5q/gHAPsHU2V/BQCrANihDeI
 l1H6Mq7+p7vPvcoUOejRI4ltWrit/YNGe8aF6aNY=
Date: Wed, 26 Aug 2020 20:16:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
In-Reply-To: <20200820042828.10308-1-dinghao.liu@zju.edu.cn>
References: <20200820042828.10308-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] ASoC: qcom: common: Fix refcount imbalance on error
Message-Id: <159846939972.39744.13708543764168639585.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Thu, 20 Aug 2020 12:28:27 +0800, Dinghao Liu wrote:
> for_each_child_of_node returns a node pointer np with
> refcount incremented. So when devm_kzalloc fails, a
> pairing refcount decrement is needed to keep np's
> refcount balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: common: Fix refcount imbalance on error
      commit: c1e6414cdc371f9ed82cefebba7538499a3059f9

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
