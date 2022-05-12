Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AE524FB1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C1A1AE6;
	Thu, 12 May 2022 16:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C1A1AE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364955;
	bh=fS5LIWilDa+hz2Ola1gsUeyqJCEe4vAjSZHbZ6Wyv2I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JzQEuA/cAmJe0fBCzbmhs07kPHZz9wOPTiHCIC9BHouYCZYeqcwBDorgHN3JIdcC1
	 0KFz1xSgdhYm08OMSSUB2/6wycob+OR1/T0+EgB/CnTJ6TKx4Yqx1cUJoFePTWnOMm
	 cHBXfFCCMa4isanZJ3a4OgaOl2mD7RJ4JOhdvdKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97894F8053E;
	Thu, 12 May 2022 16:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B12BF80539; Thu, 12 May 2022 16:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51F35F80529
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51F35F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jnJCUtKP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70BB2B82832;
 Thu, 12 May 2022 14:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE53CC385B8;
 Thu, 12 May 2022 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364778;
 bh=fS5LIWilDa+hz2Ola1gsUeyqJCEe4vAjSZHbZ6Wyv2I=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=jnJCUtKPLyvpYm1omocXcq4bY8fiwWPyNoHSOf2muv4nzjc4/pCzJXco+WbVrys2B
 nVU67xTgNAzmd+KG0jtvtElGYqRyg4AFF0nh7MbnT8oPfogz3e4wGg2D94E5fDhhHb
 AnwD31Bt8FKC8TtmDIYg1SikcscL4PtqVPqSOzy5PKSWj/T5w/Rxx4Ei3WkJlrgVEq
 hS5foECa1v5ajLahqJFojqngPid8DGO+Dc/9zdpYOEWo/7eQbOMe9RZlrPR43A1WLi
 Ii0tbKzsw8OnyryC5YIB6Qi4o5SEMUVQ2JmMHo4cJz0/uYbJXoT5peO0DKv/vb5Ook
 SznOxKhgvpj5w==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 shawnguo@kernel.org, ye.guojin@zte.com.cn, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-imx@nxp.com, linmq006@gmail.com, Xiubo Li <Xiubo.Lee@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220511052740.46903-1-linmq006@gmail.com>
References: <20220511052740.46903-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
Message-Id: <165236477462.1016627.3973321279072799571.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:54 +0100
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

On Wed, 11 May 2022 09:27:40 +0400, Miaoqian Lin wrote:
> of_find_device_by_node() takes reference, we should use put_device()
> to release it. when devm_kzalloc() fails, it doesn't have a
> put_device(), it will cause refcount leak.
> Add missing put_device() to fix this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
      commit: ed46731d8e86c8d65f5fc717671e1f1f6c3146d2

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
