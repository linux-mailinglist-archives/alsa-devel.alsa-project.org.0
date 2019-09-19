Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D89B74A8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 10:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A5D166F;
	Thu, 19 Sep 2019 10:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A5D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568880133;
	bh=XuDzjmfkD3BtNct9rzrVUeOqJXPPnXb5rsnD4I1SsrU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+qEFpKcTPibhz8VQ7I3B8dCYbRZTgov0b1q5B1HxgN1HcHN1jyiXjjyCBFpp+3lJ
	 FDyQAbO5sQQ8BAjlCLnqu42cRYceh/AlVKsKmhzyUlbDbfG2RJIPzq0yuPx461w9il
	 qA4Unk7/lX5cPbZBosUmqLLLIU71/wk66osnD8K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A75BBF8048F;
	Thu, 19 Sep 2019 10:00:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FEFF80292; Thu, 19 Sep 2019 10:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68874F80292
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 10:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68874F80292
Received: by mail-wr1-f67.google.com with SMTP id v8so2032399wrt.2
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 01:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XYLP8EKg1aWYrdXosmUlGT0i0haeJe1I34kspHyVEH0=;
 b=a0CYbbho9KBkg82LLpBrsJBbtoagtcDszPQYAJTnpSYvR2fRW1kWY4Ay2bbLmRJnEE
 qxicA4ixvDTyMHc6kS6pICCTNyfB7EHFxdZV6x/l8nsHj8pculPcJbyKnUhn3MAvVSpy
 PAGiPzk3FEpINgsTudoGlBGKg/3w4eq0cxpIzDiqJFDhqH97Z8yttbtVBot8T6ezKyan
 JQ50ZXalM4Qmo8zR5CMEYMpbQnwMKa7hhzPqKRd4Gizcsqv6tBhokYMDoj6bKWcPaQjy
 sZL4Lwfu3LlTyd5Y6ScKylm3aPld9dzQurwpYnFhKDDkCjZxcfexWryehAeh26n4lFWk
 oPeA==
X-Gm-Message-State: APjAAAW2PrQHkYXQlITAOA6i+EjxPoIysux4T1B0VB9Vlyfr5BkZpj/S
 LIGgjGFHxPXTF/Nfr0HAqxs=
X-Google-Smtp-Source: APXvYqxkZJuMnz/5Yv5b+cZRtdqNk41lsPPfWQ5dJ873pZVxw48691hLCmWcac5LtqPWpbV9fXoJ9Q==
X-Received: by 2002:adf:f50d:: with SMTP id q13mr6370586wro.187.1568880025167; 
 Thu, 19 Sep 2019 01:00:25 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id u10sm15346109wrg.55.2019.09.19.01.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:00:24 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:00:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919080021.GC13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104658eucas1p2c1f07d3e8b915d8c3a448b80d2af5df0@eucas1p2.samsung.com>
 <20190918104634.15216-4-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-4-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 3/9] ASoC: wm8994: Add support for
 setting MCLKn clock rate
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

On Wed, Sep 18, 2019 at 12:46:28PM +0200, Sylwester Nawrocki wrote:
> Extend the set_sysclk() handler so we also set frequency of the MCLK1,
> MCLK2 clocks through clk API when those clocks are specified in DT for
> the device.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
