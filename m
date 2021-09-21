Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0066413628
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 17:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74823847;
	Tue, 21 Sep 2021 17:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74823847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632238043;
	bh=MMbO/dp99d6AGhgnvypPqLozrpUzaCRHRwEsnb7xVcg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y01bHbZVhtnDrgHd4i6GsChKRmXPKDGj+cFx7vr24lHB8tBF8hks8Uk2SXXfMSw/B
	 8bgGqjv/s8wuVcfGhV/fImxyjXoAxkhagcje/ePdEJgHrOHsxPubmfHPtgXIqk9E6Z
	 Mg5nNYUKbL0b4wNnC37h1A8n6+AfUUBIOxr3AnCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C15E3F804A9;
	Tue, 21 Sep 2021 17:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA0C3F8026A; Tue, 21 Sep 2021 17:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F07F1F8011F
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F07F1F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zj/glYkL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4BC3611EF;
 Tue, 21 Sep 2021 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237959;
 bh=MMbO/dp99d6AGhgnvypPqLozrpUzaCRHRwEsnb7xVcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zj/glYkLeYHvNm4rJBXMrstUrYxzgtl5fQlmUpnsy/JVmXmyeYK/ARNQ9YmJBZ8wb
 vS5g+AFFbz75mhq4UwHC+/hwt0oiva/SEPuekzCsNIiEL+AL5nMzx25vuFjHTQFehC
 CmxwdOlXJSJTdqdq8LDAkvE6Ysa0DBqwjOgEhRjfWElrM00vdezmOre3oPCWrBV41C
 IYYduHHmDocdWnYUI7IsdsPDEj7bsbxoi2x9A5NJzcC+HWaPzJjhlHSqjlQ22yBwhc
 O7yKp+VN79dbtryyel+kEnR8p7S3qiSd+iy+r3EGXhI6/XwuSyW5hSa9xWV1rt90LF
 P0KGMrYaZhb8Q==
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl: Constify static snd_soc_ops
Date: Tue, 21 Sep 2021 16:25:08 +0100
Message-Id: <163223651320.32236.13916304424900961086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920193947.10237-1-rikard.falkeborn@gmail.com>
References: <20210920193947.10237-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Mon, 20 Sep 2021 21:39:47 +0200, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Constify static snd_soc_ops
      commit: 815b55e1101f074e737c084e996d086dcb454399

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
