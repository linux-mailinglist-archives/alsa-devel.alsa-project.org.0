Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C8390563
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 17:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7865C172E;
	Tue, 25 May 2021 17:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7865C172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621956439;
	bh=KkPgWGDOXHviuYA41UkauLa4FnSedICmC1sX0tRJ9h8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAA1Y5PmYgTLSV6jG5n+3yKCkXCtOFJXlJov2/Jc9DPWppfyCe7JEwNESExKzEIiL
	 G2vJ3tkFqrrdy8nOUCIvtYVkiiW4CROU3Q4r8UxcZ5PgHRS5InqAH5oS1P53CcaSmN
	 48VLBjyZ1f8+ph86OYEsvcGha5jsQuApcysCfXUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E266BF800F7;
	Tue, 25 May 2021 17:25:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D323F800CB; Tue, 25 May 2021 17:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC6E6F80032
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 17:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC6E6F80032
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ADsWXFPQ"
Received: by mail-pj1-x102e.google.com with SMTP id
 ml1-20020a17090b3601b029015f9b1ebce0so4135650pjb.5
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jL+DBxWN5edIJOrVtHSuYvmFZqk3JNDdtDmQJkkStO8=;
 b=ADsWXFPQuNNtwHEJoJyXj5LyZS40qB6RUp/8KdRTz+SQQiOqa8lPfdkQHPDPKrCTkC
 57WkUmg43+E1w/Tv4GssLcUeeQ3ruJGpOVJIzWiVkVd+vOJFeCdy+S76xch1GFZGW1Vk
 HZnJvLO+oME00P5s5Ljv09YiSEXvjrcjGTTQv+80Cpn2zh9zZCIpTLdVPdWfy14un5zK
 6qrdGICT2DDsaTi+9xvggt6WpE8VwTWY9y389K6wcE2VjFJQ2nAw+om9OChuhy1NIkQ1
 4ETtFDx7gN8gP4PNo49FXBG5sEs6QVNWagv1L8oI/nJhoDVDkGuNOwg6nO039jt/ne0S
 mANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jL+DBxWN5edIJOrVtHSuYvmFZqk3JNDdtDmQJkkStO8=;
 b=kn2RE3BiugyYzsaqsaknmVxEMzI5I4T6STfyFtGJ6I6uyNjnTMHXvEpnO+Ei6HOsTl
 WB9Z5kfUj0cRTxfGNpG2Yrj/GJAnZmE68p7Y4h51ai8lXl4PUCi03AgWxp33ThdAHAbn
 hjH89PFK8DrhGyBDW4CPMQXFd2tUFIKhTigpAXdGaDC/qM0G2QaRxNgxXB3jg87dMvUj
 p42zNXIOB/Gw0l7i48FSUpujxN35mFeD8R/Hh6mASWzoNOwB4OlOcsrZDsZFB6NuHJu7
 s1WPYKfAjqhsNUUC7TE+9KKO3DnxwZ85mmoedyBcEz8KY7c1Wo/IuKcZdEgqJu6PyzsJ
 Rjfw==
X-Gm-Message-State: AOAM533+K0FhAxBrrFzKNBUNU/NBIZ8Sj8kd06JTGZo+BeEyfF4LkP8k
 DbCzoc227hFborFAFi1+U6E=
X-Google-Smtp-Source: ABdhPJys9nI4J83yBrIv1q0rF+gkI0iY2Ixso6WRntsxUf21NpnE4gjcHDdIeLCDFoCqGYe/yhkc0Q==
X-Received: by 2002:a17:90a:9486:: with SMTP id
 s6mr5455853pjo.192.1621956340125; 
 Tue, 25 May 2021 08:25:40 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id w15sm2311678pjy.1.2021.05.25.08.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 08:25:39 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] ARM: dts: bcm2711: Tune DMA parameters for HDMI
 audio
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liam Girdwood
 <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-13-maxime@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fa063d1b-c23c-c29c-f9b4-c77be4626fd5@gmail.com>
Date: Tue, 25 May 2021 08:25:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210525132354.297468-13-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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



On 5/25/2021 6:23 AM, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> Enable NO_WAIT_RESP, DMA_WIDE_SOURCE, DMA_WIDE_DEST, and bump the DMA
> panic and AXI priorities to avoid any DMA transfer error with HBR audio
> (8 channel, 192Hz).
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  arch/arm/boot/dts/bcm2711.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 720beec54d61..9d1dde973680 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -344,7 +344,7 @@ hdmi0: hdmi@7ef00700 {
>  			interrupt-names = "cec-tx", "cec-rx", "cec-low",
>  					  "wakeup", "hpd-connected", "hpd-removed";
>  			ddc = <&ddc0>;
> -			dmas = <&dma 10>;
> +			dmas = <&dma (10 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;

This uses DT as a configuration language rather than a description here,
but this is most certainly an established practice that the bcm283-dma.c
supports, with no validation of the various arguments.. great.

Is there at least an option to move the meaning of this bitfields into
include/dt-bindings/dma/bcm2835-dma.h or something like that?
-- 
Florian
