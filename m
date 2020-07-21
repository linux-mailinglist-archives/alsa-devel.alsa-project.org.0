Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F03B227AC0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 10:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405DC168C;
	Tue, 21 Jul 2020 10:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405DC168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595320434;
	bh=t1Dq6zizvNs+iAZvi3pARp1B8Zckp37NAX8xpdIiXqw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5lb23mxBSEFzd66DhYOpCmZ9xGYG30GNIIsD8Y+pNR3gGYB05GLXUiLYoIsWI7ft
	 wSn/acW4ly7xrX3DoN5Of8/itRp75s2EpQICuOQB6hOijbqIK/S1CKjeUspgSY/3SO
	 V6z0yRD+NWBIKn8ajE/+cAOmMBtPulNs5XEHgUxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC3FF80117;
	Tue, 21 Jul 2020 10:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AAACF8024A; Tue, 21 Jul 2020 10:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECA4DF80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA4DF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YweqTX9U"
Received: by mail-ej1-x631.google.com with SMTP id f12so20769231eja.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M5nbmTePjYhEWelhhJ136ACTnDOYbxv7nimh622ha7g=;
 b=YweqTX9UrhYRJZiYVrc5c7DWMYknDhuRL3IQRLUmxP3vlVVrT783++udBMlVR+pCah
 2//7OzKLk9cwlmhYOEj4up2+ORpMIUB/oa7dJX/SBSDQ9XZQDqYyhWlGkR0wMskxE/EJ
 M6o+0DGsXgV0grnWZ4dafZTeLnD2h5SVaapi0US84AgisT5OsDuxnOVZrSQ9mb6Xztz2
 wE7bclsBGD6jjKPvJ1k5DOvN/cMDdJsrVsfLDQtB6XGnVJktQrFfmCu2Sif2N5gRINQJ
 06DxVoCNdL+d2rG4Lg2hHNtPGqcx5zGSR/Yki/VLQBM+Pe0fc5PDn7VSR7wcPWDRYmBd
 v21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M5nbmTePjYhEWelhhJ136ACTnDOYbxv7nimh622ha7g=;
 b=iH828+UTTFS+DooncghqmjElyDxOgegPHkRKf87gQU2UchPMoxzKgXZe/yn5FHdoxx
 cFQf1NOtw5169pPYlO8i0sTDBZN7/jBnH1xl9z/xdS17jN4BiJEzL11rtI/vtMMqwQGm
 TzFXGl/mVW971z4r7W+Q6AZnjo+Rwk3adeBNZD9DDrr/D6iK+MOryaikF9eJRjvZtZmx
 ASailSYqJ3qF2u2OXsyhEjNcvepFGnWewzNDWSBk25Bz8Qzn5rXzc8uRejQUgnddIIwS
 fxT+xxYmS4cPMDChInjFycpPyoNgIVXzKa7IEVfaKz86gKTSdXfAJWMEcBXCGiAVx8qK
 ZOdA==
X-Gm-Message-State: AOAM533YF7VOJsUEtm5vLNNNJP4AQyNnGKWxjog/Q5JByAOeZOrCfT5f
 7lb0S4TaZ3boT81SdoMT27w=
X-Google-Smtp-Source: ABdhPJw11nS7E2CfrTNNRIxorwk4oLDNlhqvQtwGoaVVGHXqRvW7dq4FeK8fAO0Fp14jlYKE+TSSVQ==
X-Received: by 2002:a17:906:6d0e:: with SMTP id
 m14mr21616314ejr.251.1595320317310; 
 Tue, 21 Jul 2020 01:31:57 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id l22sm16135840ejr.98.2020.07.21.01.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 01:31:56 -0700 (PDT)
Subject: Re: Reference USB card driver?
To: Takashi Iwai <tiwai@suse.de>
References: <b6b173b5-fe9e-32a7-638c-6e5815f28872@gmail.com>
 <s5hk0yxz42a.wl-tiwai@suse.de>
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Message-ID: <8d3e6010-402d-0bc1-61fc-95139f594368@gmail.com>
Date: Tue, 21 Jul 2020 10:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hk0yxz42a.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: nl-NL
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

On 21-07-2020 10:05, Takashi Iwai wrote:

> For USB, basically the snd-usb-audio USB audio class driver is the
> place to start with.  Other USB audio drivers are very
> device-specific, often the result of reverse engineering and might be
> poorly supported.
> 
> Which actual card -- I don't know, honestly speaking, too.  There are
> way too many devices in the market.

Thanks much for the answer. I'll start studying snd-usb-audio and will
try to make sense of things.

Rene.
