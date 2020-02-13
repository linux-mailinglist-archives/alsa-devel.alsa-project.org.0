Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7C15BA6F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 09:04:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7248F1673;
	Thu, 13 Feb 2020 09:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7248F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581581066;
	bh=Ni8IRGt9UCcpvNig4c3ptm/7DXyQFBV3e/tCCPGuQdU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzXRGfZAmoeiplOnznLYpiMv0D4/VNEyNu5hlhkVsiGS4d+oJnQj7K5pkRAQoLdLm
	 NYa+p1nAMgoRmazl5PNxCeM2v3M7omsdJ3E0bStyAXULB9DS/9INdZB6f/gZxjA45u
	 62dGklifuGBEU+Qlja0o4us79d/Tym+Ti+p+WxIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95680F80146;
	Thu, 13 Feb 2020 09:02:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C50BBF80145; Thu, 13 Feb 2020 09:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB12AF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 09:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB12AF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VrWi7c2d"
Received: by mail-il1-x144.google.com with SMTP id l4so4208342ilj.1
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10gKpQZri/82cKq6/v6n1q70/ykUGaRsAC3tbxvLKNg=;
 b=VrWi7c2dKzqZsYHKurZTdMgkC4RFCLz8pRQXKliNxIOnXIQN+w/7W6XmD6fSAowzQM
 ioOh/SrY3dOutMvt3wb5cGoy9CCd2hq9e+XJfPgkt+l6cd7VhjlSGIwQXuLnco2uNsYC
 UypTXDK4eCxQ2pS4z1F9tocVzjWyCYt5twKT2tGFFb0FupN3d1FiybANMraeI/WOAHuO
 Vbh4+aY3BmlkgOA8BGZ67TXc1X2ej6xK2B6Xe6W65hODbjUpqhOCOYwGzk3H7J8Q00Ki
 OVjdyTUPZ8P7QlU9e6592dew2zas6uql7ZoBeMEedlHy4AhNyucuGZdfqAR9pwlXQ8jB
 AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10gKpQZri/82cKq6/v6n1q70/ykUGaRsAC3tbxvLKNg=;
 b=H2b/h5EUWOVdef+yHSOQ1xkyV0LwcW353OBbRT+22Rojn02WTK4eky7032g0CotRqL
 jOmIf7C3HOv1LhFx/NKVUOyopOLR/ofmLsg7cTMig+TuF9SYVjqRZLF5DU4I5PbbqJqG
 qbqwjSzpnJP+xIxjkEWoDuvKgyoRAe91lgqX+xjm3o/+pAPcDz5+JaVdm4VZqPt+BaIb
 2LvJ7MeSJKY698UXJeuNJEl6daa6Gmx1y69Pwyc8xIF3f7GNwZUUXlYisy75AGn8+MST
 2ssVgxcJ7l6lwViB9E3pt1BgZQCNsZd39uGpMCNA3fmFLMCeYlTEd1I7mViZbwEKqj2N
 tuuw==
X-Gm-Message-State: APjAAAXIUeU48VTU8m3FrlWYkkgSCx0U8ALUL0Xck7VLYXabL1uH0MJy
 b9YpQB453aDz4+/KOLGSQeE5Hf9h2IqKzjjpmoJcig==
X-Google-Smtp-Source: APXvYqyyqulvy1f+tDe7AmP1JblcXRQSp7dWSy72c8KxhM3n5LgVfLKIkT420HK+MTxArT2iueFQFfyI3z7Ky2ifzjI=
X-Received: by 2002:a92:981b:: with SMTP id l27mr15162000ili.118.1581580958517; 
 Thu, 13 Feb 2020 00:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
 <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
 <1581559033.14792.9.camel@mtksdaap41>
In-Reply-To: <1581559033.14792.9.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 16:02:27 +0800
Message-ID: <CA+Px+wWAR3E8TWnPJEa62WjXQQ1Y-Ni9g1rqvPq0f_HPYYynHg@mail.gmail.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/3] drm/mediatek: support HDMI jack
	status reporting
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

On Thu, Feb 13, 2020 at 9:57 AM CK Hu <ck.hu@mediatek.com> wrote:
> I'm not only consider the race condition of plugged_cb and codec_dev. I
> also care about the atomic of mtk_cec_hpd_high() and hdmi->plugged_cb().
> If these two function is not an atomic operation, below is an example of
> problem:
>
> <Status disconnected>
> 1. Thread A call mtk_hdmi_audio_hook_plugged_cb()
> 2. Thread A call mtk_cec_hpd_high() and get disconnected.
> <Status connected>
> 3. Thread B call hdmi_conn_detect()
> 4. Thread B call mtk_cec_hpd_high() and get connected
> 5. Thread B callback plugged_cb() with connected
> 6. Thread A callback plugged_cb() with disconnected (Bug here)

Another attempt: https://patchwork.kernel.org/patch/11379979/
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
