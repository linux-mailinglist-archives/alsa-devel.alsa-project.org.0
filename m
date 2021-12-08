Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1A46D30E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 13:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56ACB270F;
	Wed,  8 Dec 2021 13:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56ACB270F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638965411;
	bh=f4V44CJpPmowhBW1vXj5tW/zhkUJ9srFbm6DGA5TSbM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kISGsbd5Cue2BBjoKrXvWg+EMBzUShO+OHTMwb6rGlnC05MtJIGSGUbukwzPx7Yrz
	 mSZNjhRInma2Vklb8RKiNkTo2Jl4un+xDWemxZFAoELmQq8feRLV8QJRFCZvKY57QY
	 Uz8Bp+FLFW8AMMQBlo5JleqYOWAjFX2QowLJdnpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1567F80217;
	Wed,  8 Dec 2021 13:08:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F9C4F80217; Wed,  8 Dec 2021 13:08:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE19BF800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE19BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KQcEugie"
Received: by mail-wm1-x335.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso1621984wmr.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R1D6vu1LwULEAHB02GfzTtDg6CGj6MOMTTzNmc1nbxo=;
 b=KQcEugiexb23klmZMI5tSlYPQm99/Zv4PPINCgHpDwY3fjhv8d0Zyt/TJihnvq0Ubc
 ulosvJ/VXLX1hsUssnt5uBohWJZavOjioliqCxG6+Fd8okWoYwHI2BVepUSR0LBr86HD
 skDjsgdbR4jSE6lb4q4Zlx9xgvaWcPL5d3HZlJwf7MaAII/UBpHDs5GKMn8vC3hcqSa3
 j4/ExVLga/qmDqhXUjoeArZW4LSTad6LvvGw661WNvCjd6p1lh2C7KtyBv3dDjDaftSb
 XhUy+zdWjtjEKSsqIID9dZjM+D3L0QtRBY1Wti5aUSzDt2JGywGA79EdQUO47xDDGRwp
 aTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R1D6vu1LwULEAHB02GfzTtDg6CGj6MOMTTzNmc1nbxo=;
 b=Idg+zcV0AdH+JxiI8bQZTlDhATnvzvD+5U0i+lOzY+6AG99x1PBV/YRZBDNbF7EgPx
 Yw13A5LOOmil8koollgg7zddW1GBVvg31KIOXgMxmVrdcSONKoAIBCi+ChXrHtyFbh92
 fOLnIF7K1S41lJ83GcYN+dpwnraGPpIA1Du2ZuC5ES7FcwyIuY6ywbeT7z/oGUQMntUB
 ICnot1FwxeW4hdWlf8pZB3UIRcOkl6Ep93I8F0ru6/aki9VHpfYPvq1fpq6/TG+/6IfZ
 qymBXFEh7VWkhkkI/mNi6UXcLx8E7ecdbj5RyFcTEEuo+aOrEiLlef1U31h5ei8TplBM
 KylA==
X-Gm-Message-State: AOAM531DUP/7YtYWeHesTPwnBm0EZYzhmQ1KHyE4Am73/H5fjpcS8SGP
 mvX8jxLdFHeqclChEP+JtmegRw==
X-Google-Smtp-Source: ABdhPJwP41Y8jw1WGUE8GAzmHo4vkR9Ff92/aNI150r9LWBWlHejIG/y9c1S8ZGyrHAs6k1jt25u+w==
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr15774810wmm.133.1638965324354; 
 Wed, 08 Dec 2021 04:08:44 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id u13sm6297713wmq.14.2021.12.08.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 04:08:43 -0800 (PST)
Date: Wed, 8 Dec 2021 12:08:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
Message-ID: <YbCgSeA1++U82jtn@google.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
 <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
 <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7f19c0-3826-fcc8-227c-982838acf599@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Olivier MOYSAN <olivier.moysan@foss.st.com>,
 alain.volmat@foss.st.com, arnaud.pouliquen@foss.st.com,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 08 Dec 2021, Alexandre TORGUE wrote:

