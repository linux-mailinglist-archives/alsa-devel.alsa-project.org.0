Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A037715B
	for <lists+alsa-devel@lfdr.de>; Sat,  8 May 2021 13:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C82167B;
	Sat,  8 May 2021 13:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C82167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620472374;
	bh=TrtBT3IlYaKgSLB+YlDHfaCOi6T/+MF1FtkDal6n2RA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PdjvOBgycBMFGPiS9/puawcVV9z5VeWrNSg92AoXiyzBZWgjB/wtqe1zb94UgfHCv
	 TtXBhixicZPeCvmpf+YmYbRkBL6yOhSiEs/D5XQt8VYOkHk/d3SJw7B+byAibp+ChI
	 +YE7YLSM6wp2KjcavfwNNyxq0nbdWsaadNvnngr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8DEF8010B;
	Sat,  8 May 2021 13:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E6CF8021C; Sat,  8 May 2021 13:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E278F8010B
 for <alsa-devel@alsa-project.org>; Sat,  8 May 2021 13:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E278F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ni+FkHxQ"
Received: by mail-qt1-x82b.google.com with SMTP id t7so8556033qtn.3
 for <alsa-devel@alsa-project.org>; Sat, 08 May 2021 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfDuILVJ/qrRaqU8xHoH2Xwtecz2dupT4Jbb53C42Yk=;
 b=Ni+FkHxQ5UDdVFDKXHv70m55YzCQW5Wexb2/Mt8KAgEzMEg81c/6zElDN0EHYdFNc7
 GTj3fwc2wpxevfQNbFUym2Ac+Hy+JnDvYMWjKV6jNjo8+vhod+bP+V6q7ZnGiJKidlOg
 psAH9gYK/UzDdRy/5j/blUNcU7DRpA2nhzofTJxZKMH4s6NLI8Etr0weALwYJX2ryVyC
 2Lmu7ebHjumSK7e3I2/aJfc7O+yFVc1HpUJaFK6ZbQy8IjSfJKgHALIbA7KugiLMxTFT
 nxe0yA7tnGbrkY4bYtcnaK5YEcG2MNjmUdq0n6Cup85+o+B3pPmzUGTGEv6oRabZec8z
 rZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfDuILVJ/qrRaqU8xHoH2Xwtecz2dupT4Jbb53C42Yk=;
 b=ozt/KBsPcXPpd0QjcofhCeboi4fCiGklMK6ejSZk7jIwuNUde7BiwB8o61y1ygPgGa
 X2tG1VX+vQmYvWBar/YQBS/8rRtCGjaejlGelhMskYYpoY27C+Eh1t+rIb1yz9m+eNOQ
 oG4O7m287PDZn3cTmOugmvg0HCPS67cJrLCqNsKaj0JPK/PJseEbxFKtyKFkhx88wU0K
 IpOXjyyJGByEsqwJnAt3Q4repFZ1r2NVnuoVOwZAwzFuRxOzh0CZ9+SiPrbTK1h93piZ
 yLpPYkj1pKkiZIdBxeJ5P/TE9pbdc4AlcE17Iv3WbIwreL2Wk32+5gy98cVwEPflyzeg
 wA+w==
X-Gm-Message-State: AOAM530wksC0hhXBvRinGtV1puOO80mVj/EeIlpEitWTHP309g32631C
 nCcDb2GJT/Dhih/dOK/bd2HY8YjX/X/Oye4U/9c=
X-Google-Smtp-Source: ABdhPJxoEslillAXm4KdMahYQZppkAGITUmkSjIpfL9o/fSNmiaqygZFF7zP3VcYAKQyGtzP0pX6x86BuieDRgbJ2x4=
X-Received: by 2002:ac8:47da:: with SMTP id d26mr13176229qtr.292.1620472275009; 
 Sat, 08 May 2021 04:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <1619157107-3734-1-git-send-email-shengjiu.wang@nxp.com>
 <20210504065736.bcnatgmy2gczynsr@pengutronix.de>
In-Reply-To: <20210504065736.bcnatgmy2gczynsr@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 8 May 2021 19:11:04 +0800
Message-ID: <CAA+D8AMzfj1QY-uXd6Ew7wCXomyDSdokHa-ReP6ucZjVnvYHGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: imx-akcodec: Add imx-akcodec machine driver
To: Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
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

Hi

On Tue, May 4, 2021 at 2:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> On 21-04-23 13:51, Shengjiu Wang wrote:
> > Add machine driver for i.MX boards that have
> > AK4458/AK5558/AK4497/AK5552 DAC/ADC attached to
> > SAI interface.
>
> Why? Does simple-audio-card don't fit?

No.  We need to support asrc->sai->codec case,
but simple-audio-card don't support it. simple-audio-card
needs the cpu dai is dummy on BE. And we need to
support the DSD format, this driver help to switch
the dai fmt from pdm to i2s according to the DSD or non-DSD.

best regards
wang shengjiu
