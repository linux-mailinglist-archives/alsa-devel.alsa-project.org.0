Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299FEB7450
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 09:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A40C61678;
	Thu, 19 Sep 2019 09:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A40C61678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568878828;
	bh=Ose4De2dy+Vhbv9x6e0LU+TaOH+VP9XUv6to9bb7aXo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUtqRzHG4YhNy1kVVuXm93aU3SsF3lHAyUQ2R73VDJbOBhLs2m5m7PcrFlHY59tr1
	 wcMcpEVPPMYFkqV7R3RIUhFEVUEQJ97MBSGsWlmjOrqd2Slts7JUMPq3x9/aqUxfJb
	 V5BHfVqlnP7FSknWYMQiJK32YEuDmRcj9z0Khh7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BB5F80361;
	Thu, 19 Sep 2019 09:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C8B3F80361; Thu, 19 Sep 2019 09:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A0F5F80292
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 09:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A0F5F80292
Received: by mail-wm1-f65.google.com with SMTP id 3so2703036wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 00:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y6zSWuxS8jgyDbyMqezvXVURezmzAxVKdd2OMOE7VDY=;
 b=pAdkWG5lxDZfugSx689zy18MuphaxtT1bepLja/FFb2kdaQiQnMXPBdFG9EYRbT56X
 IUNJ87uGJYepmpl4eBzwQovMq4isgV8uzyDuu/smHKJpD7sLsb6tRhJ1vJ3EMaIgfdir
 kDE9VcNXqF1uoGXTfGodRfnzhu6eELLmGJJIJIp2Jub2nC1K7iHYDRtqNP5IRoEIhKtL
 uq/9vkoU8kKN6lv2bpBduOh3RBJhwYKsoH3cbn2saSBjBPGSj2u7CBX91bEgKgewkUja
 EclTNKOukVzLF3JlgYf5RI5gWIkE2vFYqNjISGtZ1PV9hPXqrI8QVwDcVF+6IaaHJ1PL
 V4jA==
X-Gm-Message-State: APjAAAXgmTYemhUFqgyUBgwb20d9maBqDXdYF680s4T8wFmnUgOks0Mr
 tr7tbJtv4Wq8FiTJWQlY0ME=
X-Google-Smtp-Source: APXvYqzeq1U2LjJ1HD4/VWXclkN5qptlSoaU/lte93RCCam6t7j6L/Q8uKt9u97GzYcvPFW7th/KiA==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr1515680wmk.17.1568878715640; 
 Thu, 19 Sep 2019 00:38:35 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id t203sm6892411wmf.42.2019.09.19.00.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 00:38:34 -0700 (PDT)
Date: Thu, 19 Sep 2019 09:38:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919073832.GA13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104653eucas1p2e23ccbd05b3b780300adc9f4cb7a4c49@eucas1p2.samsung.com>
 <20190918104634.15216-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 1/9] ASoC: wm8994: Do not register
 inapplicable controls for WM1811
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

On Wed, Sep 18, 2019 at 12:46:26PM +0200, Sylwester Nawrocki wrote:
> In case of WM1811 device there are currently being registered controls
> referring to registers not existing on that device.
> It has been noticed when getting values of "AIF1ADC2 Volume", "AIF1DAC2
> Volume" controls was failing during ALSA state restoring at boot time:
>  "amixer: Mixer hw:0 load error: Device or resource busy"
> 
> Reading some registers through I2C was failing with EBUSY error and indeed
> those registers were not available according to the datasheet.
> 
> To fix this controls not available on WM1811 are moved to a separate array
> and registered only for WM8994 and WM8958.
> 
> There are some further differences between WM8994 and WM1811, e.g. registers
> 603h, 604h, 605h, which are not covered in this patch.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/codecs/wm8994.c | 43 +++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
