Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7340CD35
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 21:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9FFA17EE;
	Wed, 15 Sep 2021 21:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9FFA17EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631734101;
	bh=/hh/qBOXXmlcSuUzBq1gnMEj7F7DXuAqTXQJyZuXbKo=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e5D2nmdGftt6ejdrwedWH9q7q9c+enP4m7cnGl+OrIuat5sGtxO0AGylKCjamLhfp
	 15bFh0iJj4JqBt9NW8Dgy5hAYbSNsydHx4WsQCoAg5F07XzNCCoIyKUIvJlC0+KBAg
	 LYPYpURvFujxuN+B8B7EgH4MCE1CmOKysTmiqTVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 326F6F80117;
	Wed, 15 Sep 2021 21:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 325ADF80132; Wed, 15 Sep 2021 21:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84E07F80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 21:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E07F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AvsLqD+I"
Received: by mail-oi1-x235.google.com with SMTP id p2so5676088oif.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=o/xLkGlhrSnpCqv+HEwTNRKoItyS4LasgozuRU4ni1o=;
 b=AvsLqD+ImZ3uG21Z85q9lNII8aPV/FqVgO1IUBdXtaed29+o/L4jPx8h2xxrNvZPNZ
 /AqAaoUsRfDPKhJegTmB5uaHM+phiDSUEtA9+4ewEGnBJfLTz6+DfPPN7KFy0S+kZvTH
 xt6LBjfee3cPZwN1+ScwgNDTcJbEx0PfLPLi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=o/xLkGlhrSnpCqv+HEwTNRKoItyS4LasgozuRU4ni1o=;
 b=bPFa2ZaXisr4RmhcaMKusx9nrbPmfKxHlThFGKnKM2N++Usf+avJ/+zDV5ZfeRWMoe
 md5+illomVo66IsV4kvw3xOuRW7J0532mqHtH9sALT35+Ox9JPYw64oleuK9SgSlv90d
 MJCejptLjlfb/3K3EPQgIrFCqiR9X2u+EG8zK7bE6QxFb5q3uLdysKVMiuiod/8v9m6v
 iurZ1+XmYfEF9K8iiBL514OPRudkvnvR2/0mPdlmDN9XOERA/ZU8QwqIFrlpLBQDmm0K
 8rf7CyHOIA+HQX11dFd72GtRqPAu6/OmWHlIclcEP4TNudvqbKaW4TT0yCE/D+zgLSND
 qazw==
X-Gm-Message-State: AOAM53030TzvVBsXvhsOx35sADvvKu3m4l7qa0MJOM2zRrBmQfjbnZzW
 HeI4HPVlknLpz4doSpB+dqJM0dGYxO1WKt/aoJj/3Q==
X-Google-Smtp-Source: ABdhPJwFkrl8F6Ej21HTUvXwucYyETWWwd0o6RXQlIIKy4y8Ocqoi0zQx97NR+cpDDHoED2PMDRevSzOS/rZyXj3qnQ=
X-Received: by 2002:aca:2310:: with SMTP id e16mr1006542oie.64.1631734016098; 
 Wed, 15 Sep 2021 12:26:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Sep 2021 12:26:55 -0700
MIME-Version: 1.0
In-Reply-To: <e1e84488-2af5-2272-010a-474788a498a3@codeaurora.org>
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org>
 <1631539062-28577-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n50=ABP+fs1U3JjiqMSKphfxFsZBqQQYwVH2o_iOE1Wu_g@mail.gmail.com>
 <e1e84488-2af5-2272-010a-474788a498a3@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Sep 2021 12:26:55 -0700
Message-ID: <CAE-0n50wVDvL+f19abt9o9d0GvuAD+AanCwHozoyGfEFWKWz_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-09-15 04:15:43)
>
> On 9/14/2021 1:21 AM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-09-13 06:17:41)
> >> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >> new file mode 100644
> >> index 0000000..e0d705f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >> +patternProperties:
> >> +  "^dai-link@[0-9a-f]$":
> >> +    description:
> >> +      Each subnode represents a dai link. Subnodes of each dai links would be
> >> +      cpu/codec dais.
> >> +
> >> +    type: object
> >> +
> >> +    properties:
> >> +      link-name:
> >> +        description: Indicates dai-link name and PCM stream name.
> >> +        $ref: /schemas/types.yaml#/definitions/string
> >> +        maxItems: 1
> >> +
> >> +      reg:
> >> +        maxItems: 1
> >> +        description: dai link address.
> >> +
> >> +      cpu:
> >> +        description: Holds subnode which indicates cpu dai.
> >> +        type: object
> >> +        properties:
> >> +          sound-dai: true
> > Shouldn't sound-dai be required?
> Sorry. I didn't get your Query. You mean in below "required:" properties
> need to add sound-dai also?

I'd expect there to be a required: list for the 'cpu' and 'codec'
objects that says sound-dai, unless that is implicit somehow. I'm
definitely not an expert in the DT yaml, but I suspect two more
'required:' sections are needed so that 'sound-dai' isn't an optional
property.
