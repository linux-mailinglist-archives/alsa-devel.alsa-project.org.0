Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6EE299AFE
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A860F16B4;
	Tue, 27 Oct 2020 00:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A860F16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756026;
	bh=W0GHurfLARJJgjJlVQfEHZ2+dhsR3twtgbYlogiwXaA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJeW4ysWkvq2iTuC+QUmz0WE9u5cLEoqlqRgQJPn3Cdud5rspymWkiVKUHTI1JoNl
	 KVqq43v9I6Nwrs792sEpJm/CkC0mBe8N0r0/JJJ8i+nrnujcEP+SPSgFa/hwn+v6MO
	 ZCopguLrpR5MED2ErFTHuUPfEfigd7tohCykguL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 017D8F80249;
	Tue, 27 Oct 2020 00:45:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F44EF80212; Tue, 27 Oct 2020 00:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6968DF80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6968DF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yz8lb+7H"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E9D220714;
 Mon, 26 Oct 2020 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755927;
 bh=W0GHurfLARJJgjJlVQfEHZ2+dhsR3twtgbYlogiwXaA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Yz8lb+7H9sq3ef9LwgvLJkqXJdBGord+M51p3ULMYoUFXPA5UZ0JECfvUu2GR56w5
 ifKXrxvwpf7S4k3iXGP7Ype3JA9Ie+K5C6/eCplWzMHZ38QP1N/3q5XqC/qsJXzjQl
 cWQoutw5FwocAGv9T24Hqhzl+c+9HmpElL+cSwPg=
Date: Mon, 26 Oct 2020 23:45:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, timur@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz, tiwai@suse.com,
 festevam@gmail.com, alsa-devel@alsa-project.org, nicoleotsuka@gmail.com
In-Reply-To: <1602557360-18795-1-git-send-email-shengjiu.wang@nxp.com>
References: <1602557360-18795-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_spdif: Add support for higher sample rates
Message-Id: <160375592346.31132.5202638686787064614.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 13 Oct 2020 10:49:20 +0800, Shengjiu Wang wrote:
> Add 88200Hz and 176400Hz sample rates support for TX.
> Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add support for higher sample rates
      commit: 1bfa3eaa4511256ab14555ab2573e6e75194b1fa

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
