Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12146595C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 23:36:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A762680;
	Wed,  1 Dec 2021 23:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A762680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638398186;
	bh=MCKdvCEOb/1GIfaanT/gj9t4Gr94IZY+r2Rb5BEveN0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n59P76rvDkINREPHQNFgWoltuoAIO5occDhzEFD2FJ5vi7VhP0GDScwNOWqWYL5lD
	 90ZlklpWJ9eahqXdIxghm/sUrARcEUb6j6yHbvY1lq9Hs1M6TuIghNhOHKE67nDMaN
	 YLc2AvB65OO5ewP3u5YJrdEYRt7N8NFb6Zpbor+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 030A4F80249;
	Wed,  1 Dec 2021 23:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC5EF80246; Wed,  1 Dec 2021 23:35:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8767F800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 23:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8767F800EE
Received: by mail-oi1-f173.google.com with SMTP id n66so51646976oia.9
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 14:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1cxGpGuXFYT7z9IMgpvEZhppfpCtenqGacj+Q88IAEE=;
 b=yfnn89uwfnDKUwYFZRJRgdMCpDpq/HR8U1hviwk0NLPKmAVydy2zXsbT5d22y1TXJr
 k6TL3QbN46+LrItAobEhhZDDwOZzQzAf2Rs7zHi/8AgG0kOJu0l4AfZzks68Cn6IyF55
 5EGc52NDUqXsKb1kWnG2PTMe2crXRaMc/zxO8LwXXLezxKEnxaebOLCEg3+v1dcntC4u
 3VOtW+4tN0W4Vp/+ULW9Q0NegRXIKSoihaoTICIsmHBZy7E3++0iCtn4EWGo6cYE3lba
 5cdJZqnuTpqCdvbPkQjATCQCRagJbDaa1O7hYWmHuPOrVzwjE+SPeFlfbYGVIPl6p2Bm
 ElQQ==
X-Gm-Message-State: AOAM533Ezg4et4/Q9RNIjBwLp1OzvWelXv0mBfCUCldGGddQgf/2caG/
 Mvj/DUj9Cg59lKiLS9TMzw==
X-Google-Smtp-Source: ABdhPJzYVbv04PWEmrUTCr7W5O/7iNRMV3i5k8Bm9QEVICIoEC+6CgArt/iFDuAT12MH7ix6AtarcQ==
X-Received: by 2002:aca:d608:: with SMTP id n8mr1145835oig.89.1638398095643;
 Wed, 01 Dec 2021 14:34:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bf17sm655019oib.27.2021.12.01.14.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:34:55 -0800 (PST)
Received: (nullmailer pid 2914345 invoked by uid 1000);
 Wed, 01 Dec 2021 22:34:54 -0000
Date: Wed, 1 Dec 2021 16:34:54 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
Message-ID: <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, amelie.delaunay@foss.st.com,
 fabrice.gasnier@foss.st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 alain.volmat@foss.st.com, arnaud.pouliquen@foss.st.com,
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

On Fri, Nov 26, 2021 at 11:25:27AM +0100, Olivier MOYSAN wrote:
> Hi Rob,
> 
> On 11/25/21 10:26 PM, Rob Herring wrote:
> > On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
> > > The STM2 I2S DAI can be connected via the audio-graph-card.
> > > Add port entry into the bindings.
> > > 
> > > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > > ---
> > >   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: https://patchwork.ozlabs.org/patch/1559750
> > 
> > 
> > audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
> > 	arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
> > 	arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
> > 
> 
> This warning is not a new one.
> 
> The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
> port:
> 	$ref: audio-graph-port.yaml#
> 	unevaluatedProperties: false
> 
> However the spi binding requires to introduce a unit address:
> patternProperties:
>   '^port@[0-9]':
>     $ref: audio-graph-port.yaml#
>     unevaluatedProperties: false
> 
> The warning can be removed by re-ordering the bindings patches in the serie,
> as "additionalProperties: true" makes the check more tolerant on extra
> properties.

That's never right.

> The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can
> even be merely dropped.
> So, I suggest to resend the serie without audio-graph-card patch.

Only if you aren't using audio-graph-card.

> 
> Does it sound too permissive to you ?

I think perhaps you need to combine the schemas into 1. Or you need to 
restructure your dtsi files such that you only add spi specific 
properties when spi mode is enabled and only add i2s specific properties 
when i2s mode is enabled. Or use the /delete-property/ directive.

Rob
