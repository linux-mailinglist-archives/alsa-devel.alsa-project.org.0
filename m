Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDB280E69
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 10:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331DB1EF8;
	Fri,  2 Oct 2020 10:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331DB1EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601625698;
	bh=oE1D1DWpe5HU4iEtvRbwIgr+VSMUy2mKeWooGk0Z0IE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D3YM+UIgbDqFdkLEVCrrRZXmm6pL/9xk0mWnEoiLx/pXiiyASwxo/iKODaUBvAREL
	 hlUsOEUOV7eZlcKxt39z07/cHnNTlS7M/skI9Yw/TRhIpS7cA6ODpYPMj+gNjUm80v
	 hRsJiacHGD0h3XgA0jJxANi60ixyhHa1J8VNsssU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68854F800AB;
	Fri,  2 Oct 2020 09:59:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C4C0F801ED; Fri,  2 Oct 2020 09:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7D14F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 09:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7D14F800AB
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kOFyg-0006uu-9r; Fri, 02 Oct 2020 09:59:42 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kOFyX-0002aC-Sz; Fri, 02 Oct 2020 09:59:33 +0200
Message-ID: <3e6248770b881181353a00cf2a7087485d1ae0c1.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8192: add platform driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, tiwai@suse.com, 
 matthias.bgg@gmail.com, robh+dt@kernel.org, tzungbi@google.com, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Date: Fri, 02 Oct 2020 09:59:33 +0200
In-Reply-To: <1601624142-18991-3-git-send-email-jiaxin.yu@mediatek.com>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-3-git-send-email-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: shane.chien@mediatek.com, maowenan@huawei.com,
 kuninori.morimoto.gx@renesas.com
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

Hi Jiaxin,

On Fri, 2020-10-02 at 15:35 +0800, Jiaxin Yu wrote:
> +static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
[...]
> +       /* reset controller to reset audio regs before regmap cache */
> +       rstc =3D devm_reset_control_get(dev, "audiosys");

Please use devm_reset_control_get_exclusive() instead.

regards
Philipp
