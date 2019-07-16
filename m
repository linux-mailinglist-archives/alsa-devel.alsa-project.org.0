Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1006AA8F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 16:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E391689;
	Tue, 16 Jul 2019 16:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E391689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563286988;
	bh=ULGcJ/prokG3UTD4GzjvPIFLqgIYLKFYPW0PR0RdJoI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hm4a3Zlm8z/hqkR57yeF1J4nJ8yA/0Tt2J6vgNZaUjvL+kRFc+vyNm4UlVtavMLqZ
	 N8Xlj6kn1eyKP7ykfztL1YvzhrQ5cksmckrxC6mB/BvDk29HodSt8gAtShKwfdwsQy
	 2XTriH2MuhDSaGTdnUfoaktVaMl1ZFI32pTHXE5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D452CF8038F;
	Tue, 16 Jul 2019 16:21:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BBC5F8038F; Tue, 16 Jul 2019 16:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,ENV_AND_HDR_SPF_MATCH,NML_ADSP_CUSTOM_MED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DD8DF800C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 16:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD8DF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Py5/obzL"
Received: by mail-oi1-x243.google.com with SMTP id m202so15668289oig.6
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2XmDxxbJ7tU8jfvsRxWlaoaHsfnqizOFxorb/Xd+co=;
 b=Py5/obzLg1G6q0q9QNni2A4i6WspW9cxnxlS1QfRxEg9BRt1PWoOjwnaxWlw95wDhQ
 zk2XLC499vm6MTxijwxdPPDVhCQaRCFyw+qJHWt86AFA40hRMjwDOMZvCgKaj30892nR
 3Y8vkOpVAnYdsAR5GQ+/ylt+8cSq9qlPxSumsex88ZyIHEBPsauTOuHf7FrJRJlSNJ0G
 xBmJ7n3Wiqq/pFgIxlIeJn3Ms4InCCNSdUmRXMfbYZ6pVE4XIRvI/r3dn+K84uxn5ttw
 1GFLELKY4droqXKN0zwWh5as8vN/6BK+LpPAHSpEFtr3f0XWt77DBVSuhXUHhjHdb072
 ArzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2XmDxxbJ7tU8jfvsRxWlaoaHsfnqizOFxorb/Xd+co=;
 b=mfJzvPhqiFU0lGCMMGATIUsmjT/xbKklD2SpAz1cbLUr7vfhi+KvjwCX9U5oFoKgXa
 lna+nJGF0fwcjJOupC9CVrcEDXyuRHrXkNbIBWq0ZPGkxyXuUG8oMGOUPi9gbDAFlhBA
 R/8JqHKqEhKnyg65KYnKnVawpq2nptnyNpUetRKJUGnb2yxl7Jhmxk/EdWr+ucE6erG6
 TvHoBaT9aMbcwancrZ1DnbrE5U5ZZqF/oxIieGZnnDjt/tyOvf93EZxkritnIYlLcnm0
 fanl53T70277jMVvssl3kADOvdEMK4VTfZj1t/UAkZCnJhEByD1cUs/sOqTnXhTz3DTY
 H/sQ==
X-Gm-Message-State: APjAAAUDQCoXIRryCY5Cwp92an3Kca5b0nuOHai8S85UNQLWDDGLeHxI
 i3NZkByHk2VJhJoaqfDIWADeEOC8VLlDpDVEHp+Mnw==
X-Google-Smtp-Source: APXvYqwhUee7Js74E9R15ZB55hgPPsCjc9xmGxHsFteJRH0BqOq9zdyWRfoMvFTu0iFTMewZbXes9U0eh+oPZWTTRe8=
X-Received: by 2002:aca:4d84:: with SMTP id a126mr17188257oib.23.1563286366223; 
 Tue, 16 Jul 2019 07:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-3-cychiang@chromium.org>
In-Reply-To: <20190716115725.66558-3-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 22:12:35 +0800
Message-ID: <CA+Px+wWuCBvWra8+=szQOrvr3iv2YPMeoHHVtJ1vmaZWEEQ44A@mail.gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 2/5] drm: bridge: dw-hdmi: Report
 connector status using callback
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

On Tue, Jul 16, 2019 at 7:57 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> Change the Kconfig of DRM_DW_HDMI so it selects SND_SOC_HDMI_CODEC.
> This is for the typedef of hdmi_codec_plugged_cb to be used in dw-hdmi.c.
Not sure why you select SND_SOC_HDMI_CODEC in this patch.  To have
definition of hdmi_codec_plugged_cb, include hdmi-codec.h should be
sufficient.

>
> diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
> index 21a1be3ced0f..309da052db97 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -4,6 +4,7 @@ config DRM_DW_HDMI
>         select DRM_KMS_HELPER
>         select REGMAP_MMIO
>         select CEC_CORE if CEC_NOTIFIER
> +       select SND_SOC_HDMI_CODEC
So that it is weird to select this option.

>
>  config DRM_DW_HDMI_AHB_AUDIO
>         tristate "Synopsys Designware AHB Audio interface"
> @@ -20,7 +21,6 @@ config DRM_DW_HDMI_I2S_AUDIO
>         tristate "Synopsys Designware I2S Audio interface"
>         depends on SND_SOC
>         depends on DRM_DW_HDMI
> -       select SND_SOC_HDMI_CODEC
Also strange for deselecting the option.  Should be in another commit
for another reason?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
