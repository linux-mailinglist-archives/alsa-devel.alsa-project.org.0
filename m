Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C24411853
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC7316D4;
	Mon, 20 Sep 2021 17:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC7316D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632152072;
	bh=P+V/VfVqBTpDDzHM7WoqK4yIUKovVB6PEtgQJaHuhJU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h9nCOEPZRvwWtl3wKv4Y7xsMYilQYtPMxlhFb8NrZWBGCVh+fKWuYYK8U9TqpEMwv
	 SPpHW5p4jNJDp+QpZ1HysUJYB2MNsPZ/GCwKvQKCfdyU/T2duhi4liTMLuiUVbqJzK
	 d8VSfwyV1zVLDDo9fIpBDQagw5pTFLqS/oeziq64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E214CF804FA;
	Mon, 20 Sep 2021 17:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 316F6F804E6; Mon, 20 Sep 2021 17:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F3D2F80246
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F3D2F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DA+Ew7Oa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B33C6109E;
 Mon, 20 Sep 2021 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151904;
 bh=P+V/VfVqBTpDDzHM7WoqK4yIUKovVB6PEtgQJaHuhJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DA+Ew7OaGkr+DlanrbPvue3O4HNEyWwkwH0By5QK58ZyVx4ZeDBvJWfStS9jDKWyr
 PMLAw/A27UENFvglxrM1nwmUbALbmlSi0wJwDoiQyABodeXC8ixPGMQCHU2C4bFvIw
 wBpGk+RNykDjYRhGIV0UFY5ykZKKKXtM8tEGZ1hv/36LeuHT5wRjwQR14xotrRf0ve
 WioF/4IoygiwK9GjoRY1Zq873p09g0jDdcAe5ot4x4E8a6BdBjvoRL9J9D6bxjHf3k
 jxEgAtc0MANj5Xw99Kr1kH7+FIFNAQqFaiqQlYeuoFrsl0gURn8BDZFgpB7GHlcTjP
 2i4mxX/Frxpdg==
From: Mark Brown <broonie@kernel.org>
To: yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, cezary.rojewski@intel.com
Subject: Re: [PATCH] ASoC: Intel: boards: Update to modern clocking terminology
Date: Mon, 20 Sep 2021 16:30:46 +0100
Message-Id: <163215150720.38322.5289613756835517197.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920065508.7854-1-peter.ujfalusi@linux.intel.com>
References: <20210920065508.7854-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 Mark Brown <broonie@kernel.org>
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

On Mon, 20 Sep 2021 09:55:08 +0300, Peter Ujfalusi wrote:
> As part of the effort to remove our old APIs based on outdated terminology
> update the Intel board drivers to use modern terminology.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: boards: Update to modern clocking terminology
      commit: 5374b9215dbe93e22a0f51b111ca3e83f9b58e1a

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
