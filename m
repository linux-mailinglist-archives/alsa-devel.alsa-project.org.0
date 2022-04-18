Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212C506B7D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24900182D;
	Tue, 19 Apr 2022 13:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24900182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369261;
	bh=En9wiLLipwzwLTdSjG7HDPa4aiPY1I3GURlCe1n6Szw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgZh7gVQ/tkf/wAJuSPyKLoCJCjatNCaYKLxEuzRt2yQZX96XdPYIBnPd6X14xbRx
	 Dpj7hFp94zOJJEfLit3M/sLm9GCn/44S8zqiMVQUewS23RwnRTPipio91r/gRItuHF
	 0fl2WdyFJCzxh3LW6VBfK2LhtDwvRNKP0pZOXKME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 976ECF80121;
	Tue, 19 Apr 2022 13:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24103F8014E; Mon, 18 Apr 2022 16:15:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9302BF80121
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 16:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9302BF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qJbSEayo"
Received: by mail-ed1-x531.google.com with SMTP id b24so17573624edu.10
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1yRTFCOVkKJ+RZAp8eeZzdpyUBkyVtfc+F85HDlfuoo=;
 b=qJbSEayoZMj3xEnPNTw77RaMwsJN1g8UszegCEgci/5ry75g+KLusnOUdDuZGHmaCg
 mICuDDV0J/zHJe+nFQCBWecX6ztTWK7BY7AcIW+dI8X/rsOE+pEmy0z5fEgpQfWIPytV
 jEKeiMTcS9LiJzWAYOup9MHOUot003WTtRNpc+wD8Vc1Vmdf6WauErTEVZ/6kP/ocQIs
 BiEgb7O45RnisJA4lhzE5VJdFemqFbHmdQCIpQUodTG/c38vO4caTnXEDngK4+wJ+m4t
 cwTLhRT6MPIxfGHxab7NZoZOUUABbdhzwfIi/qMapP1QWRkFvuPEb/DDEFgHjAMQYFNX
 Ev1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1yRTFCOVkKJ+RZAp8eeZzdpyUBkyVtfc+F85HDlfuoo=;
 b=q4hMUE246fCTiXH4PnmBYH8Cvlr23vkd7exxOFJsOWZliMpP+BHz+HorPB9UaBTUuD
 A5k/w1lM96LC0QPNsIIJAdgVTdw44y13EnsvdbSN45HHI6IPwYqLO3ntznmrEfAliptR
 ZLIXveT5ONpfFMjIf8yz8xzwm//Yoa8wjd/u0tjhnCvYmYAZauShGLiCGJwN54pR29Sc
 Az/bbb9L2fX0IlLVStsCLGUXxKSZ9Qa2/7OEilCTIRsFQvzfQjSMmXf9FBDAf6B7qR2W
 5D9dg7OSWAinon7ZJcuK8ZcLAqGCYFelgC3OgOylfkXutFfwZD08nQc5iPJO43+RVIsy
 5rzQ==
X-Gm-Message-State: AOAM5336x1u61w3gtrgmii7E6bI+5bemgck8iDXoWtWRxus0LegVly5a
 NzY9lATFc5a+UJfXxQhJj9BoHIL8xzsPZw==
X-Google-Smtp-Source: ABdhPJwWbKxKE/s2WQA8BrT3wDax55L1kR1qRsK2tjFDUUbIrjWurn1uJ0uytKKfbXukb2UEpdJzNw==
X-Received: by 2002:aa7:db0f:0:b0:41d:7b44:2613 with SMTP id
 t15-20020aa7db0f000000b0041d7b442613mr12292802eds.126.1650291350373; 
 Mon, 18 Apr 2022 07:15:50 -0700 (PDT)
Received: from ryzen ([2001:b07:2e3:dacc:d3f3:c3c5:d3a2:5ee7])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a056402049a00b004197b0867e0sm7123850edv.42.2022.04.18.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 07:15:49 -0700 (PDT)
Date: Mon, 18 Apr 2022 16:15:44 +0200
From: Maurizio Avogadro <mavoga@gmail.com>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: add mapping for MSI MAG X570S Torpedo
 MAX.
Message-ID: <Yl1ykPaGgsFf3SnW@ryzen>
References: <Yl1nXcsAKWrFOMbY@ryzen>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="CJqx0wKUgyWf6HFh"
Content-Disposition: inline
In-Reply-To: <Yl1nXcsAKWrFOMbY@ryzen>
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
Cc: Andrea Fagiani <andfagiani@gmail.com>, Timo Gurr <timo.gurr@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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


--CJqx0wKUgyWf6HFh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed description, sorry.

--CJqx0wKUgyWf6HFh
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-ALSA-usb-audio-add-mapping-for-MSI-MAG-X570S-Torpedo.patch"

From c49119b1dcfcca1fcefadd92e095463e6245d4e1 Mon Sep 17 00:00:00 2001
From: Maurizio Avogadro <mavoga@gmail.com>
Date: Mon, 18 Apr 2022 15:16:12 +0200
Subject: [PATCH] ALSA: usb-audio: add mapping for MSI MAG X570S Torpedo MAX.

The USB audio device 0db0:a073 based on the Realtek ALC4080 chipset
exposes all playback volume controls as "PCM". This makes
distinguishing the individual functions hard.
The mapping already adopted for device 0db0:419c based on the same
chipset fixes the issue, apply it for this device too.

Signed-off-by: Maurizio Avogadro <mavoga@gmail.com>
---
 sound/usb/mixer_maps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 64f5544d0a0a..7ef7a8abcc2b 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -599,6 +599,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x0db0, 0x419c),
 		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
 	},
+	{	/* MSI MAG X570S Torpedo Max */
+		.id = USB_ID(0x0db0, 0xa073),
+		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),
 		.map = trx40_mobo_map,
-- 
2.35.1


--CJqx0wKUgyWf6HFh--
