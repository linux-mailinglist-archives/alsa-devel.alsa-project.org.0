Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D12324D13
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 10:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F121655;
	Thu, 25 Feb 2021 10:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F121655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614246130;
	bh=NySZg68iF+xCsotyhroizogobFz2BWNu/H+MIjvhL1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HCOJ3cPIZYr+gM7TZapdCLEDCKcES1ocymKxMN+9jrpTHg0JPlKfaU87CpbPsa6A6
	 omz1rsLFB0AVCEeUAYfX+pke5kQtpS7TsDo1hQr1Tw+yykQf1ZQsoKYN2h5L7Ph8ec
	 wSj98/Nzt6RQ8Rrm0gRGTUagTwb8DNN2EBdNVxb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3D4F800D2;
	Thu, 25 Feb 2021 10:40:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C559DF800D2; Thu, 25 Feb 2021 10:40:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC8C4F800D2
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 10:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC8C4F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Q2P7SdD1"
Received: by mail-il1-x12c.google.com with SMTP id z18so4338717ile.9
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xuyUCiPBvn13xopnoJ6QCfsNWMMSBma0qCRPKKO2B0w=;
 b=Q2P7SdD1rVbufaHBjtmF9H3QDamw46psb5BL+KZ7JzWnZwX+X3mhBtgKieqt/sRnpI
 PE8BV8KzX35rq8NCuYveO4alAb/wdSv3FjzoZOiA+2EdOQNmvczIAKjBhG8/F/UMrHaD
 ulblsQDHfJ4BrtForDvplOfqVSu/QGMTwOKKC4NVEsMuydemfMzrKLqVDVlkonzjbjUB
 Ij77dOw5ZN9flekAiFa/WFXMBiK3VO3hVxEN6e04fJQIyOVvF2TZnQ9QiI3+OwRmvD2+
 O6Glg5y2ccaRrqtEqB8C1++UjDqhGmspw5WtZJaiG6iJ+4OEyyBceRpM9OPlizAUHCZa
 IkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xuyUCiPBvn13xopnoJ6QCfsNWMMSBma0qCRPKKO2B0w=;
 b=GJ0ljUqMzQzQiCFs8+IfjFnbxMUtO+MFPtU3GsBUXcfP7ftcmt5XY2GDR1Tc+grXg5
 Pk+4AP9ttyYvu0aet69ACf4tz+GaRlsuqEkycvLRExJYswAmJ4/a6k9K+tMznfhIzwIl
 XehQowRYSnihcYAmAo/ts8c2Wl7J2+pAh8N7n7yOL4QYIwYxmAOh8hftlcwHAxiwoBmM
 jRcO+fNBMnSX72wVdgG26qemsLdLzmWLN/oC2/hfrSsqYoxkMM/6nMOtWMsEUzi04PyZ
 FTFLvLjvldRYt+zdlcKenimbmYahx/T6Nnho4jXo23ch1RX+XZegxHxU9UXylx0qki6v
 KDMQ==
X-Gm-Message-State: AOAM533H9qfWsSpVkmW+5Mv1oif/z2vrQSVSl3QGHiPkW3aJPpNJm4j0
 leB+tc0QsoQWvnBNAC/3nDzSfkTIj4FlHOVof9YXkA==
X-Google-Smtp-Source: ABdhPJxWMZlETkE2TBQpV1kmcaW3l9fh3hi+gU+rj4+Mdnj6WDPLIwZhLDvtLKPBQMFb+kiTU/QxE8Pks9U7auvz2/M=
X-Received: by 2002:a92:2c08:: with SMTP id t8mr1747236ile.72.1614246025095;
 Thu, 25 Feb 2021 01:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20210225084545.13359-1-jack.yu@realtek.com>
In-Reply-To: <20210225084545.13359-1-jack.yu@realtek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 25 Feb 2021 17:40:14 +0800
Message-ID: <CA+Px+wW-f3XHa3xJFggGkx7=wwrwTLQDvnM55+KN_Zp4pkOm9g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
To: Jack Yu <jack.yu@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: oder_chiou@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 lars@metafoo.de, =?UTF-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, kenny_chen@realtek.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

On Thu, Feb 25, 2021 at 4:47 PM <jack.yu@realtek.com> wrote:
>  static struct platform_driver rt1015p_platform_driver = {
>         .driver = {
>                 .name = "rt1015p",
>                 .of_match_table = of_match_ptr(rt1015p_device_id),
> +#ifdef CONFIG_ACPI
> +               .acpi_match_table = ACPI_PTR(rt1015p_acpi_match),
> +#endif

You don't need the guard because ACPI_PTR() returns NULL if
CONFIG_ACPI is not defined.
