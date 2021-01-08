Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E72EECC0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 06:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82A91692;
	Fri,  8 Jan 2021 05:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82A91692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610082003;
	bh=W4rdGLSTxKDPfw75JgfkaBzk5kk79wjjJ9VA6MTDa2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwuMasgAvxajmWGkT9Of18eLJT1baBcGsPUdqlI28LBhU9olwO4VALP+DgP1ZoGII
	 U4UFnw+yqdRWz2sJwUaYep3t6C7eaiVQKZ9uMJpElG7Z+Z2aCd17l3E6uLubo+1VVk
	 8q3Vscc2glj6mGqnYPm3ibyQJJUk+kupVek9tvGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53DF8F800EE;
	Fri,  8 Jan 2021 05:58:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82EEDF80166; Fri,  8 Jan 2021 05:58:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC697F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 05:58:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC697F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EBMZa6kB"
Received: by mail-vs1-xe33.google.com with SMTP id e20so4885046vsr.12
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 20:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W4rdGLSTxKDPfw75JgfkaBzk5kk79wjjJ9VA6MTDa2Q=;
 b=EBMZa6kBZYBFUvIxtYUIFiOOXtkDLs6tu3Tvx5QATngETYkJghg2EliH4XTOPu6Bt+
 0t0NHpFnagN3TCzOA5+FLEHim1DI7PQ+X692eSQBbEHYYGOPWws48yRbHkqKQ7+yhTug
 QUhLjTjv8/eAlumFy41A9Hy1hZxx9jD7xPBb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W4rdGLSTxKDPfw75JgfkaBzk5kk79wjjJ9VA6MTDa2Q=;
 b=lHKnnOeYm+1D1FJ16T31XUVxmwY2Cu7lmgOBXoJh2nS30nugRSMRSCETbGWMD4kBJC
 FgSq+idmbjhhNGECDlcuu1Dw0557Z1rmRtjRuPyVqjOVJ8x4td6naZE0xyHjibXbXuQD
 dUlJRbInMwZIt4GI95gi9MTwKiYLlG+kvV/w+Z/upOAoh9vR9sFnQFRd3PtCCNdx/MzH
 8ryReb71EH3YTlz9foU63IPkFBgB0FfuUdPwOBJpua+8uM3uY3Hb/+tW3toojYxuWRGr
 XfuRI1Dqs+UzRpLfg1z2qMehfks0El7MXG/NQ+EHO2HuV4BGwMvEf8Ifz14PRs7t3IEF
 cU/w==
X-Gm-Message-State: AOAM533ipfUoZLnPx1+TXAGU4s3Ge6//4TYRQnK8/NpqFfCsWJAMh0I1
 mtaWrh1Nlu5Ri94c9ic62jxU9Z9aDabyiO8uOFU3Dw==
X-Google-Smtp-Source: ABdhPJyUCYN4dVE7lrXmBC6FacDWh+fEpOGViWqsFYTO/SaNqRzaLv9WnGjUVFdcO3x4xtbcyaLZOpuEZ4UuFIMfrG0=
X-Received: by 2002:a67:2287:: with SMTP id i129mr1529947vsi.15.1610081882763; 
 Thu, 07 Jan 2021 20:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
 <20210107135459.GB4726@sirena.org.uk>
In-Reply-To: <20210107135459.GB4726@sirena.org.uk>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 8 Jan 2021 12:57:51 +0800
Message-ID: <CAGvk5PqMCEib8Yr=V4SxT0BBMoC1+yGXm0y+52+LwC5dPQUVnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B41=E6=9C=887=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Jan 07, 2021 at 04:59:41PM +0800, Yu-Hsuan Hsu wrote:
> > Add the new command EC_CODEC_I2S_RX_RESET in ec_codec_i2s_rx_subcmd,
> > which is used for resetting the EC codec.
>
> I think the request was to sync over all the commands that are supported
> in the EC rather than just split this one addition into a separate
> patch.
Got it. However, after running make_linux_ec_commands_h.sh to create
the new cros_ec_commands.h, I found there are lots of difference (1092
insertions(+), 66 deletions(-)). In addition, there are also some
redefined variables(most are in ./include/linux/usb/pd.h) causing the
compile error.

It seems not easy to sync cros_ec_commands.h. I'm afraid of breaking
something. Does anyone have any suggestion? Thanks.
