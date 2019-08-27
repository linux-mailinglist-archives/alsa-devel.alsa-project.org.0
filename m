Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D944F9DBBD
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 04:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4B7832;
	Tue, 27 Aug 2019 04:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4B7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566873991;
	bh=OLxrVXTG6sNgF2EjD8vlzqBpZA8CosmeJMEX9I3+Oy0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0bW/kZkCbS2YzgEFsbMGWO6iD9lSKdrhf48ZvfGuOD0I/vyTYtaiQKmzc5Dllq2N
	 fcbTGh3POvusQdNHVqCgWvjAXFj/Uz9v2oFUVTISlaiD1g8y6qwcQYzLwjVI2gnT0j
	 d2sTLn7w+xpf2YKQUNWQ4R7AhMdB2voPXWjU8yaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1F60F805A9;
	Tue, 27 Aug 2019 04:44:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56458F80444; Tue, 27 Aug 2019 04:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC30EF802A1
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 04:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC30EF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="CAZimfyO"
Received: by mail-qk1-x743.google.com with SMTP id u190so15875651qkh.5
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 19:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ALo2se9tgrniPYFX0bT5iHmGVqO3QJBoqA7cFuqMpl4=;
 b=CAZimfyOfJedLHvcojyTMfYruy39wvxx93L0GI5uTcacgiOJ5Yyq3FhPYe5FsZYH5+
 3N+gayRbTKKzDCzQVjXSOMeMFSjyLJJQ690yPjhMZ4lx07xno4x/He/iZRGX20OchrA6
 fU9ebrvx40TVb3Cf7rMcDMu4Vct5X73lRwBHWCllYlsoSxEIe5iWeeZbGdFpYqX7K4KU
 vY4mKhhY9GS4hjmDpWsGXrgzh6IalziEVe/k+N4SAfjIv/wVSxra+211EVjNUgz1tnOi
 4/mek9IjGrvAPxJYPTSBBJ3NzS6pHfe/NKHBmYjrjLpDDDI3rFiozfMan+mNmnDEXeYG
 Soxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALo2se9tgrniPYFX0bT5iHmGVqO3QJBoqA7cFuqMpl4=;
 b=BG6SG2iKEwYhr7ER4F8ktWvzTdNK6O8HdcP5RiyXPMU1iHupVR1CRGN02ireiAo+Zh
 Xy9FVZH77bDVWE4qwCzLZKuW7exzeBlcT/jQlT+3ATlIWdgp6AIcYrTRJikygIezo70F
 zynnJZQqhJvg6UaF+hEVjW8ksuPBA5jRiDqNfs6VasO8RzqOEU9q1lUQmotrAoG3nAUL
 nzfBpywZJetYzWzofZHIr+NMQ1u+UGvVp4zbcCecmKP4WdozP9Kt8BF6iOYCM/NZxAqr
 wfRNwQP/hh9kaJTlosvreOn//P1EmZrtILF0V6MYlGK/gHU0nEsoMf3NxJmvVlTZQLc4
 YLtA==
X-Gm-Message-State: APjAAAUGQEAym9QjqBohQqf6AuAWE712s89UY4WncBnvvz0DRpWt7dNb
 8p6B5CL1SIFodJ/7jegPA2inNlXtWp1NxcB5UZOwmw==
X-Google-Smtp-Source: APXvYqwH+1nJX9BnF0hTAr/iGIJOtgC/Q1ezZWHVlFvR/hRfCSoovtViAX4vZ6I4zlpbyh8ByWX3OxkmBe/RXzSfkRU=
X-Received: by 2002:ae9:eb4e:: with SMTP id b75mr19215266qkg.478.1566873849070; 
 Mon, 26 Aug 2019 19:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190826153900.25969-1-katsuhiro@katsuster.net>
In-Reply-To: <20190826153900.25969-1-katsuhiro@katsuster.net>
From: Daniel Drake <drake@endlessm.com>
Date: Tue, 27 Aug 2019 10:43:58 +0800
Message-ID: <CAD8Lp44a0i2Z9YV0tOKB=QuoZzU-ALSqTr_X8XaMVrGbw-DfQg@mail.gmail.com>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: es8316: fix headphone mixer
	volume table
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

On Mon, Aug 26, 2019 at 11:39 PM Katsuhiro Suzuki
<katsuhiro@katsuster.net> wrote:
>
> This patch fix setting table of Headphone mixer volume.
> Current code uses 4 ... 7 values but these values are prohibited.
>
> Correct settings are the following:
>   0000 -12dB
>   0001 -10.5dB
>   0010 -9dB
>   0011 -7.5dB
>   0100 -6dB
>   1000 -4.5dB
>   1001 -3dB
>   1010 -1.5dB
>   1011 0dB
>
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Reviewed-by: Daniel Drake <drake@endlessm.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
