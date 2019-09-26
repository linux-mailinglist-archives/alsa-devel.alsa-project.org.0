Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860ABEE5F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 11:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18EB1730;
	Thu, 26 Sep 2019 11:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18EB1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569489863;
	bh=rd0XYNjhB1onstSeM+QkOqDH7z845TkYZr6O4+vs3Y4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fc7cvs9f7lO2Z/uCW+HFeHYxXU5EW3W82Jnhe+gONThfJgHq8rGqHNLFTJsz4pwuz
	 oX/pkMUivDjp3KgWKlW7zoTwwaGjDGBV4KYRZ5TXb0giR6iDD6qk6uM75ncFsKqHSh
	 9XL5cem+hVmNlIC3+SnFl04Mp5AA/6QosHsPG1YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 670FCF802BD;
	Thu, 26 Sep 2019 11:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A123F803F4; Thu, 26 Sep 2019 11:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A743F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 11:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A743F80138
Received: by mail-wm1-f65.google.com with SMTP id 3so1753023wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 02:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vgFOGD9cQQzr5aVgS0FXDv/JqrPP7fo8C4YuNbx6MHs=;
 b=t41Go8AMXZEJoxmiLaZc1luufDms65xuAtnAMvKuLgFyuMZyhVhGUR3ZQqkZldn4OG
 aQv4RDsjuKpzoHMEnQtlRxUqvI41F8+5biwUaFQjtKo4ZRtozxGJk0TBHeWW4aG2LZH7
 07I6urUE62a+JYHh3UYZVkCrlwjn2SevTtReIhlPqsBGGRlrr9+1xNJee0ZuV8R0gCDq
 3uMKZ6BAFQ0rd/PclcZyT6AzQ1Bzhzcsxh+3h+fQ6BYMc8Ne5Kq+T+3zoscgmNVFbwWf
 VyZgPGXS/RvGpVCHdgsjStxivhntr8t21DG9JWRLeuBQxD43nlw7ily3iwBFIVS5dMhP
 SWqw==
X-Gm-Message-State: APjAAAXPivfGpH5vtwAbPWFlxeGM/BwFV7qMxzQKeA2YZq9D+Nx5yjaC
 X80E/nbHx9hU92gdOyX9xrE=
X-Google-Smtp-Source: APXvYqwcXhG1KCHaxYekItIcx4iwKZ2ODFV3h1DqGAkuOzX3JiLYINdqNPu7SLDMZd7vv2fm67yFwA==
X-Received: by 2002:a7b:cb08:: with SMTP id u8mr2290088wmj.6.1569489752065;
 Thu, 26 Sep 2019 02:22:32 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id u22sm2238301wru.72.2019.09.26.02.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 02:22:31 -0700 (PDT)
Date: Thu, 26 Sep 2019 11:22:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190926092229.GB15552@pi3>
References: <CGME20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633@eucas1p2.samsung.com>
 <20190925132628.31858-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925132628.31858-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v5] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
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

On Wed, Sep 25, 2019 at 03:26:28PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v5:
> - Removed '#clock-cells' property from required properties
> - Added deprecated property to 'clock-output-names'
> and removed corresponding comment. 
> 
> Best regards, 
> Maciej Falkowski
> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
