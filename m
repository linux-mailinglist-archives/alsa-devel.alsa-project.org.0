Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B015AB16D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 15:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A5D1634;
	Fri,  2 Sep 2022 15:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A5D1634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662125501;
	bh=EhfAqx7+9bqHRSvR8s0IzuAeBJ94yTCCtgQttzyRyrM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X5EwMLwTQGCxxxTCwzejujQhGXUPrWvFL4EyZYqAO+o4lB+Z1T6eAWVpNmFZSfRJF
	 ObZerkLpILR7Li1YdmuS7HRdbsv426NC6Gkfd7L8TlbpHzuNynJfrRuDxenqYvIQA2
	 9/UO32R+pURb3IkOVDIwwo89d4L2ALP2+q/ymtSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C00F8030F;
	Fri,  2 Sep 2022 15:30:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53AD5F8027B; Fri,  2 Sep 2022 15:30:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7185FF80154
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 15:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7185FF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T8egBlM4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E74CCB82B6C;
 Fri,  2 Sep 2022 13:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C8DC433D6;
 Fri,  2 Sep 2022 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662125433;
 bh=EhfAqx7+9bqHRSvR8s0IzuAeBJ94yTCCtgQttzyRyrM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=T8egBlM44VGvdGuf/AABYh9pMmfSkUlbBA6v8xFzS4UMIm9lwLlsnqdYsKnkar+P8
 u4xqYuAy76I4ZfYqoUyjPDSS86C8eDGGvxGkl2u03chFR5kcgxxKDxDJPYqVxHmSDY
 4xAEWIUqShXzMtnOirb7oAdiZbcFuKOG/iJjsgdCXYizHIQ+wQDCuOg2u5j/sJRbC3
 G5JXnSbKNgh8p6EAzeuZHeAuCd/Gt8WAVqXIq4cSDDRCJinJlJvTdvsAAx24mJqgtY
 1LojI21lxF/gG/a+hf0DfcylydAiR1Q2pgZdAN75WRl5nk/XB+Y5j3E9xwZVMb+VPT
 6frM37yANPD5A==
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, kuninori.morimoto.gx@renesas.com
In-Reply-To: <20220902013030.3691266-1-jiasheng@iscas.ac.cn>
References: <20220902013030.3691266-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: rsnd: Add check for rsnd_mod_power_on
Message-Id: <166212543201.44289.12872080973862311815.b4-ty@kernel.org>
Date: Fri, 02 Sep 2022 14:30:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7d1a0
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
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

On Fri, 2 Sep 2022 09:30:30 +0800, Jiasheng Jiang wrote:
> As rsnd_mod_power_on() can return negative numbers,
> it should be better to check the return value and
> deal with the exception.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: Add check for rsnd_mod_power_on
      commit: 376be51caf8871419bbcbb755e1e615d30dc3153

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
