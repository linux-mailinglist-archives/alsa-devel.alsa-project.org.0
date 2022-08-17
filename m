Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A4596F40
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F259829;
	Wed, 17 Aug 2022 15:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F259829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741814;
	bh=1kDRuQaxZT7BKS6Qe8EMQuwWIj3108NrId+NWFrzBUA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j3MnmjBb1tRPAjFzjD1mMSuJN+HfEqwrl9jGESiywNWCvxd58iqGFlVB1MewtEmWZ
	 UlDccLkrC/9R7gDT5v+pTtCOnwil70LXsqoJMVU6HJrpUcwhp531P1yMJTJdQFZoTp
	 Xddx8UPFBAVyPTQXs7TcgdR3ykySizVd4OCAVOPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDEFF802D2;
	Wed, 17 Aug 2022 15:09:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC77F80082; Wed, 17 Aug 2022 15:09:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3D92F80082
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D92F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uRD3ocUH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AEFCB81D90;
 Wed, 17 Aug 2022 13:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4658C433C1;
 Wed, 17 Aug 2022 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660741747;
 bh=1kDRuQaxZT7BKS6Qe8EMQuwWIj3108NrId+NWFrzBUA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uRD3ocUHnu4NrnoDsgslKAosvNWNfT8/Xuik1yfbOvBe1Irrkk3VYUB+xta2lc0dj
 OWVHywVvd9R19kzH/xsmb7H5yVr82PSPHI/x12q5ydDQA1OQd88sdHrKawMRWEEJzz
 jyJAWBc5C4CjNwNs7sVHd2pG2MPNxtCUA29Q8Epje1NNC4f4sqHt267ycOD2UcTRtJ
 UGL6+9XAunJna0E2KqzTmtBAyKDggnFDtWwylTDzKmvFEZn7pMBUMUE3CnWevKJf47
 nxYxDL1ICbI3sdcX4kx8OmL/R/v2x6PaAWZiXVMbybu/kEdFL3d/WO5bNNN7SgTiKc
 ppdvHYx1TIb1g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220816165229.7971-1-srinivas.kandagatla@linaro.org>
References: <20220816165229.7971-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sm8250: add missing module owner
Message-Id: <166074174646.88107.2289850693615815412.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 14:09:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com
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

On Tue, 16 Aug 2022 17:52:29 +0100, Srinivas Kandagatla wrote:
> Add missing module owner to able to build and load this driver as module.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: add missing module owner
      commit: c6e14bb9f50df7126ca64405ae807d8bc7b39f9a

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
