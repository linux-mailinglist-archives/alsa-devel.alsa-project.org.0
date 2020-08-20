Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B782424C760
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 23:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62FB61686;
	Thu, 20 Aug 2020 23:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62FB61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597960329;
	bh=Bx31esN2mPf7lmCBEMBgqpTqFifE4a0F/RsNqDpOaDA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8xXuca3+6ThkUvb+CZBSQsKUIl2k9OVrSvXy477ylBi8PSuCWfU9vcalflZ3LIFH
	 2IdWrpUEtnRtAnM7CPfjJzPWyaoxttMLAwJYUoPdMMP+lpzkR6Hp/O0rmTP2L+i9BO
	 rFncqXM9ypSHo6W2//wbIGWek3P9HczwxTq0aGbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21696F80247;
	Thu, 20 Aug 2020 23:49:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 317FCF80228; Thu, 20 Aug 2020 23:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67F5BF800D3
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 23:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67F5BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ijTfjR6O"
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 269C6214F1;
 Thu, 20 Aug 2020 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597960125;
 bh=Bx31esN2mPf7lmCBEMBgqpTqFifE4a0F/RsNqDpOaDA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ijTfjR6OsaRfWZCaNUqnmjQfbXkI/pNj2mfXAmnTHt7+p1c31nIWgmezY7zBpgrq4
 jsl+vrAJnzjtLwvyj3+dpHeObs0YJ1zZZrb6Lwh/TJd1OGQ+Sap6ulXiYeOmbT2etC
 SaIdajnNskIp53GCoLvacKm8lrrbUJUCaZVI0Rbw=
Date: Thu, 20 Aug 2020 22:48:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrick Lai <plai@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, Colin King <colin.king@canonical.com>,
 Jaroslav Kysela <perex@perex.cz>, Banajit Goswami <bgoswami@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Ajit Pandey <ajitp@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>
In-Reply-To: <20200819160103.164893-1-colin.king@canonical.com>
References: <20200819160103.164893-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: qcom: add missing out of memory check on
 drvdata->clks allocation
Message-Id: <159796008815.44152.14467897806901945440.b4-ty@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 19 Aug 2020 17:01:03 +0100, Colin King wrote:
> Currently drvdata->clks is not being checked for an allocation failure,
> leading to potential null pointer dereferencing. Fix this by adding a
> check and returning -ENOMEM if an error occurred.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: add missing out of memory check on drvdata->clks allocation
      commit: a467f2f8ad5f9a21f92b3fa6ad2aac90fa7054fe

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
