Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4ADBF486
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 15:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4181757;
	Thu, 26 Sep 2019 15:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4181757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569506203;
	bh=nhpZlU0dPKpM/bPwWlObne5IzKKTf1KFfn6c+vqb1Eo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lz4i9G6NOSFixhmPcEyc8AXt6etXXwnB0pluDAIAxe2bCe2Ajt/2oRFUhXKx6eQQU
	 lkZaMUr79eurWrdKU4jPg4y55CG8delY2/s7XZo5SprWPpU3zFqmBPOcxsNWtsCxLE
	 iRdL0Pq9KoCLLhH4+0QrVP2hmDZtZonEtrMdwit8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2190F8045F;
	Thu, 26 Sep 2019 15:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F657F803F4; Thu, 26 Sep 2019 15:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CAF6F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 15:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CAF6F80213
Received: by mail-wm1-f65.google.com with SMTP id v17so2674376wml.4
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 06:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5wV+knHWT3pYBu8f1yGbF2JMv7/SsKIGIbzvgHlj+ME=;
 b=K52KBKsTDzPLlEVR+YMpSWpvV+WXR8OOCem+peKnOzAO5v2aySCeczPlD51F2a8IoL
 z5G/2pWfopcyU8GCH8a3BVtw4pk4y+eQ2Qii3Lzs0hcu5SUHcFmxs5Zn7r6m3B/RYr76
 3DNKtK0ioVRL3Q9WnXvxKQWtT0QTF4nXDHEA+w69/GH1xuQEHOIGLSAnURzjLga/2/PP
 L3WuBdSWqyR6Qkar/0bt/G5u50d1Ge4wxuULw4/fXQ+ZsFDx3vu3o1lnmwp8FIc9Hjra
 HSOrutWibSSbiqYkVZLD76QnaCKN1KmU3HkYeMsQlDzovfVwg6Nb+ghsawrIMJ6MBRqq
 WgYA==
X-Gm-Message-State: APjAAAVPwDTAT2i6Ge4a0BBY/Zf5XLqTHk+0oXyygcKaOx0f/rIGNqm5
 VKt0N3MozNeFH75O5QSCeKM=
X-Google-Smtp-Source: APXvYqxMWSiEBcFYFgkxhkOkbLWb5nMuD3l2ak3ZLUUZEhI7MlrM1L7wlshwHZt+wX2Q+NqzPP5UKg==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr3204892wmh.112.1569506092705; 
 Thu, 26 Sep 2019 06:54:52 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id j1sm6011300wrg.24.2019.09.26.06.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 06:54:50 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:54:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190926135447.GA15983@pi3>
References: <CGME20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4@eucas1p1.samsung.com>
 <20190926120210.8544-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926120210.8544-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2] dt-bindings: sound: Convert Samsung
 Exynos5433 TM2(E) audio complex with WM5110 codec to dt-schema
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

On Thu, Sep 26, 2019 at 02:02:10PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
> newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added type and description and removed number of items from 'model' property.

Thanks for the changes. However still you have non-standard properties
put in random order. Argument that the order follows example-schema is
not correct. These are not standard properties.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
