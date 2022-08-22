Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955659C7B4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 21:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0FBE1632;
	Mon, 22 Aug 2022 20:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0FBE1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661194834;
	bh=bwzvwojmSgtuoyWuFH+V8diEXG0uVqK9Nqw8er34tCw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rS8ezf6qFDt0q0WoeG52aKzKw54hpKWY4YNJ4cezyA1/1SZANy+nQQNnd9toG1zGC
	 fyuJjXaM8H1jveeyJOyqNJaEgleQNRTOzddR2xSt6w8lRAC8lM9erXqZmg3Y/xUTwO
	 D5dXUUGKvLju0WLZ/HqQbII90nZw0/2lnEFPhDDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1F75F8026D;
	Mon, 22 Aug 2022 20:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 437E0F8026A; Mon, 22 Aug 2022 20:59:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AC44F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC44F800ED
Received: by mail-ot1-f51.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so8320266otq.5
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 11:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=KC3mSExT2980nvsUpi0Nta2kzUEej10EfwvbkK4Vxig=;
 b=ZOsi10FlosvLmPt4CtpkpVvIEeJdUFwsXLsYkjNhaLLO7aLNIyfBxQET6MSUCFmroD
 7Cto4I/fkhior5ylDPUenJwwdQ7VRytzSXymbZc1U4e0Svm/H8sFpPAe/6P0IPSn9DUJ
 Gj91eInH3prN+Yp9eYuIt7LkYxfIAjtoBmu2Ex/PK7rZiTPRA8KfjEuxNkO35B4hl70G
 BRDaI/JwbjpvvgAJIw2fQu3CpeB4w3nELAYcCjdhIShPKbcGRdJsCJ6C2RW5x0bkJwCH
 GNHPzWr4oBGJREJXxzwoAM7vHyvJQdpzEwkhgukR4PDkxFArOTqR2ViBKTuFkCsXYVhK
 Qhrg==
X-Gm-Message-State: ACgBeo2BycFCKqwliPahFgGxr8FUObBrYH/QijToVJiIE7coALMN7WTr
 5BfCZNrH2qGsAe2q9YEyog==
X-Google-Smtp-Source: AA6agR7btQFmvQq0Xy9/DuWu4SwhzJqPzpfHfJhyCbe3cPr8MjiKVjCR+AbUoPv1GGenu7V4Fr40aw==
X-Received: by 2002:a05:6830:19a:b0:636:dbfe:4c36 with SMTP id
 q26-20020a056830019a00b00636dbfe4c36mr8070226ota.257.1661194767772; 
 Mon, 22 Aug 2022 11:59:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z24-20020a4a8e58000000b004357ccfc8bfsm2633078ook.7.2022.08.22.11.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:59:27 -0700 (PDT)
Received: (nullmailer pid 170179 invoked by uid 1000);
 Mon, 22 Aug 2022 18:59:26 -0000
Date: Mon, 22 Aug 2022 13:59:26 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Message-ID: <20220822185926.GA146730-robh@kernel.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
 <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
 <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
 <737767DD-CB70-4941-8CF5-497333D3A801@cutebit.org>
 <a0a34ac8-4b62-4e69-f16f-7a51132a3987@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0a34ac8-4b62-4e69-f16f-7a51132a3987@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

On Fri, Aug 19, 2022 at 05:17:17PM +0300, Krzysztof Kozlowski wrote:
> On 19/08/2022 17:14, Martin Povišer wrote:
> >>> Since it was brought up last time but I didn’t respond: the
> >>> nonalphabetical order is as the chips were introduced (and
> >>> matches other schemas).
> >>
> >> Sure, just keep that order for future compatibles as well - so always
> >> put them according to verifiable time of market introduction...
> >>
> >> This is very poor reason, instead of alphabetical order. Even worse
> >> reason is repeating wrong pattern just because someone else did it.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > I don’t see it nearly as clear-cut. Adding to the end seems pretty
> > foolproof too, but OK, next submission will have it alphabet. ordered.
> 
> The concept is the same everywhere, be it Kconfig, Makefile or other
> lists. If everyone adds at the end, you increase the chances of
> conflicts. Having alphabetical order usually means simultaneous edits
> will happen in different places.

The difference for those cases is there is 0 control of when things are 
added with the source being all independent (different companies). For 
these, it's all one platform family and there's limits as to when one 
source can produce new entries.

I'd kind of like to know timeline order, but alphabetical is the only 
thing we can ever check easily and possibly automate (hint). 

Rob
