Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410812E299D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 05:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00E91841;
	Fri, 25 Dec 2020 05:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00E91841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608871712;
	bh=Uqfb4RFA8x2Gu1eGghT4zsb2523tfRTZEiXvbR8NYb4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GUm+4NOD35DTD4tPN8mSb4THpW0YEbqqQwqVWgFfnNnUtjDTC+EnqL9C95KQnkiXF
	 nhjDXiGWRtI1qbx9z2VdlLGIhnOrCaJwAK0/ELuAjfw6PK4HOEHXtXvWlLnlUz+dEu
	 zKftTaT2QSWuwBk63lRJiQ9wN47qxKNBUeyFFJV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26723F800AB;
	Fri, 25 Dec 2020 05:46:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1BF5F801D5; Fri, 25 Dec 2020 05:46:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29074F800AB
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 05:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29074F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="WhCFmRsn"
Received: by mail-yb1-xb2e.google.com with SMTP id d37so3614040ybi.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 20:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Uqfb4RFA8x2Gu1eGghT4zsb2523tfRTZEiXvbR8NYb4=;
 b=WhCFmRsnBy9xpEzy0gErUvSAU6iTs+nOf3vvPEVQu5guD0T0WmLdh1lln6+2Mipsxf
 Dbpm6jY6QeNoqg4ta5EDXDdYZVzmRXnHDxrA38BYoL10cKzaJrsw+eySli9WqP4JiqHu
 LLEJx6vqd+J/FrQZlQFgLT70ym0DZzLjnd7drHeKxoG9S4Qf6V8ET8bSs22JLnxp3H/i
 uP4hP9+jEA57qBXaOao+ZrUhi2DdWjyoQqJoMSCDCR8GW6nWTGC7eoM7mvWiYO6BZqzf
 eu4YmYuqwzcj+jHayGaC3+181QxH1rLbDOXCDy+2Qr+XrxU7Q9KIIGZhZDy5Z8EH3Fw8
 eKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Uqfb4RFA8x2Gu1eGghT4zsb2523tfRTZEiXvbR8NYb4=;
 b=b4iIhqUTYMxAD3SSConS2MTDKt8hSwPFv2ck5TGYgRKkB0hA76866fER6gdrd6EEyD
 fJXYEPU4g2rSTTql81u5uFqQ7xbyggkrmM0VuDEQzdoZkgEh2I9nainmmPSpZ9/F7PiU
 knRVCGOry59tTXr+gQwQk6VEHmh6yMYwqCVq6J3ldd7drinD1jBL50bxmjmZn90/rUHW
 VggVtZdjMcSZKxaGxkO4la/m/nbfqIVScMdb5wdnwqUEDbOpFNkqfFoqwc8ZxhPL9cJA
 dGxDDxxABluv4qwiYAzNy83Vb16GC/5LAO1r7gkrC2ljQVJmjqXW6He84nYxHuf03vHs
 6Z6Q==
X-Gm-Message-State: AOAM53152LTwoG12ySzgOjrfniXKfX9O6R/IxXIpi3q/OoKGuRPXAz38
 iTcsNj1grDfL5Hm0mLMqy0/nHD4qD5BiZOjuPs9d8A==
X-Google-Smtp-Source: ABdhPJyu1tVHX0MJ7f7oau0+fQ9KNEKwZqEyLXTG1LdiiOH8cqhsuIRHJYrervteRJVTaa8G7nqN8BgCKWYNzENs/pQ=
X-Received: by 2002:a25:1e42:: with SMTP id e63mr34443894ybe.270.1608871609342; 
 Thu, 24 Dec 2020 20:46:49 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
 <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
 <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
 <8fc2a9ae-c87a-03cd-4349-81d0ea3380d3@metafoo.de>
 <CALd3UbQEJBqUqwx2ua9Sx1P3xr3uf221AVJUV7erp6MF0JegRg@mail.gmail.com>
 <20201225005953.GA162573@workstation>
 <CALd3UbSc=h_bYT4koBH79mmKhy4NxZX2EXNJ-oOpt+GJTtk+Yw@mail.gmail.com>
In-Reply-To: <CALd3UbSc=h_bYT4koBH79mmKhy4NxZX2EXNJ-oOpt+GJTtk+Yw@mail.gmail.com>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Thu, 24 Dec 2020 20:46:38 -0800
Message-ID: <CALd3UbTp1UMmbo3myJucks23dYqbh4jRnuVnPgxK3maNSR8+SA@mail.gmail.com>
Subject: Re: question about alsa tracepoints and alsa debugging
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Takashi-san, Lars-Peter

> clear there is a deadlock, please see below. In my code I can see that
> spin_lock_irqsave() is being called in the dw_mci_interrupt() which
> then calls some other code which again calls spin_lock_irqsave() so I
> guess that is what the problem is, and I have to restructure my code
> to avoid that.

I managed to solve my problem by removing the accidentally introduced
extra locking call in dw_mci_set_drto(). So now everything seems to
work smoothly.

Thanks again for your help!
Bert
