Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA96C61BB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 09:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B82EC3;
	Thu, 23 Mar 2023 09:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B82EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679560379;
	bh=jARnPAZ4PvcBPJorEwvxuj0CwW1dXaCSwWqHey/qwB4=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=rUqDtU1OHylZhx2CqBxJduSY/neQDJQziz5DWcImcEtvDOr8ibCpfMnQVMIf9IHvZ
	 BMb8tN5KeOF55xBnQpqJka02XBy+JCGbZKQGsQpn344lU8LODpyzw+RWCrpkf2Rq9m
	 nrxWqEoimeaO7sjbFJg3ZQ4khMXg1tpJDLv8l90o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A20F8027B;
	Thu, 23 Mar 2023 09:32:08 +0100 (CET)
Date: Thu, 23 Mar 2023 09:31:54 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <551fe9b4-4c99-74b8-af44-9f431c488af8@linaro.org>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
	<20230322134654.219957-3-herve.codina@bootlin.com>
	<551fe9b4-4c99-74b8-af44-9f431c488af8@linaro.org>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNQA5K7LMKPJ5TCVL4JJPFXJPT2I3CPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167956032827.26.17701255324489779431@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D2A3F802E8; Thu, 23 Mar 2023 09:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2D90F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 09:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D90F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PzcT9o7j
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7332100005;
	Thu, 23 Mar 2023 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679560317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDd1tQ/W5Z8aDygD3qGQ9dvWDUINrjV0N0N66+d7lpc=;
	b=PzcT9o7ji9u/dXSGXb6PtP6CQzgcHhTT8zhGYCvtujxPxxKXBTaggDueOSiguXoX2aVL5l
	31PPwc3OLu2pSDIlUnig5zhy7LCBDOpynVLazso+9YfV1tWvnmQmDWU45ebTgzX6JeZBMA
	5JF/KUs5PvgRUZ8JQRkCx00/HczUmyvT5rUg1QmIg2TjSh2mxufeBLBGiPYIttQ0nQbCRg
	evjwELvxhhf5oOOKkGbMRzqU+5KtKaaqIwfYnwq/U29or35s0wnWPrXjgSoDcjCYvSqyYA
	QV07XU3erWsCTRpwPFliOzu8NDId3K4aJ+qu3R/ZVka3eUpzuOlPm/PdpaOkog==
Date: Thu, 23 Mar 2023 09:31:54 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230323093154.5852f81b@bootlin.com>
In-Reply-To: <551fe9b4-4c99-74b8-af44-9f431c488af8@linaro.org>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
	<20230322134654.219957-3-herve.codina@bootlin.com>
	<551fe9b4-4c99-74b8-af44-9f431c488af8@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MNQA5K7LMKPJ5TCVL4JJPFXJPT2I3CPK
X-Message-ID-Hash: MNQA5K7LMKPJ5TCVL4JJPFXJPT2I3CPK
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNQA5K7LMKPJ5TCVL4JJPFXJPT2I3CPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 08:30:39 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 22/03/2023 14:46, Herve Codina wrote:
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> 
> > +static const struct of_device_id pef2256_id_table[] = {
> > +	{ .compatible = "lantiq,pef2256" },
> > +	{} /* sentinel */
> > +};
> > +MODULE_DEVICE_TABLE(of, pef2256_id_table);
> > +
> > +static struct platform_driver pef2256_driver = {
> > +	.driver = {
> > +		.name = "lantiq-pef2256",
> > +		.of_match_table = of_match_ptr(pef2256_id_table),  
> 
> Drop of_match_ptr. This will case warnings with W=1 and !OF.
> 
> Best regards,
> Krzysztof
> 

Acked. Will be dropped in v4.

Thanks.
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
