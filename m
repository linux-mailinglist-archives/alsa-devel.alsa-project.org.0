Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50B89838F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 10:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D422C6F;
	Thu,  4 Apr 2024 10:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D422C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712220933;
	bh=oN6L5F4339c8x9zBSAaPAAYbUmNj5mF92X0nhCMXYT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mkPlMbHZcnNP7p8NW8Sh+3aJT6Ha6arK8zpzuPbpqioIQCtV/QDB8RAF+30etoBWz
	 9AOdm8P60GEgWFVdCSVfV9nzSeP+X7+hcdDoEOh1B//ILfev+LWNs7rmhEkvPGiUlE
	 eGg+Qhnwzp6n9vn05BQWCg+Y+l+m1Y/cpORy2/Pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B44BAF80630; Thu,  4 Apr 2024 10:54:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8793F80624;
	Thu,  4 Apr 2024 10:54:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0918F80619; Thu,  4 Apr 2024 10:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EDE7F805EC
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 10:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDE7F805EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cYLxCkDQ
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso544843276.1
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Apr 2024 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712220838; x=1712825638;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b0saMo4QGYVfrGZY3BfXYJ+wYYPXK1vgxsVH3LduLhE=;
        b=cYLxCkDQbDlgJ4kC9xZXaJ15H+Tl4/PqpvQ4N7wcseOMlAzUeqtH3gJkHFKC8Ur0no
         tRBW26WpQRBXCbciMLGEECmsf3E90iLMF030DZOhDDgXtEf0ZvwMplV8S2PPJEswl4MY
         JEUNtqMLqLeE7RknC2g2nQ3APz65ouZMECR/f67rt1JmlDzJfkbniKGdNxdy4PRVccj+
         wYPwirQkkZlXgX3InwWsgygEKSNR7NXIQV4wbRiVFBhrsER5VUbl7Iill51LjRnfAcGh
         L5eRwPEGSe4WhU2OY2T4zGwCcx8BpSP54p4TPl+rB1u8FWvTrhdJ7p3AOk7dRM8+Sdmv
         eRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712220838; x=1712825638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0saMo4QGYVfrGZY3BfXYJ+wYYPXK1vgxsVH3LduLhE=;
        b=Jw3awhSf51E31/7uGVRH7VE502L0aA8iL1CpSLJq88Opgq8Erj31CIzOD7uvbHTW+Z
         TpYLxzTC4YkdDaB3nYq1MrocDX3yFkDT9shKY1sbNUoMXCC61RRolsztzBr2bk+jGgSj
         Ir312rZQqpDlKHqaHocbTln3Rt3vCEIVgOT4Wt3G50JGS8fxKqpj0C36o5X4uqBpauzK
         1QAAfb7XS0dtyimdinVDQSby7Oko0m0c4CA/IzcUm3sNEYF0pAQyn+k91fUNsqn3gFLu
         f0Ispi7iQy1vztYbnd7WqxhixjOyy8wCP7LJ5TlLVobGNWwiKGOKx/7EEmpsVxxzZ/J+
         u5yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi8ZPPA6glubykaFzSEAnLY/D7JpvKP8cPeEHzSa1XVEgZlWGrkNMizL0HdupENU3PDK6qJoVZSteBZ7NecD7Lxui9d/64q9Z7BDY=
X-Gm-Message-State: AOJu0YxjXPzJtStEZLS+eYYED2MU/NWomup/kwkkbsZNgPDGExJduWA7
	w5J28oB8jo0tTGgQoxiUF7VEGNSxg7xfJphF0NqzwpA/2rpiuFTpRI/7CFSazkXRcbi0VhHDJzl
	+ZP7jZcoEKIoWCnS3Z1VKTj4qQA0DdUEvkI6S6w==
X-Google-Smtp-Source: 
 AGHT+IH7f3/xIqdGulCRGC9S2/T1fajzZP/pOTgqSEEM7kR4WSRQcksdbB122eHZa/2SpUYAsKQ5FgKEuYfHL4yMoGw=
X-Received: by 2002:a25:5f51:0:b0:dc6:9d35:f9aa with SMTP id
 h17-20020a255f51000000b00dc69d35f9aamr2068959ybm.19.1712220837771; Thu, 04
 Apr 2024 01:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240404084631.417779-1-quic_mohs@quicinc.com>
 <20240404084631.417779-2-quic_mohs@quicinc.com>
In-Reply-To: <20240404084631.417779-2-quic_mohs@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Apr 2024 11:53:46 +0300
Message-ID: 
 <CAA8EJpqWaYhzPKgTREtJnfdNZ4oSFZaRFM7Jhg+qd3AqadGOkA@mail.gmail.com>
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
Message-ID-Hash: LT6UG7VDVMEAWIB2FFTWNSW4AUG6ULFB
X-Message-ID-Hash: LT6UG7VDVMEAWIB2FFTWNSW4AUG6ULFB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LT6UG7VDVMEAWIB2FFTWNSW4AUG6ULFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 4 Apr 2024 at 11:48, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> soc platforms sound card.
>
> The bindings are the same as for other newer Qualcomm ADSP sound cards,
> thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
> is separate.
>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 2ab6871e89e5..ff1a27f26bc2 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -29,6 +29,8 @@ properties:
>        - enum:
>            - qcom,apq8016-sbc-sndcard
>            - qcom,msm8916-qdsp6-sndcard
> +          - qcom,qcm6490-sndcard
> +          - qcom,qcs6490-rb3gen2-sndcard

My 2c: you are adding one soundcard for the SoC family (qcm6490) and
another one for the particular board kind (qcs6490-rb3gen2). That
doesn't seem logical.

>            - qcom,qrb5165-rb5-sndcard
>            - qcom,sc7180-qdsp6-sndcard
>            - qcom,sc8280xp-sndcard
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
