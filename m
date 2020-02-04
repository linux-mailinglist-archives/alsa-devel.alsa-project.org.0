Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8ED152134
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 20:34:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F271685;
	Tue,  4 Feb 2020 20:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F271685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580844849;
	bh=YcLgXjpK0DF04viozaOZv+ykJROQIQ5+4VzcZr6CCu0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBRzrgQXw/SpxJS/mAG8XUVH5Xx0V8Qd+9zcTuBXbAm8S9mtKua8jxR4R50Ntiya1
	 rjPo079++8O3oW1Lf0tEHqNEWbLt/KCRJlG5aPcfhcfsEFUeZK+wRwLp7XCem4ph6U
	 KTU8yjaRUjeQOCZVMXoaR527T6q+zX4MPvJfsdtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B23EF80051;
	Tue,  4 Feb 2020 20:32:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E11F80162; Tue,  4 Feb 2020 20:32:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C60E0F800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 20:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C60E0F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mWK4nea1"
Received: by mail-ot1-x341.google.com with SMTP id 59so18257191otp.12
 for <alsa-devel@alsa-project.org>; Tue, 04 Feb 2020 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Et9pRiR1Ma9sl4dJgbbua/nMtmbzH7oTYgwDY47X7gk=;
 b=mWK4nea1vZ+jAlGOExb5wDwpAZ3JWzhU5OdQ8/31S3QOckRF2nYpYo6wWHBDYmVM4j
 MDthJxcFcL/zDT6gYv5DHan4HE3uI3+QrFYOGCUZQx6XENcty1le7xnHUpfu3GPP6A5Q
 zD1HMqARhWC5qO0rwcMm0qVwyVm6espiPRjn1S1kadtT50muRqMQFTPisCGAeCYIXU3U
 XmoG1NdhWw9VIy4/MrBAPmP+rVMk9bPFw2moHnlh+iEbv78d7GZC0NQ6DXeD5ou3lX0H
 4InqYTjATU6AbgeIXLM+1PChmJPFJrwYQnLl6GNPDTwSRhDlNnY9gDPkZauDc0jB0H3G
 VD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Et9pRiR1Ma9sl4dJgbbua/nMtmbzH7oTYgwDY47X7gk=;
 b=nCdQaGJQLEdVGcDYBXMM59AgcFL7hfIsyGZga2rYug5tAgHMux2Bw9TZdpufBP79Si
 0cl17C4fQA5SMO/Ajug5bBYpUta5GvpOu3BPRvvNHj0zMQjVrIQrK1MfSkED+Je4bv6l
 vNRxu1YX9mc1dz9Tver0QjrPZDSNJphYVwULe1VZ0WJJkblYeSACP60dRc5ARqbS+BUe
 Wo/VYa+7S5HCXYEr2CibUvmxEx1xLoc9MXGcnEFDL2UkC4f9P1szRjxtSEOHS6+4+Mck
 hirMWVkGqSSpwPPcPFdFLc88NPV0NiFUZuar/zEyGjLCjKKJBSeHm4uThbyOqzHgFTM/
 /zHQ==
X-Gm-Message-State: APjAAAWqYD8j/MN0hcNuFtU+vOh3nb+Ce8sddEIiq+3rNmQ0ypNtrTvH
 WRLUJSPAir5vTnMLilMRERU=
X-Google-Smtp-Source: APXvYqxQ67LpNhXsPEsg9KZN32c1olOPxSz/GZrtpkwwa1ocuWDNEP7eW11vQi3Lai5XLFsN73GBAw==
X-Received: by 2002:a9d:588c:: with SMTP id x12mr22627232otg.2.1580844736997; 
 Tue, 04 Feb 2020 11:32:16 -0800 (PST)
Received: from ubuntu-x2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b145sm3997400oii.31.2020.02.04.11.32.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Feb 2020 11:32:16 -0800 (PST)
Date: Tue, 4 Feb 2020 12:32:15 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200204193215.GA44094@ubuntu-x2-xlarge-x86>
References: <20200204060143.23393-1-natechancellor@gmail.com>
 <20200204100039.GX3897@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204100039.GX3897@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Remove some unnecessary
	NULL checks
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

On Tue, Feb 04, 2020 at 10:00:39AM +0000, Mark Brown wrote:
> On Mon, Feb 03, 2020 at 11:01:44PM -0700, Nathan Chancellor wrote:
> > Clang warns:
> > 
> > ../sound/soc/codecs/wcd934x.c:1886:11: warning: address of array
> > 'wcd->rx_chs' will always evaluate to 'true' [-Wpointer-bool-conversion]
> >         if (wcd->rx_chs) {
> >         ~~  ~~~~~^~~~~~
> > ../sound/soc/codecs/wcd934x.c:1894:11: warning: address of array
> > 'wcd->tx_chs' will always evaluate to 'true' [-Wpointer-bool-conversion]
> >         if (wcd->tx_chs) {
> >         ~~  ~~~~~^~~~~~
> > 2 warnings generated.
> > 
> > Arrays that are in the middle of a struct are never NULL so they don't
> > need a check like this.
> 
> I'm not convincd this is a sensible warning, at the use site a
> pointer to an array in a struct looks identical to an array
> embedded in the struct so it's not such a bad idea to check and
> refactoring of the struct could easily introduce problems.

There have been a few other bugs found with this warning:

9fcf2b3c1c02 ("drm/atmel-hlcdc: check stride values in the first plane")
44d7f1a77d8c ("media: pxa_camera: Fix check for pdev->dev.of_node")
8a72b81e6df5 ("isdn: isdnloop: fix pointer dereference bug")

Other static checkers like smatch will warn about this as well (since I
am sure that is how Dan Carpenter found the same issue in the wcd9335
driver). Isn't an antipattern in the kernel to do things "just in
case we do something later"? There are plenty of NULL checks removed
from the kernel because they do not do anything now.

I'd be fine with changing the check to something else that keeps the
same logic but doesn't create a warning; I am not exactly sure what that
would be because that is more of a specific driver logic thing, which I
am not familiar with.

Cheers,
Nathan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
