Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1FD38D6D4
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25491682;
	Sat, 22 May 2021 20:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25491682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621706930;
	bh=iAZqjmilzhA5CxG8vwjVPN58WhQTaNTO14usbMhKNcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZnLnHdGo9lDspAiKEolpPGrbKkiy017YkJ84hAFnzgg7roIXulOaI3pKAR8KHyPu0
	 9r/s1z9hwzupNxjGZS22yxjznQf0/bO+LlxmXl4My5BZsnGiWPbO5feSvCnNaC8rXe
	 kRy7ioWNTQmSmgzSiw2iAorRBDHNRB3NbyUoEVlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40986F800DF;
	Sat, 22 May 2021 20:07:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 116B5F80217; Sat, 22 May 2021 20:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D14F800E5
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D14F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ovza31Qh"
Received: by mail-pg1-x52f.google.com with SMTP id q15so16859895pgg.12
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qaJe4XeckA6fMx+oTvdo/CE3HQxATmnvoDblOqwChiM=;
 b=ovza31Qhhbgz0B+LflD5i33F64tAlOKI4IfnfZDxV70h7vynorQ6hmaxrQEDX0zv+J
 bT1NwqSHEelpqNLm6UcX3J8jtJtR8ivA//xx/MIjvnAV/562IEyejggnsCT9GUFKEAXt
 YHfCMLYSeVq7OgPVLq9QAKWgR6TFzfeuwDf0uk9XT97BmQ0IaHV6yb5COsykzv8X76lx
 N0Ddzd+ueSjLLRe61kTBE9GvSspiM+MZoXiVMqoXGcD2Mq5dN6El6/r/Y2JWs/moo9yx
 sHKn5R6qOGUtKyGpBMp0vU4TNzAZDA+gJnwn8NOdBewP92DQRofdXwKobUoFpWnxdcLh
 fOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaJe4XeckA6fMx+oTvdo/CE3HQxATmnvoDblOqwChiM=;
 b=ftaEZneTcOJFJydq8E0V7kb95xqIlMxfTaheEPjuNv2KSxHog6C+5Znc7E1ptzLr0U
 Oam1YEAcQlHF/2SbE/ziqnyXUVxrwWixJHHo6JVmPyY0CtcqnjTBxTnKJlTDasx1XfIy
 HGudxqy+j+i8Y5PIi+b+rtrqWTatrRrqNXaO74b33VaX92suOiGawTTvzVsuryfgfsDV
 gqwNjtqpWlDkP09qNOOfdakXoW7bN6p5Z7iT5RunnuMJQAgBFVXHobw8pKtQK7xdCsDX
 P4Xf+/8d8KTljgyeIgdbNy90rpHVFNJK5WBnfY2tcwS6vsRamh1NoZuXiDIlFqZEsddb
 lZEQ==
X-Gm-Message-State: AOAM530jj2RGyVciimrPUM6V52ldeBnrM2d9CPu9JXzB/RxK0btgWuzj
 HAX1yKZaqIy1GyWomL1mXIr8SP5OZ6DtoNIdlk0=
X-Google-Smtp-Source: ABdhPJwOM2/b3CjlqSRRXfaywp6am8NkcUNBNaQd4dr2OqYsnCANNqFxbi/fEE10s5NnHqhETIPX4t497jCk+RBiuJg=
X-Received: by 2002:a62:bd07:0:b029:2df:2c0a:d5e9 with SMTP id
 a7-20020a62bd070000b02902df2c0ad5e9mr16069773pff.7.1621706833802; Sat, 22 May
 2021 11:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-3-hdegoede@redhat.com>
In-Reply-To: <20210521171418.393871-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 May 2021 21:06:57 +0300
Message-ID: <CAHp75VchPrngr5h91sfqxEPk81DHG43UkOsjhXpz4iNDagPjaw@mail.gmail.com>
Subject: Re: [PATCH 2/8] iio: accel: bmc150: Don't make the remove function of
 the second accelerometer unregister itself
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Fri, May 21, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On machines with dual accelerometers described in a single ACPI fwnode,
> the bmc150_accel_probe() instantiates a second i2c-client for the second
> accelerometer.
>
> A pointer to this manually instantiated second i2c-client is stored
> inside the iio_dev's private-data through bmc150_set_second_device(),
> so that the i2c-client can be unregistered from bmc150_accel_remove().
>
> Before this commit bmc150_set_second_device() took only 1 argument so it
> would store the pointer in private-data of the iio_dev belonging to the
> manually instantiated i2c-client, leading to the bmc150_accel_remove()
> call for the second_dev trying to unregister *itself* while it was
> being removed, leading to a deadlock and rmmod hanging.
>
> Change bmc150_set_second_device() to take 2 arguments: 1. The i2c-client
> which is instantiating the second i2c-client for the 2nd accelerometer and
> 2. The second-device pointer itself (which also is an i2c-client).
>
> This will store the second_device pointer in the private data of the
> iio_dev belonging to the (ACPI instantiated) i2c-client for the first
> accelerometer and will make bmc150_accel_remove() unregister the
> second_device i2c-client when called for the first client,
> avoiding the deadlock.

I would rather call it aux device (at least in the code). The
terminology maybe needs more clarification (like the main one in the
block with the display panel and aux in the keyboard).

If you disagree, ignore this comment. I have no strong opinion here
since I don't know the difference between them (accelerometers).


-- 
With Best Regards,
Andy Shevchenko
