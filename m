Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88C358A62
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 507111675;
	Thu,  8 Apr 2021 18:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 507111675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901125;
	bh=I1Rg2nveovVTb3EpMQgIGYLULEwlNQWKYxhFMmedRtM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vqwFFNKPH2zIKbpSA42DsNvOZVTBO3QJYbYrrwqoYur6ExHM6ru1wj9o7IPT8+Ofb
	 ViWPrtVaSD48DYF+jcwtn81oFnbDVaFzBe6MHJR6KyIMJbLvwW8CkFUx3paINv5cLh
	 wQtaN37Uj2s9ruo4tE92C7EzMALX2bsQR/O1lBa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0165DF804B1;
	Thu,  8 Apr 2021 18:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F64F804A9; Thu,  8 Apr 2021 18:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE460F8032D
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE460F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q5r0xaTF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B840A61158;
 Thu,  8 Apr 2021 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900942;
 bh=I1Rg2nveovVTb3EpMQgIGYLULEwlNQWKYxhFMmedRtM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q5r0xaTF+ERvgelyEYxIg7OzPZRFkbgewP8I0Qrp58CHKwvJ56tqWn6QeqKIuKlun
 ZErLhPkzpBRZl3bssOO11Jq+vEubqeUWxQnE9zdkLma9H0GLJRoc0ue3/HOkBNcj9D
 JklwhmGphaYpfqdK41KQKVtClMXQlsAHFbG4vGhhRcQZMKiJaRZlgh0b2xidDZyRsV
 JBNQb3WCWi53+2oJN6m6M9WNRijmoQbXWEPc9Clv0EojhDO6IJnmzq/qyjWwF5bd9Y
 ftJtdzaA2ClO/6GZd3Vwt064wiT5hudntVi3gvkqKmPV7NbWvmEBC+A9zt8VQpSc02
 xIKTlQecaRAxA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ye Bin <yebin10@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: cx2072x: constify static struct
 snd_soc_dai_ops
Date: Thu,  8 Apr 2021 17:54:42 +0100
Message-Id: <161790012551.16915.11291748382496909531.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062656.803606-1-yebin10@huawei.com>
References: <20210408062656.803606-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, 8 Apr 2021 14:26:56 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cx2072x: constify static struct snd_soc_dai_ops
      commit: e9a216d8f14ac4d926078885e7e772db08e6aad9

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
