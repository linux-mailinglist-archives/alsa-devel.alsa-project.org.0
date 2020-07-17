Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F4223FD7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 17:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F5C1679;
	Fri, 17 Jul 2020 17:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F5C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595000611;
	bh=zZZXKkoo6jRo9cnEc915dxdlDYp+1O3LpZF62jp+s98=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZV7+ZI8nie4NpcrRDeS26OVVIZenD8vznRFyBgvb0VtqqmEQSt51EpaNDM435Y5Y
	 O1XWjFbQEbkNZibo8CynbxASgSZiIt6iLPG/5Hcvf1HT57xvMjeyUh/u+pW9OnT+Uz
	 mUog/syz0v4dl41c5ILN8CnZUPAnkQMBTaCkkw5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC635F802E0;
	Fri, 17 Jul 2020 17:40:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61EA8F802DF; Fri, 17 Jul 2020 17:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE50F802DB
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 17:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE50F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wCWypbZZ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD3F3207DD;
 Fri, 17 Jul 2020 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595000406;
 bh=zZZXKkoo6jRo9cnEc915dxdlDYp+1O3LpZF62jp+s98=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=wCWypbZZF7PLbOUbetRlsgfqG3+u73IGwbKUGEPdUuXOLMwHzN+f+DZ+/7TKvV0JI
 osW7ch72As13d4Dc9d38g2D99ZnGpzLIsPL0QCWJMziadUCdX5I3S76a6fPKQjTSl/
 JB/IN903+jeKxLY/cxvXNV2tPW6jZ9+shlCQ+rTo=
Date: Fri, 17 Jul 2020 16:39:55 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 Jing Xiangfeng <jingxiangfeng@huawei.com>, perex@perex.cz,
 khilman@baylibre.com, jbrunet@baylibre.com
In-Reply-To: <20200717082242.130627-1-jingxiangfeng@huawei.com>
References: <20200717082242.130627-1-jingxiangfeng@huawei.com>
Subject: Re: [PATCH v2] ASoC: meson: fixes the missed kfree() for
 axg_card_add_tdm_loopback
Message-Id: <159500037996.27597.11571662104348843402.b4-ty@kernel.org>
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 17 Jul 2020 16:22:42 +0800, Jing Xiangfeng wrote:
> axg_card_add_tdm_loopback() misses to call kfree() in an error path. We
> can use devm_kasprintf() to fix the issue, also improve maintainability.
> So use it instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: fixes the missed kfree() for axg_card_add_tdm_loopback
      commit: bd054ece7d9cdd88e900df6625e951a01d9f655e

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
