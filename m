Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7482917EA47
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 21:40:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF1D3166A;
	Mon,  9 Mar 2020 21:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF1D3166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583786444;
	bh=uKIKyE2aDLigjVLzzpTPvrwTJrITxL3fQ1PGUSn/J5Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKXJQ0tPXIC3DlHHYES/nf2Em4xRGbzSmxhEABJMAsmEH+3rY68Qx5+7A+ZSQovgU
	 dvpsrKQvQsx87v9IGlkc4Kd6SDSmsyX4o8M87/GSQZYtmEBeLFmPZFe8R7dMBFttvA
	 4oJkeaXSV8pNCOn9+bTmfOTwnayznxhdTHe6zq/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5F8FF801F7;
	Mon,  9 Mar 2020 21:39:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85BAF801EB; Mon,  9 Mar 2020 21:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0976F80123
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 21:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0976F80123
Received: by mail-ot1-f68.google.com with SMTP id k26so3739688otr.2
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 13:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=movXecPtcFCRJBwb8EpVb7ysHOpf27xnptRbhixi3a4=;
 b=anYaF9zB3v+C4vyNrpr0djac34Ke7dr3lzpIA2B8uqxsvYYNXZ1krqWe4X6/E8RdSN
 kiV8QW+qvZDa00U/5FBVGghRFpx3/hrI2FfCXzDsmMjNkeZtbn/fDPMU2YHwk4QTR1Dc
 px3X7B5dwHl5XqY+D4aVgUGC0g9iSeYYuAl8apd/I718KIHRIPAQ3CKW4gJxjIkmvset
 ZzzCK2KwZFKtdBcA5Ll1cDWbtmymFuCBgx7NJmOAqMWE0gZ1WohpUcW8t+LjE+DKlAUe
 eZuHD2tEZZz2Uv89Bzf7GQxG0dleQ3l0lInW+56STFlhpYmuzbsg889Kp7i8CC2ffpfA
 fcuQ==
X-Gm-Message-State: ANhLgQ03Pwd4eAJscw0uuVgAywaupB4r4cIfQQUWQpe8D2cnN26eOAem
 eoYedk6zqbEcQalzZTNp+Q==
X-Google-Smtp-Source: ADFU+vvLY1vdTo+msfSic/K+4qibHlH1f0qTdVM2N2SfpTods148lywXntMcEmHDYFrgDcR2ILTnuw==
X-Received: by 2002:a9d:4001:: with SMTP id m1mr551258ote.57.1583786329894;
 Mon, 09 Mar 2020 13:38:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q1sm3495874oij.18.2020.03.09.13.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 13:38:48 -0700 (PDT)
Received: (nullmailer pid 31750 invoked by uid 1000);
 Mon, 09 Mar 2020 20:38:47 -0000
Date: Mon, 9 Mar 2020 15:38:47 -0500
From: Rob Herring <robh@kernel.org>
To: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: Re: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
Message-ID: <20200309203847.GA31358@bogus>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
 <20200308142509.27765-7-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200308142509.27765-7-charles-antoine.couret@mind.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles-Antoine Couret <charles-antoine.couret@mind.be>
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

On Sun,  8 Mar 2020 15:25:09 +0100, Charles-Antoine Couret wrote:
> Document the bindings for the tas5756m driver.
> 
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> ---
>  .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/sound/tas5756m.example.dts:23.37-38 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/sound/tas5756m.example.dt.yaml] Error 1
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1251057
Please check and re-submit.
