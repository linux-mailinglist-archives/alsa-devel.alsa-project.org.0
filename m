Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D915BF8C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 586F616A0;
	Thu, 13 Feb 2020 14:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 586F616A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581601146;
	bh=+0GsaL3JFUiBnPUu/d4+WWFOnqJUZdTPfAxSl4Vbhh8=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJ905QckUaQgZCiQ//dPkbk2dtzGld9/f1KSDu7rRco/9CbgKcgklcDC3B9teIGhz
	 p7nv3d9yVTtGu2EQC9ogB19cpykcvyW1Z/OQFOw46fwVD00+w5mJkIlWyDGD/NXfrU
	 xWc7tp2Jwr8brcjff2U9MPYJCtlMbaPo+OWS/sxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B72F80145;
	Thu, 13 Feb 2020 14:37:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65BF6F80145; Thu, 13 Feb 2020 14:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3028F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3028F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="lREixcYx"
Received: by mail-wm1-x343.google.com with SMTP id s144so7129359wme.1
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=sxsqagGeLumUFdcq50AfVMoV5tnNdOJIUWrTE3Ysc1A=;
 b=lREixcYxXZMd+HB4zB2kgeqIErnl7jdpIIkpsP5+/IOc4ptokJJUQl/hcsgLXyPMDo
 TeXUfvTxntS2PHa0smS3c6xXkpt20cclIbqaCcenZWG2Q11SNIO4WnQHdY/f84U0p+05
 qb/JgE3bECvD7RWiTcxt7s3ZFmctiS4R4ZIAiDAUZRABkajvcukxMsBHpYgOKhw5Upx9
 4ZfAgPiGZ+w8utqHIqh62/tCiGB0qBVGXRLi7dk6olziJvetq4jALpcZDBug9m7QvdTr
 4qsD+sxNrkslbVOIde4Csc7qnI8jUDm02AdAZSTw0nF/m7/5mA9Y72Q9R8LeNQ1k9anM
 W1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=sxsqagGeLumUFdcq50AfVMoV5tnNdOJIUWrTE3Ysc1A=;
 b=JkVRxPvf4XsryGWSexvPDYCR0D1ueOaaMiiJMNYXvTVQU+mfW8KqX7fsIf2rPpW7G6
 i4XXHiQ3bonpXzF51AFU63TQTaApxBkAvAHEUJ+qlNb9VrPeT6H2FMxggOqJnJC2MUzh
 GR7XlnU/D/qPZkf21Ue+w5pbTpx9uqY4od/3gVDv8I2RuCWTjj8nThaPYbRsKjxKCdt+
 N4kXjCdMYerbeJSk152WK2PrzxrLnxwS2Y9af6E7jFmw9kGgeG8cvGNOLxOpAsBruMuc
 NaxXJ82oNhN7jbFA5lSv4byWgSaJ8Oas6biVi8ziY+o4ay9vDYT14dWJYmjMhWz1X1hN
 KsBg==
X-Gm-Message-State: APjAAAXMItbmyBnq4n4E1g8bKQgA2w4RDxdCGBsG7NCl5tAz9roSGb8/
 qJUXWugBpp8XzUt32Xm12SLywQ==
X-Google-Smtp-Source: APXvYqztiV9EvOZIAj+NxxlShIkxKNbZk+0M4SW5L7q87rWhDfrwA1ZAf1ZxaTm0hoeyiyP9i1JGSg==
X-Received: by 2002:a7b:ca49:: with SMTP id m9mr6164468wml.50.1581601039822;
 Thu, 13 Feb 2020 05:37:19 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g15sm2713097wro.65.2020.02.13.05.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 05:37:19 -0800 (PST)
References: <20200213061147.29386-1-samuel@sholland.org>
 <20200213061147.29386-2-samuel@sholland.org>
 <1jr1yyannl.fsf@starbuckisacylon.baylibre.com>
 <20200213113701.GA4333@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
In-reply-to: <20200213113701.GA4333@sirena.org.uk>
Date: Thu, 13 Feb 2020 14:37:18 +0100
Message-ID: <1jo8u2a9rl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: codec2codec: avoid
	invalid/double-free of pcm runtime
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


On Thu 13 Feb 2020 at 12:37, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 13, 2020 at 09:37:18AM +0100, Jerome Brunet wrote:
>
>> This brings another question/problem:
>> A link which has failed in PMU, could try in PMD to hw_free/shutdown a
>> dai which has not gone through startup/hw_params, right ?
>
> I think so, yes.

Maybe this can be solved using the dai active counts which the
codec-to-codec event is not updating. I'll try to come up with
something.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
