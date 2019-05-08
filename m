Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9517356
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 10:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329A418FE;
	Wed,  8 May 2019 10:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329A418FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557303074;
	bh=uRWJ+opfNshW7MoK+fNSKGSxL2E4FLQ+wAKDuBhe7c4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nO0tA+s6zG2+1PEyi5T+/EdNXgOw7VjrxEjjyL4hFNxlVPXPSnq7BYSwB8rKE8JQJ
	 VEmUvYpuLQzMbNcTCXiPOwYPuxMFLWW4kZUTjHBsIJRz3nm5RwJuhrtPTPg1siOEhd
	 f9I9QN7K3zA484xct67if+1VvMCcxwWxXbRuvkMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E85F89715;
	Wed,  8 May 2019 10:09:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF5CF8970E; Wed,  8 May 2019 10:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B82BEF80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 10:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B82BEF80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="pcmjCkM2"
Received: by mail-wr1-x444.google.com with SMTP id o4so25926517wra.3
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=fxFNIEA7V7ZTCYue3C9CGZ6JTXB6kcJzDAiUiQhZtzA=;
 b=pcmjCkM2jD1XewDN3VhIEI63Qp4BoAQ6NJySwkHFRHbzYPzhRhWaSxwD39xBosPhvV
 IexZw+1R9w+ZmujpBaSFfhsnD096FyhuS7+5uOdr7Ao3MPEwR+dT+aJvhEqxAHGXpmeL
 4GC5KiLO6Anv4Rc05gjNqwCyWwhXRrwInZovJUU8yOj1se8oExjvckYrGt2NV94JDI4j
 PcXdSoYEF4qVoIoIjuFq4Hqt52mIVdGGNeC/QmXlVSjimOoyxJwOnpBVdPyXzanIxpYt
 mtggrUDUa61XgmSSUhTQ2a1XYHDtUMsmVk3a0DJPfAt/u3wE6iYLaU7N2fq3aHbqgh9t
 MsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=fxFNIEA7V7ZTCYue3C9CGZ6JTXB6kcJzDAiUiQhZtzA=;
 b=DMHvv0f7i5ewONcGigRdTNVBFu95tXqa4u9g8BrPaiF5oBxwZRN/LXAZQfuyf/GKPc
 Xh6GKQBoIGuvbpP39vE9RG4N4VXrLRWV6zRPzmvbEg6p3WEmOtyRmHK2wAfsPbHSnB4/
 jdNJhaXViAfc59pO2IleuuyFVg5GnB0izqiFk1KagH5cKlSGkCUqNCHvCSujLY62HTPB
 HeyknNAoJSWlhDxN5WejshqAykDHCVOsNGffXOk/oihBxZxqYVPaWAyZ0o237XxQMX3n
 OW2gHeIPJEHHdMlLXaDxuJf8puN7gVlN1u6BXcTAcHJyWm1gTEclkWXaP0z5waTJxPu5
 1yiw==
X-Gm-Message-State: APjAAAUPN0gVtK19c86n4WMmJ3cWRECu/eeCrINFwZGRbq97nVZu81tb
 lp6vMxN/myu2NZ2De6h6USEUYw==
X-Google-Smtp-Source: APXvYqw7wQtH4AXjNUiDLs2Zh6bWTvzpqq77mI0gNIJaWkzh+2WDHnNjEzVb4o/1mEThOBfHwGBogg==
X-Received: by 2002:adf:b641:: with SMTP id i1mr25882376wre.288.1557302940061; 
 Wed, 08 May 2019 01:09:00 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id h123sm1635385wme.6.2019.05.08.01.08.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 08 May 2019 01:08:59 -0700 (PDT)
Message-ID: <08ee1bbfb5ae15b5cb2bd421abe6979b83097553.camel@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 08 May 2019 10:08:58 +0200
In-Reply-To: <20190508065016.GP14916@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-2-jbrunet@baylibre.com>
 <20190508065016.GP14916@sirena.org.uk>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] ASoC: hdmi-codec: remove function
 name debug traces
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

On Wed, 2019-05-08 at 15:50 +0900, Mark Brown wrote:
> On Mon, May 06, 2019 at 11:58:12AM +0200, Jerome Brunet wrote:
> > Remove the debug traces only showing the function name on entry.
> > The same can be obtained using ftrace.
> 
> This is not a bug fix and so shouldn't be the first patch in the series
> in order to avoid dependencies from it on anything later in the series
> that is actually a fix.

Sure, I'll re-order


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
