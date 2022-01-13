Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E848DD9B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF00F2026;
	Thu, 13 Jan 2022 19:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF00F2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642098175;
	bh=URiTPL1xF3hdL6X50nwOPjCIsx8EBtso9PREhJV4kMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afJ1zTO3KnrL5dhU9eemR5jjv/uORlKztvfb2RzlHSh9HVVuQV+mbM60biVStzv/m
	 q1f4b8mGMo/ZrlPX4eV03K8o/64qUiuypcZA08z4pz62UOBRfiW0d0eo7uamdrg5zH
	 LuSA/blREvYPyPOGCQaCThOXhHrfi5kzUJRpuqQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27604F80054;
	Thu, 13 Jan 2022 19:21:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F8E6F8013F; Thu, 13 Jan 2022 19:21:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,PRX_BODY_30,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE86F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE86F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PJY7Zvl/"
Received: by mail-ed1-x52e.google.com with SMTP id a18so26295020edj.7
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMHtdvU9XeJ3wjSZJWX9SQTYtWlQlU+oMcR+hFhhTs0=;
 b=PJY7Zvl/ThfQH8zKW3lnHfZoumnkwhOusZ+9kOji5+/FBwsaW2S2SjYTSd6Qnw65q+
 ECQzmssJDalmRBn2fIKreTTTotSHVjnN0qd9Q3aG0i/diFUQSf0noTB18PdpRoM7fNE6
 QfwisMrbjyDvUqvsrMjJQhnk/mR+DEwd7Qd2NNJr/0E67yp5O5uKQgHk11Xdts+yL+y7
 +1ETJG1nV/bR7OHzBS5dTu6OndnAiupFN6jf8bR/rGP1hZYgvGKNwrUoCXJY+On8h3ZD
 d+U6rluPrxoVoPmOlKWUqc4bctLxPwQi8hpA+mejp4Zwlnw3GCn14uQjXauWyNevNnZV
 a2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMHtdvU9XeJ3wjSZJWX9SQTYtWlQlU+oMcR+hFhhTs0=;
 b=3wka5ko25yJKiaQ2iedSXFYvZMcTXmV8wiU6f+AD0dlO1BPwNI9DQ7eXdXxJIhpv4V
 cHfL+q9tT5P+XFEPBtVq7X8TDQFtBrl8gOlA31e+VQaJV86uocTi1eGx67cJKvZs2wC7
 r3IhbdG7tiuJqcRj0qgDYFK4FithDqjWEUfimPbDz3jfPXPMhrrNrz/uBmSOg/Tqp3Pd
 8+LTiCpKUVz8bICaNEzpfKxCYpsZhDiDN/Np4raXhYo9NpQX/RffyGsRKuqG2qwdzJS1
 2KtnrBYmQ3BYZa64DHN8Xw93Mc6EYT+DZm/3tmkYhJF3qB4ebVoeEzLakHvKbZ9H6R+C
 gm+w==
X-Gm-Message-State: AOAM530x0oB6KfJOTenUeFgzPA8Ka648pt6Jkv3gxpUipQdSyq9GwAqQ
 6zgBI3UfUPl8OC6SK/pl+JcxykVNDKNJbtN9goI=
X-Google-Smtp-Source: ABdhPJwkWP3y+Mykb97iSqNB1kWesZW1rkM7lpPOwVdCiKu991wkE1sXidQ8ZIAbtKxYNQZ3jHEEoq6WzX7zZv9X1rc=
X-Received: by 2002:a05:6402:34cb:: with SMTP id
 w11mr5218180edc.158.1642098086061; 
 Thu, 13 Jan 2022 10:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-8-tanureal@opensource.cirrus.com>
 <CAHp75VdQGBixkUStPiq3VuoL+9TJo946ObfRA-L-D72DaFHnrw@mail.gmail.com>
 <66351fd6-f434-775f-d8d5-2a6baf098269@opensource.cirrus.com>
 <CAHp75Vc=x0AanRhkGHvbgs0M9VLdZfEFKJUxRTEMFvT5YwDtzA@mail.gmail.com>
In-Reply-To: <CAHp75Vc=x0AanRhkGHvbgs0M9VLdZfEFKJUxRTEMFvT5YwDtzA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jan 2022 20:19:40 +0200
Message-ID: <CAHp75Vc_Y+1SRryQn+=qpGqfNpRYS7ymGL+RifHdOwKcwsmF-Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] hda: cs35l41: Add support for CS35L41 in HDA
 systems
To: Lucas tanure <tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Thu, Jan 13, 2022 at 8:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jan 13, 2022 at 6:53 PM Lucas tanure
> <tanureal@opensource.cirrus.com> wrote:
> > On 1/6/22 12:29, Andy Shevchenko wrote:
> > > On Fri, Dec 17, 2021 at 5:45 PM Lucas Tanure
> > > <tanureal@opensource.cirrus.com> wrote:

...

> > >> +        * Device CLSA0100 doesn't have _DSD so a gpiod_get by the label reset won't work.
> > >
> > > So, you need to add mapping tables and switch to regular APIs, tell
> > > me, why it won't work.

> > The part about how the driver access the ACPI table is going to be
> > improved later if possible.
> > The laptop has already shipped and doesn't have a _DSD node, so the
> > driver needs to read the reset GPIO from a hard coded index inside a
> > node that contains more than one cs35l41.
>
> We have a lot of cases like this, hint: `git grep -n -w
> devm_acpi_dev_add_driver_gpios`.

It's all described here: Documentation/firmware-guide/acpi/gpio-properties.rst

-- 
With Best Regards,
Andy Shevchenko
