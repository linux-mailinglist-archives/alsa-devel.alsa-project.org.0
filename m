Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F337D6E94
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8327E7F1;
	Wed, 25 Oct 2023 16:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8327E7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698243675;
	bh=YPxAOTUhUKwtwp1XXgLyfx0MtIYdqhU8AsvP6K/wWOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qqaQz+ick52/QIJrNe+SlC8u+xw2a/edS7yUTUqV6g/NatdO+61TeT57LxXfTdgVk
	 U5cadwu5yW0btvy6l/QeSslL22jI5+EdH+adOYHwELgqi0tVcOwRvVHsMVNr32fvJb
	 s4suR+D2waBeIUuL94dbg6Sp/ajfTFHrcbqDtQsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDC68F80165; Wed, 25 Oct 2023 16:20:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3808BF80157;
	Wed, 25 Oct 2023 16:20:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EBCCF80165; Wed, 25 Oct 2023 16:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87779F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87779F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UQl1EYu2
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so8456915e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698243611; x=1698848411;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXdFX0UY5tniJLRDcl1ufSs5c/hl+EfLWW5bDdsq8SA=;
        b=UQl1EYu2e8LXVX+pLvdq17KPec7jGCeESj63ZZSM/qR904T3oDOWAnKcKFqCB2rJYh
         7TMikIzSEKMzEAXoCUvvqyTtH+FksV9sx1ZYXS5Kx5sGqZpZtN1ODpAa2iLrAAsGO8Gj
         3dD3GgFuQZ9r5VLhVi3uWpkVNjjw9wAovQkCYYzEwuCoZIkvc/TtSNaaeLw9U0CNBj1S
         Y3xf0tm7IBnyhnsi/qjPZUsxDs2vKvWwNtocvIUXkbdCoMmTuCxqDcfFAzDJxQB6UZVx
         RYV2EYjiJg0JU7SXaW4+dLQa9KLvFF7fkX0FQ7cxhdSPz0iXRkfKOlgOx51LgVhK3vd9
         iq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698243611; x=1698848411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXdFX0UY5tniJLRDcl1ufSs5c/hl+EfLWW5bDdsq8SA=;
        b=gjBOGK/zADO5sT4hWTa6lFv7ampGNd7+c/ACAPfJbbDzOHYgxW22jjiOHBhh6WSpgd
         GsKyS2MFuE6ldz/s3W6E7iTWRiKyXUd1DKQ9XKhfH09g3Gji2WjWWvXOM/6xtAp1qMTm
         4J3+1CKLlv6mxTCr7GwRkbM7DRIaHJXfe+EKw/0ynQCi/vlVecrdag62qh63kxgilLvq
         9YYjkh29BxE//nis+i5ZGYzq3tDnfvHdEIvSAtFov6J+Sv1tp9IA9DuUlgxNc/dqkbpQ
         VcDGLmrTxL6hXCm/0xsz9rLRGDa1gv3/zdqSJut4TMbJtt/BpXms6T7DxD5bSz/+tXPN
         m00Q==
X-Gm-Message-State: AOJu0YzohANFHtc9+G+IAFTVhD+MCL8Q2zj45QZ5JPffiahkPj3rplS8
	BIizJjaNSv5ADmYtH6y4Omw=
X-Google-Smtp-Source: 
 AGHT+IHCJiQ2e6pDH3+U3/wVqmKSJcAM0uK7m8zA5flWq6iZTKh/qG9TOso4O1h1Ce74ljz0EvAsIw==
X-Received: by 2002:ac2:5550:0:b0:503:258f:fd1b with SMTP id
 l16-20020ac25550000000b00503258ffd1bmr11409838lfk.18.1698243610440;
        Wed, 25 Oct 2023 07:20:10 -0700 (PDT)
Received: from [192.168.76.157] (85-76-164-65-nat.elisa-mobile.fi.
 [85.76.164.65])
        by smtp.gmail.com with ESMTPSA id
 x13-20020ac25dcd000000b005041ce44bbdsm2568600lfq.5.2023.10.25.07.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 07:20:09 -0700 (PDT)
Message-ID: <a0db9dbb-df0e-406a-9a88-2a6968ec1469@gmail.com>
Date: Wed, 25 Oct 2023 17:21:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Tony Lindgren <tony@atomide.com>, bcousson@baylibre.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com>
 <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
 <20230921121626.GT5285@atomide.com> <20231006102348.GK34982@atomide.com>
 <20231006213003.0fbac87a@aktux> <20231007062518.GM34982@atomide.com>
 <20231007091156.588d7ba1@aktux>
 <db511d14-f2fe-4b4e-bd13-223e7a33f933@gmail.com>
 <20231013132503.25d63933@aktux>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20231013132503.25d63933@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OL7CKS7EWBM5TM42ZUZQT2U4S3P2HTU5
X-Message-ID-Hash: OL7CKS7EWBM5TM42ZUZQT2U4S3P2HTU5
X-MailFrom: peter.ujfalusi@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OL7CKS7EWBM5TM42ZUZQT2U4S3P2HTU5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 13/10/2023 14:25, Andreas Kemnade wrote:
>> I guess it is because of the pm_runtime_put_sync() in the
>> omap2_mcbsp_set_clks_src() around the fclk re-parenting.
>> That is a bit dubious thing for sure. We need to disable the device to
>> be able to re-parent the fclk but if we disable the device it is going
>> to be powered down, right? I think we have appropriate context handling,
>> so it might work, but it is certainly not a rock solid code... If you
>> have a stream running already, you don't really want to kill the McBSP.
>>
> Ok, so if the device is powered of at omap2_mcbsp_set_clks_src() 
> we get the usage count underflow, and the counter is incremented
> immediately again in the runtime put function. So things get out of balance...
> I'll check Tony's fix here.
> 
>> The problem is that this mux is outside of the McBSP IP, so we need a
>> system level (iow, clk API) way to change it runtime.
>>
>> What is the machine driver where this happens? If you set the sysclk in
>> hw_params of the machine driver, it will be OK, but if you do that in
>> probe time then it is likely going to fail as you experienced
>>
> As you see in the other patches of this series,
> it is a simple-audio-card with a tlv320aic3x codec
> in combination with the mcbsp.

To be honest I would be happier if we can just remove the whole
omap2_mcbsp_set_clks_src() and leave the CLKS source selection outside
of the driver.
But omap3pandora is selecting external clock as parent
(OMAP_MCBSP_SYSCLK_CLKS_EXT - in hw_params, so it actually works) and I
don't know what happens if this functionality is removed. Likely going
to break Pandora.
That is fixable, but what worries me is this comment and code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/ti/omap-mcbsp.c#n388

Which is added by me a long time ago:
e386615c01d37 ("ASoC: omap-mcbsp: When closing the port select PRCM
source for CLKS signal")

I'm not sure if this is possible to do in any other way.

-- 
Péter
