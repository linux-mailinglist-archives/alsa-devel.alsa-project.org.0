Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AB34F7BD8
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 11:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 347E417A8;
	Thu,  7 Apr 2022 11:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 347E417A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649324351;
	bh=YcV0evLf+R2U300KOktMd4Hf1IaExnGql5B24JONj8c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8y04pcSZnRxO/WKbbcEzkaHkbLkwTYj86Za1PCpYtNsX/WU2D/Cq3cU4sTX+e2Dq
	 ywAJl86kH9zY0KWvQxRQRdfwLvRtnvR/GJ6EP4VcwIUeMJl22qqxbsbGNZwuNQwz+i
	 Eh9Vsuq0cwy0Fg9pNAZ1e0duRQYsB95Wivm0OJKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C3BF80085;
	Thu,  7 Apr 2022 11:38:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB1BF8024C; Thu,  7 Apr 2022 11:38:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA678F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 11:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA678F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dmVt+wmB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 060F0B826E7;
 Thu,  7 Apr 2022 09:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EA1C385A0;
 Thu,  7 Apr 2022 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649324283;
 bh=YcV0evLf+R2U300KOktMd4Hf1IaExnGql5B24JONj8c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dmVt+wmB5GFyh77APZAqJOfAJ6ZzPTtEdXt8zZTVefYGipNY3fWLpxmdKf/0u28wl
 w1YBGnyMrCMjPG0Ox1DdIjzI+RXTsN3FmxdNW0MzfDFp+UOEH2URcerY0ovnAAgbLK
 FArBG1ajD+mk2LNzAcQmKFxtrTOajj1k9EjB+RWDwTpJr74liiuhn3JvOjiD7I8ihn
 sfBbh7vvRGGXAIWtNxSA2jBMBrxj/C6kbSo77v06wWo4/0OAAOR6d33NcVvnPL6BSG
 lURiY4eTMWNrfeutrB9e2OvHJZpj/KDYupQ9fmUtvTptkUACvg4CQbB8d7V2Ichb9Q
 8g7Pc2U6wZ5Sw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, nizhen@uniontech.com
In-Reply-To: <20220310065354.14493-1-nizhen@uniontech.com>
References: <20220310065354.14493-1-nizhen@uniontech.com>
Subject: Re: [PATCH] ASoC: Intel: boards: Use temporary variable for struct
 device
Message-Id: <164932428242.3844153.12708508204017781920.b4-ty@kernel.org>
Date: Thu, 07 Apr 2022 10:38:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 10 Mar 2022 14:53:54 +0800, Zhen Ni wrote:
> Use temporary variable for struct device to make code neater.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: boards: Use temporary variable for struct device
      commit: 8b3520f7f6f6b54bb6b6e50b88f707a6b8113887

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
