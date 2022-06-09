Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 050A4545317
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 19:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577201B3D;
	Thu,  9 Jun 2022 19:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577201B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654796217;
	bh=DvZOY0CjrL+8UScVun/und34Mrmgp6Nt0vI3/PjgTUU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TR4VjNO3DfehLmiTrPYrJO8BFGI/56deWaP3ry6f0uMEfrqbeTgalD7o1TrIJEm4V
	 wClDIEbvSmgpro/XVsoh8oe4VRZe4dVXuEShru4SY9/T5J8ZQ4TqyVLmQJWX9i5bNt
	 GccZCusZgpOYJI0D0UZZke0Byf+7C1bII9FWj6+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0056F8012F;
	Thu,  9 Jun 2022 19:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 714FDF801F5; Thu,  9 Jun 2022 19:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B084F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 19:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B084F800C7
Received: by mail-yb1-f175.google.com with SMTP id r82so42900850ybc.13
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 10:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VC+T5gNopDGm2JXb4Q0gD1ESudpir+AKQBEND4sHjLs=;
 b=LUwBn9BwOYxil90A2Q4LixsJLIPZwOAobqhU0ARETlUZopsa6SrxBtXHwymYD8hTlZ
 a41f9QMXOixbXj5SOU9G63UPmsM5H2dXGwEllQJn15e46QGrqr55z5EKL+Lndugp5J9q
 Duj7nL1VnLUukHhaT6pJpI0T9LwAoXoMbfZlLn9gZdrwRD1qMXSPN6nEoNc6xnEf49pc
 d7WMAOpeEaAcivEhYazzsRywZ4Z/CeYP8pLUfoJHuOMxm6/EKZBEsKl+bakBACQr9zWK
 HHgC3OvDdKhyi8RACIxRcCjbA/c3U4cJarKDNZW24H3AaSmOHKM4toeR3mQkk6QgS0cx
 bg5Q==
X-Gm-Message-State: AOAM530Tv70+Z556JgXeiP0grsXVDvY0lWeuhb/Ykgol7DPwBDsuvnCo
 2eU5PZ2Yh0XOXW01uhPmgv2g2PzlWVB/cYtoFpk=
X-Google-Smtp-Source: ABdhPJyVIGpmxye5bnwhynEG24c16C312gNtzaFfAseNsDXbDB5re+boNDhXJ5I+yEEdQCOMEXBzOFI0n7W06mBDIAE=
X-Received: by 2002:a25:d748:0:b0:65c:6b00:55af with SMTP id
 o69-20020a25d748000000b0065c6b0055afmr39672546ybg.365.1654796151473; Thu, 09
 Jun 2022 10:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <1843211.tdWV9SEqCh@kreacher> <5296779.Sb9uPGUboI@kreacher>
 <63d7f3ed-b5a9-c869-5d25-a33a1d4e63c8@linux.intel.com>
 <CAJZ5v0i7xtjrEOXgKiWP5St8OZoiZ4qq+gL62BFrmv-qpeaG_w@mail.gmail.com>
 <7652ddab-53a5-ac8e-33f5-d25527acb1a6@linux.intel.com>
In-Reply-To: <7652ddab-53a5-ac8e-33f5-d25527acb1a6@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 9 Jun 2022 19:35:40 +0200
Message-ID: <CAJZ5v0jR1_tO_t90UKQFjYfyE+vOoToJSMCfZ8y37voaYO=wJQ@mail.gmail.com>
Subject: Re: [PATCH v1 14/16] soundwire: Use acpi_dev_for_each_child()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Thu, Jun 9, 2022 at 6:21 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >> Shouldn't the return of sdw_acpi_find_one() be trapped, e.g. with
> >>
> >> return acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);
> >
> > Sure, I'll do that.  Thanks!
>
> I also added this EXPORT_SYMBOL to work-around link errors, not sure if
> this is in your tree already?

One of the previous patches in the series is adding the export.

> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
>
> index 86fa61a21826c..ade6259c19af6 100644
>
> --- a/drivers/acpi/bus.c
>
> +++ b/drivers/acpi/bus.c
>
> @@ -1113,6 +1113,7 @@ int acpi_dev_for_each_child(struct acpi_device *adev,
>
>
>
>         return device_for_each_child(&adev->dev, &adwc,
> acpi_dev_for_one_check);
>
>  }
>
> +EXPORT_SYMBOL_GPL(acpi_dev_for_each_child);
>
>
