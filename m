Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBB2638C2C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641AE1749;
	Fri, 25 Nov 2022 15:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641AE1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386592;
	bh=oz1foM0y1L0ZUHf+qrjUsaustfjOq1LYMGfAD1Ig4J4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ei+yCoPC4LtxDhOdfS+CIrs/66rTTWP8WeU/xSQUqPbd3T9wNAcPTEL4ocu6c5/ha
	 ElbR6xlzlX+EDeMZTUzbKIq5CiDiAwl/IQ09yx/lHaPtutTgF2pr/vfZsuIM7lcm+t
	 Fn28blwT18/MBSZ8h5evd4ZvFtRp1KnKTHZKc28E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B456F8057D;
	Fri, 25 Nov 2022 15:27:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D922FF80571; Fri, 25 Nov 2022 15:27:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD642F80557
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD642F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O7R0dPk7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 595A2B82B0E;
 Fri, 25 Nov 2022 14:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0B8C433D6;
 Fri, 25 Nov 2022 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386422;
 bh=oz1foM0y1L0ZUHf+qrjUsaustfjOq1LYMGfAD1Ig4J4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=O7R0dPk7CXKTEepJBgDH5H9+IJxYeHkBppT+gDzZX6dRvgBF3sgHAu+eRCDS0ZY1m
 t+mZYIAtZ9EPjts8FLdXp+khjElIbiPmaucWxGQsvKdHrsvXvybAwTQLl9CRWmyjz1
 XWXl9ydGuCrL/wYhf7mbIZdnDxl+i0dPq6eNLsErlJqu2TiSX7P+UJ5ChlHSi4t8qc
 BWR1Cr5NmflTT/EIqoOo45HJO1bZ+vyEasjT9YO7gH6qjOVOUZJDn/UX/oj549Tjyh
 P81LoE5NKq21UJjcqrPgjXq9heujUMupl5DKfoWSHOuYrlrlc9k632bifdJ9HXVZ9f
 n+nfEpeOjQESA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Yuan Can <yuancan@huawei.com>, perex@perex.cz, 
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
In-Reply-To: <20221124140510.63468-1-yuancan@huawei.com>
References: <20221124140510.63468-1-yuancan@huawei.com>
Subject: Re: [PATCH] ASoC: qcom: Add checks for devm_kcalloc
Message-Id: <166938642035.506633.4702879051499912669.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:27:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 24 Nov 2022 14:05:10 +0000, Yuan Can wrote:
> As the devm_kcalloc may return NULL, the return value needs to be checked
> to avoid NULL poineter dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Add checks for devm_kcalloc
      commit: 1bf5ee979076ceb121ee51c95197d890b1cee7f4

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
