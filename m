Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB387E5125
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 18:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79CE2185B;
	Fri, 25 Oct 2019 18:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79CE2185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572020665;
	bh=/xXnk2kuG88dFi+ylO14FIlMM/jKu/eGNe5NOXWh0GQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NRWhO8eN8CL/aGd+TJBPMTcSVpUyLBLwuKEo8FmZnVIAw8Z9ElDjCASwepZ6oaGfB
	 /TqwgbIAdQH5t9T9Xb8qkVPXBCasIKBD4nUKIwCc7uLlAbrxc+GDi66oTXFfInYqiT
	 v1Hn+IXWtZCUDAv5m58cGOtz5hgaIOPob45iJQ9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2C0F8036F;
	Fri, 25 Oct 2019 18:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D63DF8036F; Fri, 25 Oct 2019 18:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B683F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 18:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B683F802A0
Received: by mail-ot1-f67.google.com with SMTP id 41so2414609oti.12
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 09:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DcXI0ptEmLNRJ3ATloq3LFD9nbZMbeqbCJ87LxNGHWo=;
 b=SJTZDJi+9fAQ2ogEePOSNdJ1pLr6f4ZnhsjxisDpG2fwG/9gyfy/4pALzHLKSmh+aO
 eqbl8B6w5w4/wCrtmJ7md8mVHL/djccF9bSeb5ZSkCEW5PtBBkLtwGQ186yqlo6SXcJ2
 4qZneCn+t1maE7wrYfKDltKVXv1nQZ3W91CtKZJT0KF5ccjr4ZQkOAMZj5TIoH4mACcw
 PFoKtQlrfNpCfE/Yx0Hk7sMczTOg1ii9EnX1VnTBInILCv82bnxHfg+80z7I5gIdPe4l
 5X3AdD9CLeZB9uxI/bV2b/JsQVL43+rcrT5BXpBic+S3qVv/LBi8x4zTT3XQvLaS3po2
 /l2w==
X-Gm-Message-State: APjAAAW0l/fe1gzmNVnYE1GbXHkEGn9TQe1NpxmNp3qhz8dEtFyoELZL
 UKpXQcB9dC2lP9Vt5eGb5A==
X-Google-Smtp-Source: APXvYqzzIuc1vcdp++0F80RLl8KAdKlip2Nqm2Fe6QaByRNOoVA8SwaqBnoVkTda+L/6FQKAQI1xRg==
X-Received: by 2002:a9d:3476:: with SMTP id v109mr3516135otb.211.1572020554577; 
 Fri, 25 Oct 2019 09:22:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i5sm836976otk.10.2019.10.25.09.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 09:22:33 -0700 (PDT)
Date: Fri, 25 Oct 2019 11:22:32 -0500
From: Rob Herring <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20191025162232.GA23022@bogus>
References: <20191025133007.11190-1-cychiang@chromium.org>
 <20191025133007.11190-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025133007.11190-3-cychiang@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v8 2/6] ASoC: rockchip-max98090: Support
 usage with and without HDMI
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

On Fri, Oct 25, 2019 at 09:30:03PM +0800, Cheng-Yi Chiang wrote:
> There will be multiple boards sharing this machine driver.
> Use compatible string to specify the use case.
> 
> "rockchip,rockchip-audio-max98090" for max98090-only.
> "rockchip,rockchip-audio-hdmi" for HDMI-only
> "rockchip,rockchip-audio-max98090-hdmi" for max98090 plus
> 
> Move these properties to optional because they are not needed for
> HDMI-only use case.
> "rockchip,audio-codec": The phandle of the MAX98090 audio codec
> "rockchip,headset-codec": The phandle of Ext chip for jack detection
> 
> The machine driver change will add support for HDMI codec in
> rockchip-max98090.
> Add one optional property "rockchip,hdmi-codec" to let user specify HDMI
> device node in DTS so machine driver can find hdmi-codec device node for
> codec DAI.

Why not just use the presence of rockchip,hdmi-codec to enable HDMI or 
not. Maybe you still add rockchip,rockchip-audio-hdmi for HDMI only.

Really, the same should have been done for which codec is used too, but 
I guess someone wanted 2 machine drivers.

> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/rockchip-max98090.txt      | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
