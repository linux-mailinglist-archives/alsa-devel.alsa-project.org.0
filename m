Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D5C8D65
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 17:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9096167D;
	Wed,  2 Oct 2019 17:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9096167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570031468;
	bh=mzO6E6+hCZUVtfQHD3Wat4LqCdnWbotMDz0kioD4wTk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1zm9eZhySQZXnEGz2RBMcRg+MGfQQTmowioUF/FCtaWU3KYnY4HPO0Vi4ICNFlIB
	 BXfeP+DVQumEcN7SijimveruxG8v5YfBbapvZ4OeoII/2vQGGakTXmoNGYvI+eyfvL
	 Ar4J5vbhvt0WfrrlaR/74imuBs3bjK9vNYQz0eSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F38FCF80391;
	Wed,  2 Oct 2019 17:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 115BBF80391; Wed,  2 Oct 2019 17:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 853EFF800DE
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 17:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 853EFF800DE
Received: by mail-wm1-f67.google.com with SMTP id b24so7490747wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 08:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hgUS28cg0Ci8+dU8EWiIp1hr9/xKokLLrdm7CPLWAvo=;
 b=FHyWW4puQb+KXzj1KT9eZv8T1/13DRUmDuJuYYxpw9UAgi6BCQpNxeB8IKnrIQzqbS
 8QEieoiUDd9WmmCst8HxE/09ZOX2jE029QNQ/ndIe0cg+tTl1QWfdvLsnpoMSL9UUhQc
 gd3l3Gz10Kg4UwJBW9FfP8ND1KrZDwlu9IfXjvEoteJFkzlKxvNXTuI9howyIdMtbCK4
 dKZgjFVRlkuXpZNgoJv2fLrfy5+3v/MBnOV0CyIly7nWf5//mw8lMk3VcPE/OyAvSYIw
 dE34DLRu5YyCP2qepWlSwg7kobbIartqBwdWZtMUTd492tc+SdwkEbim4YvAhwYFt0ve
 nfQg==
X-Gm-Message-State: APjAAAV4QCuKmt6m8QktZyjT0aGzqIy9nB5VGzsUWQq4l0b6PTyUpKJ8
 QSJU9zStkVym2HrJ3YCyK84=
X-Google-Smtp-Source: APXvYqyTeEy+1KjEAYvX0VNyGdGx9sODUOSxgNLAZ2aoIxasQFGDO/mzpLVaIyqmpgn0Y5MQ2y7OYQ==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr3554413wmj.81.1570031357494; 
 Wed, 02 Oct 2019 08:49:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id p7sm7527991wma.34.2019.10.02.08.49.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Oct 2019 08:49:16 -0700 (PDT)
Date: Wed, 2 Oct 2019 17:49:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191002154914.GC4072@kozik-lap>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920121525eucas1p27562c205c41200221540b720c9084fb4@eucas1p2.samsung.com>
 <20190920121431.31678-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920121431.31678-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ARM: dts: exynos: split phandle in
	dmas property
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

On Fri, Sep 20, 2019 at 02:14:30PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Change representation of phandle array as then
> dt-schema counts number of its items properly.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 14 +++++++-------
>  arch/arm/boot/dts/exynos5410.dtsi |  6 +++---
>  arch/arm/boot/dts/exynos5420.dtsi | 14 +++++++-------

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
