Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B840B20812
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 15:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 239D916ED;
	Thu, 16 May 2019 15:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 239D916ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558013163;
	bh=tDia+7ePrW5nuCIakE7CGcWyE+xFAOgaB4Vwy/aROvw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M7Ki5wboXDQJzEtwCIyt4DHejGBoGYTG0MQhSOyTGmkY+STFbwImsKLHuG40jyCxb
	 5Kh1C96vBMpz8MzreUvhOE6c2e6mh/S3/cvVk9PJgByviPdgcB35p7eF2MeaSWeDr2
	 2muTh5bEZ59uN++ISbdoX3C3UBGAXDimP5H07cIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 933A8F89693;
	Thu, 16 May 2019 15:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DAEF896B6; Thu, 16 May 2019 15:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_26,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9159F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 15:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9159F80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mMP7Wzmt"
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C35F92087E
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558013050;
 bh=WC/f5/dSz84BLEkLCwH5U1Ll+l1qX8eGJWnolT70naA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mMP7Wzmthjy6/0ck2UaNN4pJP5P8nV7mxvFMGXF/TXYcTLRh/uSIQe7sLPkomaF5P
 UuK4HcS5R0vgmx2B3+OJsYBGXM4bD2J4a6cEsFeaAZLmsQLxmZcHEIU/Ni+Dbe+Crd
 OOycWYTzu9X1HBX4OX90uNcziIg7l7XeU9A1xw2M=
Received: by mail-qt1-f170.google.com with SMTP id d13so3822354qth.5
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 06:24:10 -0700 (PDT)
X-Gm-Message-State: APjAAAWs2N/JcBzffECMBEiStbls6+wwfBTEtOtofYnT3ltOT2qTxYrO
 aQ8jpJcH70Twb+EfmAKHwSTG2d6Dv31KhvHPyw==
X-Google-Smtp-Source: APXvYqwyjeW+HDz4tETM+qCkBYtyxCUgfVIbX6tfJRijPiTqWWE5F/OFxbxutdZT+809kJ9yZ7QBXnSwzANIq6CG5w4=
X-Received: by 2002:aed:2471:: with SMTP id s46mr42283987qtc.144.1558013050035; 
 Thu, 16 May 2019 06:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <706cb97ae45cc9edc49c8709b2189ed786d2c7db.1557993523.git-series.maxime.ripard@bootlin.com>
 <a0558cf83011d21c4f44fecc078dff1e67cdbe9d.1557993523.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <a0558cf83011d21c4f44fecc078dff1e67cdbe9d.1557993523.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 May 2019 08:23:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKKE1XT12SdqG=nUnW0-F9Nb8VNxHq0jwm_AYowRKjJOA@mail.gmail.com>
Message-ID: <CAL_JsqKKE1XT12SdqG=nUnW0-F9Nb8VNxHq0jwm_AYowRKjJOA@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3 2/2] dt-bindings: sound: sun4i-spdif:
 Document that the RX channel can be missing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 16, 2019 at 2:59 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The H3 and compatibles controllers don't have any reception capabilities,
> even though it was never documented as such in the binding before.
>
> Therefore, on those controllers, we don't have the option to set an RX DMA
> channel.
>
> This was already done in the DTSI, but the binding itself was never
> updated. Let's add a special case in the schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Removed the expanded items description and rely on yaml-bindings tools
>     to fill them
>   - Fix typo in dmas property description
>
> Changes from v1:
>   - switch to a draft7 conditional
> ---
>  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
