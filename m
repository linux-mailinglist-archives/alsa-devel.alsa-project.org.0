Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F09EFA1DD6
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F5D169F;
	Thu, 29 Aug 2019 16:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F5D169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090387;
	bh=qKuOyQLh4mGjPderja86YPhIPuMTDJQd9hHN+VMg/gw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WAFWU+k10Fsvw/uhXzMUvR1tToCrRB9T827yP3SfNV+hqCP2biDvHEKO/MK8WEONy
	 GGfV/MR262ouW0lJUJ4zPtytigGmWdM3polSf9BgMSMd338ueDUgMrss6Vc8tssZgs
	 MbHLjojy5Lr/9cSF3M+9Rmo5AWBD27GGE4RmkI+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4561F80771;
	Tue, 27 Aug 2019 22:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40B6CF8076D; Tue, 27 Aug 2019 22:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A84F80600
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 22:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A84F80600
Received: by mail-ot1-f66.google.com with SMTP id o101so437233ota.8
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 13:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yEs6l2fJU7RmZsOxPVyhORblbcAOtVtSRpHm1RzNSjc=;
 b=OXLEef25m3rqB692EtIqaepYEI8NoIMnpNhsbSkFko098VhFrbI5qJ0PS0egOFUjaM
 O2R6fFJoY96NfvEXBFzI00FzTePTnvfF/DW4tIl6XU264va+Ehw/4tbwZ/j7VF74J9ek
 P0QftJjzPXnH/Em+aaLhCp6agFnwPcpuNaf3EKkaIj4FKdFShyy7tqqIMqtavMI9oNuZ
 PW4n6aL8dSkqHwBHG5fp9k66sgiTmajQqk7Hp6CwC93LTlnu0MNaR0iidgmVJDj1lzXp
 Ojp5pAi27VdbJNoenK8uq4aHsEBM2JTHlMJ601rX5RNBFK1ccPjzO/QopUXOFP94vei7
 jgZw==
X-Gm-Message-State: APjAAAVryDKokCCYkzS1pwlqdXNTIU3wQVcBxQuyT61VIjffMyhn9Fmq
 L7/JG2sIlK3MdDGeoqEmVA==
X-Google-Smtp-Source: APXvYqzrjs49PpZDuNJPU/9JKUModDuntpB/Dbk2/J/J20C5B4I5e2NRQqruQtkzoQr+yDWUgW4LGw==
X-Received: by 2002:a9d:7145:: with SMTP id y5mr389282otj.290.1566937223616;
 Tue, 27 Aug 2019 13:20:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t18sm147987otk.73.2019.08.27.13.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 13:20:22 -0700 (PDT)
Date: Tue, 27 Aug 2019 15:20:22 -0500
From: Rob Herring <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190827202022.GA7783@bogus>
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
 <20190823065340.GD2672@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823065340.GD2672@vkoul-mobl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
	slave bindings
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

On Fri, Aug 23, 2019 at 12:23:40PM +0530, Vinod Koul wrote:
> On 23-08-19, 00:37, Srinivas Kandagatla wrote:
> > This patch adds bindings for Soundwire Slave devices that includes how
> > SoundWire enumeration address and Link ID are used to represented in
> > SoundWire slave device tree nodes.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > ---
> >  .../soundwire/soundwire-controller.yaml       | 75 +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> > new file mode 100644
> > index 000000000000..91aa6c6d6266
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SoundWire Controller Generic Binding
> 
> Controller does not make sense here, why not use spec terminology and
> say "SoundWire Slave Generic Binding"

It's both IMO. It's describing the structure of child devices of a 
controller (aka a bus).

> 
> > +
> > +maintainers:
> > +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > +
> > +description: |
> > +  SoundWire busses can be described with a node for the SoundWire controller
> > +  device and a set of child nodes for each SoundWire slave on the bus.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^soundwire(@.*|-[0-9a-f])*$"

'-[0-9a-f]' was to handle cases like spi-gpio or i2c-gpio. Would a 
bit banged interface be possible here?

> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":

If there are distinct fields in the address, they are typically comma 
separated in the unit-address.

> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +      pattern: "^sdw[0-9][0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
> > +      description:
> > +	  Is the textual representation of SoundWire Enumeration
> > +	  address. compatible string should contain SoundWire Version ID,
> > +	  Manufacturer ID, Part ID and Class ID in order and shall be in
> > +	  lower-case hexadecimal with leading zeroes.
> > +	  Valid sizes of these fields are
> > +	  Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
> > +	  and '0x2' represents SoundWire 1.1 and so on.
> > +	  MFD is 4 nibbles
> > +	  PID is 4 nibbles
> > +	  CID is 2 nibbles
> > +	  More Information on detail of encoding of these fields can be
> > +	  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
> > +
> > +      reg:
> > +        maxItems: 1
> > +        description:
> > +          Instance ID and Link ID of SoundWire Device Address.
> 
> This looks better :) Thanks.
> 
> Apart from the minor nit above this looks good to me, I can merge the
> sdw parts if Rob is fine with them.
> 
> Thanks
> 
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +
> > +examples:
> > +  - |
> > +    soundwire@c2d0000 {
> > +        #address-cells = <2>;
> > +        #size-cells = <0>;
> > +        compatible = "qcom,soundwire-v1.5.0";

This will probably change once I review it. :)

> > +        reg = <0x0c2d0000 0x2000>;
> > +
> > +        speaker@1 {
> > +            compatible = "sdw10217201000";
> > +            reg = <1 0>;
> > +        };
> > +
> > +        speaker@2 {
> > +            compatible = "sdw10217201000";
> > +            reg = <2 0>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.21.0
> 
> -- 
> ~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
