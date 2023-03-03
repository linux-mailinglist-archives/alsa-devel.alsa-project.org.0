Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC36ACB18
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:46:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE13B117D;
	Mon,  6 Mar 2023 18:45:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE13B117D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124779;
	bh=DmQoXQumo3SpDn6JRBqtsSTm6ua0zaU5LLHb41ESiYk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ecjd/ZHP9TBL7t6afK7qqcsSfx1Y1OqWzSVvOLXuygiDid5v2oOC6veh9gyzAqbEq
	 lbi+pySgRBxvz3zVyU98oyJul7HS0UQMfaBPLGdfbhJVycH5niW+/dcor7vNTuRbUu
	 /kHIBjxLlKd+sLvYl1ey42vCVUmAQMTTFp+d+YHw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84D7EF805E5;
	Mon,  6 Mar 2023 18:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78CE5F80266; Fri,  3 Mar 2023 11:19:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-10.mta1.migadu.com (out-10.mta1.migadu.com
 [IPv6:2001:41d0:203:375::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CAB0F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 11:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAB0F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=DS4XUpMP
Date: Fri, 3 Mar 2023 11:19:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677838744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kW2dzd3rEyl+CD4yLWkK8l1i2WlSV/ZTeNH0M+2hcM=;
	b=DS4XUpMPlzbaKHRnAVpOzr/6GUmjnedAJsaqpX/wb6EhL3t6Fr33Sz2Uzmsh2OpDAYagMr
	Zy8AbU6hmF8dGJaZLw0bUc4fp5EjJl42mF4bIsxVdKJYGWQaQ8vWDhrsznYPnLeJDNmU3+
	j93ojnIj4e3TMysRnxoWACvYytH0HKk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: maxim,max9867: add clocks
 property
Message-ID: <ZAHJlPlLRrz81hmv@g0hl1n.net>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
 <20230302-max9867-v2-2-fd2036d5e825@skidata.com>
 <45d306d3-8efb-12ac-0a83-f01ca2982b0a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45d306d3-8efb-12ac-0a83-f01ca2982b0a@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HZIWDX7MP5XG4SBJYI6B7GDLZUYTPMJ2
X-Message-ID-Hash: HZIWDX7MP5XG4SBJYI6B7GDLZUYTPMJ2
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:40:47 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, Benjamin Bara <bbara93@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZIWDX7MP5XG4SBJYI6B7GDLZUYTPMJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,
thanks for the review and quick response!

On Fri, Mar 03, 2023 at 11:09:15AM +0100, Krzysztof Kozlowski wrote:
> On 03/03/2023 11:04, richard.leitner@linux.dev wrote:
> > From: Richard Leitner <richard.leitner@skidata.com>
> > 
> > Add clocks property to require a "mclk" definition for the
> > maxim,max9867 codec.
> 
> But why? You just wrote what the patch does, which is easy to see.
> Commit msgs should explain why you are doing something.

Ok. Will adapt the message in v3.

> 
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ---
> >  Documentation/devicetree/bindings/sound/maxim,max9867.yaml | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> > index 74cd163546ec..6f27029b137d 100644
> > --- a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> > +++ b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> > @@ -35,9 +35,13 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > +  - clocks
> >  
> >  additionalProperties: false
> >  
> > @@ -50,6 +54,13 @@ examples:
> >              compatible = "maxim,max9867";
> >              #sound-dai-cells = <0>;
> >              reg = <0x18>;
> > +            clocks = <&codec_clk>;
> >          };
> >      };
> > +
> > +    codec_clk: clock {
> > +        compatible = "fixed-clock";
> > +        #clock-cells = <0>;
> > +        clock-frequency = <12288000>;
> 
> Drop the node, it's entirely common/regular stuff.

True. I thought it is nessecary for
	"make DT_CHECKER_FLAGS=-m dt_binding_check"
to succeed. But I just learned it in fact isn't.
Thanks for the pointer and that eureka moment 😉.

Will fix that in v3.

> 
> Best regards,
> Krzysztof
> 

regards;rl
