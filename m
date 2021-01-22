Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17389300DE8
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:41:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA751EF3;
	Fri, 22 Jan 2021 21:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA751EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611348108;
	bh=XFWAZTDNCzDwJFABRX7QOGARkIzv5j/d+fqEKPfMgl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BAFJXgSMjrbwdI7n1CmWTQDnuuLehr4liSEDmaTFWO5t/MZCNVfWOaa4L8/2yLJjq
	 asEjgQmxjznonZyZAvlcKyUgLJN1BR+9fDWkKSRZBUV73v98qNuh14iO9un9824vF2
	 LPjNJCnUc0WnOO2rNTYHaF4lg6QSYIU46n5iwQls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1685F80166;
	Fri, 22 Jan 2021 21:40:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50BDBF8019B; Fri, 22 Jan 2021 21:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C208DF8016E
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C208DF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fgcWBQDd"
Received: by mail-pg1-x52c.google.com with SMTP id c22so4575696pgg.13
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPBpTtNISftNMnwOVfv0OcRq7P7OLC0DLakDCVVKP/U=;
 b=fgcWBQDdJ0m1A8KrLvi9mOIAG0c1vqbz725WE9Yq4aZM0AIG7DSAN/OBvxu4pA1rLe
 70+Vd6TWFk5J9wwuTdVdrvtHub1/AKBCruwfJP4f3uU62PQP2N3kli+mzQC6hIMvrJ6e
 qx8/BcLGdhZ/Yw5YwbTWVkw+084MCcieaDEnTsfAeq9HWUWiZJufrT1vpa9+cMGfP5C5
 4KtWEd98cP1RnNSyLytLlO5lYqj0xPsB752MOxKxeZ8JWnlwEUU4dmuoubzE01n3xeUH
 /MW59zP4bMvLIfmXoT1h1fJKuaRS2M21yebh0cwC8JsybV7mXg4BS0iF5tYkaRK5vU0z
 J6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPBpTtNISftNMnwOVfv0OcRq7P7OLC0DLakDCVVKP/U=;
 b=LsuGCHTTn6MgCyysVju/DSuk92UG8TWx3CceSc5l+cUr/nbJ8Qpe0OddsutRHclkTQ
 mgpmrtDKH5P/Chv0GOSlxglEtWhH6jNp0S6I5AzdUwYR44jMa9k10yNok+RTwIYze4bZ
 Vf/e33b21/zrnNduqgx3kTgh7Tqea60mW/k91jAlXgXTxWW7lDX+On0i9EYNpCA4rm+v
 6UBEITtmfsnMKHS9PjgoOUgsvxfdCxnHKdNY94c/317zyqgdzW39dBxzycoH57QnyIlc
 YZ198wdI9OsArrnZ0uoOOQ15cKigalo/OSSwYcGva3VhBPPSNqqVoWGJlb1+HuACT9ob
 QGaA==
X-Gm-Message-State: AOAM531F1P1gyiWozPPy4ngGPoedSbUVgMgROSacDA47V1VenVGe9ae5
 /qPifyBa89h0EVSg3Xy1n3ws/OVhP9KjzJjX8zk=
X-Google-Smtp-Source: ABdhPJwnbZ+jAOGuV98zPaY7ANvVMlLzk73pb/52V5+0ncXlHDi/+mOtDdqNqaD4GwHheMMKR5Kg8GQRrKXfDvMNFGU=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr6578225pfk.73.1611348004138; Fri, 22
 Jan 2021 12:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-7-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Jan 2021 22:40:53 +0200
Message-ID: <CAHp75VedGzihYi1Ndjj4K4326pMrLtk3V7gi_rxteu5HaqWfEA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] ASoC/extcon: arizona: Move arizona jack code to
 sound/soc/codecs/arizona-jack.c
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The jack handling for arizona codecs is being refactored so that it is
> done directly by the codec drivers, instead of having an extcon-driver
> bind to a separate "arizona-extcon" child-device for this.
>
> drivers/mfd/arizona-core.c has already been updated to no longer
> instantiate an "arizona-extcon" child-device for the arizona codecs.
>
> This means that the "arizona-extcon" driver is no longer useful
> (there are no longer any devices for it to bind to).
>
> This commit drops the extcon Kconfig / Makefile bits and moves
> drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c .
>
> This is a preparation patch for converting the arizona extcon-driver into
> a helper library for letting the arizona codec-drivers directly report jack
> state through the standard sound/soc/soc-jack.c functions.

...

>  MAINTAINERS                                               | 1 -

> -F:     drivers/extcon/extcon-arizona.c

Commit message doesn't shed a light if we need to move this actually
to another record in MAINTAINERS database.

-- 
With Best Regards,
Andy Shevchenko
