Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D838D6FC
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D651681;
	Sat, 22 May 2021 20:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D651681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621708575;
	bh=dzqLyA/OqDblUjyOGrjyxm4W6ppYWH5kC2KfzgiLwpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZcMadSGqaoBhhE39ej/ikcZcXFSp8dBbur+5HzP5HTHjJFq6gh1A4ZlI902bWDUYE
	 9dNF10Gx5Pks9wqjMjjtsydl7oKZPDzmg/FyekiNffRkn9vo91K0RVwivpLH6IPLOi
	 Y4KJSMamnzH6fVlJPNMtYins228Eh+sVumjTTaAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD218F80257;
	Sat, 22 May 2021 20:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 177F2F80229; Sat, 22 May 2021 20:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F30BF8020B
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F30BF8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J5bAPZF4"
Received: by mail-pl1-x62a.google.com with SMTP id a7so3918263plh.3
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UT3idbb+/CKlgAZo8J+QyttKJ62VQ/voVfgpCB2NdyU=;
 b=J5bAPZF4Ka5Bm5ReT+pAgr6e+ORxz1zfdvsbG4tdIL1zt33akgEKdI8nC1Www790nI
 2dsgZPO/zQkJ4UPYn23eIMsVkuhlBjBrBrH99kH3DqMPTC2mDU8o3aWwVaOSxj2h5VKr
 A43K84c/T1JLKo4ooHyFHOAO2q9DSbnLWAIaCFJ1NXr6XdXNK1U5BXqF7kcn/mKXC+8I
 cpnRCvOaKgon0gyTQ6JYq2qgY0TgPVrp0U03J+wEnXMvGa5u6VRnEaxTsGMzVHmaIREL
 TdWHrJ6J1A+alIxqGw3W8ug7lXDGPkn9DyCWsgnGdU38OLYoSScBLIYX5BcSndjwBOlf
 8maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UT3idbb+/CKlgAZo8J+QyttKJ62VQ/voVfgpCB2NdyU=;
 b=CiVBywKwPNjkQ9hcPYsbYSIva0U9Pp8Vj1qji8XetigVAJVOZRI9YRmHC0oUpOh557
 VQnaAJKgCVVxwIK7wtRTpSJvBS0NTJxoUDRdASjyDGs9Z69hxMLdE4Kp59eRhyQAUF8B
 HKkF7bwJLtYhHVKg6r5WTOJPUi2fKRASoS79Wgchg8lRPFAGqnQdUnCZ7iHAwwU6spI2
 /xMz5uyQP5VRq56qHFKybaINlov84OAwgh5wzZj6gewBJmRpOBqnsKmVWzGsI9KNWeke
 rkFhD+9G9LrW9Y8Qy4bwh44iwn5VEf1yfnNByWVkgY7SsVOgfoqK9c9TCl0jmq/J7GrO
 jOjw==
X-Gm-Message-State: AOAM531j7K3RmLOXGHt33kDzuUqDuDgrsWVPuFnnTDPbJGzEGEK04pUg
 pc1cTAcBGi2AOxb9z2TMJ21L3DrLKG1db6rcz14=
X-Google-Smtp-Source: ABdhPJy1U2YceGLwHCiM/BicK0yVF4RzJdhSMODobo4Pfb6dJSj5p5+9aFEwW5Hq1tWUIakJUVOXnCOC0hQg52gIRXY=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr18139299plc.0.1621708477253; Sat, 22 May
 2021 11:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-9-hdegoede@redhat.com>
In-Reply-To: <20210521171418.393871-9-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 May 2021 21:34:20 +0300
Message-ID: <CAHp75VeOpT9yJx8FT57NwQQCo0ojs+-sHZn7D3DSA=caH3FZMg@mail.gmail.com>
Subject: Re: [PATCH 8/8] iio: accel: bmc150: Set label based on accel-location
 for ACPI DUAL250E fwnodes
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
> Some Yoga laptops with 1 accelerometer in the display and 1 in the base,
> use an ACPI HID of DUAL250E instead of BOSC0200.
>
> Set the iio-device's label for DUAL250E devices to a value indicating which
> sensor is which, mirroring how we do this for BOSC0200 dual sensor devices.
>
> Note the DUAL250E fwnode unfortunately does not include a mount-matrix.

> +       /* Special case for devices with a "DUAL250E" HID */
> +       if (adev && acpi_dev_hid_uid_match(adev, "DUAL250E", NULL)) {
> +               if (strcmp(dev_name(dev), "i2c-DUAL250E:base") == 0)
> +                       label = "accel-base";
> +               else
> +                       label = "accel-display";
> +
> +               indio_dev->label = label;
> +               return false; /* DUAL250E fwnodes have no mount matrix info */
> +       }
> +
>         if (!adev || !acpi_dev_hid_uid_match(adev, "BOSC0200", NULL))
>                 return false;


This sounds to me like

_apply_orientation_generic()
...

_apply_orientation_dual250e()


_apply_orientation()

if ()
  return _apply_orientation_generic()

if ()
 return _apply_orientation_dual250e

return false;



--
With Best Regards,
Andy Shevchenko
