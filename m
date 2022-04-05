Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715A4F2982
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A04176C;
	Tue,  5 Apr 2022 11:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A04176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151334;
	bh=uenQ5PTJTk45mI+LcbrDbJhSKL0UrjCnt82W9zY+s0I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IkJmv+aZl+IHqXd+jEWEIV3HAJH2zxulNp7htQc8C3uc0vRrlmu0HB75qHd+5EQoj
	 5ZAL7lhVfrt7N8KEtI+x5FJWXb6O/bVd1CEvztO75mg8fsRV6uhmswWff52YjKhQ57
	 jiiw0OBn2FZBgy7shaj/KBgH7rXlEBR5Mb30QDhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 826A3F80559;
	Tue,  5 Apr 2022 11:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 962C8F80564; Tue,  5 Apr 2022 11:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2032CF8055C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2032CF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CF7a3xLA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA053616D2;
 Tue,  5 Apr 2022 09:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C060FC385A0;
 Tue,  5 Apr 2022 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151094;
 bh=uenQ5PTJTk45mI+LcbrDbJhSKL0UrjCnt82W9zY+s0I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CF7a3xLAF/P87ypUF0Qng9SPB+YI0nG0+F1zbYVUhGjH9ey+WsqUhUCZYp4M2/Seh
 v0HRD4ZUjlDgqGbSJK1lZcCkfqLFX0xyQQuFfNNnRtHO1EsNvLhLoif/j5B+0qXZkn
 nsAggl7EESWkqAmr0h1B54qZeBYXTVCxdrfyCgCmv+QsOboWkRiuuC6INLeHES710C
 zc+Qms5U2WuykD2XD5M1m6FgthS8uIeAWSqme3JJS5w6jkuCwmTwhi+jmVmF1AT/8c
 9LX6dRtB3BVD3Ds/Y7ArU5PMZRaX6kMvb2xxBMYtFh1eCbuwiCTUKpFP66Ha91o472
 nKLHvWPYzlRNQ==
From: Mark Brown <broonie@kernel.org>
To: krzk@kernel.org, rikard.falkeborn@gmail.com,
 Liam Girdwood <lgirdwood@gmail.com>, s.nawrocki@samsung.com
In-Reply-To: <20220330204227.25081-1-rikard.falkeborn@gmail.com>
References: <20220330204227.25081-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: samsung: Constify snd_soc_dapm_{route,
 widget} structs
Message-Id: <164915109148.276574.7227991139286446163.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, mani@kernel.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, afaerber@suse.de,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 30 Mar 2022 22:42:27 +0200, Rikard Falkeborn wrote:
> These structs only have their address assigned to the
> dapm_{routes,widget} fields in the snd_soc_card struct,
> both which are pointers to const data. Make them const to
> allow the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Constify snd_soc_dapm_{route,widget} structs
      commit: 5449fd7bd01fc13266979a6ab48493d4d2e43725

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
