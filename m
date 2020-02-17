Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB1160C5B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 09:08:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4151674;
	Mon, 17 Feb 2020 09:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4151674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581926918;
	bh=Z496eBAIRqNqFKwkZ+IEgBibQQQP5sWDTkxWZELEgaI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+JXgM+AIx3leNo41mbJZpUdAraAV1//kRZauw3FdZNWRrEw1AhM69X0KrojuVuTH
	 cujytcapCZYrbVPv33Ay10ufMqOb0chZots7HEyioVd9UBn9ZBd4vcqQd55PVLfkHw
	 g+msi5oR6rTY81rnxCCu8fyBWy1g5h6M/LfKx9n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF30F800B6;
	Mon, 17 Feb 2020 09:06:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF8D1F80172; Mon, 17 Feb 2020 09:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23806F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23806F800B6
Received: by mail-ed1-f68.google.com with SMTP id c26so19606338eds.8
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7HNmg9K88memoV4mQIdFTzsV1B2vI42lPI0r8PIbeg=;
 b=sxm/3QP1iLDhA0CqLbiG9ggFYx+1s+EFEexN5sAXia49rD1u0Q2CiH7dbZcoR9gltP
 1Zt/VHXZ0tK610SrlURWsyx2rkSZ5oZIX6TeDe72bHZ+2WaXi61aOA77m2Iqa2KzWdYj
 QadJYzsy+qcs6QUUZqGcllk0SwOuPbTSPudNvtso0kNUplxqmE3gwGpu7YQgqwSrDpKT
 QrjsO+FlMZd4xPY6Kb0CGcXVWEzngOMjn52rqDI/QzDzL2vRJEZLTSindHzN7k5ImK3x
 zk50Rh3tpKp8ZB3Sml3AH86juSl7Ifh9OZcGyb9bYLrG7quW/+LaRhE8RnNk+4rc9CLg
 OxHQ==
X-Gm-Message-State: APjAAAWZPlwW4opel6HtHtmyxOw9bPI64g3YRMaLdp1sxkYvucnO9f8N
 ZyS7nrN05gTvn1WhzX1Yc3p3WlzJCBc=
X-Google-Smtp-Source: APXvYqwrNnH0Lb/NWZLq8WmGiqvINl3vAf4wlbnXO+hjK2b5DBn86+saQKUPR8pnCoHhpezKhJQdAg==
X-Received: by 2002:a17:906:b80a:: with SMTP id
 dv10mr14230531ejb.115.1581926811706; 
 Mon, 17 Feb 2020 00:06:51 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id u9sm827892ejj.49.2020.02.17.00.06.51
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:06:51 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id a9so17296477wmj.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:06:51 -0800 (PST)
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr22204730wmg.16.1581926810934; 
 Mon, 17 Feb 2020 00:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-13-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-13-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 16:06:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v65e3dwji4cwRh6uTryjXq=0qmeggEjrMgL9KtB+JTWCVg@mail.gmail.com>
Message-ID: <CAGb2v65e3dwji4cwRh6uTryjXq=0qmeggEjrMgL9KtB+JTWCVg@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 12/34] ASoC: sun8i-codec: Fix AIF1
	MODCLK widget name
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

On Mon, Feb 17, 2020 at 2:43 PM Samuel Holland <samuel@sholland.org> wrote:
>
> It should be "AIF1", not "AFI1".
>
> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
> Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
