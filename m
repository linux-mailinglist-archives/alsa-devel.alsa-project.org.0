Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB62C5CD3
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:08:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 686B11804;
	Thu, 26 Nov 2020 21:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 686B11804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606421305;
	bh=7rQmTmv1ksW+ZfZDI/e0wJHZOLdUZO3zjTXU1u/XYRg=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=co3vF7EtHySFx0vt69eXfqDbaBXfkRPDppmF/EMPy0RDfDLlkL5olpAx0YdTYmqld
	 FqO+kYJaXbrvmtr9ylcOFtfKPgQcMKlFuwY4wnj+TWVVlXKqNyLG66wYWqPk4OkqfX
	 e4AqBmOE7Zd3F4tKAJYkFrsCEDLgjnr7cvXMyrFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 518AAF804CB;
	Thu, 26 Nov 2020 21:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 303FCF804C3; Thu, 26 Nov 2020 21:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E56AF800EA
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:06:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E56AF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SendZoJ+"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 451FB21D91;
 Thu, 26 Nov 2020 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606421160;
 bh=7rQmTmv1ksW+ZfZDI/e0wJHZOLdUZO3zjTXU1u/XYRg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=SendZoJ+GTnIUWwxUbppNh9LNNQhZqfDbd82QiKtYOcnEe/bVOcvt5L451L0lmF/x
 AucA5PdvTJHLoxu1C27BT2lv0wJqoNb2mYtdXEAN8L+ZthqUG68b7aC3Znj0/on1jL
 FW/aebBnRyRvXFRMWNsq2shqbDkyoF6zxgP/+6vI=
Date: Thu, 26 Nov 2020 20:05:35 +0000
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com, tiwai@suse.com, kuninori.morimoto.gx@renesas.com,
 cychiang@chromium.org, perex@perex.cz, tzungbi@google.com, lgirdwood@gmail.com,
 grandmaster@al2klimov.de, pankaj.laxminarayan.bharadiya@intel.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com>
References: <1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: Add RX support
Message-Id: <160642112480.9090.16664768187050244422.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 26 Nov 2020 14:36:48 +0800, Shengjiu Wang wrote:
> HDMI interface can also be used as receiver, this patch is to
> add such support. The most difference compare with TX is that RX
> don't need to get edid information.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Add RX support
      commit: 144f836646989783cb018d00fa69f3f8dab58349

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
