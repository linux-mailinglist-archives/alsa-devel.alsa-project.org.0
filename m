Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651FA91AACE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F34210E;
	Thu, 27 Jun 2024 17:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F34210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501191;
	bh=AMWL6jWtVLIBtIv6eoQ8PZgGmdE3SlQmweWXtoF89k8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aYmSx/WrqNGJt1yq0ihCqm88KWLJOQ0VbHgfwf6tQg2kBVNNOwQJIuksAEK7HFxvJ
	 59mh5lVNwnBaRDBw+pe92Clk/Q08exE6SJo8sjG2ZLfDn9/djo34zuEHUG2M+cpcXW
	 Ilz4Fcd6p+TP6MftuK5PsaLuu4MiKG4yykJvRnm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E3F9F805B4; Thu, 27 Jun 2024 17:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AFC4F805AE;
	Thu, 27 Jun 2024 17:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F2D6F80423; Thu, 27 Jun 2024 17:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89279F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89279F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h0tvJCOT
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-64789495923so29411477b3.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501152; x=1720105952;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BU2vZmzqi+olvgZ5virQM/8AdFIn12e+5hjEcUIemP4=;
        b=h0tvJCOT5u6s8tkXuxtqKMr1P3/5MKlL9AJoNaWsqYI+/sPqp/1n0UStOIIHsSHaaJ
         s3wEmIZYXPNI1dl0rbEpxM0wFYbmzMt2AAJsk1dDJqLchN6uoNei2OjnMBNU2OGx1DJH
         31WzwnnfYbm/y/aUKGDtG1/RE/fvE89OXUW/93QnZXs/7z6m/pe8TyROYedbxOedG12S
         vGu0EHD09RRF7iDCERXG9+gjujCUSNkpk8MYUHwDKaZTZXh/FdLmEKwTOXGJaW+XSAyM
         9TsFOExMhoNZcAC1juAgnWdDnbF5ciHwag7kf9EBtUGtnNyRHSxoYRjQMjgfCrT90y90
         wpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501152; x=1720105952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BU2vZmzqi+olvgZ5virQM/8AdFIn12e+5hjEcUIemP4=;
        b=G1sIKftSt8VIrliireysIazH4ql0pTUC4iSkGy52ESTn0EdLR3wK8Y/Xsi4IJacJBT
         4dD3MBgZHkhLGVBF6PhmRBdf39ZmXHsp1h0vUGnPjqSXCjg++XBreKS1Ssu2XvxHYkFn
         GAfH0h70YPccEKmT3nPzToDL4mdSQxUyIfQYYY0c7aTAfVuqk23UxR2/AUhYE3C95ZKx
         v+S6rw+TSLzA84dByIt+taHMb/9Oof14EZpOHsNaJCg65FzN59/Y/244I+1AhdtNR9u+
         6f9wWPgK/fixayNahkTerXWHneF4urNd1o3Qr0X+ORp8ZcJp7oOqjdB7ZrY1KME3igxU
         M7ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKY18+iT56nHDsgBY+dAKbPvJGtUp6JaidMzqhARJhgwBDDdeGq+TEAaJwgieb9+GXG+iOAPZNlzdGi/RyPlNwxSDxjAnxRCexriE=
X-Gm-Message-State: AOJu0YzMldZaZw+eCVCSWRbt8TLW8GCUZW2j/0xEQ3K3g68ABbPDPRdX
	N1YwvE9g2aPXGeAecpWL56YybSB2FRyjy2JZefV9+2Qc5+x5Ah7+nV5KK2B3SWVR3DqsN6IyBv5
	rySZ7/yfUk0jjEJtovvKQDOtAYB4MaZTSWPrT4Q==
X-Google-Smtp-Source: 
 AGHT+IGBkCGjvpXyOLI1sZD88556mMVWRjS2lGe1CdsQmgpXL0A8yG+//8kBFLmfop+VM0G5SSumDfGjvj4aPwOBPHs=
X-Received: by 2002:a05:690c:845:b0:61a:d846:9858 with SMTP id
 00721157ae682-643aa1c15ddmr132441767b3.20.1719501151805; Thu, 27 Jun 2024
 08:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
 <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
 <3b897a1a-bd5d-4e6b-8289-a9c6b280f193@linaro.org>
In-Reply-To: <3b897a1a-bd5d-4e6b-8289-a9c6b280f193@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 18:12:20 +0300
Message-ID: 
 <CAA8EJppRkyMHmmLWzQumpB25fFkAq8Mji=LsPUsWeoLOpsja3Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: JB4MISCUFOBJPSAMFKJ2ZAOSKC5RPIJS
X-Message-ID-Hash: JB4MISCUFOBJPSAMFKJ2ZAOSKC5RPIJS
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JB4MISCUFOBJPSAMFKJ2ZAOSKC5RPIJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 at 17:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/06/2024 15:38, Dmitry Baryshkov wrote:
> > On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
> >> Add support to parse static master port map information from device tree.
> >> This is required for correct port mapping between soundwire device and
> >> master ports.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>  sound/soc/codecs/wsa884x.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> >> index a9767ef0e39d..72ff71bfb827 100644
> >> --- a/sound/soc/codecs/wsa884x.c
> >> +++ b/sound/soc/codecs/wsa884x.c
> >> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
> >>      wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
> >>      wsa884x->sconfig.type = SDW_STREAM_PDM;
> >>
> >> +    /**
> >> +     * Port map index starts with 0, however the data port for this codec
> >> +     * are from index 1
> >> +     */
> >> +    if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> >> +                                    WSA884X_MAX_SWR_PORTS))
> >> +            dev_info(dev, "Static Port mapping not specified\n");
> >
> > Same comment. Either dev_warn (if it's something to warn about) or
> > dev_info.
> >
> > Or, as your commit message mentions that it is required, it should be an
> > error if the port mapping is not specified.
>
> That would be an ABI break.

Ok. So make it required just for new platforms. My point is that
dev_info here is pretty pointless.


-- 
With best wishes
Dmitry
