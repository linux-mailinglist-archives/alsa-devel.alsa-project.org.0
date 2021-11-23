Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9845B52D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:17:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D628517C1;
	Wed, 24 Nov 2021 08:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D628517C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738221;
	bh=TRTNZs8BhKFnAquUbsfZgiGOj5bO0mdsd83pZGHObcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVORKsWHb0BTmCULoLe4mCvY5t5vCqpNx3vIgcr8Nc5TWzGzKZghN8rb/l9HGAqHr
	 BNe6K7mBqX4NvDFPhHJubr0IBhvrf+U9tDE780973Ga52ObPeJdPZH5OW0muRC/qIL
	 0tT1Nw0G5zLrrOTiahAXiM+GmawUh0h+TjqqZn0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F34F805E9;
	Wed, 24 Nov 2021 08:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F4BF8049E; Wed, 24 Nov 2021 00:02:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 444EEF80087
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 00:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 444EEF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qGLwsyoG"
Received: by mail-ed1-x52c.google.com with SMTP id v1so1730454edx.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ht9E1p/DyzTpsAqMy6QR1zhTTEv9RdTNX9jIQ90EKf0=;
 b=qGLwsyoG1Pcf+l323FrU7zfkNsFBiEzV5p5s/wM7Hesk9nWnHJt0R1pIC6iiRlBomj
 NIf011wRJHUCAZWgYCsyh8UriNs3HfQjBFpDSXeoC/Cg21V2Yz5UOsuUK47O207wyekj
 +Qejdg9mnrlOc55iDAViSd0Iu/yIUcWRdvDbNskawt0WKFT0NcaMRLUHgG7TR6h2kpUw
 tOvVadWKaMapJYV7LYcfVTXwrorDKh/VKELoFAFbzKlNi1D8W90hZEziIj5B94Rga1f+
 iX4JVBap0gLwiltixQTrP9/YoYobHKAzMIaHZadLqsIabt6riHb9XERx98H/MucVrXHh
 PUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ht9E1p/DyzTpsAqMy6QR1zhTTEv9RdTNX9jIQ90EKf0=;
 b=OfGI+j7tzO5pHtLHsyygYmOhztOpedEpj8M7FILNXzkKESZBKvmqaI/g0+fUwMZd+j
 7XDQnjkN1fFS9yeBwsuoUXgLkgyHpbn6VzhZUdbtsapaIclFz/bhJrAlsWwZ6vkNnzYu
 vrfQqCtymNPo6e5e+/Q/IcJNTlTO0oI7yGyURe4jL3iFniVYFMkjS7BSgbOTqeWi28F/
 fKOOUBIFGer239SmTQtNMvfAdoiXNgq3TCcgLThrgC1UyfgSuffndzi+eGzxeor/lmM2
 g8XpV8mNeAQFnnm6VbsOR2wGXFhuL4TLhI1rLWiDSyEPQkO93k4jrgcwDr8kkSMdvZxX
 CQiA==
X-Gm-Message-State: AOAM532ImXvKwil+tVOXmumCxia2ikedW6c94KgtwrZIHKOi6FlsUrJT
 wytIConjjk/shyqIpB3ZvVpxzYJEVw2U7wVu9iU=
X-Google-Smtp-Source: ABdhPJyGkjWgdJNmrGbvK5UhP73uvpIxjmfUItuL6e+QCzmzGC5HR6vmcZUBZndWYGeq7YneJzPMHREKrcnGnGuWkB8=
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr13399358ejc.141.1637708517524; 
 Tue, 23 Nov 2021 15:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
 <87af37a2-dc02-2ae0-a621-b82c8601c16c@redhat.com>
 <756f813c-cc3e-7ddf-e5db-cf6c874f907e@opensource.cirrus.com>
 <1605be8d-0913-4b52-32e2-8076fff01d30@redhat.com>
In-Reply-To: <1605be8d-0913-4b52-32e2-8076fff01d30@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Nov 2021 01:01:21 +0200
Message-ID: <CAHp75VcanaEU89LXCs_CaBC5WvhotyuTeeS2FSxqhZntbz5FFg@mail.gmail.com>
Subject: Re: [PATCH 11/11] ACPI / scan: Create platform device for CLSA0100
 ACPI nodes
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Elia Devito <eliadevito@gmail.com>,
 Lucas tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Werner Sembach <wse@tuxedocomputers.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Shuming Fan <shumingf@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Sami Loone <sami@loone.fi>, Len Brown <lenb@kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Chris Chiu <chris.chiu@canonical.com>, Arnd Bergmann <arnd@arndb.de>,
 Mark Gross <markgross@kernel.org>, Mark Brown <broonie@kernel.org>,
 Cameron Berkenpas <cam@neo-zeon.de>, Jack Yu <jack.yu@realtek.com>,
 Kailang Yang <kailang@realtek.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Rhodes <david.rhodes@cirrus.com>
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

On Tue, Nov 23, 2021 at 8:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/23/21 18:11, Lucas tanure wrote:
> > On 11/23/21 17:05, Hans de Goede wrote:
> >> On 11/23/21 17:31, Lucas Tanure wrote:
> >>> The ACPI device with CLSA0100 is a sound card with multiple
> >>> instances of CS35L41.
> >>>
> >>> We add an ID to the I2C multi instantiate list to enumerate
> >>> all I2C slaves correctly.

...

> >>> @@ -1708,6 +1708,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
> >>>           {"BSG2150", },
> >>>           {"INT33FE", },
> >>>           {"INT3515", },


> >>> +        {"CLSA0100", },

Can we keep it sorted, please?
Ditto for the other driver.

> >>>           {}

-- 
With Best Regards,
Andy Shevchenko
