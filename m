Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76350CD1F
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 20:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9C2170B;
	Sat, 23 Apr 2022 20:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9C2170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650740366;
	bh=Z9iXY8kio3B/BhyqueL62L2Zi57eq65kZJOrRD5oV/4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dew2QZHYNyIrKd3FoWUJjtTxEGjVhWeXUpVps++VpgqxOT/0sViAqLwKzILdtu1mS
	 6ZAZ+VruF+g56QoIT/tkgy8Y/RiVleypvMSpJJE4V+gQ2rjikKIlz/Jv9eHzjOjJ+v
	 1javrtXRGrV2C+MftzTAMbU/prAcRATzRrvJXysI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA5CEF800B6;
	Sat, 23 Apr 2022 20:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A7DF80248; Sat, 23 Apr 2022 20:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC5EF800B6
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 20:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC5EF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EbWgnmv/"
Received: by mail-ej1-x631.google.com with SMTP id i27so22224407ejd.9
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Iv9M4OkgtaRvCoiJAy8qzTnQXxQuFrI58JdJzyBH2yE=;
 b=EbWgnmv/cmUpjOe6imKJeQAc6QCEoIkIRTzxe/lO2PQZfTHet1FwlBblZTjEv2+Gac
 iqoIDlbxRS2vMEOKGYdOXU9Ts9TU9peEMj4w0W2ClFbCZtcFwNOc9eWEgF90o4SThHhU
 TQwTPaKTD0HW/BUndVc97qvcMh0IJ0aQCwEz5xcgm0PrQlArWSOtGlw50jy5ybX48EFj
 P82STRYG+upyaP7Y1dQ2l2GRaIfJtrXz1BVBKnii9LtP3jzyYvXS1FZXu17iXWb33YVx
 WFaWMmsnBcrWrVjD4QjRBQ6jkVX0M258JjehgTJEo+sI9f4Gl/f1c3zOZ+m96Cw9fV1j
 Hc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Iv9M4OkgtaRvCoiJAy8qzTnQXxQuFrI58JdJzyBH2yE=;
 b=jM72zZZGQ4vMYqPdIG4/FFl7+wG8FD8yEGgZiHpaLrxNUaXcCQt9PKr2BaV/VDnaFI
 Lds+Hi6q3zNjaPt4r3Xpn6DhzatiUlBnkYTZ5Fqbl+MAJGMIvVPgbEDPw/LI3N1VUzAq
 Trf0Hskuk9UAT2Bz2qQhnPr26ioiB/IBrGwWOPbAxb5ix3mtiewC7I+CoWRFPB3gwRGc
 7Uf37VVBGLeb7kbmhMgmK4tXTzSF51/0sOik0bCzc2LyRiVWRgp3Hk4KUj0Zbp4VVJrl
 yGucyDvknr3wJTzKyI9bQaCmw7i9CgR3O8YsywzurheVFT+449QgKVKIXNYuFoyabBjZ
 x7xw==
X-Gm-Message-State: AOAM530n2/jprW4OY9cW6zn6ylH/3FhX2JCbt+TjUBiRrUizNCxiJOzF
 G90oPBd8mcBthPJiDTjzu3ezfA==
X-Google-Smtp-Source: ABdhPJxHzEcfSa378ZqltzxferYBiM134gmVCHZYwZylv2DWpH7hlgv1Lty1aRMnN2dg7bCwN4Bc9A==
X-Received: by 2002:a17:907:961b:b0:6ef:fd58:8629 with SMTP id
 gb27-20020a170907961b00b006effd588629mr9240358ejc.589.1650740296313; 
 Sat, 23 Apr 2022 11:58:16 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r15-20020a170906350f00b006e9c9cdb4f9sm1911965eja.202.2022.04.23.11.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 11:58:15 -0700 (PDT)
Message-ID: <e0a77899-8ffe-6cdf-bca3-846b00bed4f5@linaro.org>
Date: Sat, 23 Apr 2022 20:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Biju Das <biju.das@bp.renesas.com>
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

On 23/04/2022 15:31, Biju Das wrote:
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
> 
> While at it add a '.' at the end of dmas description for the first cell.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
