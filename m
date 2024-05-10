Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053088C1C6B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 04:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BAA7F50;
	Fri, 10 May 2024 04:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BAA7F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715308265;
	bh=ZzdVd+yC6m/YJclBMlBaIakLpO01LhOZQZwe/MSFkz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uDIOgiiD9v6lvciQajVdlWT9crYkl5yo1NQ5jLPi9mXiNFqZ8pbYP3ik00Uxwryod
	 sSv3W6C+NdrHOxPaGvvR2ECVZfeuaULaib7zpZMdzcrNpJS4wKN8m7/3HGN97FTsDc
	 OZz5iW3mjlTaWAIsxdcwThyWEudykvf+ChmuTdMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 503EAF80588; Fri, 10 May 2024 04:30:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EFCF805A0;
	Fri, 10 May 2024 04:30:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AE7FF80423; Fri, 10 May 2024 04:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F18C6F8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 04:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18C6F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ck0KNE4+
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-36c80f9c86bso7036065ab.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715308222; x=1715913022;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21VKHMMaZA0kpkZw9wZiu6Ve2UlBKMEGNlaolOO9V6A=;
        b=Ck0KNE4+t254daIjoNsQcLkQd1ptfr74hYAzI6YGUHym2tW50rpdKFOu2w9B72fZEQ
         knx/MQ6oKKFks6HCoKPnA5kJ5v0LqOeuJsj52jja6eukTXLnPEP+j5NTO9SdBOyCAKRF
         If2CQCLNHUpAIeBN8hbusLc1wzv+DDGNlxW/cc5e+0+TsAkHRlcAYLpYptPBrYyoknRN
         Sax6epjGq2wl34e+wx2sQoYJQ1ng9gNlsoZoqxrL94jYUvS36uemUM5GfBE4Za++vG0k
         nCw3ccISB85ZH1eC0mIU76xo3BGvmodrfsBejTcZgEWjaqhrs4k1A8S1WmCSlHLSEiG1
         JEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715308222; x=1715913022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21VKHMMaZA0kpkZw9wZiu6Ve2UlBKMEGNlaolOO9V6A=;
        b=lF09G8unqR8iIINFQvk2oqEsS64CXyTigzG0+1HS3cPkWsI4iu/u2h2+WrBSLyHEGI
         r0HQ1a+0iHUNLpKnl4StY9NZ5lkQYgr1+OYhCq+fmHO532zXclOzmyJaPEUS4vJgl+3g
         14JJz8NhGABdfcFiJccYE7sCKD3z21plo9c7XIAbqIBnsQ/4yeOdEAsx7xHK7D8Z056+
         AfLIZnNKGun0+mbirMXke9JAR+KhgyCyD77aPAnJyIOnIE6LgWnN9fk00xuKk8fajJQZ
         JYFDapS335iISX9t9M1U9PAYvlmAt4rdMId5iZ82cxSoDqgk6Uij0Mxjwjh6WcunhJcL
         WJAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDK2WECQczCIdGYvy9hJ5RIBSEz+5CE9Q/i5STTNntXRYkzCD3rzG+YMe4NNFVBoHCzRyj/t4c8ceu30g2gr1Lk28aI0K3LZslW4Y=
X-Gm-Message-State: AOJu0YwrDkicTcMqfPrkn3hdNdtCcoSf9MJS4Mxl7hyqczupKfA0Mnwa
	j/1RFhTiKSKl8if6AicooN8qgMoUht77vJEf5PItSY7yXIKO9LIUxz7kTvd3FYY8q4DowvMPjv9
	TV7/he7iNPN9hjeGX6p4hxl/Gauk=
X-Google-Smtp-Source: 
 AGHT+IGrr4iwZg6NUnOgkVHX9/Croov3vFT4FOj9bA67E1Jv8+1P0qtMgoPO/Vex1YuXlIlPwX+ZWDLIR3wv6gRTbps=
X-Received: by 2002:a05:6e02:1d83:b0:36c:47df:5922 with SMTP id
 e9e14a558f8ab-36cc14e12bemr19098315ab.29.1715308222256; Thu, 09 May 2024
 19:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-2-git-send-email-shengjiu.wang@nxp.com>
 <20240509-phonics-wound-58d3435165f0@spud>
In-Reply-To: <20240509-phonics-wound-58d3435165f0@spud>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 10:30:11 +0800
Message-ID: 
 <CAA+D8AOn=fPmUHthSRZeAYSpA3mCCdQQAT2SmqjAALo8nRPHsQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX95
To: Conor Dooley <conor@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2YS37OJOND5CSNYW6FUPLCPXARIO6K7Q
X-Message-ID-Hash: 2YS37OJOND5CSNYW6FUPLCPXARIO6K7Q
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YS37OJOND5CSNYW6FUPLCPXARIO6K7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 10, 2024 at 1:11=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 09, 2024 at 10:57:37AM +0800, Shengjiu Wang wrote:
> > Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
>
> That's apparent from the diff. Why is it not compatible with existing
> devices?

i.MX8MP:  There is PHY and support eARC, ARC, SPDIF
i.MX93: There is no PHY and support SPDIF only
i.MX95: There is PHY (PHY is different with i.MX8MP),  only support SPDIF.

Will add such info in the commit message.

Best regards
Shengjiu
>
> Cheers,
> Conor.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 0eb0c1ba8710..1c74a32def09 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -22,6 +22,7 @@ properties:
> >      enum:
> >        - fsl,imx8mp-xcvr
> >        - fsl,imx93-xcvr
> > +      - fsl,imx95-xcvr
> >
> >    reg:
> >      items:
> > --
> > 2.34.1
> >
