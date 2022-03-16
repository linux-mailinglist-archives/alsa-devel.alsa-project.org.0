Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A54DA879
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 03:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04EAD170C;
	Wed, 16 Mar 2022 03:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04EAD170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647398018;
	bh=JlWuwsVAf8tixVVfAj7k3At1hsOc2H52eSxmDWkWpNE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4LzGNI/msP5RdA9C4OQOBkrMUN2YCEkh52LkC4JB7HY44zCRforTlGvjC+o45MUW
	 M/8MJ3GESggMUdvhHQA37tp1Vspzg3XUbOxZjEgzWcjacuyw9T/3nhsruHD8rRe13q
	 QjnvdTLBlB0u9CiLwOO+n/nifPUgMDtubgEAB+1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C8FF801F7;
	Wed, 16 Mar 2022 03:32:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6D8F80162; Wed, 16 Mar 2022 03:32:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8059F800FF
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 03:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8059F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qi4zpYKr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E98B1B819DE;
 Wed, 16 Mar 2022 02:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3CBC340E8;
 Wed, 16 Mar 2022 02:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647397940;
 bh=JlWuwsVAf8tixVVfAj7k3At1hsOc2H52eSxmDWkWpNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qi4zpYKrUUrbZLKM+Xl0nS5aG1eZ4vTX/qCHb5xZQd4h2K4CZaJPT1O3J8f4cuQmO
 ikj643PaI0do9JOx4U2u20nixZmCCxYuFzyRXN69OlhnqPurTuTfA9dQQW1ARw+Aol
 KrNmCKUUJhcFAdjc+xxLaBYPXIsPsze9agB9ApcFHB3/35FGDi8F3WHpVM3l1sIbw5
 RijlwULauuXFxRWs85GucfaVVoAI8vfxYmrlpklI3lk3kptoCMXwPZhbtiBcFUrXB9
 ykvLNpzHC1kX8zWNLMV3btNhs/7fH8zY80RnvNRhH9j6CWIaJi55cHaRMGGDpeUXRU
 7BCfWIauqWRBg==
Date: Wed, 16 Mar 2022 10:32:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Message-ID: <YjFMMEniUVlb1QsX@google.com>
References: <Yia5XgkGyLbIRc1f@google.com>
 <20220316014059.19292-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316014059.19292-1-linmq006@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Shunli Wang <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

On Wed, Mar 16, 2022 at 01:40:57AM +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> Fixes: 5bdbe9771177 ("ASoC: mediatek: mt8183-da7219: use hdmi-codec")
> Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")

Again, I am not sure if the Fixes tag makes sense.  Although the issue was
there when the driver birth, there are some more commits after then.

Given that:
- The patch is a minor fix (see [1][2]).
- There is no specific commit the patch aims to fix.
I prefer to drop the Fixes tags.  In any case, I don't think the tags would be
helpful.

I would defer to Mark.

[1]: https://elixir.bootlin.com/linux/v5.17-rc8/source/include/linux/of.h#L129
[2]: https://elixir.bootlin.com/linux/v5.17-rc8/source/drivers/of/Kconfig#L55

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
