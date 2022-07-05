Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8C56745B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 18:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AD516C2;
	Tue,  5 Jul 2022 18:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AD516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657038676;
	bh=/Nc/x8M2iHoKA/YFP+4nCd6Kgh+uhpbN2hknp5o+wxQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n5UE9ju1vFnrNo+2UJ74gtZdUjRU2Ls0qCCoyR8mY6IqciYFq5rqOfN6pyOUzgn+g
	 8CR8dyrKgvdYRtPfsLtr3mcHR6bcfsMCY9JG5UOwpYlyKxLz4FwihFR0AMwfrNBifU
	 M9t0waw9em2m4Xf6SmlpRYGkuxxN7ESIwhlg9t7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149DCF80104;
	Tue,  5 Jul 2022 18:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87CB9F8015B; Tue,  5 Jul 2022 18:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 650C0F8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 18:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 650C0F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="SPEMBybH"
Received: by mail-wr1-x432.google.com with SMTP id a5so3641099wrx.12
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1mv3mJqTJJTSx3NpvZlyG+2KI9BHYtO9VrU9ve+aY6E=;
 b=SPEMBybHl76PAFAbvb9V0r4ns9juoAy1mwlBzc5BEOCAbWPxSpdfsYR7K5HIfOmuNI
 LZDhRk6tS4hNJXukYfwnm7ZU+DQ0MFYyoNmTF6sLXVnAV2YbEYpaLJQ+5svtvXRQbkK6
 ASSYpyhabNxatLE0bjdF0/Gi9HcWwEoF5+cYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1mv3mJqTJJTSx3NpvZlyG+2KI9BHYtO9VrU9ve+aY6E=;
 b=yqeHh8METtiwgfj5lz+nuHPWxRUjhiN2LcQnU+vxp+w2ZeNGG5fbnrPQUk+kXB25Xp
 r+ug9JjstCqwkQOunjNRqeOxsAdvo63fHc2ywWcg3Z/SvycjyZJX3Yr02vyJ3B0A5t2h
 7NcuaIGjQaGLt4ET8YXfb4wwXO6lHXMQOQLjxoCc9doEaau00+7cvg4M7/MpndNmAUm2
 yhebjcHjtCasBEGHVTH2SO8J5LEkuUWWRmiHP4saJ/JRxvTYyFf9ULBf+3GBUcOejz90
 q2WjhwezsYhmDrf7iMUNqanfTg9qp3O24kVyORN8THwj1cA6gGSA7HPuoTxf1U9zN3m9
 ndPA==
X-Gm-Message-State: AJIora8gginuTzPgi/g4b3wc7e/U0CL99nXeMpb3pFliQg6afe0rXA73
 o7nims/kiTgJtT24rZVt316TIw==
X-Google-Smtp-Source: AGRyM1vvEqIY6YnA7gl5KpdF8rSMkdbHIRId4+/4m6l7DrLUYhvCWvQdBOZ0Bhdh83gAKgYHz3V8MA==
X-Received: by 2002:adf:c64c:0:b0:21a:7a3:54a4 with SMTP id
 u12-20020adfc64c000000b0021a07a354a4mr33582204wrg.163.1657038599242; 
 Tue, 05 Jul 2022 09:29:59 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0021d4aca9d1esm15258179wru.99.2022.07.05.09.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 09:29:58 -0700 (PDT)
Date: Tue, 5 Jul 2022 18:29:56 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: equalizer cfg in max98088 driver
Message-ID: <20220705162956.GA2676656@tom-ThinkPad-T14s-Gen-2i>
References: <20220705075500.GA1987744@tom-ThinkPad-T14s-Gen-2i>
 <YsQd7mub0KJdYUDw@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsQd7mub0KJdYUDw@sirena.org.uk>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

Hi Mark,

On Tue, Jul 05, 2022 at 12:18:06PM +0100, Mark Brown wrote:
> On Tue, Jul 05, 2022 at 09:55:00AM +0200, Tommaso Merciai wrote:
> 
> > Just a question. Can you explain me the proper way to configure eq1 and
> > eq2 of max98089 using sound/soc/codecs/max98088.c driver?
> > Could be a valid solution fetching eq1, eq2 bands params from dts?
> 
> There's plenty of examples of equalisers in the code already.  I don't
> know how this specific device works but generally these are either
> exposed as a series of volume like sliders or as binary controls.  This
> doesn't restrict people to settings from the firmware, making
> development of new configuraitons much easier.

Thanks for your reply.
I meant somethings like this:

	max98089: codec@10 {
		#sound-dai-cells = <0>;
		compatible = "maxim,max98089", "maxim,max98088";
		reg = <0x10>;
		clocks = <&clk IMX8MM_CLK_SAI3_ROOT>;
		clock-names = "mclk";

		/* eq1 cfg params */
		eq1-cfg-dt-en;
		eq1-band1 = /bits/ 16 <0x2000 0xC001 0x4000 0x005D 0x0000>;
		eq1-band2 = /bits/ 16 <0x2C30 0xC01F 0x3DAA 0x03EC 0x111E>;
		eq1-band3 = /bits/ 16 <0x0C41 0xC0BE 0x29AA 0x09B5 0x3094>;
		eq1-band4 = /bits/ 16 <0x6671 0xC655 0x3036 0x1BC0 0x2A16>;
		eq1-band5 = /bits/ 16 <0x538D 0xD64E 0x23BD 0x308D 0x3517>;
	};

Regards,
Tommaso

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
