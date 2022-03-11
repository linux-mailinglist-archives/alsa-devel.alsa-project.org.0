Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3B14D7B19
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:00:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B69A16F7;
	Mon, 14 Mar 2022 07:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B69A16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241237;
	bh=9meDeAiRmIAI/UfRmHgNcLLtH+UVof0suHk1c/rgL8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGu/FWrbMJ75l5ln86euWLtcOJz0Fi1VPLeRsKxmNK3RMz4i6jBfUG0OIU7dPRhQT
	 xfQpkOtPWfycY5pzTr57Qby32y26xq1ZfUrXqLE3UJBlanvk8EGVptvKmXsKr8AEBW
	 7L5lvCRqWHNlvxta0xuUQn2BfXpbiw4nRoEA0gSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1133EF8012C;
	Mon, 14 Mar 2022 07:58:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 130E4F80227; Fri, 11 Mar 2022 06:53:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B602F800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 06:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B602F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lBLSNHND"
Received: by mail-io1-xd43.google.com with SMTP id r2so9011984iod.9
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 21:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iH2ohTMZfPnRZ9E6jdBe6JKfO5koQv5qtiPS15nsl0I=;
 b=lBLSNHNDBDLhECW+i7GItRVFc2s/fgUj/HMjqg84Xln7MQUu6DxpDIq7jdrZwx2YWB
 HDmLI2wAzHNtmqomw5J3eD4YE0N+ivlLv1Er2iRuVUG3/ri6ZqhWubh8509kcBE3idYJ
 QSA8JQqsfolKtgGCs518PBnajsSWdlErkZ82pu6WfzPooJzUIJTbF/7cexQ5S5Qzlfm4
 T3VU65+SP5zmCBG6TatJtUP47W9CAUa1dZzaetX2Lj37T5DDBjKD1toIp6o1KdpvmHbF
 sS2V5edCKN/TlpsmgAUVLXwVE/c7LQBrMEB794Vlthuht9Tw3zS8/YqcEUwo9Q6D9LGW
 yd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iH2ohTMZfPnRZ9E6jdBe6JKfO5koQv5qtiPS15nsl0I=;
 b=ZIVdscrzFcb8oQ4pqBku3a57YkouoQo2/rr+1+oCkRQxlYeoz6c3JAaV++7QNztO5q
 yKTboCUmWyACllcnrkrQWKdqo7+tDVrU28JYjFr2HCxkulgIlblHujn1bVxnYeOq6L2h
 463S+btzV3Bio+y0TBDYugkUrtWxtlh5EZaeET4jZ1cVKhXFlXZqvfvyLfPAhCvEc0BV
 /EKPlHiZgcRLIkBa9LrBdfTx3lDKFcBzv1wZoHsdecTkaI42mDeaBAjnGpYqlzflBSme
 JZ7i9Yb974CycIRckRX5JRBlWNjulDRiaGgMUqFXxZZSQt7srIngzG6J7RoVXZJSDuDx
 PiQQ==
X-Gm-Message-State: AOAM531SDmp6CcDoa1v2I4tQ78PzLYtE9AZ6U2PJFmiis06Y/38AseeM
 To06R3GjmITnefF0SpYkyice3uZF/qchGoJmRQw=
X-Google-Smtp-Source: ABdhPJyhB8o0PTCDqSOXDuEw7PVy6+1fE/kih9mRtFuqIls65qjo2Ut/x9nk2zkysjNJPIYFuuSGFOigSWM7dqpBCj0=
X-Received: by 2002:a5d:8ace:0:b0:641:2a6e:471c with SMTP id
 e14-20020a5d8ace000000b006412a6e471cmr6896106iot.42.1646977993769; Thu, 10
 Mar 2022 21:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20220310081548.31846-1-steve.lee.analog@gmail.com>
 <SJ0PR03MB67794358405FA661992A206D990B9@SJ0PR03MB6779.namprd03.prod.outlook.com>
 <YinhDPrSvrYV5vKp@sirena.org.uk>
In-Reply-To: <YinhDPrSvrYV5vKp@sirena.org.uk>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Fri, 11 Mar 2022 14:53:02 +0900
Message-ID: <CA+Fz0PZN=aW=YQ=np=tbcJat-B7GR-DFeWKufABEJbPfOz9bpA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98390: Add reset gpio control
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "steves.lee@maximintegrated.com" <steves.lee@maximintegrated.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "Sa,
 Nuno" <Nuno.Sa@analog.com>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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

On Thu, Mar 10, 2022 at 8:29 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Mar 10, 2022 at 08:48:09AM +0000, Sa, Nuno wrote:
>
> > > +   max98390->reset_gpio = of_get_named_gpio(i2c-
> > > >dev.of_node,
> > > +                                           "maxim,reset-gpios", 0);
>
> > Why not using devm_gpiod_get_optional()? We could request the pin
> > already in the asserted state and make the code slightly better...
>
> Yes, and it'd support other firmware interfaces too.  We also need an
> update to the binding document covering the new property.
>
> Might also be worth putting the device into reset when unloading the
> driver, though that's not essential.

I will check and update v2 patch.
