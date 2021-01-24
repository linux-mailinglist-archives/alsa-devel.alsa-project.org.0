Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDE301E93
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 20:55:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F591829;
	Sun, 24 Jan 2021 20:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F591829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611518146;
	bh=9qDjjuC5ILTQz4ZOZPLOor7RhYdirpCAOAMuMwNjneM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ru2VjzDZzIdA90eiJ61PZ/g//XhEiYFtZ+y+aKoJMECNArStpgMoBJFSK8MobfrHs
	 S40j+2P3+g1JL3k7LbeaIBmJcYVVDymITrCj6zD6a0Kr7YjINHOL7f5hOTH1gxyw+O
	 BPyT4gYurNPcSGtTzpahayXF8f3adu9S27bHGGws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC4F0F8014E;
	Sun, 24 Jan 2021 20:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE97FF8015B; Sun, 24 Jan 2021 20:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB292F8012D
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 20:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB292F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JCV5O1pS"
Received: by mail-pl1-x62a.google.com with SMTP id j21so1682245pls.7
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 11:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ltb649fO8RUvDMlMxNJBpTVqk8j9NP6KsJDcg7ev6Y4=;
 b=JCV5O1pSwqZq2AVnFfiH+vbw0ZzxLViHrbzqAmhlg+AhbLd5UtFp+2y6R+M4oXRV8h
 JmGcdYDUaOclT4744iIAHXZkeoHsVjRT8wzXE2wVrZqbl0H7r5WwmrDLCCCN3l4m3G+n
 WKENMKmvh6ymZpV/8sxlcDADbKpefc4esxNhK/dMcW7Dl7DL0gV3F4tJY9uhXDGH5Dgv
 22l0hM6O+nCQLHxxKqqb73AvXRqHA1JAEBa1GJqFKOUhSWDQf/QtOW4DL6xLAsf1NSWj
 zbRjdTljsrBqgqEegVtL2ayIiat612CrON95QQ7BvfK6htck5N8/ubyCnbSw7uJSv584
 mc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ltb649fO8RUvDMlMxNJBpTVqk8j9NP6KsJDcg7ev6Y4=;
 b=lCcLbzTxs9j9+GuQZz3VnmDZsYbbdmNP6wWT2cKWbeer2uegTjddlYXgCCXs6uO9h2
 Y2Qqpz1tvm4p1h3KS8xPVfgVtN/Q7ZJ528TzxYzOnALJccid5y8sybCKqKuSnl1Zngfj
 /GIwrIne0Q6MYpYxsCnI4cZqHKj2/2Qp/Dosv0emSl6FMOwfgG9VFqlj8YklIxhCNA06
 vz7WMV0DeOUAhoTDCYrNzZfpaHjvCkXHjaMq8F+Cqft7R/ZP0bpBEwetEzvASrutXeOU
 usBCXstXCwOgbjgByY2VDodCmiKCC4x8Qw1iuLtJFThXH0MKuhtd8bLpMaNyXA6WC6UC
 fcSQ==
X-Gm-Message-State: AOAM532CZ/5sQ9tNRWAuZIVC4Xm56t/p+6CAYXYR0Ob+dyceuT44wfRo
 AIv0IaLVYrCwRZx7le16GukoA2EH5ELsmzHOAvA=
X-Google-Smtp-Source: ABdhPJyMzqMWlIbM4YtmLGbSwyxu6flhf4uZBdMdVYvQFXtEBXf9gl/dVML1kArVb+Ps05sGDr/raz3bpxU8rzwpE7A=
X-Received: by 2002:a17:902:b190:b029:df:fff2:c345 with SMTP id
 s16-20020a170902b190b02900dffff2c345mr2435989plr.17.1611518044950; Sun, 24
 Jan 2021 11:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121720.79863-1-hdegoede@redhat.com>
 <20210123121720.79863-2-hdegoede@redhat.com>
In-Reply-To: <20210123121720.79863-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 24 Jan 2021 21:53:48 +0200
Message-ID: <CAHp75VdOhXMBb9t8GEA3qrjyuRzNSXFZ--QuaVMUAaNh-=DnGA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] ASoC: arizona-jack: Cleanup logging
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

On Sat, Jan 23, 2021 at 2:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Cleanup the use of dev_foo functions used for logging:
>
> 1. Many of these are unnecessarily split over multiple lines
> 2. Use dev_err_probe() in cases where we might get a -EPROBE_DEFER
>    return value

...

>                 if (IS_ERR(info->micd_pol_gpio)) {
>                         ret = PTR_ERR(info->micd_pol_gpio);
> -                       dev_err(arizona->dev,
> -                               "Failed to get microphone polarity GPIO: %d\n",
> -                               ret);
> +                       dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
>                         return ret;
>                 }

I still think that using dev_err_probe() naturally, i.e. as a part of
the return statement is better.

-- 
With Best Regards,
Andy Shevchenko
