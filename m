Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9686ACAD9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898111155;
	Mon,  6 Mar 2023 18:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898111155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124480;
	bh=XHyPAF51eUMlK3QtsfufW6z18pzirI5oCur/SoGs5P4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mkTTqcUn9kPTXLLlaoxCXWqGwB9ZTnN7xT6YHJliYqHFTMwITQobGlW1aCOjdQI+r
	 zesO6l2SO+jph3HLoi3lytxWSm3FxTeZ1EMDsWtLqT6athKUdx9yj4I88CdCs4/sWa
	 aFTqmhVkI5UOwEvqKQPCPO2Jdz6n9y/ZZlgy9Y3M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE72F8055A;
	Mon,  6 Mar 2023 18:38:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 394CDF80266; Thu,  2 Mar 2023 14:48:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-39.mta0.migadu.com (out-39.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 570A2F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 570A2F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=Fcy93b3r
Date: Thu, 2 Mar 2023 14:48:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677764890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V991dQeEws4gMfHQC4nmHWlHaA6flpJIWdTN0Wx42VA=;
	b=Fcy93b3rfXouCdwjKyg+iGKp3SkD6tfNB6iH1jBLaidKblWBulqy1/6N33ZhE7PQ2U89Oc
	FWZgZyWjDb60c09PWCc5c+vmAJbdZJiJnYy8rBYFQI969EAN7InJi2dkI+z+glnGLk16Md
	aDN7gmpcqImu8UqsUtd96EVxEp2tWHk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: maxim,max9867: convert txt
 bindings to yaml
Message-ID: <ZACpGN5Qk26Q8U9K@g0hl1n.net>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
 <27aa0b4a-14fc-5fce-ab49-a8744b131882@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27aa0b4a-14fc-5fce-ab49-a8744b131882@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OSL2C2XAIHHWEZMX6P6SQOQR663AQ22J
X-Message-ID-Hash: OSL2C2XAIHHWEZMX6P6SQOQR663AQ22J
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:45 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSL2C2XAIHHWEZMX6P6SQOQR663AQ22J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 02, 2023 at 02:31:14PM +0100, Krzysztof Kozlowski wrote:
> On 02/03/2023 12:55, richard.leitner@linux.dev wrote:
> > From: Richard Leitner <richard.leitner@skidata.com>
> > 
> > Convert from max9867.txt to maxim,max9867.yaml and add missing
> > '#sound-dai-cells' property.
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> Except wrong ID (and missing test):
> 
> > +
> > +examples:
> > +  - |
> > +    &i2c {
> > +            max9867: max9867@18 {
> 
> Generic node names, so "codec" and drop the unused label.

Thanks for the review and feedback. I'll fix that in v2.

> 
> Use 4 spaces for example indentation.

Ok. checkpatch.pl didn't complain about that so I thought this was
fine. Are there any other scripts/tools to check for correct formatting
of bindings?

> 
> > +                    compatible = "maxim,max9867";
> > +                    #sound-dai-cells = <0>;
> > +                    reg = <0x18>;
> 
> Best regards,
> Krzysztof
> 

Thanks & regards;rl
