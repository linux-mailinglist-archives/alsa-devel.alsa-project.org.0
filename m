Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A958CE0A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 20:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC26210E;
	Mon,  8 Aug 2022 20:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC26210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659984794;
	bh=509Vlh0aaasSIvnKS+Wl7RWhla5F0k13Qa/Ysf/hWIQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAKP+P3gSY42v+bBDw+zh0IIP7jig523u1yb/OA47P/5DGFXzcrfe4W1261112zoQ
	 FGFDadfkzK3+ZnwcFb2vcxbObsC7t38gu3Ba3JCSj0LCkScbXwe6z+Gi+oRzChGETt
	 Xlw7/3kcxTVWAcLEtJ6vA4XkTH2BADV/ikcn+jJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 563F4F800E8;
	Mon,  8 Aug 2022 20:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607D0F8049C; Mon,  8 Aug 2022 20:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ABB2F8013D
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 20:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABB2F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QxKtOC/c"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 694C3611AA;
 Mon,  8 Aug 2022 18:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFE7C433D6;
 Mon,  8 Aug 2022 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659984724;
 bh=509Vlh0aaasSIvnKS+Wl7RWhla5F0k13Qa/Ysf/hWIQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QxKtOC/ccHzrXIeZMLSlvQph5yP51eHmcmjuHBs9Rm+3R7M7hKtWEqkr0g9jsCtF2
 1IdikxPNDR5kSThNTeqGfE3dSPLwwBvL0HaG84/TVtuBsIY7BguX/mSC7/qX3XrGOo
 AYClkonIzyrgrJO3OHqxafNecB1zeyCdz9qS6VH34b0Vub0dOtQyxDWH4yvLvrHglW
 ZCP5NXAn/WfqBAqUa3+dTpIRmLBfJcugxLcOt5WDgG5uPMBobus3cmPDdF6fcIsj4W
 B0zrapECVlc01kIbz57H55MXRkQJ31ffWOSIg1yXJ68vL0J8Hqgc4FGpHr6dvEGO4H
 CgKm9GuZUy5gg==
Date: Mon, 8 Aug 2022 11:52:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few
 stale maintainers cleanup
Message-ID: <20220808115202.3175eb1f@kernel.org>
In-Reply-To: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
 Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 linux-hwmon@vger.kernel.org, Robert Jones <rjones@gateworks.com>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Mon,  8 Aug 2022 13:47:07 +0300 Krzysztof Kozlowski wrote:
> Several of the bindings here had only one
> maintainer and history does not always point to a new one (although I did not
> perform extensive digging). I added subsystem maintainer, because dtschema
> requires such entry. This is not the best choice as simply subsystem maintainer
> might not have the actual device (or its datasheets or any interest in it).
> 
> However dtschema requires a maintainer. Maybe we could add some
> "orphaned" entry in such case?

Integrating it with MAINTAINERS would be another option worth exploring
although slightly tangential.

How do you want this merged? It's all over the place subsystem-wise.
