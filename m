Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A64826617C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 16:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AB04167A;
	Fri, 11 Sep 2020 16:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AB04167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599835693;
	bh=HRfFjDvRE3Y1G/dU9gHF3Q6FH9eUzpiD5TRGNq1jAZA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vwk9BnCVIT+xz0bzWjWaxOwUlzpLMhy+Ltm0Gi4Zn+zFD7YV2kc8BqAXaj5uce32u
	 6Bij5SCeiBm4XnuqbyWhWzgz+P694VOL7TrERNpfjpK07kGEMyvlbwxIqUFpx8yNDb
	 9SNvzyud+s+Mo0W9LersoNVfgShRp6RhVMjR4n9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B94F80240;
	Fri, 11 Sep 2020 16:46:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03C5FF80227; Fri, 11 Sep 2020 16:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B2EEF80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 16:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B2EEF80115
Received: by mail-ed1-f65.google.com with SMTP id w1so10257889edr.3
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 07:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0ZsoGj1RzPrf2TRsjqQZWuaKEAUJYQqnu3wsCh7rZCw=;
 b=GCuLmZ5kK1ObK7ozX726eZGugWkIrZjXKfNFNcKqKA+YtPVoeIeraruKwve6iooRqF
 l/SwT5O0dKkVS+wS1UjTEEOGdAJ5BI67BLuJgt5Ks6Oq9HdMsJthHHbJgCkQ2Hsx7gvs
 vjWEJjjQsmgvdi8PS17RbK5YZEyGYecc+ntW1Xxl1IWg35eGX6mCq3tmWKhVCpnMcrg0
 4aRY4kJwj6qZunNifTVJj8e4LMrVZmu+uVJXXRWr2ETDnFqDFxKs5cGAxpq+9521wsoO
 oeq5MYRudgGLOC4WEhmhBh0AhzoEPmhXSk1t9tQBm5Nfzjr4IwtM6HPQsoLkPmokcgDS
 WUeA==
X-Gm-Message-State: AOAM533mAbneu9O7cRK3oxDOOxvaoZ/S+31WFQ4LApCCDWx6XH8Ofj/t
 r2kt5fMi7oOo0sVppbvxTw4=
X-Google-Smtp-Source: ABdhPJwZHiY5Rfa19iuLEAR/VPmA/pAeV2n2uyQ7Ar6ijYqLwqvPzkQh/DM3V9GvYiSZDa+BoTXlCg==
X-Received: by 2002:a05:6402:78b:: with SMTP id
 d11mr2469596edy.341.1599835573944; 
 Fri, 11 Sep 2020 07:46:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id d24sm1818951edp.17.2020.09.11.07.46.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Sep 2020 07:46:12 -0700 (PDT)
Date: Fri, 11 Sep 2020 16:46:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: exynos: Remove undocumented i2s
 properties in Exynos5433
Message-ID: <20200911144610.GA15290@kozik-lap>
References: <20200903203250.19830-1-krzk@kernel.org>
 <20200903203250.19830-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903203250.19830-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 03, 2020 at 10:32:49PM +0200, Krzysztof Kozlowski wrote:
> Few I2S device node properties were not documented and not used by any
> of the drivers.  Remove them to fix dtbs_check warning:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@14d60000:
>     Additional properties are not allowed ('samsung,supports-rstclr', 'samsung,supports-tdm',
>     'samsung,supports-6ch', 'samsung,supports-low-rfs' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ----

Applied.

Best regards,
Krzysztof

