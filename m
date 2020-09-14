Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1065F2694CF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 20:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090E81687;
	Mon, 14 Sep 2020 20:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090E81687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600108037;
	bh=R82vW1g1klOGPHfFZDHK495mf5mQfr8bgBhAoaXysKE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tE6H9ylMxEw/AY3iOvuDUK8s+pf510xubLtUBgAVqjNKijki6T5Uf6vnr8/ugn10B
	 UmiBXrWhWgZyEIa//phj3swB6vRflGsZWpuggWoSfz2HYnQvz6zAjWrovRwk9s/VYq
	 zhThDW0yJbcwTcKlYHjCuEaAoz849deedbPyXrU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E953F8015D;
	Mon, 14 Sep 2020 20:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EB86F801F7; Mon, 14 Sep 2020 20:25:24 +0200 (CEST)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 642ACF80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 20:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 642ACF80105
Received: by mail-io1-f65.google.com with SMTP id j2so1114521ioj.7
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 11:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kU/2sZrLzC+Bk/ABMelZP0JnISX9KWlKhr4rvY79f84=;
 b=ZPMpx1f+GBkHUkxLmFPUFYQKbkdAO83vODbIpBCn0gmA7i+rtproVDmhZ0/uAjpX+m
 CP/Ky0CNazucb1pOpnUZq/QwGRj2/tYTaBxazRilp74dElDqxO+xru9CTFSMaGE4t+cK
 SdrFiFa/Oty7Xj9WJ5U77yUGfSOk/EAlrbc4S966qrxnYlwBWQWw/LoitH3cwi9EpSNA
 dNx3y3yQtZ0mrCuUARd70eWavtWY+T/idNhy+IjkKhMMzrhdb5OjmV8NHKSdxVoUmjrI
 HYQ/hUvru7pK3gsXl3IvGbZosTozS/MiCh9H76tNhFGjSy1W+GyYBx5LQMXqaWeO0slu
 caYQ==
X-Gm-Message-State: AOAM5310FLYlSPi/T0pVdqiQgylLPZMPfq9yIAVGHZNm3QeV1sn8+fhQ
 usVCGAej52BWc0hgTo2hxw==
X-Google-Smtp-Source: ABdhPJwVe+zJQsdM1ytThZGYPxVPTrJFjBf/Wy4kmefHouTjymFTaisrIJZzO8Pc2eYtbsGGwf8edQ==
X-Received: by 2002:a02:605c:: with SMTP id d28mr14120122jaf.12.1600107304504; 
 Mon, 14 Sep 2020 11:15:04 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m12sm7331781ilg.55.2020.09.14.11.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:15:03 -0700 (PDT)
Received: (nullmailer pid 4169787 invoked by uid 1000);
 Mon, 14 Sep 2020 18:15:02 -0000
Date: Mon, 14 Sep 2020 12:15:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: connector: Convert Samsung 11-pin USB
 bindings to dtschema
Message-ID: <20200914181502.GA4169708@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-5-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
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

On Sat, 29 Aug 2020 16:24:56 +0200, Krzysztof Kozlowski wrote:
> Add Samsung 11-pin USB-C connector into standard dtschema bindings file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../connector/samsung,usb-connector-11pin.txt | 49 -------------------
>  .../bindings/connector/usb-connector.yaml     | 44 +++++++++++++++++
>  2 files changed, 44 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
> 

Applied, thanks!
