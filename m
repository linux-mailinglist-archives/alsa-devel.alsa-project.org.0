Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3D952A68
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B5122BCD;
	Thu, 15 Aug 2024 10:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B5122BCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710421;
	bh=iLzGfAYReosnIhXCk1VOcUKl/i0/LVKCJemQ52zsYcY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ktROU9JsoSJAieEGUG8wXVnP1yy0jAXGrd9pZKsRLzJVxJU+S6h9oSUeQ49wdSQ6r
	 300LvrIKAC6G6az08O17lYRI90gm6kXjl6DyIjvYasF1JKvVK9hvT6tVduJZ3+ohXt
	 SZrRH1AxmxW0A8+Ti1Xuqdnj0mbUmyXCgqwNm4Xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FB15F807B5; Thu, 15 Aug 2024 10:24:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF74F807A2;
	Thu, 15 Aug 2024 10:24:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2634F802DB; Fri,  9 Aug 2024 11:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D34F8023A
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 11:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D34F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=gDjgsmBq
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so2407674a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723194757; x=1723799557;
 darn=alsa-project.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=gDjgsmBq5pjArzbU/unx+0k4HUz+FaoBLHeewGxnXLi0DL/W8E60aanj+AkJcAcsar
         psTPgWPe5vD83Pdmfru1EAIOGcIfBI230kddah4gf3B/aS2piy2OooFxjwdPpGAhLjd2
         Rz2VYBhEqJSTPsgBRMcMi9SRMeaEK9t8SRkYh0B/l/gIhouArJ//BaQVfj09cb+hJCgl
         VvTsasrUTaQiQGohcLZ4BWBT5Jh7qDw+3b3dQrDeKbFxOA3qfTeha0Erm+q5w4BcpflO
         whesWOxUzU+M9NqDWJ8dtqWjx+yv0dIfpGsiSZkhNmK2RMoS2XRbm0nzRViswo1UAFXe
         ghqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194757; x=1723799557;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=OLKdeEL1M6UoVSTrJO+6nW5CQKeSZDXKVtyZADvQplroUtC7+suonP7ys4ihBEddEB
         WiztTwx8wZBqVj1KjsPbF+YDeZX6Hfpp624G0Wl1CSnDNboNRh1M3Z/UemPptCzDslTK
         wZkyErB+BdBelHbW9frpljVoU9H47EjYucC6n+ep2YzIbpsnvP/NMYsPJ005GBtXjBk3
         tx1sfAw34YtNa4dIMYVzcDHNTeBQrnRx4kWn99ZvFsiCCCtHGcKYnWaZGVx6cJjZpiG5
         vU9k49B+5yFC8RhtC/g7CYE0OJL9cS1gpIeTiCAHn6iTp6q1fHV0b3qB8qPRGcICB0QX
         x/Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwuvpE+GZfYORKFXegwbEh3waeHBm872Scl0D2s4RKxXD6K5NI73dxlTvw6R5ZWu3deK7w6nUCD7ltoKklSJIzml6BTXBuCq7JgAY=
X-Gm-Message-State: AOJu0YzADjumkH7vlNwKpRZc/4NUaPnoeX2+D8hPbSv5r4Xzz7/Y8+BB
	Q/nv3xp/TI75DPxhXX+yN3GQSBSvP6BZBHIJb+IkM1KdCkAD5ncarsggCbEzTCw=
X-Google-Smtp-Source: 
 AGHT+IHDUZDs7bOcbUASgJVPa4IcEoa+TGubCNTDd+aHDQmy+MvrocMHlvfzwk/Wi4ksiDbfFd9BVQ==
X-Received: by 2002:a05:6402:42c6:b0:5a2:ec88:de7a with SMTP id
 4fb4d7f45d1cf-5bd0a6dc52cmr695902a12.33.1723194756675;
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2c4b5f2sm1358221a12.45.2024.08.09.02.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Aug 2024 11:12:35 +0200
Message-Id: <D3B9K69AAWNT.2KIHAZRFNB8NP@fairphone.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490
 sound card
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
 <20240809-fp5-dp-sound-v1-1-d7ba2c24f6b9@fairphone.com>
 <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>
In-Reply-To: <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UKWRSYVOUHNAPZGDZKWX4KYR6AHK6BYT
X-Message-ID-Hash: UKWRSYVOUHNAPZGDZKWX4KYR6AHK6BYT
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:23:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKWRSYVOUHNAPZGDZKWX4KYR6AHK6BYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri Aug 9, 2024 at 11:09 AM CEST, Krzysztof Kozlowski wrote:
> On 09/08/2024 10:33, Luca Weiss wrote:
> > Document the bindings for the Qualcomm QCM6490 sound card.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b=
/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index c9076dcd44c1..0a31be6d917f 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -31,6 +31,7 @@ properties:
> >            - qcom,apq8096-sndcard
> >            - qcom,msm8916-qdsp6-sndcard
> >            - qcom,qcm6490-idp-sndcard
> > +          - qcom,qcm6490-sndcard
>
> I think it would be better to make it a board-compatible and also
> followed by qcom,qcm6490-idp-sndcard fallback, thus no need for driver
> changes.

Hi Krzysztof,

So that we get "fairphone,fp5-sndcard", "qcom,qcm6490-idp-sndcard"?

I can change it to that in v2.

Regards
Luca

>
> Best regards,
> Krzysztof

