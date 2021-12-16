Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1A477B3E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 19:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8A0205C;
	Thu, 16 Dec 2021 19:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8A0205C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639677854;
	bh=XXIPm0ETvDYSq5+F8GoS9u5J7ridTgh+G8pNkpXWPd4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PV13roW2XFvrO7A9E40GtLDQj0b5tE3/nEJDeAtyQpihpBMoHxFyZjUEd/4iAaNDP
	 PqhXHaRi7lE7mI6zpS34jCQnkrWm1vZdRjpr0/Cw/vGP+77DtF8Sf4JIypYMkIhuHB
	 CdyVTa+XTxyOJQfpIGVAlBaaIUVMqL5HVLjU6HbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F630F8015B;
	Thu, 16 Dec 2021 19:03:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8162BF800DE; Thu, 16 Dec 2021 19:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CD5F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 19:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CD5F800DE
Received: by mail-ot1-f44.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso29904789otr.2
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 10:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QQ381WmSY1ABB0mZ35OvJqIYgZKiMipXpNULkZCKiDs=;
 b=efjaPbBEgotAjsmSWrvJHN5VCT8jdOPV8R2NQJsu8IYenscTm9ZDy8yAjkbm54Sgrr
 n4vIXW7fp21gF4YXLOypkEg9xq6pq2iQLIQECJGb8js5yI4cUR3jC932zO5jf54OXK0U
 5c584SiwKYI4dhjQiinG+WN4qhxjFpzgrQbuN25CCVDFKVb5ChyedDuSGW+nob4Vg76/
 3Q7kbh+pfdpF6/I+v+MkgXM71+FVXqswBbYmTUtgSDvxHUP7eFqk/cNRxx9POHJO/S2q
 QEPDZISdDtfyZE0Ygo1OeQeOHsvv8j7fhZNQbbdU8nExbUM5CITZCPQj7JP+Ax+GeJRc
 6FoQ==
X-Gm-Message-State: AOAM531v9N90B4zE3O9cqwubAgC28Q4vcgkx/DgnWmaIkpn7VETjtDKe
 o30Ma4tnvwsFIIj0qy6tDg==
X-Google-Smtp-Source: ABdhPJzn4BW0cemeZqsl+FNsr2G5s9GTvWt8pmx801Wgc8bSgOFAmgz/5Jg2e2++4y9spe8ck1jRZQ==
X-Received: by 2002:a9d:3af:: with SMTP id f44mr13345289otf.271.1639677775334; 
 Thu, 16 Dec 2021 10:02:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h1sm1146543otq.45.2021.12.16.10.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 10:02:54 -0800 (PST)
Received: (nullmailer pid 485016 invoked by uid 1000);
 Thu, 16 Dec 2021 18:02:53 -0000
Date: Thu, 16 Dec 2021 12:02:53 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: qcom: sm8250: Document
 "pin-switches" and "widgets"
Message-ID: <Ybt/TagtH9iDv4mu@robh.at.kernel.org>
References: <20211214142049.20422-1-stephan@gerhold.net>
 <20211214142049.20422-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214142049.20422-3-stephan@gerhold.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

On Tue, Dec 14, 2021 at 03:20:47PM +0100, Stephan Gerhold wrote:
> Some sound card setups might require extra pin switches to allow
> turning off certain audio components. There are two real examples for
> this in smartphones/tablets based on MSM8916:
> 
>   1. Analog speaker amplifiers connected to headphone outputs.
> 
>      The MSM8916 analog codec does not have a separate "Line Out" port
>      so some devices have an analog speaker amplifier connected to one
>      of the headphone outputs. A pin switch is necessary to allow
>      playback on headphones without also activating the speaker.
> 
>   2. External speaker codec also used as earpiece.
> 
>      Some smartphones have two front-facing (stereo) speakers that can
>      be also configured to act as an earpiece during voice calls. A pin
>      switch is needed to allow disabling the second speaker during
>      voice calls.

This all makes sense, but how that translates to the DT properties I 
don't have a clue.

> There are existing bindings that allow setting up such pin switches in
> simple-card.yaml. Document the same for Qcom sound cards.

And that description is equally as bad.

> One variant of example 1 above is added to the examples in the DT
> schema: There is an analog speaker amplifier connected to the HPH_R
> (right headphone channel) output. Adding a "Speaker" pin switch and
> widget allows turning off the speaker when audio should be only played
> via the connected headphones.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

But nothing new here really, so

Acked-by: Rob Herring <robh@kernel.org>
