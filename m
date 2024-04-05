Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE5899B28
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 12:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40731F3;
	Fri,  5 Apr 2024 12:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40731F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712314023;
	bh=L4E8p/GV0Ds3nAyTGC7XhelVlzhjjV+Qy3Ty0PI9xhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LUOGR9ylZqQ92Kk1DRbndmHqD/n3fm4NiIy3aoQEjG9LaUt0lRCC5CEtQZx2NKIDh
	 9E1PGFroCeIbhXIMxmAi+Uw+tK5tXhYPJFm3t1OPuxIOhEFjO8JmuXb2RCJUl45/fy
	 rOZrk4j62U9mA/cZDUZNAMFEoH1f2gaws1fxYpDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B3E6F805A1; Fri,  5 Apr 2024 12:46:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE37CF8059F;
	Fri,  5 Apr 2024 12:46:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8169FF8020D; Fri,  5 Apr 2024 12:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95DECF80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 12:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DECF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XQOOJ+iZ
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6156483284fso22843387b3.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 03:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712313978; x=1712918778;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q464s0pydIE+zRv4fDUf6M5jc7NXRIaMdUPXgVeAtAQ=;
        b=XQOOJ+iZoLk/iEpCJqXLnFukSqxRkxxokpa/vmP04SQUQRXJZvEWjCVpp+4E/RSi4G
         DOXxAuR7uFRCNzbyMlY9hDdTesuQo0BiJJmxCs7H69aM5+Rt5o89MMXcRoTc6MT9Lkyt
         1JeSqMkPoyrdtPRnHYEzX+my+uce9vvqCfZilX4oqV2Y24VLzl6ckcAjr8I4NIhrg0hj
         txLVFptfr5pweDr4b4wV1C3uXPS6/3cAssInGInEJ5dJk/XrmsLvfbROYpivG3n1DhGJ
         bQUUjkOSRNd9882+xjkXJ29f8aQvifRAlSNU4B9NN6Gi5yYgb23Zyci1UCav8NFQc1fz
         xBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313978; x=1712918778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q464s0pydIE+zRv4fDUf6M5jc7NXRIaMdUPXgVeAtAQ=;
        b=wSPkvicowYC3KMK67HxKOqxWXoFTU4nSumiRgp5h1w5kPmpTH83eY1orVBnDfalyij
         WGkbcndSc1O1vw+ZZwS5+SrHt9N8Yc45psrux6wrsAqH1xo9tDchCwUw/EAIubYRgiwG
         EToND5V/M5DB8omrENBGskFw8ZIg+/0zBIDTrGtjRUEv84rCakKblV7atXTqmd8fBazW
         n6jUQF/dYl4nuB3f+wE31PQl3eFBtYxNU2A/ji//Tk9LvRt0hdRbfr+vnTr+AU/HRKhL
         lC2D9tyYiprAXdNdkml/NrzdPkqrLx0TLSifmib/uGeYnLN61tWu6WUj1XMks3D4+iE+
         lefA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPierz10RzYJeiZ3+zl8bgPiU126gjt0gVYGAW49ARXnMda50c3TtjyXylbkDiUY3pc/KHYxpRNerKEK7VFFpOyS+2NodMAvU2fAI=
X-Gm-Message-State: AOJu0Yz4yDRt9V1JvIMW42ayqqxqujb+I4H5n3Am/paY9rF/TGE2+Qlo
	tBDD7mo+0z1Fm3u8ri1piAVTaNdrQNkfoBYtGRUGjh0Wdsydvck5EeJbG+LrNepw5JvETOKDjAt
	Na48jID+0XHocpeKvsue1LAz5LRFoRbfCQf2tQA==
X-Google-Smtp-Source: 
 AGHT+IFD4lOAA6OE545MWaALDTv8kewFB0UhOTHwNBgdOdA/c4Xh5GLbUDrWS+o4QO2az8mbVpwytUQzz3UDkLFdfw8=
X-Received: by 2002:a25:bc85:0:b0:dcc:44d7:5c7f with SMTP id
 e5-20020a25bc85000000b00dcc44d75c7fmr782319ybk.62.1712313978067; Fri, 05 Apr
 2024 03:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240404084631.417779-1-quic_mohs@quicinc.com>
 <20240404084631.417779-2-quic_mohs@quicinc.com>
 <CAA8EJpqWaYhzPKgTREtJnfdNZ4oSFZaRFM7Jhg+qd3AqadGOkA@mail.gmail.com>
 <797d67b9-9e09-8b84-9abc-dd4a4a2a40f5@quicinc.com>
In-Reply-To: <797d67b9-9e09-8b84-9abc-dd4a4a2a40f5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 13:46:07 +0300
Message-ID: 
 <CAA8EJpo2__vcpqq1zofyyZ6UwPPn7Ed0R=TPcMZ25+JHwRExwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd
 QCS6490 sound card
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: RSHMNINSUDNTL5GXDH4ITXZ3GHMKGOOS
X-Message-ID-Hash: RSHMNINSUDNTL5GXDH4ITXZ3GHMKGOOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSHMNINSUDNTL5GXDH4ITXZ3GHMKGOOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 5 Apr 2024 at 08:56, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> On 4/4/2024 2:23 PM, Dmitry Baryshkov wrote:
> > On Thu, 4 Apr 2024 at 11:48, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
> >>
> >> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> >> soc platforms sound card.
> >>
> >> The bindings are the same as for other newer Qualcomm ADSP sound cards,
> >> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
> >> is separate.
> >>
> >> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> >> ---
> >>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> index 2ab6871e89e5..ff1a27f26bc2 100644
> >> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> @@ -29,6 +29,8 @@ properties:
> >>         - enum:
> >>             - qcom,apq8016-sbc-sndcard
> >>             - qcom,msm8916-qdsp6-sndcard
> >> +          - qcom,qcm6490-sndcard
> >> +          - qcom,qcs6490-rb3gen2-sndcard
> >
> > My 2c: you are adding one soundcard for the SoC family (qcm6490) and
> > another one for the particular board kind (qcs6490-rb3gen2). That
> > doesn't seem logical.
>
> The qcm6490-sndcard compatible for enabling soundcard on
> qcm6490 IDP boards.
>
> Will change compatible name as qcom,qcm6490-idp-sndcard.

Any consistent way is fine with me.


-- 
With best wishes
Dmitry
