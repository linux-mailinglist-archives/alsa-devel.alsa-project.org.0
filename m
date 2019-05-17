Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B382206E
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 00:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E12D1693;
	Sat, 18 May 2019 00:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E12D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558133451;
	bh=787A9tmxFD7iINs0wwXPNA+xizd33RInZsGGgUFL7ck=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjt+iDyitF0e+9xc5R3UFcAiu68GFeQi5i1LpFSMHD5rKBRkWeWj8FBCSg7tqzQgR
	 ZHXfkMC/9B3/gbTvjRVjUt9MOXkQfcok5LLdz2wBckht0Onob1KN8SY44agpXUk3Tf
	 fSdFVGyUYFobG04kZnTgYcPz9UTz59h4R9Fb6ncc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9085F8968A;
	Sat, 18 May 2019 00:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE82DF8968A; Sat, 18 May 2019 00:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE795F80759
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 00:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE795F80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j1fMEwmF"
Received: by mail-it1-x142.google.com with SMTP id a190so14420294ite.4
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 15:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fWLIDy2co5Vn50CtpXbdQSItadAnwXRU6oL36I+LMbU=;
 b=j1fMEwmFBzpq5dKJ/MaU3D+drIuI0ARLCKClUL2DUep1n6kX4Fj3FE+3y2BpqzVZcg
 cEeqDwknBjsY/k8bhbZb9ooIqb2AicXfoG+WcGFLfDGOXOwGm39gXALlBPzi1fE7dZkl
 Gy0hqJ4vSeb3tcYqh9HvuEQUYmtA/7AZnr2/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fWLIDy2co5Vn50CtpXbdQSItadAnwXRU6oL36I+LMbU=;
 b=Zixxxhbij25Xe8gG6T7oDHJk4ocDe5P1OZ++lcQEkIhw9jN555ycxJr6Tt9+17HPXX
 L2NVRLHWM9VpXpuyUFDoPb55AbfaHjwyLkIWzoQdLzUTsxtGoUv0wEDYOuXvxIO4VfPo
 1ig2SX1DvtMt2Y9M/OwovIi9OyVPzutUFGZlKo58Nl14ue6IgUS54lrJH7z8kbyreOxt
 FHEvZmt2mfDsuuXNijsW0Mi88UkGUqwYOhJzyVbL+YxOL9S5UbtfPZtikzq9rzk3KKYl
 Y+94utNyuJAixA3idSABNch6VQ0Al2hFdJ9HA8ZHyzTkpiqceGk/h8tDt8brTBYsuxi5
 IRTg==
X-Gm-Message-State: APjAAAWrbLCVxxckFQcFAGvAu0FL4f9FP25y7P1G+KgW+ujAhSxW0wdH
 sKtUElNDKqUW3o+QwGb1Z+eTuikyDcCS7hn8qJ+/OQ==
X-Google-Smtp-Source: APXvYqyYg5NJJ7Eb1Cf1sch9W6PqiIZNmQkePH7xL+iwmKaY8JvrKHQXzNzcY6+FGrg1OB6xJE1HilF2iy1ns9vW/Ag=
X-Received: by 2002:a02:1142:: with SMTP id 63mr37714962jaf.19.1558133338638; 
 Fri, 17 May 2019 15:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190509211353.213194-1-gwendal@chromium.org>
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Fri, 17 May 2019 15:48:47 -0700
Message-ID: <CAPUE2ut4OUhrmbx6n8KCj7+ghXmC9iMnxGN8DMvyvZstznwwng@mail.gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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

Lee,

I verified and merged the changes on the kernels (3.18, 4.4 and 4.14)
used on chromebook using a squashed version of these patches.
(crrev.com/c/1583322, crrev.com/c/1583385, crrev.com/c/1583321
respectively)
Please let me know if you have any questions.

Thanks,

Gwendal.

On Thu, May 9, 2019 at 2:14 PM Gwendal Grignou <gwendal@chromium.org> wrote:
>
> The interface between CrosEC embedded controller and the host,
> described by cros_ec_commands.h, as diverged from what the embedded
> controller really support.
>
> The source of thruth is at
> https://chromium.googlesource.com/chromiumos/platform/ec/+/master/include/ec_commands.h
>
> That include file is converted to remove ACPI and Embedded only code.
>
> From now on, cros_ec_commands.h will be automatically generated from
> the file above, do not modify directly.
>
> Fell free to squash the commits below.
>
> Changes in v3:
> - Rebase after commit 81888d8ab1532 ("mfd: cros_ec: Update the EC feature codes")
> - Add Acked-by: Benson Leung <bleung@chromium.org>
>
> Changes in v2:
> - Move I2S changes at the end of the patchset, squashed with change in
>   sound/soc/codecs/cros_ec_codec.c to match new interface.
> - Add Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> Gwendal Grignou (30):
>   mfd: cros_ec: Update license term
>   mfd: cros_ec: Zero BUILD_ macro
>   mfd: cros_ec: set comments properly
>   mfd: cros_ec: add ec_align macros
>   mfd: cros_ec: Define commands as 4-digit UPPER CASE hex values
>   mfd: cros_ec: use BIT macro
>   mfd: cros_ec: Update ACPI interface definition
>   mfd: cros_ec: move HDMI CEC API definition
>   mfd: cros_ec: Remove zero-size structs
>   mfd: cros_ec: Add Flash V2 commands API
>   mfd: cros_ec: Add PWM_SET_DUTY API
>   mfd: cros_ec: Add lightbar v2 API
>   mfd: cros_ec: Expand hash API
>   mfd: cros_ec: Add EC transport protocol v4
>   mfd: cros_ec: Complete MEMS sensor API
>   mfd: cros_ec: Fix event processing API
>   mfd: cros_ec: Add fingerprint API
>   mfd: cros_ec: Fix temperature API
>   mfd: cros_ec: Complete Power and USB PD API
>   mfd: cros_ec: Add API for keyboard testing
>   mfd: cros_ec: Add Hibernate API
>   mfd: cros_ec: Add Smart Battery Firmware update API
>   mfd: cros_ec: Add I2C passthru protection API
>   mfd: cros_ec: Add API for EC-EC communication
>   mfd: cros_ec: Add API for Touchpad support
>   mfd: cros_ec: Add API for Fingerprint support
>   mfd: cros_ec: Add API for rwsig
>   mfd: cros_ec: Add SKU ID and Secure storage API
>   mfd: cros_ec: Add Management API entry points
>   mfd: cros_ec: Update I2S API
>
>  include/linux/mfd/cros_ec_commands.h | 3658 ++++++++++++++++++++------
>  sound/soc/codecs/cros_ec_codec.c     |    8 +-
>  2 files changed, 2915 insertions(+), 751 deletions(-)
>
> --
> 2.21.0.1020.gf2820cf01a-goog
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
