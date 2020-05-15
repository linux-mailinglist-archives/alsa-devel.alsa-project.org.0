Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D41D4905
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 11:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ABF51672;
	Fri, 15 May 2020 11:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ABF51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589533481;
	bh=3jXIaHprCVElwGYgr4C7LV2Sj+ymV78LwFuHzy7ajwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkoHvou9k8mKAOZstZCRNhgT7BcbCmmob1xelBQw4AkdVvhAg2Yl41VtAknCVhRiO
	 EmnGOfis6NiV3E9m9j46RXjiig6M8EyppqrrPrSLSRnQJglpPVvJTZZAcWHlfr/yXo
	 bGHpBl5IyoQKoHDljzebl6zziX4tJnoE+2SkFhB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C40F800E3;
	Fri, 15 May 2020 11:03:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87D6EF80247; Fri, 15 May 2020 11:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1D6AF800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 11:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1D6AF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="H/qbFr5r"
Received: by mail-io1-xd41.google.com with SMTP id d7so1835894ioq.5
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cKM5+1eerHoxHCYTkL75schYrAhugNMkBpRUDg5jmss=;
 b=H/qbFr5rhsFWHW1Ul+LO7uT94igdi4uQXL6IaWkH8xfLxj40Qo9cy07/nakkMizsTI
 RsxySkLaO2rzrwIQTiVbY6AfqCTxqWqCxl0U0v5WstPFbCWO058sx/MN9pimbMZCc/aN
 k2LccTwwrYAw7oTbmL5jMY+pDGUiNflkCGEsalOCFYrRctBuI92JFyKWk8B1MXWgtm8A
 I44S7WQz1y7VOPgwIdP1Hen6kJXHHBVnD7bDH4a3SeDnvfiZVb5p9TuwUZrRG1D+Tkua
 f9GuI23usJ4XQtyer7G06vswurPiSd9zb2XyYpSUZdPAmUcQRzs1l6m1xHhA4a7nHh+a
 Mihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cKM5+1eerHoxHCYTkL75schYrAhugNMkBpRUDg5jmss=;
 b=HumzonsFVmNhMnkxCtrkQJmQGFwqBzx2uvFC7nBzSvDSIHu6vq6ZxNqdsBcKyZbIER
 zudVWpUaddn0hgwcx+WDSyvQ+wZ74yxP7KUS3mO22T6v53pagUqorsOY2qeSW9DwyKo9
 Imo+Xge05VSY3Xz9rVq3jA+k/Wikb1F6nJV15HVucVj8mpZdzygWQ+O6+tUiNdTzzvRC
 jJ8KKUsdAeZu4P0W8yBcnDkyeDy0sXmXq8rf0pjgKcE9HYz7G+zf2EC3rVRJr4s/yyQb
 cecpXeAXOrCmcPzGjgWKbZSCVKZcPd/qE1NiphqA5TWqwx273SN2CXMWA9xGaWNvZj7o
 hHRg==
X-Gm-Message-State: AOAM531WwAhEp4BUY3ar/xFt9mPBkcfwql/JZWNI3qSdVc0PiMNAz6Yn
 8NOwaJHmZ1NphVDKEewht6nEru9QmxuLUa/HKkZFAw==
X-Google-Smtp-Source: ABdhPJybL4iDJKI46D/krUR9YfY4KGNJL3OjsHpMyGzNVoecAyXK43k5XIYrXWf2C16sTe32N/Vh1pgpJcfdPkMYKTI=
X-Received: by 2002:a05:6638:1014:: with SMTP id
 r20mr2201565jab.29.1589533369690; 
 Fri, 15 May 2020 02:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
 <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
 <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
 <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
 <CAMj1kXEkUetEX4XG1CkS9nBa2e7J4LsM1vL7FvSoBUgVjz51mQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEkUetEX4XG1CkS9nBa2e7J4LsM1vL7FvSoBUgVjz51mQ@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 15 May 2020 17:02:38 +0800
Message-ID: <CA+Px+wXFpGZJx6yRJWQPsT0=8uWPduWW1_EierRxEJhjLFHjTw@mail.gmail.com>
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, May 15, 2020 at 2:50 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> In this case, you are using the digest to decide whether the same code
> has already been loaded, right?
>
> So it makes sense to think about the threat model here: if you are
> able to defeat the strong hash, what does that buy an attacker? If an
> attacker is able to create a different piece of code that has the same
> digest as the code that was already loaded, the only thing that
> happens is that the loader will ignore it. If that is a threat you
> want to protect yourself against, then you need sha256. Otherwise, a
> crc is sufficient.

My original intention is to:
- avoid transmitting duplicate data if remote processor already has
the same binary blob (be reminded that the transmission may be costly)
- check integrity if any transmission error

Not considering preventing an attacker in the original design.  If an
attacker can send arbitrary binary blobs to the remote processor (via
a dedicated SPI or a specific memory region), the attacker should
already "root" the kernel and the device.

I understand your point that CRC should be sufficient in the use case.
However here are my considerations:
- as the payload is possibly executable, I would like to use stronger
hash to pay more attention
- calling calculate_sha256() is in-frequent, I don't really see a
drawback if it is almost one time effort

If we want to switch to use CRC32, we cannot change the kernel code
only.  There is an implementation of a remote processor that also
needs to modify accordingly.  I will keep in mind whether to switch to
use CRC32 next time when we are revisiting the design.

> In general, you shouldn't use crypto at all unless you can explain why
> it is necessary.

When you are mentioning "crypto", do you refer to both crc32 and
sha256 in the case?
