Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D518637CCFC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 19:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57106186C;
	Wed, 12 May 2021 19:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57106186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620839252;
	bh=8N5j+xcwpdd1FAn4F9NFsokj6l+Jn2U46GKPUTsKebI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ukejdaPDbAS0AL61JkVYmQUc7rmmG7ECLLrERE4tWIebCh5vm1pqjNjPkS0H/gStB
	 GVa6dIfGcuclqH3OuFqOuc0EvyEAQWn/Xpu0rRRxO4h6pT5675Vo5DaG7pRgMaMOJ4
	 +EdVMHLKX1IbOzPOE9UuRwaTxVJA0gVpc1NNmQSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 818CCF80272;
	Wed, 12 May 2021 19:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B92CBF8012E; Wed, 12 May 2021 19:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31EB1F8012E
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 19:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31EB1F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NDNFB3Mw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C77D661363;
 Wed, 12 May 2021 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620839144;
 bh=8N5j+xcwpdd1FAn4F9NFsokj6l+Jn2U46GKPUTsKebI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NDNFB3MwyJPiKxBsJ1tj6cyqc7tgARFhxf6nrJlRJirx7Syo/NsZ5G5nRKJyeqVQf
 LP25w3m3auluVPTvgTmij4yWKZq8H5NdNeSYxEK/UQa0gYY1WQSe2wyGjqQ5UYVBjY
 3b9CBXAVojADLj77sCv0gGS3RcsP6PpBSV64uZ6K/jkGmECxih81LFETgr6AefjZ8n
 ArW382aoDInDig0mJff8nNPZFIkJf5k7kqXCydadcm1nzI5qypXSi40HvpDFOZIus7
 TjaRMxkmoBOPKJV1knnJ/Yf2O8NPBrAl0s0FYZqnQcfFB2fyUyllJE2WWdVosRttG3
 5qX3W6uIIFQkw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-dai.h: Align the word of comment for
 SND_SOC_DAIFMT_CBC_CFC
Date: Wed, 12 May 2021 18:04:43 +0100
Message-Id: <162083892846.44734.2101445931216615242.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <8735usc1gr.wl-kuninori.morimoto.gx@renesas.com>
References: <8735usc1gr.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 12 May 2021 08:09:08 +0900, Kuninori Morimoto wrote:
> Let's use "consumer" instead of "follower".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dai.h: Align the word of comment for SND_SOC_DAIFMT_CBC_CFC
      commit: 47c1131633ef6210add63b8b5704497023a3462a

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
