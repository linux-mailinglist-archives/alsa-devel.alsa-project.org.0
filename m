Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094D542896
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 09:54:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2E4A17B2;
	Wed,  8 Jun 2022 09:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2E4A17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654674895;
	bh=zbzHpMsS0WwyudhiAtSyge4vte1jMnMDbZKeX1lJpTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Im8qoIrpqJv+ubefv+MF7k7Piv4tD1S/qyQPhkWEmVlp54ozJZJ1c9gD7pQx1sF7p
	 goTaXt/WSx0hSSRVmxa2QClUfV91QVr/6aEIqJ+dTn1kBC5u0PIOP9z1+B3HpGhDPW
	 u2g0iA6bTF0iu2gqLFgoLfG8XHVsL80NBtaeVE6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1450CF8026A;
	Wed,  8 Jun 2022 09:53:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30C1DF8024C; Wed,  8 Jun 2022 09:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F353F80118
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 09:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F353F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="JUp3sJwq"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 992C13F0E8
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654674824;
 bh=Vg4qwAHVWngxhO+NcKoiKt+xyqhFoSxezJOs33bH8X8=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=JUp3sJwqQvqWZIDsDZqcAnYU6w6nGLL5m4K9g5sJLBJCapy8QY42Kz44CPSCHSZaV
 8fVNLszX8LFIDonApt0CCAlEmQfUzh4DzCopzllAyn4cVJoCL8Etu+gCcAiTp189Wu
 ubL4ijUyvxCbB5hIZBiz7Fgqm4GayuMdE7B1tW6V4PVItKuWTTBJOy4qk/Up1edsbk
 NpQulnG2HTI9PN1cnuTbB8dxXYoHgCSYjf/CyrG3dQiXdxQo/TwjjImQAK5YqxXc5u
 cZrqrL3wy/apHswUNGngkv3pDTX28KTutBn+28+2OplIVlNfYNCCCiE3Tbo68xxsF2
 geKad9nO3idZw==
Received: by mail-wm1-f70.google.com with SMTP id
 m19-20020a05600c4f5300b003974eba88c0so9579494wmq.9
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 00:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vg4qwAHVWngxhO+NcKoiKt+xyqhFoSxezJOs33bH8X8=;
 b=dKJrPg8R+D9JrReYv78oZ1HcXd7NCNvXrLVyZYyy+SontGIfoGxY1m5kBtI2aOLKXl
 /qE3vVZUgfX8ZFjn7xrYg2U4SkcQ77mHFwiSY88TvE+JTxx94nz90+8nS5BEJQl6gTmw
 TksNnqAVn+PjKituFeLCHlfEDYvqInodrVOMp8A2yaLfIb1hbPJJbbh5aBdmj6d2DQKf
 ajUr+iug3J0uUVppcnOsZ61ZAUD2voqf4rCoHInKjYXwu4cCt9gEY1OWbsFUD6mk9Xer
 JbERtDk4q625la6WpVHF0tZ7YhmGwKnVenreW622YkckroHSI8efoyYTyiFZJWifTT6X
 xYFQ==
X-Gm-Message-State: AOAM5313b7+fnCpZ7GWAeZ/71LKwcBz/IRieDAF+wadwteGiDpPENTpv
 1Jwuc/y7vHmvY0d6HJIbCvYpK6D/nF02mjO3NGWlSoQJLIFerfchcMdEgfQKgWk74WZh713H0AB
 iG9yjs2somBXD5VXjIHlhEtNYCqH2VbUiTCTgTpMdRa2N9BZl7EgS6wjy
X-Received: by 2002:a5d:6790:0:b0:217:1567:d319 with SMTP id
 v16-20020a5d6790000000b002171567d319mr19865791wru.16.1654674823972; 
 Wed, 08 Jun 2022 00:53:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf7YVGkv76qA2GcyuIyqsdWfvW8bxj9SujV8l1BvFPdrXYuRdPB9zB1XoIk6WYCABfrZfQVzpmNeyk7eTJsww=
X-Received: by 2002:a5d:6790:0:b0:217:1567:d319 with SMTP id
 v16-20020a5d6790000000b002171567d319mr19865762wru.16.1654674823636; Wed, 08
 Jun 2022 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220608070527.14824-1-huangwenhuia@uniontech.com>
 <87wndrboja.wl-tiwai@suse.de>
In-Reply-To: <87wndrboja.wl-tiwai@suse.de>
From: Jeremy Szu <jeremy.szu@canonical.com>
Date: Wed, 8 Jun 2022 15:53:32 +0800
Message-ID: <CAKzWQkySkKccnmSx_2fKT9QvPfwBOV36Mc-pt3KQR0NO1QkQ2w@mail.gmail.com>
Subject: Re: [PATCH v3] ALSA: hda/realtek - Add HW8326 support
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: huangwenhui <huangwenhuia@uniontech.com>, kailang@realtek.com,
 tanureal@opensource.cirrus.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 wse@tuxedocomputers.com, hui.wang@canonical.com, sami@loone.fi,
 cam@neo-zeon.de, alsa-devel@alsa-project.org
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

and better to follow the order to easy to find the codec once the list
growing next time, e.g.

@@ -651,6 +651,7 @@ static const struct hda_vendor_id hda_vendor_ids[] = {
        { 0x1095, "Silicon Image" },
        { 0x10de, "Nvidia" },
        { 0x10ec, "Realtek" },
+       { 0x19e5, "Huawei" },
        { 0x1102, "Creative" },
        { 0x1106, "VIA" },
        { 0x111d, "IDT" },

to

       { 0x14f1, "Conexant" },
        { 0x17e8, "Chrontel" },
        { 0x1854, "LG" },
+       { 0x19e5, "Huawei" },
        { 0x1aec, "Wolfson Microelectronics" },
        { 0x1af4, "QEMU" },

and so on.


On Wed, Jun 8, 2022 at 3:30 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 08 Jun 2022 09:05:27 +0200,
> huangwenhui wrote:
> >
> > Added the support of new Huawei codec HW8326. The HW8326 is developed
> > by Huawei with Realtek's IP Core, and it's compatible with ALC256.
> >
> > Signed-off-by: huangwenhui <huangwenhuia@uniontech.com>
>
> Thanks, applied now.
>
>
> Takashi



-- 
Sincerely,
Jeremy Su
