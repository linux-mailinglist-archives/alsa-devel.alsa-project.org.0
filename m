Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C050038D6DE
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2AB81696;
	Sat, 22 May 2021 20:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2AB81696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621707169;
	bh=0J2lu4G+dxis9RazZT0NkRZ50+fRbeVZYlnnMoMHkiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qx6fKxWhulBYIf8F2LQ16HHW7mrtxgcEgV1IX+ZW1NA/BREXSh427YJ/sjnvi0/Jo
	 F56G3KMoW6z7XmjVINZd+bGzK2W/m+fZoQ1NSdNEAQRkbxw6nk9v5TjMrj8cdgmLcs
	 4gtVAfy3xmUQhouSGdM3J3I8V8RAVV7G1xd+FoTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F71F80257;
	Sat, 22 May 2021 20:11:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A088F80229; Sat, 22 May 2021 20:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D85E1F800DF
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85E1F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VHJIUfmL"
Received: by mail-pf1-x42a.google.com with SMTP id g18so15736047pfr.2
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SK1jwCORAJwOku71k74kizq3BL/irGNdgIM5FobjmM=;
 b=VHJIUfmLszzHd+U/XxstxbnDiua+CqbneEPzSwbTrodTOtPvnn86yMa9AcyoPJO92Q
 7ynnKMbSMq7/1yUqP8XF0CF8hZSwezJiU3q4GS79TMLtaTgJ6aWqfyvT+NwIEZJMl1xY
 v4WHfjErBVp45Xwp9+9xN/BHOXG2+k/SP3LBQrYXRxVWjFjMQL20mOptdXm2ukhRwGx8
 Br1buXG1k8BRq87rwYJuA3PTtyt+qubUEqhN3db19aiJiXb2eXoFBo7M3zJYYrxPvQwd
 PuPmNn85YMrcRopcm72/3aI03L9kDvd7oGOkN+OJbR3q5UOrKd8/D8MIumUrP605pfCU
 EyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SK1jwCORAJwOku71k74kizq3BL/irGNdgIM5FobjmM=;
 b=llh1y23e5e4ipi38uMycjhz98/e5W4ECVBhY+mEDxTledVW1ohJVT5EVB28WJf1PkZ
 7gq31jCYT2ePuIZ4lhwucU2D1+NAJYWqUnAoAyukuhc/ld+BdSSdwq3QZDiaQHpktmLJ
 giZveixTjdK/xs4zwKHieshgP0ymHgbM/GBG39fBW5GBgA4Z10woGDzk/f/K+ZlPn1nx
 Dw4B7D0CwK/vB9oYpIdzq0RR810gRmDo6N8uLqZgyYjJ7Yx0aost868T/WQONutCLNoO
 qzY2NKwdPpE4PnIvvke3sdJxrUCK/5cLBNvjoXVq86SZT1RRZ/IT8BuhCIUeKlLbkWGM
 1wPQ==
X-Gm-Message-State: AOAM531cWa4Yy7IYD51Nk+UL678UFLk28st+Rk9PXOyl6g7K5520QN1H
 9KiF4Lqn24HkoJz41aMTZjbCfL+Zys4rUEv4hLs=
X-Google-Smtp-Source: ABdhPJxNLyTS1W/9LF7NcfOsca+cphRVoI5JVl72ltX0NVbzB6beP5o/0iTUNuBCog2Iz9M5dAWa7LGTFikQR9Psx3U=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr14588981pfh.73.1621707109670; Sat, 22
 May 2021 11:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-5-hdegoede@redhat.com>
In-Reply-To: <20210521171418.393871-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 May 2021 21:11:32 +0300
Message-ID: <CAHp75Vf_itoC8hiacBPXLK73NLbFre58b=wmVdEbviwEj0ZHHA@mail.gmail.com>
Subject: Re: [PATCH 4/8] iio: accel: bmc150: Add support for
 dual-accelerometers with a DUAL250E HID
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Lenovo Yoga 300-11IBR has a ACPI fwnode with a HID of DUAL250E
> which contains I2C and IRQ resources for 2 accelerometers, 1 in the
> display and one in the base of the device. Add support for this.

...

> +       board_info.irq = acpi_dev_gpio_irq_get_by(adev, NULL, 1);

If NULL will be there after the series, why not to use
acpi_dev_gpio_irq_get() directly?

-- 
With Best Regards,
Andy Shevchenko
