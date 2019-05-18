Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A780B221E2
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 08:41:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E01291690;
	Sat, 18 May 2019 08:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E01291690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558161703;
	bh=VG6CjQiu5THTqg58od3SkZra1TH8lPIk67rVgmRzkcA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=irFHeSH3/vjdLgaQ/UncSwMvBcNxw+08MUnped7UMLPZVOseS2011TKaN2s90+UiX
	 78yVV91JUz2/XkvOyk8Wj/ruIYKh7YbesuILmNKPaGFM8/BemAyDChxPmEvCu5yOuO
	 OiBR35PkfEmRnkyGd0vQdwvTBPBhtwY+2dYtnzMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EE6F896B7;
	Sat, 18 May 2019 08:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3CB3F896B7; Sat, 18 May 2019 08:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C03FF80C18
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 08:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C03FF80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dZe0LlJt"
Received: by mail-wm1-x342.google.com with SMTP id f204so8759611wme.0
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Jt5wdJSrUlMimCqzmtUfOwS3RUy8dmQzUxp/EazQ63E=;
 b=dZe0LlJtaGjmsxFrB3WS6yfJAUdNu7yGh2KfFAhFjOYxyhAu7hRONM2EoZfpL0aWFy
 BBmbRuFArOn2ofe65BDJg19HRDus/FpRJeh1XQfc9P584bczswF4q7C3NjGvZX7PtAe0
 1AF63pWP3P7/pQjatnOvogqaAsIJSL+HnvxVPhzCWE6Bp3DyQwUv/nPPtejN6uRkVdlT
 1iglk5nzNJaG0BovJfM1R3QjorFnB2LqdpYIQc5ROPQxmmyoyO6HStd8E+Av/17J2HzV
 bVc4WGuIUihZx3DmekjIjr/Cr9j1yhy4xTAwGFeI1ZXHtQKpYF7vDDHi6PoI93tstccv
 tugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Jt5wdJSrUlMimCqzmtUfOwS3RUy8dmQzUxp/EazQ63E=;
 b=kUkM8rTpE/gNO9P2BTmX41vb4dUyhCUAr25cAFTR1+AScAiv1zD0U+O7ZvKFFyzR49
 zwJ9Ks/RhlHtyN/RmBWEixXoaMVFEVxfNPn6iINAewyTr0DfMSBcewEwqrFPELx51pLK
 B7DwKCdew2g8gmefbOisRaFUBfU9oVWgf/Cb4hdJzTjHLSal7MCXuWEsrFB4RCxA60D8
 a6Ths5NuAJcpQxh78/emPrHaEg3RlES9owNilfNFngI0X1Um0ri7uNqS03A6M4aHtxjd
 XM/tXHSDzj7r/gLc7UwsAHkrlT29JBdf1aQ799oLUFZUp9YhxWIsWdD1pYaiMl+BugTH
 oUMg==
X-Gm-Message-State: APjAAAV3Oxx5WpxeS7jRvDktXbEhz9qNp8O364W1yS+4y52pDaOw9b6P
 A6G9roR5XoCwIvhUpeMAItBHjA==
X-Google-Smtp-Source: APXvYqyMF2eXS8TN2xbzmW4LOMI5WZiw2Jc5lr+yU/TJnKmJrKCVrjm4QEnP4KX7m2d6GrlabBihHw==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr4655773wmj.41.1558161590908;
 Fri, 17 May 2019 23:39:50 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id c63sm11476790wma.29.2019.05.17.23.39.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 23:39:50 -0700 (PDT)
Date: Sat, 18 May 2019 07:39:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190518063949.GY4319@dell>
References: <20190509211353.213194-1-gwendal@chromium.org>
 <CAPUE2ut4OUhrmbx6n8KCj7+ghXmC9iMnxGN8DMvyvZstznwwng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPUE2ut4OUhrmbx6n8KCj7+ghXmC9iMnxGN8DMvyvZstznwwng@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Jonathan Cameron <jic23@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gRnJpLCAxNyBNYXkgMjAxOSwgR3dlbmRhbCBHcmlnbm91IHdyb3RlOgoKPiBMZWUsCj4gCj4g
SSB2ZXJpZmllZCBhbmQgbWVyZ2VkIHRoZSBjaGFuZ2VzIG9uIHRoZSBrZXJuZWxzICgzLjE4LCA0
LjQgYW5kIDQuMTQpCj4gdXNlZCBvbiBjaHJvbWVib29rIHVzaW5nIGEgc3F1YXNoZWQgdmVyc2lv
biBvZiB0aGVzZSBwYXRjaGVzLgo+IChjcnJldi5jb20vYy8xNTgzMzIyLCBjcnJldi5jb20vYy8x
NTgzMzg1LCBjcnJldi5jb20vYy8xNTgzMzIxCj4gcmVzcGVjdGl2ZWx5KQo+IFBsZWFzZSBsZXQg
bWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zLgoKSXMgbm8gb25lIGVsc2UgZnJvbSBD
aHJvbWl1bSBnb2luZyB0byByZXZpZXc/CgpUaGVzZSBzZWVtIGxpa2UgcXVpdGUgaW1wb3J0YW50
IGNoYW5nZXMuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
