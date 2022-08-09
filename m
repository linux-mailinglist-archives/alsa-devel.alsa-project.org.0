Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148E58DED7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 20:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64DF100;
	Tue,  9 Aug 2022 20:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64DF100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660069498;
	bh=wIuMzWI3SH6GkOhuSmYYKpDVKw+Zt9Rpl0tkIVhn/mc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FuS3mzIz4gUX9l18dsBlho/Bbrkxuh7zy8/bsVNLc3vLLhzDj5vapik0HxYR8mw3A
	 RiMovB9e+MqgkE7aso7jiWLFwQeLfnhtX6rqgj9WwEaI/wyfw9mDRfFV4TAX6fhwLy
	 aByC/msMLIX8OZ/U32NUnqmtlRXRTi65NvFPfJUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50F17F801F7;
	Tue,  9 Aug 2022 20:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A95F2F8016C; Tue,  9 Aug 2022 20:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45AA2F80132
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 20:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45AA2F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j6BUX+q7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9216F610AA;
 Tue,  9 Aug 2022 18:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68EAC433D7;
 Tue,  9 Aug 2022 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660069431;
 bh=wIuMzWI3SH6GkOhuSmYYKpDVKw+Zt9Rpl0tkIVhn/mc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j6BUX+q7nXY1SgQGco59LqQLSMl8PEPNupt+l7j0AExL9vrcU76xMOfdT8gVgy3jW
 n/4aGpHqmENnxcKmYRuiC33wqZ8sfOX5W1SjCiVul7gj0l1MHTUrVxVexLGCNR9TJN
 VyFRySD7qoVn2l+IW+5ZBPKGU1uCf6z5raHWNg7quGTlK/Yo4BoKR71+g3/S0Rx0Qr
 pSufsNurSB+suT2p0BJpmQyvO9XG/DIiPe4T52pUJLvicGvwp7R/+0qKQ7taVioSdm
 Tw+Us95xoH6KScaoHs744A2Lw3GDuiMwtqJ0DjogeagZXLxdzGy7uEdx1h+ul5KqnQ
 Rq6hc0QHz5+Nw==
Date: Tue, 9 Aug 2022 11:23:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few
 stale maintainers cleanup
Message-ID: <20220809112341.7599d68e@kernel.org>
In-Reply-To: <c6b890b6-e72f-0377-f0ae-cd15d29c23a1@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808115202.3175eb1f@kernel.org>
 <c6b890b6-e72f-0377-f0ae-cd15d29c23a1@linaro.org>
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

On Tue, 9 Aug 2022 08:25:29 +0300 Krzysztof Kozlowski wrote:
> On 08/08/2022 21:52, Jakub Kicinski wrote:
> > Integrating it with MAINTAINERS would be another option worth exploring
> > although slightly tangential.
> > 
> > How do you want this merged? It's all over the place subsystem-wise.  
> 
> I was thinking this could go via Rob's tree as fixes for current cycle,
> so your Ack would be great

Sounds good!
