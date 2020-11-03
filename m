Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B742A4E35
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3893216A9;
	Tue,  3 Nov 2020 19:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3893216A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604427485;
	bh=wk0S0vO2fliEpNp+FjpvKllKARFXc9z7ErvvdfCd7TI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btuBHlSI3i1RyaTQ07b+q99cs5T1dACwXkZrEKUHjSV8nzYy9+8tGn4BnsuHAA+Tv
	 7AbfgKrW7D1eRajYjRwtQdL/R6VE+3zLuNBl58h/uIgzrQHR/zRVd3BYghuk1YuI+Z
	 AyYwraUs5iWXj0S9xgeE3dWn1tPHBLod1PJ7GgM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 668A0F804DF;
	Tue,  3 Nov 2020 19:15:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67018F804D8; Tue,  3 Nov 2020 19:15:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03C77F804D2
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C77F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dUaVPFrZ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5388E22226;
 Tue,  3 Nov 2020 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604427305;
 bh=wk0S0vO2fliEpNp+FjpvKllKARFXc9z7ErvvdfCd7TI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dUaVPFrZEWfY/hHzJ5/WpF6l8PtpxFjF2LONyCrOEPohZuJL152nivlmKsG0uD2ZL
 vQ0hJYJLlp3wdA1V/pun4BNYg2ROne23s6ch3cqigogDxCzfTVZSXDBDjj593kMt4V
 0NPvWMwx6EJhgOi+EXLGiYGwqVaxZyMJ3dlv9Udk=
Date: Tue, 03 Nov 2020 18:14:56 +0000
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@ti.com, perex@perex.cz,
 Zhang Qilong <zhangqilong3@huawei.com>, tiwai@suse.com
In-Reply-To: <20201102103428.32678-1-zhangqilong3@huawei.com>
References: <20201102103428.32678-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: remove always zero of
 davinci_mcasp_get_dt_params
Message-Id: <160442726962.14840.8783808850524637186.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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

On Mon, 2 Nov 2020 18:34:28 +0800, Zhang Qilong wrote:
> davinci_mcasp_get_dt_params alway return zero, and its return value
> could be ignored by the caller. So make it 'void' type to avoid the
> check its return value.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-mcasp: remove always zero of davinci_mcasp_get_dt_params
      commit: 19f6e424d6150b5eede2277dbc6dfd3bf42e994f

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
