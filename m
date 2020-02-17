Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7E5160BFF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E27A1683;
	Mon, 17 Feb 2020 08:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E27A1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581926291;
	bh=2GaPIzXEX2ziNaBQzrkE2MfWRN7JTua5FkqavVj5ORw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sPPjChzwhqGUzNM4DsxWxRtl3P3K5i4nFNwTdLjqcobLHOosckEZ6oO3UVqOEFNHu
	 u2FKHYqR915/vmSea4A0MM4Gx7l7AfaJZtJurMPaA5c9OEO6HyH90BXlITniVJcshw
	 0mBOg4Ud91M+dpC120T15mTI5BBLIE3LpcB/MQf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E2FF8025F;
	Mon, 17 Feb 2020 08:56:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04599F80277; Mon, 17 Feb 2020 08:56:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15DE0F8025F
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15DE0F8025F
Received: by mail-ed1-f65.google.com with SMTP id dc19so19541367edb.10
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=POZSjnznzGFS7zRQrJFpM+E5CtoyaZYCXz+IRVPYHNw=;
 b=HAA95iPq+uVA6Lb8MflrGbDJ7ISl4Ashr6KRmhvCRJkMOHJ+2fVoSKPJGYHz3aKr5c
 adkueV332yElXOAfjN6wxWK8xsBI4eSmjVGjm9rU6owqxMpNfL+lFeKcD2rlrq+xGLFA
 ZPgkQ+/5leUPN/Y7AqWd86A/v7OyJSerlB8D9GShyJeWUSztFdeyBC1NR7o6HW6zAAyM
 46fF5PmlyBu/E3jF2HtSyiv+ZFwL6P3NStG6lWUGfQOabZKadSXIDmxtHduaigbUkQBt
 CRMiZYHSNiGO1ic1LzAiLMjojaS9ZCjEnl0cNsm0vFZfiy7mGuOLtHDJw5aDUAGtGCkf
 885Q==
X-Gm-Message-State: APjAAAWFMqg7+XCP6wRmIrsQ/lpu8vtvc0ojMIBE3o5RgnvNsDOwh7pR
 ev6lV1YXf8mx256p+Cpqk3NNKEVJJOA=
X-Google-Smtp-Source: APXvYqyIese24hEoiYizyENM7GQmDB6RukBGf15H6alW9QvVaaDuXBXvSXbxxPalgDh3bV7X4EfY3A==
X-Received: by 2002:a17:906:e86:: with SMTP id
 p6mr13436750ejf.299.1581926169281; 
 Sun, 16 Feb 2020 23:56:09 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id r24sm502486edv.69.2020.02.16.23.56.07
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:56:08 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id y11so18382252wrt.6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:56:07 -0800 (PST)
X-Received: by 2002:a5d:484f:: with SMTP id n15mr20409557wrs.365.1581926167590; 
 Sun, 16 Feb 2020 23:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-16-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-16-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:55:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ZHb0angmhZwkOA0uvKX1sNW+pERfhp4YiUHVeBB0g3Q@mail.gmail.com>
Message-ID: <CAGb2v65ZHb0angmhZwkOA0uvKX1sNW+pERfhp4YiUHVeBB0g3Q@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 15/34] ASoC: sun8i-codec: Fix
	ADC_DIG_CTRL field name
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
> This is the enable bit for the "AD"C, no the "DA"C.
>
> Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
