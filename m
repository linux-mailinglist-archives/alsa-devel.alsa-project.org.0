Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AF69F2D4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 11:39:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55315E83;
	Wed, 22 Feb 2023 11:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55315E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677062382;
	bh=gp2w0QkuelptL1Cp/PCquJQ1aJnbWyY9riv4z9+aoNs=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hRWXORIVF5FiorfDoDW9audSmdUybHpgOavTko2HPKRejaGQOkuBXnmneTWsd8Rig
	 aQl5bDZj3YdxCAlzAikTpNOvcKAfUutoNxbQQrz1ElsxuzTriQ9pH5Y+vun7ABnzy8
	 20gvRK9RL4QyELxOJ3vKA24OobJtlCTCDz+awk4s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58881F80125;
	Wed, 22 Feb 2023 11:38:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDFFBF80266; Wed, 22 Feb 2023 10:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 846E6F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 10:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846E6F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MaR6vviA
Received: by mail-lj1-x22f.google.com with SMTP id by8so2202325ljb.7
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 01:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yleek0oaFc70WbJunAtXSm0MOQeAIy9beRoYkSDegxQ=;
        b=MaR6vviAZKVp1bFr4GsfVcqKsd/ROQreCiDNcS1+A/LFIMFtBOmT5Zq/0YH1dh8EzE
         19ijszOgiXRWeTRZBoYGTWSR2M1W+qaB1soNJp9vb1GMyvJMT0xubVIVIilmbu2LY5V9
         7wlKMhiN0GFK6f/SXB7U0zf5wqg5XHbAJ31HEgI4nnKcvwkZfPbargHwsz322Kt9vLUc
         bevPvHUwQbg0VgPcGWsBIjIkTW2ExcW5kWunrqhddlXx1/8P5e/3ByfAy5PNlz/FeNpp
         WX6GD+kGdOmSr9U0t380kEfCMXcQ8tknOgLjtCoiAWvNX12416KNGZ/uiIcKzjAfXGlb
         MHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yleek0oaFc70WbJunAtXSm0MOQeAIy9beRoYkSDegxQ=;
        b=BvZ59FWMPamiiGN656mp0QH5jxUTvMBjoyFNdTFHpJ58u5AD7UVOXea+3apjC1O84x
         qDZ8Q7Co1Hq+xmDA+pQempEtv7mF+UIVcaRUo0BaGRf4LhLCG6Y9vfG97/M8JmCxgy0R
         mgbQlmdm9uFfAzfzCt1dWOhLqgshqf9qQRxYDfJLfKWJcYp7rIOVu3ItpntFuVtukd2r
         sJD+SD6s8AG7v6B4Plnx6JnRK4gwhW6AU2cLz/tTxJZ9qsKXoGDnq6EDcAqhmIocOzCO
         O5svVDeYqry19GJBhW2mVZ8l4ONWeqpC92gDwGp5ViAc+qbTnj0z0CYBSgit+joyDcVg
         87oQ==
X-Gm-Message-State: AO0yUKXlj1IXgKqqu/mcGUBKJnM1BEWGFJWTUNU0X95ppqMEXQi4WclP
	lnxNR4jzSdlg2b6dR4xQxOM=
X-Google-Smtp-Source: 
 AK7set/JBY1TYm0YPPO8CsPIN7FcVv0ivVO2LrB1rButFqoarh+nxqZLywS5l5PLR/ZvbWmGNiTH+w==
X-Received: by 2002:a2e:bc0d:0:b0:294:669b:8f97 with SMTP id
 b13-20020a2ebc0d000000b00294669b8f97mr4297154ljf.46.1677058801266;
        Wed, 22 Feb 2023 01:40:01 -0800 (PST)
Received: from [127.0.0.1] ([91.204.85.69])
        by smtp.gmail.com with ESMTPSA id
 o16-20020a2e9b50000000b002958bb2deacsm401396ljj.46.2023.02.22.01.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:40:00 -0800 (PST)
Date: Wed, 22 Feb 2023 11:39:59 +0200
From: =?UTF-8?B?0KHQstGP0YLQvtGB0LvQsNCyINCg0LjQs9C10LvRjA==?=
 <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_09/10=5D_staging=3A_dsp=3A_a?=
 =?US-ASCII?Q?dd_support_for_Fortemedia_FM34NE_DSP?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y/Xefn/76JW1C03d@kroah.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com> <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
 <Y/Xefn/76JW1C03d@kroah.com>
Message-ID: <C94BE033-EE34-40E4-96D4-1EB4C1B04A09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YJN5TJTIJBDZCCCTNOPPQJDNHG6ZI2WC
X-Message-ID-Hash: YJN5TJTIJBDZCCCTNOPPQJDNHG6ZI2WC
X-Mailman-Approved-At: Wed, 22 Feb 2023 10:38:47 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJN5TJTIJBDZCCCTNOPPQJDNHG6ZI2WC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



22 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2023 =D1=80=2E 11:21:02 GMT+02:00,=
 Greg Kroah-Hartman <gregkh@linuxfoundation=2Eorg> =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=B2(-=D0=BB=D0=B0):
>On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:
>> =D0=B2=D1=82, 21 =D0=BB=D1=8E=D1=82=2E 2023 =D1=80=2E =D0=BE 21:27 Greg=
 Kroah-Hartman
>> <gregkh@linuxfoundation=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>> >
>> > On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
>> > > FM34NE is digital sound processing chip used for active
>> > > noise suppression mainly on ASUS Transformers=2E
>> > >
>> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> > > ---
>> > >  drivers/staging/Kconfig          |   2 +
>> > >  drivers/staging/Makefile         |   1 +
>> > >  drivers/staging/dsp/Kconfig      |   7 +
>> > >  drivers/staging/dsp/Makefile     |   2 +
>> > >  drivers/staging/dsp/dsp-fm34ne=2Ec | 364 +++++++++++++
>> > >  drivers/staging/dsp/dsp-fm34ne=2Eh | 845 +++++++++++++++++++++++++=
++++++
>> > >  6 files changed, 1221 insertions(+)
>> > >  create mode 100644 drivers/staging/dsp/Kconfig
>> > >  create mode 100644 drivers/staging/dsp/Makefile
>> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne=2Ec
>> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne=2Eh
>> >
>> >
>> > Sorry, but why is this going into drivers/staging/ at all?  What is
>> > needed to be done to get this out of staging?  Why not do that work
>> > right now?  At the least, we need a TODO file in the directory that
>> > lists what needs to be done and who is responsible for it=2E
>>=20
>> Because this driver sets up fm34 and switches it to bypass mode allowin=
g
>> sound to work on the device=2E There is no dsp framework in kernel whic=
h could
>> be called to operate dsp from the actual sound codec=2E (If there is, I
>> would be glad
>> if you show me)=2E Fm34 must be active only on DMIC use, all other case=
s require
>> it to be in bypass=2E
>
>That does not explain at all why this needs to go into drivers/staging/
>and not the normal portion of the kernel=2E  Why this specific location?
>What is wrong with it that requires it to go here?

It is not fully functional and does not perform its main function (noise c=
ancellation) because it has to be called only for DMIC=2E Same time it is e=
ssential to be set so that audio could work on device=2E

Once there is such a framework in kernel, which allows to control dsp from=
, I assume, asoc machine driver, this driver can be moved wherever it shoul=
d be=2E Currently I can not tell where it should be since I haven't seen ds=
p drivers like this in kernel=2E

>In other words, you need to document _WHY_ it must go here as it is not
>obvious at all=2E
>
>thanks,
>
>greg k-h
