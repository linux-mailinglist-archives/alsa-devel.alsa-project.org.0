Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D358D571
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 10:34:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8ADD10E;
	Tue,  9 Aug 2022 10:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8ADD10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660034047;
	bh=XJB9RCVL4C+VGKYbDKfGa332IsSZTZpU3mURjk60nmM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=paHrDX2BYlt6uSY4owQ4EeXU+vwlFvnP33uh3S2ABhv5xftSKdi53gs8vh8/IJWGF
	 NlOqlsSe6wduYbfHaB7Pe0WDLu2aiwDPdnHE1k51ua1Rs7uj9mJcZTstYMiykaw0IC
	 R7vJ17xPRo4tzb42aKnMYacbPLhzpSW0JktE3sGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A301F800E8;
	Tue,  9 Aug 2022 10:33:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78ED3F8016C; Tue,  9 Aug 2022 10:33:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CEEAF8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 10:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CEEAF8012A
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oLKfR-0006K1-7S; Tue, 09 Aug 2022 10:32:49 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oLKfM-002fas-63; Tue, 09 Aug 2022 10:32:46 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oLKfN-0001Qi-La; Tue, 09 Aug 2022 10:32:45 +0200
Message-ID: <b18ef07670c09d4a58b70dc3671549a9b7d5b4e2.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] ASoC: apple: mca: Start new platform driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Martin =?UTF-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Date: Tue, 09 Aug 2022 10:32:45 +0200
In-Reply-To: <20220808224153.3634-3-povik+lin@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-3-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
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

Hi Martin,

On Di, 2022-08-09 at 00:41 +0200, Martin Povi=C5=A1er wrote:
> +	mca->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(mca->rstc)) {
> +		dev_dbg(&pdev->dev, "couldn't obtain reset control: %pe\n", mca->rstc)=
;
> +		mca->rstc =3D NULL;
> +	}

Please don't ignore errors, this could be -ENOMEM.

For optional resets, use devm_reset_control_get_optional_shared(),
which returns NULL if there is no resets property in the device tree.

regards
Philipp
