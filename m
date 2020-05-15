Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDD91D4AB3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 12:18:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44A08166B;
	Fri, 15 May 2020 12:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44A08166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589537912;
	bh=YOHyHt/9yJ9cIXM0YEkb8saEuSaYaNven2d/oO5FvgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9QdVrA1LiF2K/GRCct8h+kKsYUx5/bhaCsCX6pYP6ndAikMBNAHjMhF4p8DmyZrF
	 2eIVHgiJhDm3/k3TqJVeOMZqGKR93tdhv9uZYPysfdccW6J9LzZm3CJfuvbNJhEobQ
	 qXwivQ2PfvOpaw+ma+i+GuUgf+joS717rFMBLIvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44720F80247;
	Fri, 15 May 2020 12:16:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BE1F80247; Fri, 15 May 2020 12:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8DFF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 12:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8DFF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="hg8+Jv48"
Received: by mail-io1-xd41.google.com with SMTP id k18so2116006ion.0
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOHyHt/9yJ9cIXM0YEkb8saEuSaYaNven2d/oO5FvgM=;
 b=hg8+Jv48vda0Q8CZa2JDbMP8vSVn32fmSqcGjARW4yCuPto2xFDzdwKNtA3q3AIttp
 XSQhMJqQueKD1ZkeBC0odnJ0V7mpZz9zR8vmnalLwcCvAf/K92vZvLXbL1MMUxUMqpMk
 ESb6mA5GlcQK83l9KnaZP/NMpAZH80ruDkNVbhrdAVto5cqOTrpAJszC47Z71MbLXCDo
 1HNejEbIpSJGcnV9iURjgATgodSrQ2hyqau6JnvqboR6wrozUvGUMU86el1IPQ56Z3Tq
 6zzFpN0zUqoRnwthRH5o2Ne+0YHPJh8tdJ3UIW5QwO32kejr2uxnHEpucWNXvfe9ahPn
 ysuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOHyHt/9yJ9cIXM0YEkb8saEuSaYaNven2d/oO5FvgM=;
 b=swM4hBkzIVF0hZ0Zme5QbAkvI6ZEahJ7UFnX65vewwEZiLnHgb35AX1IkQ5Pp//piv
 6I4FJ8pIWCowxfRpvuA9m0WfCCKZWXgCK7UbRdiWK+wsqrZF0vSgvXXQjAUWMjPhJLiW
 T+fK/IvQblukofd32JTTbeMLP9mWE0qIOjqQlN/NcalwImLDHjS3E4MmIV5+8DqdZ/qB
 Z6lcnXmTE4b8qispMlC4gWfN5jBws7nmXld/O+hpcHHu4tu3+0n0IXtTUJLbjs6ZQd03
 kWyQL+QKGyTJLhqkfYx031K/i28wdxxVDGdTNKFlWD4+A53e9tTrmjifaqEjIHho45Yq
 itrg==
X-Gm-Message-State: AOAM5335Oc7905IqmrWTQZvn5TMpUSWsR6vehnlFQqBq12UeAnrtaFPv
 QMY90s85PmN1jaeuSu4orX0RmP9HQ4aowJGrUW5g3A==
X-Google-Smtp-Source: ABdhPJzWEWhgqRkp/Sy2dUm7FKBpIXJpWVCJjh9m0xPKXm1nMlvygEJKrNNynHVhI1/J0v07SlNpwMzJFFD5cEsF8+c=
X-Received: by 2002:a05:6638:1014:: with SMTP id
 r20mr2446737jab.29.1589537797461; 
 Fri, 15 May 2020 03:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200515100309.20795-1-ardb@kernel.org>
In-Reply-To: <20200515100309.20795-1-ardb@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 15 May 2020 18:16:26 +0800
Message-ID: <CA+Px+wUpYaUfA1saEWePuy+CmCX8mPiH+-Mg23P6c+jhM_yxHQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: switch to library API for SHA-256
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
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

On Fri, May 15, 2020 at 6:03 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CrOS EC codec driver uses SHA-256 explicitly, and not in a
> performance critical manner, so there is really no point in using
> the SHASH crypto API here. Let's switch to the library API instead.
>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