> Hi Ahmad
> 
> On 12/7/21 2:59 PM, Ahmad Fatoum wrote:
> > Hello Alex,
> > 
> > On 07.12.21 14:52, Alexandre TORGUE wrote:
> > > Hi Rob
> > > 
> > > On 12/1/21 11:34 PM, Rob Herring wrote:
> > > > On Fri, Nov 26, 2021 at 11:25:27AM +0100, Olivier MOYSAN wrote:
> > > > > Hi Rob,
> > > > > 
> > > > > On 11/25/21 10:26 PM, Rob Herring wrote:
> > > > > > On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
> > > > > > > The STM2 I2S DAI can be connected via the audio-graph-card.
> > > > > > > Add port entry into the bindings.
> > > > > > > 
> > > > > > > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > > > > > > ---
> > > > > > >     Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
> > > > > > >     1 file changed, 5 insertions(+)
> > > > > > > 
> > > > > > 
> > > > > > Running 'make dtbs_check' with the schema in this patch gives the
> > > > > > following warnings. Consider if they are expected or the schema is
> > > > > > incorrect. These may not be new warnings.
> > > > > > 
> > > > > > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > > > > > This will change in the future.
> > > > > > 
> > > > > > Full log is available here: https://patchwork.ozlabs.org/patch/1559750
> > > > > > 
> > > > > > 
> > > > > > audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
> > > > > >      arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
> > > > > >      arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
> > > > > > 
> > > > > 
> > > > > This warning is not a new one.
> > > > > 
> > > > > The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
> > > > > port:
> > > > >      $ref: audio-graph-port.yaml#
> > > > >      unevaluatedProperties: false
> > > > > 
> > > > > However the spi binding requires to introduce a unit address:
> > > > > patternProperties:
> > > > >     '^port@[0-9]':
> > > > >       $ref: audio-graph-port.yaml#
> > > > >       unevaluatedProperties: false
> > > > > 
> > > > > The warning can be removed by re-ordering the bindings patches in the serie,
> > > > > as "additionalProperties: true" makes the check more tolerant on extra
> > > > > properties.
> > > > 
> > > > That's never right.
> > > > 
> > > > > The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can
> > > > > even be merely dropped.
> > > > > So, I suggest to resend the serie without audio-graph-card patch.
> > > > 
> > > > Only if you aren't using audio-graph-card.
> > > > 
> > > > > 
> > > > > Does it sound too permissive to you ?
> > > > 
> > > > I think perhaps you need to combine the schemas into 1. Or you need to
> > > > restructure your dtsi files such that you only add spi specific
> > > > properties when spi mode is enabled and only add i2s specific properties
> > > > when i2s mode is enabled. Or use the /delete-property/ directive.
> > > 
> > > Initially the aim of this series was to fix a "make W=1" warnings seen on spi and i2s nodes (duplicate unit-address). Moving both nodes in a common node + using a different compatible depending on SPI or I2S usage sounded good) but it is not enough. In this series the common node is named as following: "spi2s2: spi@4000b000". It is fine for a spi usage but if we want to use this "common node" with I2S compatible and specific bindings, the node name remains spi@... and then specific spi checks are done. For this with this series applied we got this issue reported by spi-controller.yaml:
> > > 
> > > spi@4000b000: port@0: 'compatible' is a required property
> > > 
> > > So, if we use two separates nodes we got W=1 warning and if we use a common node we got yaml check issue. One possibility would be to use a common node with a new node name (for example i2spi@...) but I think it is not acceptable.
> > > 
> > > How to progress ?
> > 
> > Atmel Flexcom can be configured to be either UART, SPI or i2c. Functions
> > are child nodes of the flexcom node and the MFD driver matching against it,
> > just configure the operating mode and then calls of_platform_populate.
> > 
> > Would something along these lines fit here as well?
> 
> Yes it could but in my mind it was not a MFD as both feature cannot be used
> at the same time: it is either SPI or I2S and choice is done "statically" in
> device tree depending board usage.
> 
> Lee, what it is your feeling about that ? Will you accept to add a MFD
> driver for this SPI/I2S peripheral whose prurpose is only to populate child
> node (either SPI or I2S) ?

From your description, this doesn't sound like a good fit for MFD.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
