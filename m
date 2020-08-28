Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E725825586C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 12:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE1818A2;
	Fri, 28 Aug 2020 12:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE1818A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598609496;
	bh=hLcOiWv7gVT/57aIvz9r1jKsdI7Dgu59sKwWTrynUuc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldxILWBEMGykyqrLDyqhVG1tbhm6hsO+ivJ+XqCY00FChTbhF41E0uo2co1vF4AyI
	 8HAYxKIatGH6C51asv4YISvmBkqAb4OTvqYL29LtPbtris9r8DMqYi0EMDKpO3dMDV
	 wwRQDPoECwzZgcGgdgH5sjiHJMSJd+lKd0/hQado=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 262AFF80299;
	Fri, 28 Aug 2020 12:10:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2757EF80264; Fri, 28 Aug 2020 12:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 408DEF800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 408DEF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uUfsV9bX"
Received: by mail-wr1-x442.google.com with SMTP id h15so743579wrt.12
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bSq5SvyGuEAR7HTW9EkWirck6/mt4ja6XuqM9i2UtcE=;
 b=uUfsV9bX2g2WLFAJal0RrTio5GD0tveUiqEms18A2TFDdY2TayD39/bho6lbBwpEO9
 7OhSIBrYLpMUP/NGPk9jIdS+L6KSJ+iO7HtzJ9m6eNnxrBLQEf//Rzlw5dwJKRBieFFY
 Ro8Niwh+WjPJdFnsWeMkvHdejo+IKspyDCvmNVSkXT93DDFOwncnTuHfl6F+JxvHBVhw
 Ky6wX3T9eIbgxGEdk/t1FPEWfknnZG20Tl/p4r2VeGauWC4IPUNHZDZZma8zwN2xpXLS
 ORhVOduYIDi4qSfzGTMLJw1f9KxEVYCds40B8cT6R+aIMu8jrMtkJp3BX1fz5LyGMUc/
 fiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bSq5SvyGuEAR7HTW9EkWirck6/mt4ja6XuqM9i2UtcE=;
 b=K5rt8HIEVPy50iPGDZfjmD9y/OUAOoafM3nVgaCZiEE2dkdLQm5+929d8fCGNSBhS7
 2e6cL4i7wSHf2Hjm83ccMjVsZsAotyC33Pe7rZdqtWrGR/pXHdvYqNrGbG673TJ9EXv0
 yLxQgBsSsMem547oT8W423LPtf/lRNKytGb/jEgWLwtd+y43bMNZNZsFS+JhjEBY88wO
 oUGqyftVaGpTnYKxcthQyHcqX+X0uWgNYDTgZa+v9f8maQ5KNUxHwYIr83xW5XkKarig
 TMGy7lIOQSFzThk1Y3Vf95B3C2811rbI+8x2qj2u4i6nQAK8hXX+oiEn//31X/LtYTFH
 BPrg==
X-Gm-Message-State: AOAM533z6p1thxK4TndGZ8xD+3oFAEOmc14aThqENTt4jqNfSvuPPOT+
 cb6Z3izYPz2umqsMJ5Dqmpk/EQ==
X-Google-Smtp-Source: ABdhPJyHZPvqQFcx1P7uiUjZgyKst3EX44RhRKQqLGhsYGi70Dj6nTfb9BsJHrslejUACrbZt03uug==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr821224wrw.222.1598609415296; 
 Fri, 28 Aug 2020 03:10:15 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id i4sm1197625wrw.26.2020.08.28.03.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:10:14 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:10:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] mfd: stmfx: Simplify with dev_err_probe()
Message-ID: <20200828101013.GI1826686@dell>
References: <20200826144935.10067-1-krzk@kernel.org>
 <20200826144935.10067-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200826144935.10067-2-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 26 Aug 2020, Krzysztof Kozlowski wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/stmfx.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
