Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F44B8657
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 11:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10EF21922;
	Wed, 16 Feb 2022 11:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10EF21922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645009177;
	bh=APDj2JQowla5VN9wgYQvqEBkeDwB1AQlKi39bfuox6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gWIUxk7KvZKQzaL60jF499M0aZsKqPcFcy4/CgVT+lB4rOkM1eWhf6ChsjcESTpWA
	 BOiZ+dUYOhRY1B8s+tHGshVS4CojSgt9jyX50bS0TEUDT7uBzpwVAVHxU/MsQagPWm
	 5ToGyyzP4bGFAzrqj79hkoH6ECnT31mrTAX4yOkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE05F8012E;
	Wed, 16 Feb 2022 11:58:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09987F800D8; Wed, 16 Feb 2022 11:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18B12F800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 11:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B12F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="fd5QC5V+"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F12E640806
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645009098;
 bh=APDj2JQowla5VN9wgYQvqEBkeDwB1AQlKi39bfuox6w=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=fd5QC5V+cESXhKdtBRnGjOxYs20VglPL1pDLyYUP9lm0u8bZeMq4dXrPhHE+OqAmP
 EcPEI4jjAm8HiRnnCDG92wjAPQ14VZQPBeB6t+4C2F4AdQ2vGWH3xb5HiZdL/1kXYo
 d6MCwTp5LWtPBlOgt198cFRZ8Dtlp6fY3iVdeOVZeb1xjxVJj0wTQiV6nzwC+8b579
 AFzRla9L8jwSz4j0fklCcBSq8tHrVqQZQNVjYRpT9nstAQlSlxkiz1ybsO8Y9FbPrP
 +WiKvD1HyukpehHl3aTKNAm2YTAZFjq9/+Y/JMwgO0pZWJpG8mKvH/ADhZBBUMEPA1
 CHkbGU4LsuPIw==
Received: by mail-ed1-f69.google.com with SMTP id
 cr7-20020a056402222700b0040f59dae606so1321936edb.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 02:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=APDj2JQowla5VN9wgYQvqEBkeDwB1AQlKi39bfuox6w=;
 b=ePS9MsNgCG7dpBVmR1lNO2ZdgfhUq/VGhJarmmhaTnFNZCZ9EKgXRGDcGHHvzDG9Nd
 fj+P6AAXDSNTr7Oy9N+0L3X74vKNEpuzXMj4TRu5PB2ooNLxQKtU6SaaARpZPCEPJRAz
 HLRgvevZ7pFcDCDXfgnnZfCBGbifQVKiKPOfa6jCg0lvnusGCftUU6QYo+NnH6n/ECCv
 aDtpTYXVvWPIcKtd/ogus2cVcPDtOo6s24dqoCRor/0YEx/rYpz56OdrxBier9sm50or
 m2ZxbpFU4SCcBxud2iAGNl9XZMWCQcioorrUCD2PVw8kPhjeOuDOZyWMmbv5LYqTSJ/z
 srEw==
X-Gm-Message-State: AOAM5332Y3bIcFRztFw3V+XWB8FFbggKD+KvgOKynuIbFOuJJm5w4baf
 adEpGd4ejEwT9VtHFV4DFpvRZGW7ru6uoNuYR3dFe8+1JN/7vMOnRlRTo6iAvc6f+WwGiLhpedt
 TA4Q4poomYMlQJw74lONm3iSOhj13vcf5/AVZ4jx2fiGnRGie9+lhPymQ
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id
 re28-20020a170906d8dc00b006cfd1d1db25mr1808013ejb.285.1645009098276; 
 Wed, 16 Feb 2022 02:58:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5GVqeYDxf8KFG6ucnyHvzLbGYzH9A2TyOYd9tau6dRiSUPrlEWjw70ZXBEh1BoDUDDU1MjaUHZ/lMRXjFl3s=
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id
 re28-20020a170906d8dc00b006cfd1d1db25mr1808003ejb.285.1645009098094; Wed, 16
 Feb 2022 02:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216092240.26464-1-mkumard@nvidia.com>
 <20220216092240.26464-6-mkumard@nvidia.com>
 <2249cf46-5c54-2e59-f247-5a22f2e6e5b9@canonical.com>
 <DM6PR12MB4435ABC8098A6C3EB2357B47C1359@DM6PR12MB4435.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4435ABC8098A6C3EB2357B47C1359@DM6PR12MB4435.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed, 16 Feb 2022 11:58:07 +0100
Message-ID: <CA+Eumj6UU-WqNckYrE8YMJaSVS_E2KFydPs4B-Q=ESiVZw=QDQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: Document Tegra234 HDA support
To: Mohan Kumar D <mkumard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sameer Pujar <spujar@nvidia.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
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

On Wed, 16 Feb 2022 at 11:54, Mohan Kumar D <mkumard@nvidia.com> wrote:
>
> Hi Krzysztof Kozlowski,
> The current order is intentional to reflect the new->old chip, the top entry is newer chip. If needed we can add comment to reflect this info.
>

Hm, okay, such ordering sounds good as well. :)

Thanks!

Best regards,
Krzysztof
