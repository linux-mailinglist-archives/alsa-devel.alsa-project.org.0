Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0A59F874
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 13:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D092D1679;
	Wed, 24 Aug 2022 13:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D092D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661339645;
	bh=OGlg8pv6kHT4dTZmIiN7JaN/Td1DIt3ykmROSVhjXKk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CAYVQKAZKhhCOk9u61IbyTQuhqtFR4Ktmo/GGpVQLboGi57c8G6duIukBurQda6Mg
	 mcZY8yAinh6nOCxCkdU2cbZCSZkRAAeoEklEVf9hEgyZp4Zr+9wuoI5rylqP/UobzU
	 02O8RqEF4n9W3JconYTe8eYua6t38lukTns6ZN1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4788EF8052D;
	Wed, 24 Aug 2022 13:12:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C7D5F80529; Wed, 24 Aug 2022 13:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E88DFF80526
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 13:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E88DFF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R89AQjm5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5403B8238B;
 Wed, 24 Aug 2022 11:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6E5C433D6;
 Wed, 24 Aug 2022 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661339548;
 bh=OGlg8pv6kHT4dTZmIiN7JaN/Td1DIt3ykmROSVhjXKk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R89AQjm5QIFEy1m4KLw/y3y2fnUtsahYYAiDRrKZ7ZVutepzYsjI3j649BIhmpVt6
 BIWFJ24zWf8uKJTwO1LANI064i3Q62jQ+yYvw/u/dnBJKdhi5e9QydoifyCwe/MjHM
 0ZVAG30iOKEHOZovM7etDo7b/5+D6FUkhYJ6YFS+7ltBW9GEgC7dxVTEOxHr6NBk5l
 EVmUTe5SOqjkkKpguYiDGPkIu3jt7uEhMNl09oAVmExm700bo6jZGgahl7SyVHDnNW
 +J3qiIHFrMv7UBLBAOjdyFF6h+h2kufzi4Qm5U2kc1FrbqERx9edy/uS/1BORps4Ju
 WAy5d2T1nRQfw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, perex@perex.cz, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 festevam@gmail.com, tiwai@suse.com
In-Reply-To: <1659681926-13493-1-git-send-email-shengjiu.wang@nxp.com>
References: <1659681926-13493-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Update slots number according to bclk_ratio
Message-Id: <166133954610.17904.8655688757494279362.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
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

On Fri, 5 Aug 2022 14:45:26 +0800, Shengjiu Wang wrote:
> The bclk_ratio is set by .set_bclk_ratio API.
> bclk_ratio = slots * slot_width
> So if slots is not set by .set_tdm_slot, then it can be calculated
> by bclk_ratio.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Update slots number according to bclk_ratio
      commit: 837b40293de66a5b96f883f540512ec5c3867610

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
