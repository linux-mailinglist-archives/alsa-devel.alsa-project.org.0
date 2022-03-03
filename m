Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 943014CB624
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 06:17:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B0D192F;
	Thu,  3 Mar 2022 06:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B0D192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646284650;
	bh=0bq/jJdABYiYg74A+Fe0/noQNqV2iAgsmxYRoawwrlo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U3R72HlO/sQMi00BTtIQzM2uG225akLTAS1f2Uo94eTu+j7VqJxaWAaXB7R8HWoxt
	 n+JfdUzoSKjAGmqTyZphtoYtAc91OLkmJWa7sBzNVDMb905LUiC74pErDvhQmktr/1
	 h8Ur5ZBO183kZY48tq7XiK4ive/LxDIr3ZJlyCC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96821F80166;
	Thu,  3 Mar 2022 06:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0132F80152; Thu,  3 Mar 2022 06:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EE25F80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 06:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EE25F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uZ5A5oQo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D5C861766;
 Thu,  3 Mar 2022 05:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91609C004E1;
 Thu,  3 Mar 2022 05:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646284567;
 bh=0bq/jJdABYiYg74A+Fe0/noQNqV2iAgsmxYRoawwrlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZ5A5oQoJlaOFyFdgdRfHHGQkn4BIGzNHMx23tTiXbv2PzRoXTrI3YduuTBp0Mm77
 sYpOvkvXxTGeq8Xoefo30WCa2/LtCfTmCyYCStH5idHLLDLzF65JuJtbOEfeZEHNBx
 jEvxXX0p65qRHDwTJMhskS5RzBe4xTGqUDrwnGYqkthjApxEajeKwPy7DKwlP1GKTz
 60UhG2uZkUnnr+fsd1LvZZLbkzvfyDzY40t85sEXZRUdLIDdfyiESu2lpIKBAwKLjb
 dcE3UcqlzLEdrtOM6IkYdAhPattuq7VKn19JFr4w0+KP5gRIcHF424ulBCBY1lE4Sd
 lAzWmgqDd0PVg==
Date: Thu, 3 Mar 2022 13:16:03 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <YiBPE9z+iHU7unn7@google.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
 <20220301072924.24814-3-jiaxin.yu@mediatek.com>
 <Yh3hcQpLngg8Pnd4@google.com>
 <0b8a5c22acb87b49de0380c7cb4e49030f93d715.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b8a5c22acb87b49de0380c7cb4e49030f93d715.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Wed, Mar 02, 2022 at 12:07:39PM +0800, Jiaxin Yu wrote:
> On Tue, 2022-03-01 at 17:03 +0800, Tzung-Bi Shih wrote:
> > After seeing the code, I am starting to wonder if the reuse is
> > overkill.  If
> > they (RT5682 vs. RT5682S) only have some minor differences, probably
> > it could
> > reuse more by:
> > 
> > SND_SOC_DAILINK_DEFS(i2s8, ...
> > SND_SOC_DAILINK_DEFS(i2s9, ...
> > 
> > ...
> > 
> > if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
> >         i2s8_codecs.name = RT5682S_DEV0_NAME;
> >         i2s8_codecs.dai_name = RT5682S_CODEC_DAI;
> >         ...
> > }
> > 
> > Or even uses of_device_is_compatible() if it would like to reuse the
> > struct
> > snd_soc_card.
> If we reuse the struct snd_soc_card, the card .name will be same.
> Should I change the card .name through of_device_is_compatible()?

Exactly yes.
