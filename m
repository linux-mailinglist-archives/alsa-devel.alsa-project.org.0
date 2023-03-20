Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D26C2063
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:52:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DFE11E7;
	Mon, 20 Mar 2023 19:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DFE11E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679338355;
	bh=S8/wjmJqd4dDaylyebZ0+uIOatkjRiNn/Ov+ZV71IZ0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QItA9UTeEs7yNk20KDqkOX8wQ+5O4rvqgsMsEdWFNwcAnoYQ1pICUd6cUkxEDgSDO
	 zVwJfDEPnQHyFGtfCgORc+I/NFuK3HK4NnJ09UAQ78q7Y41qFYY7mfUoFd/HZeabO7
	 viKZ7HiwS5TeL5axm6/tat3hFs9IEO1YYQZIL8hI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C6CF80254;
	Mon, 20 Mar 2023 19:51:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEFC7F8027B; Mon, 20 Mar 2023 19:51:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5DCDF800C9
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 19:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5DCDF800C9
Received: by mail-oi1-f175.google.com with SMTP id s28so3270376oij.3
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 11:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679338289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy+uHtGeEkfIqZQQa8hhdrfId4RR8Z97pUxZtUSj9PA=;
        b=Isy0t0c6ScZQwJZEKeI9AsT0xoODT12yUVQM2DeTx5hExK8fGTP2tilo8+DAe/HFDy
         V9Hb20MVKyGFxkvqNShUJICeLypilRwnTI0ggxQRhImzXC2XyI+ud6N8UrXXJVenwp/n
         FtNkpRwry1I7CxhvSPSoNJ+z1mHnZWas7Qk3t7EFMSO5Gn6RMxUcLcGmfvAtRaSFHdJC
         WOHfdwPHJMQ6sMimNZPuJN2Jv3uw/LwKiXBCnmjnawFlYpXq73Ffs4gDcmEJD9i6DfhE
         FvreTPLyEZs9QqMn765kLupYk0Ph6Lpq/zviCgpZWDeQAmQ+VXHPtoG2YN4Chbzth6q2
         kgZw==
X-Gm-Message-State: AO0yUKVa0mLjQ+GCj1AazJOV79ublKzfuJsxHuixfyyl0RRu65YjhZOy
	1j8H4g0fzRVzYf3j/2ukPQ==
X-Google-Smtp-Source: 
 AK7set9jXZc51gZ66cNWRgvGJ0XOwRR+9Ihp6etk3fE60Cj/RzLnr6UVsEVIP2Y4rWDRiNW97j4Ryg==
X-Received: by 2002:a05:6808:698:b0:387:a25:c5eb with SMTP id
 k24-20020a056808069800b003870a25c5ebmr377119oig.19.1679338288833;
        Mon, 20 Mar 2023 11:51:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a05687050c700b0016e8726f0d4sm3578282oaf.3.2023.03.20.11.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 11:51:28 -0700 (PDT)
Received: (nullmailer pid 2240797 invoked by uid 1000);
	Mon, 20 Mar 2023 18:51:27 -0000
Date: Mon, 20 Mar 2023 13:51:27 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq PEF2466
 E1/T1/J1 framer
Message-ID: <20230320185127.GA2233912-robh@kernel.org>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-2-herve.codina@bootlin.com>
 <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
 <167930560089.26.8624952010101991814@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <167930560089.26.8624952010101991814@mailman-core.alsa-project.org>
