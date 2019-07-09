Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E28563C5E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 22:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E88821668;
	Tue,  9 Jul 2019 22:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E88821668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562702595;
	bh=77WEil0HnS87xisqXl8bTPZWXXZGMVNiQMVyZ1SClVE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HINrNBxCqaNMDpRKyhf8MYUUqGzmiJcXyecHa7Vld0m26fsfNVvBxIFr7sANbHqhO
	 ojAyfHMCLki3YkKZAfmx4vxZYyzgVOy/DA+4aUnMu2IHWSGzd0Tkp58TVMcMMx7MCb
	 mtrBszM18bsvog/+EmLP1AThk7n4PZ8Bu8uFcFEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30781F80276;
	Tue,  9 Jul 2019 22:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0044F80274; Tue,  9 Jul 2019 22:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E2BF800E0
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 22:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E2BF800E0
Received: by mail-io1-f66.google.com with SMTP id g20so24751740ioc.12
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 13:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B7/QcW7r5MQOGhPEoQO1LbngGWl8Cp/c3zBrZbGmskM=;
 b=X3d2ghYBwmcFK9nIEAoIwI615dD54vlxNYKOe9xVCTiMeV8sJ0IW7IM5FoXE28i0NP
 FJ+ad7GIpoCqH0Pd5geEgTh1SNALSMdVdH809o+McXveOStxd8l2Yys4Q2nb7fWMhgCQ
 KPKHuBnIwkOP4aZAyScrtOaVtSXPrfGUe/zDLEtOj5tWjjgpBon6ExKqiceSg20W6Wxd
 SsUQiv/k61M7qShu9sVqu2LFm9ohoskjkRPY8fc1ghmJKNXvlZCxWPdKBLf14Kzjxw4s
 tJUboipHBehQZelo4w7dXwZ4chKyZ/BscwsVFyIgxHwfLGixYNTfOsCpXcpD/iwZiJOL
 XkFQ==
X-Gm-Message-State: APjAAAWX6XK1gO0+gDSNHNavuT1bnDn8FlDbGEax2SPcPy3eZoyFqFe3
 g3V3oERV5+KVKQk8Bmx4iA==
X-Google-Smtp-Source: APXvYqytSsRPVq3GTbSVDnVsku/qIgTDId3MOrt1dloK9TJz1SnYYCUTN2WCuwk38In8AaLhppOnLQ==
X-Received: by 2002:a02:7f15:: with SMTP id r21mr31288185jac.120.1562702483721; 
 Tue, 09 Jul 2019 13:01:23 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id s2sm15525321ioj.8.2019.07.09.13.01.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:01:23 -0700 (PDT)
Date: Tue, 9 Jul 2019 14:01:21 -0600
From: Rob Herring <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20190709200121.GA19118@bogus>
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-6-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603043251.226549-6-cychiang@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH 5/7] ASoC: rockchip: rockchip-max98090: Add
	node for HDMI
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

On Mon, Jun 03, 2019 at 12:32:49PM +0800, Cheng-Yi Chiang wrote:
> Let user specify HDMI node so machine driver can use it to let codec
> driver register callback on correct hdmi-notifier.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-max98090.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
> index a805aa99ad75..dae57c14864e 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
> +++ b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
> @@ -7,6 +7,7 @@ Required properties:
>    connected to the CODEC
>  - rockchip,audio-codec: The phandle of the MAX98090 audio codec
>  - rockchip,headset-codec: The phandle of Ext chip for jack detection
> +- rockchip,hdmi: The phandle of HDMI node for HDMI jack detection
>  
>  Example:
>  
> @@ -16,4 +17,5 @@ sound {
>  	rockchip,i2s-controller = <&i2s>;
>  	rockchip,audio-codec = <&max98090>;
>  	rockchip,headset-codec = <&headsetcodec>;
> +	rockchip,hdmi= <&hdmi>;

space                ^

With that,

Acked-by: Rob Herring <robh@kernel.org>

>  };
> -- 
> 2.22.0.rc1.257.g3120a18244-goog
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
