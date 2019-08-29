Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B29A2750
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 21:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E5815E2;
	Thu, 29 Aug 2019 21:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E5815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567107147;
	bh=xFIFHGd4rvaJek6pketYaxehoyFMXxMlvsFNZ3mkhLU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtwJdaOm5B9lX8C2zYwkH4ocN9yiRwJG6QezQPlUMJDIq9IyChqQxRB0q790585ZL
	 ER4GXgM2rIXtSUxI/2pEXviyl3gGQcdAc/mT2lfBb9GHS2GEyrdFbdEm/jl4/tbgPe
	 3khU3YpvgN/rsZAaVl1lElEnD1wsuD1E+Dh6N+Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB92AF800F1;
	Thu, 29 Aug 2019 21:30:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77681F80148; Thu, 29 Aug 2019 21:30:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5D90F800F1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 21:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5D90F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KCEFp0U6"
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8803A22CEA
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567107032;
 bh=P8Okz1ioDyQ5iQhhZdadmnrkWaz9o8uYiuS0d0WDRvU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KCEFp0U6rFSC8fIUYAgYeOAPSqvJeCAi1y4HpyDJjcC/XELXgJd3q28f97XeSRotf
 Em3O6VdjKFphBdvLxx3GLXXZNZpPYp4m0Z7KIPGkz+TYVqOVaWAZ2Fp82r0uZfPa+g
 tciw54shUTMXr6RuyRkAt88LL65IrR7IyWGV+GuE=
Received: by mail-qk1-f175.google.com with SMTP id m2so3990459qki.12
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 12:30:32 -0700 (PDT)
X-Gm-Message-State: APjAAAUOZs2nkBxX2dgkCBU9NZE3iZ3ogcdcQDaR+sCU4oiraPkeBgH4
 bTTT35rlwZJJzBuTxVFKWL1kEm9AM2a0vxidRQ==
X-Google-Smtp-Source: APXvYqzkIC+v5aIBr2WVnHist8Ob0TXXTVPct/ifT/ce+i4zRLnYa43TF25d7xt3ZDfB1IBglTWwTXNJUva+39sy1q0=
X-Received: by 2002:ae9:e212:: with SMTP id c18mr5379641qkc.254.1567107031751; 
 Thu, 29 Aug 2019 12:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
 <20190829144442.6210-4-srinivas.kandagatla@linaro.org>
 <CAL_JsqLOHA+r9UCTwyvj+_BzWSrsVDZw5vp-1XhYYvQxncx0sw@mail.gmail.com>
 <ef01465e-25d6-059c-1f5d-8e8ebd6b887d@linaro.org>
In-Reply-To: <ef01465e-25d6-059c-1f5d-8e8ebd6b887d@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 14:30:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL9p9fF4KZ4DSfhC0+XTDe0OaR8CZ0mmDNPTxaoi38FFA@mail.gmail.com>
Message-ID: <CAL_JsqL9p9fF4KZ4DSfhC0+XTDe0OaR8CZ0mmDNPTxaoi38FFA@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v5 3/4] dt-bindings: ASoC: Add WSA881x
	bindings
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

On Thu, Aug 29, 2019 at 10:52 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Thanks for the review!
>
> On 29/08/2019 16:46, Rob Herring wrote:
> > On Thu, Aug 29, 2019 at 9:45 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
> >> Amplifier. This Amplifier also has a simple thermal sensor for
> >> over temperature and speaker protection.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   .../bindings/sound/qcom,wsa881x.yaml          | 41 +++++++++++++++++++
> >>   1 file changed, 41 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> >> new file mode 100644
> >> index 000000000000..7a486c024732
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> >> @@ -0,0 +1,41 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >
> > Dual license please.
> >
> Will do that!
>
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
> >> +
> >> +maintainers:
> >> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> +
> >> +description: |
> >> +  WSA8810 is a class-D smart speaker amplifier and WSA8815
> >> +  is a high-output power class-D smart speaker amplifier.
> >> +  Their primary operating mode uses a SoundWire digital audio
> >> +  interface. This binding is for SoundWire interface.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: "sdw10217201000"
> >
> > No need for quotes.
>
> Did not knew that! Still getting used to yaml stuff :-)
>
> >
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >
> >> +  powerdown-gpios:
> >> +    description: GPIO spec for Powerdown/Shutdown line to use
> >> +    maxItems: 1
> >> +
> >> +  '#thermal-sensor-cells':
> >> +    const: 0
> >
> > Either of these required?
> >
>
> "make dt_binding_check" was complaining when I added this! Let me retry it!

Because the example in soundwire-controller.yaml will no longer be valid... :)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
