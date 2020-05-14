Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A41D29BD
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 10:11:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DAB71661;
	Thu, 14 May 2020 10:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DAB71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589443882;
	bh=/duuv5ML1Vve1WSyYtwM7QMNV+1Rwn/7CujwCqJIkcs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3nVNNPhjGP/9SQRNAqQVz2Y3w9t/bPdRmdscAQwGHWE7GL3EQN6JtJWixwsH+FLy
	 OoJEoUZw4LxLtbvS5ygzy60wq1kHDc9P2cr9MZmppFvKOplMxcP9swkK65sDrHNXod
	 zsDqx7Vk7D6hpW/y+Tq0NbGYM0j8GMHwSmxdesIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C636F800BD;
	Thu, 14 May 2020 10:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75F30F80158; Thu, 14 May 2020 10:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5189DF800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 10:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5189DF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="Qvc1apOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1901; q=dns/txt; s=axis-central1;
 t=1589443773; x=1620979773;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-transfer-encoding;
 bh=lawWfUyOQrdLpw+zeoVZeDBdYrpx8vxSo3sYmVlA0eI=;
 b=Qvc1apOZbjN/kTLLzoosRfWlvtYTJglHMC4sFpmWnQTdFcSgVty3L5J8
 NA+6hXfX7RWp96camOH87OtVUED+dxsQozYxAXDnhwkNvUVW786VVPbYc
 VLtTEmvRkDrlvVziZ/kDM/0TZ11XarcA3b3hnzctu2ZQVxbrAIDwsUPf9
 PMYbR4AdhyO36jCL+zjL98zFM+Ku9oN3shsng+Jevepb5dk8b5hAcsysq
 FIasl/kz3CvJJmXPkiAmA0WMDgrtK2a8szbFiZhf/GHrS++uxA0kfpo/k
 zbXCehhuvVwxwLLrOvVPZElZjiC7tjdWX6d6WT11BNVW3XsUermhEs8Tn w==;
IronPort-SDR: 0Y3Pv7UCp3mAT5TEROn3U+48T2Mv/N55yt1fR9rJQRmJlK/PMkWzNEGKvJysBdH929zw56q+Jy
 N7QO8c+FdD2bF5b7dpsE62No91JOJpywRYEMMESqLi2y1RQ90MnAKtCckp4RBFCTA7ttAepP5/
 0bAwdvgvngpCTIr7RzS0YSFqJAVJ3M/VnXbs4vJW0yjhm2D7k24LETC3/qvfRVQ9MVTTl4Phfh
 SQcT8z4jiQSK6sfC+bQVbgvZhoNFCRFXCepH8H0QdPtKWRc2D2Xd3gJUEqERAsMM7B2xGFEzFz
 IRg=
X-IronPort-AV: E=Sophos;i="5.73,390,1583190000"; 
   d="scan'208";a="8713783"
Date: Thu, 14 May 2020 10:09:23 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/3] ASoC: tlv320adcx140: Add device tree property
 for PDM edges
In-Reply-To: <20200513200549.12213-2-dmurphy@ti.com>
Message-ID: <alpine.DEB.2.20.2005141006450.30387@lnxricardw1.se.axis.com>
References: <20200513200549.12213-1-dmurphy@ti.com>
 <20200513200549.12213-2-dmurphy@ti.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Cc: Rob Herring <robh@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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


On Wed, 13 May 2020, Dan Murphy wrote:

> Add a device tree property to configure the PDM sampling edge for each
> digital microphone.
> 
> CC: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/sound/tlv320adcx140.yaml   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> index ab2268c0ee67..55668c7d261d 100644
> --- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> +++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> @@ -63,6 +63,19 @@ properties:
>        - $ref: /schemas/types.yaml#/definitions/uint32
>        - enum: [0, 1, 2]
>  
> +  ti,pdm-edge-select:
> +    description: |
> +       Defines the sampling edge configuration for the PDM inputs.  This is
> an
> +       array defined as <PDMIN1 PDMIN2 PDMIN3 PDMIN4>. 0 (default) is
> negative
> +       sampling edge and 1 is positive sampling edge.

A bit of a nitpick, but I would think of the edges as 
negative-going/positive-going, or rising/falling. Not sure if anyone would 
misunderstand 'negative edge' in practice though.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - minItems: 1
> +        maxItems: 4
> +        items:
> +          maximum: 1
> +        default: [0, 0, 0, 0]
> +
>  required:
>    - compatible
>    - reg
> @@ -77,6 +90,7 @@ examples:
>          compatible = "ti,tlv320adc5140";
>          reg = <0x4c>;
>          ti,mic-bias-source = <6>;
> +        ti,pdm-edge-select = < 0 1 0 1>;

Should there really be a space between < and 0 ?

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
