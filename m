Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165260F8B8
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 15:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F7EA2F8D;
	Thu, 27 Oct 2022 15:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F7EA2F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666876368;
	bh=4oIVzfpMgaAT0HX4FWTthc6xrrun7ylc9/g6rsWhf08=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGRcbo5bUkccj+EhfBPIQq+7UL/pR/kbo+v9Sdht2/6fpE3StsZkEF1yXnjTyzXVq
	 j7hT7Y8pd0t2xgEMnDg6Hb1Xillz2R2VlP5uTb5KkrhcWzehcZgq4BVbfWhcGh8ppY
	 3NFBOGiRX/bmk6Q8AtJJfxF8PA5Dc47okroAeuPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9D74F804FE;
	Thu, 27 Oct 2022 15:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B099EF80533; Mon, 24 Oct 2022 20:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A212F80431
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 20:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A212F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="1O1ZHqYi"
Received: by mail-pf1-x42f.google.com with SMTP id m6so9724385pfb.0
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=4oIVzfpMgaAT0HX4FWTthc6xrrun7ylc9/g6rsWhf08=;
 b=1O1ZHqYiBlXY2fwJNdkh+vQ/VNUVsNL1SE/FLAfOhoxD5MPiaq4El7Qm3wHo+8cgb3
 gl9aeVRIggYlqbyizkSb3bBtxGG+NDi5jQPFLC5t5vcs2zVF6v3XXS2LwIAxKpdiwggC
 n0PBC2uHZpCn05uEfUStTvJ1YOjR10a1WhlYwJ1EMZXodMLzQ2LjYg7xigqwXSPkiO03
 194iUFBYOfLlARIf+xoEZo/W0V34QwVqxfhOTk30UjgjuOg0gjGBGTFOiN2O2yCX/CJd
 B7mqvd4VripHn5nnSvfz8dNOkV/MSTcHE9+6t9xVPrjJY5DORvB26GRhxou4kxGlK326
 FM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4oIVzfpMgaAT0HX4FWTthc6xrrun7ylc9/g6rsWhf08=;
 b=wWBDcaiH54J8hLoocZG2KIfhCUeiERaLbghwRgZ/hAJXBMy1yTeQz+9TbMVGL1RsWN
 ltT7k0OoFShs8qTWdlYxUPqqEutYPZsHBqDeo8pIJqGVcpkA/GQQDJcLoVFS3XgeDA4R
 sjp1FL9DxHa8W5H4dqqiIPHENiVT42/Pw0XEv8FEZHJOA7PTDZhOtNNREZAT4p+bVdT9
 brTzu/dMc5zKhv2sqxAmP5ywihWF+rdtYaloZjJW+AyVXA68HsLJ7Q3Ue7B8Kz88pVua
 qVnfYyFSS7BGNdBw1+4RhRU7zjEC9Za3U9E1ixU2kks/FLAuxDYqeUwFyRzSm0bHiiu3
 J5eg==
X-Gm-Message-State: ACrzQf0dBRaA7j97BkcUz0mdw4pvcDyIxD8zpG2x04zl0z6nAHfdW8Jp
 L8c3ChzonZWdRkQ2AJjOJGr41Q==
X-Google-Smtp-Source: AMsMyM5NJO1kEdsQTHB/8tQPhUzIwVroAro5GyKcBeo3+9Tpkq+lfovTaDaocHC24z3Nm955Wr4NWg==
X-Received: by 2002:aa7:81cc:0:b0:563:4e53:c08b with SMTP id
 c12-20020aa781cc000000b005634e53c08bmr34743652pfn.19.1666635958991; 
 Mon, 24 Oct 2022 11:25:58 -0700 (PDT)
Received: from localhost ([75.172.140.17]) by smtp.gmail.com with ESMTPSA id
 z11-20020a170903018b00b00177f4ef7970sm72911plg.11.2022.10.24.11.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 11:25:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/14] ARM: remove unused davinci board & drivers
In-Reply-To: <20221019152947.3857217-1-arnd@kernel.org>
References: <20221019152947.3857217-1-arnd@kernel.org>
Date: Mon, 24 Oct 2022 11:25:57 -0700
Message-ID: <7h7d0phydm.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 27 Oct 2022 15:11:26 +0200
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-media@vger.kernel.org,
 David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bin Liu <b-liu@ti.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-usb@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> As part of removing all board files that were previously marked as unused,
> I looked through the davinci platform and recursively removed everything
> that has now become unused.
>
> In particular, this is for all dm3xx support, in addition to the dm64xx
> support removed previously. The remaining support is now for da8xx using
> devicetree only, which means a lot of the da8xx specific device support
> can also go away.

Acked-by: Kevin Hilman <khilman@baylibre.com>

Kevin