Message-ID-Hash: VLAH5AW6J2HA2AK4QTKD2PVDL7IYMSPV
X-Message-ID-Hash: VLAH5AW6J2HA2AK4QTKD2PVDL7IYMSPV
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLAH5AW6J2HA2AK4QTKD2PVDL7IYMSPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 20, 2023 at 10:46:19AM +0100, Herve Codina via Alsa-devel wrote:
> Received: by alsa1.perex.cz (Postfix, from userid 50401) id 16494F8027B;
>  Mon, 20 Mar 2023 10:46:37 +0100 (CET)
> X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
> X-Spam-Level: 
> X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
>  DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
>  URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
>  version=3.4.6
> Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
>  [217.70.183.198]) (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384
>  (256/256 bits)) (No client certificate requested) by alsa1.perex.cz
>  (Postfix) with ESMTPS id 3FF5FF80105 for <alsa-devel@alsa-project.org>;
>  Mon, 20 Mar 2023 10:46:22 +0100 (CET)
> DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF5FF80105
> Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
>  unprotected) header.d=bootlin.com header.i=@bootlin.com
>  header.a=rsa-sha256 header.s=gm1 header.b=m4O7nLC1
> Received: (Authenticated sender: herve.codina@bootlin.com) by
>  mail.gandi.net (Postfix) with ESMTPSA id 40453C0009; Mon, 20 Mar 2023
>  09:46:20 +0000 (UTC)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
>  t=1679305582;
>  h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
>   to:to:cc:cc:mime-version:mime-version:content-type:content-type:
>   content-transfer-encoding:content-transfer-encoding:
>   in-reply-to:in-reply-to:references:references;
>  bh=Ieu9Fv38se4lD4z/BVXUHLrVJL9Tx5iKWZgvO8X+VoY=;
>  b=m4O7nLC1LPZDOI5eM/hmgqouxdkin2veA6CvJhT9kU9rGQALB3ya2fuybMfDvrkTqqBjEd
>  j6DAxXMgOKgwuUfEsZsp3BFJpoii00hSaf0r2uIbnnGcUrDGVQqUQVEqv51O6VBqnrViQk
>  PstlJM0lcE9R/AFASd5D/HQGoYYyRY+NKT7xt8g1Ax23Yk/tUG59LXku/skn/4faSLodnU
>  vV2ng3VMUcoLuvSMJtdYY3hrXEWqUrW1ZogxAFHJNiKuyOELmqZGmNo4B4yAFOEcqqyano
>  /f4m/7BtT7X1wwPvGu29gg+0aOFrGQq5kb4UNrMoriSQyKnxPRha8zL3J2Jckw==
> Date: Mon, 20 Mar 2023 10:46:19 +0100
> From: Herve Codina <herve.codina@bootlin.com>
> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: Re: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq PEF2466
>  E1/T1/J1 framer
> Message-ID: <20230320104619.468a304b@bootlin.com>
> In-Reply-To: <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
> References: <20230316122741.577663-1-herve.codina@bootlin.com>
>  <20230316122741.577663-2-herve.codina@bootlin.com>
>  <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
> Organization: Bootlin
> X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: quoted-printable
> Message-ID-Hash: AJZF4VHU24ASVVBCPRMLJCDG4ZDX55LB
> X-Message-ID-Hash: AJZF4VHU24ASVVBCPRMLJCDG4ZDX55LB
> X-MailFrom: herve.codina@bootlin.com
> X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
>  loop; banned-address; member-moderation;
>  header-match-alsa-devel.alsa-project.org-0;
>  header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
>  administrivia; implicit-dest; max-recipients; max-size; news-moderation;
>  no-subject; digests; suspicious-header
> CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
>  <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
>  Mark Brown <broonie@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
>  Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
>  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai
>  <tiwai@suse.com>, linux-kernel@vger.kernel.org,
>  devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Christophe Leroy
>  <christophe.leroy@csgroup.eu>, Thomas Petazzoni
>  <thomas.petazzoni@bootlin.com>
> X-Mailman-Version: 3.3.8
> Precedence: list
> List-Id: "Alsa-devel mailing list for ALSA developers -
>  http://www.alsa-project.org" <alsa-devel.alsa-project.org>
> Archived-At: <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJZF4VHU24ASVVBCPRMLJCDG4ZDX55LB/>
> List-Archive: <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
> List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
> List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
> List-Post: <mailto:alsa-devel@alsa-project.org>
> List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
> List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The alsa-devel list doesn't seem to like your emails. The archives 
(lore) has 2 copies with the 2nd having the original headers in the 
body. I'm seeing this recently on other senders too. Best I can tell is  
you sent this as quoted-printable.

Rob
