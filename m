Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D282F9EFA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 13:03:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A9017F6;
	Mon, 18 Jan 2021 13:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A9017F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610971384;
	bh=yij0b3kHENbQrdbRKEbQHvpxuBqlLDlZ5GAQ0Pw9Kvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tEPeahf/GckrD84YMD5/zj5jlbq0t00ZWU5gDuHFt909NWC85WqFhW511MT4wtZAx
	 GhqF/QxABlQfrpdw2qgcinqeBTfiotshXd1zgX+NOxrZFoDmKHYbUuWSDCFqFZ+gz+
	 N0HTAKAKM1v9i6M8okqaR0d5+5sdrn8fxTpCr73o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A677F8016E;
	Mon, 18 Jan 2021 13:02:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21DA6F8019D; Mon, 18 Jan 2021 13:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96A66F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A66F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="foMgbK9+"
Received: by mail-pg1-x534.google.com with SMTP id v19so10768507pgj.12
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 04:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7HW5Fn5HqLLSx1V6tfhUzIQT3KvnzKSP/Tp5i7ao8Q=;
 b=foMgbK9+xSCa7cPcjEBKOC32mrd3JFNOSTTijm0db1uK1Tj7O387n4xTOTjMeKaSLy
 3/ksApl3DqGDdbVwb2jLAYVLWj1czd6rEhuhQefabMWbjJNqF8pWqyAJQZwu5DszdFHU
 1TGnqUK4Ay7sOUJIXTpxaxB4xn+0x8gaWhun6WTYth7Gtc7p6Fcm4edEjci/sSBI8rIi
 qRrn4ThVdmkMxop8ZJc6IYPE7/6gG9wsvniiRvbtVc8pS+vfHeaHF1sLOXHLNIhAE5qf
 T28ekBadRD0epMZc1WRDbXHzvMxBnF/2RsA9IOQDJlUXKikZB1PVvjfJgMas2SSUhTRz
 oxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7HW5Fn5HqLLSx1V6tfhUzIQT3KvnzKSP/Tp5i7ao8Q=;
 b=OO/HbuWPLfGpj2ezsSA1ZRTeouhQKtgC2cqTDowrplVat99Z7m7ymnuT9bybrJr1WP
 RdAsubbkudUAojUxk1jUYIEJoBrOaX8VsFR9cPK4LsA4jMV81pad85WIl0uEe8fBF4GL
 1/bhEDN6f6t0qFSwBsbsZvqUirgwpGcDTHYUCwoYQTXNTu/u8D6yysBnkBzQDr58cnHZ
 BaD3UvM+xS1iCRqIylKuDLjr/eIg5Z68JQAWKvH8VZwS5gt+oZqlsFl+h/Lwd+zkW8Ce
 xTe2ZjiGkywEi4R6iR2HIsBhB+4gxYHIYx7ZKYlGr8dAvbKdEVO7oxLaCXGTSf2hagh4
 dUtQ==
X-Gm-Message-State: AOAM533a9lNteDPP/9wYQ4cndJv0zYBXi39thsbKE5uxKS9bgl4yn1Ay
 6gEwslQ5YcnVxQUqsiu3xIM18ZcwvlG/V/MsYpWSR4nobOI=
X-Google-Smtp-Source: ABdhPJwIpGgRaQ5jpp/Lql9aNM1L2bu9IsIaQARThbryiR57zrZbo5CMa5Ay7ikc17JjghePtBgVTKA4qzZSDocr+HI=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr25981538pfe.40.1610971327005; Mon, 18
 Jan 2021 04:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-8-hdegoede@redhat.com>
In-Reply-To: <20210117160555.78376-8-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Jan 2021 14:02:56 +0200
Message-ID: <CAHp75Vc92WoJm5T1jbF7UUjCNrVZr2as8ccEWxCZ9aP7z+ZyLA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] ASoC: arizona-jack: Use arizona->dev for
 runtime-pm
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

On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Use arizona->dev for runtime-pm as the main shared/libray code from
> sound/soc/codecs/arizona.c does.

Can you elaborate switchings from get() to get_sync() in few places
along with moving disable()?


-- 
With Best Regards,
Andy Shevchenko
