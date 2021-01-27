Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E6305FFB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 16:45:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6301705;
	Wed, 27 Jan 2021 16:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6301705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611762351;
	bh=/A47meofXCI6JlFoTXPPdZui3jDHvPtr2n106BEbW3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oABG1teVglQmI4wWBC2z+bebIPSWX9YlZkaDGV/RvQCcedX1BprjEzIbSQ32kafiS
	 ZJxcf+c+GPPAG9tqKisOKIMeT3gBCVHta9I9/Ab0u8tpvFznsx+7zm7q6V9TFqBltG
	 G526hJz91WsUzJilBX/D2h9f4DubCeCJ6GjeqoD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C1BF800E9;
	Wed, 27 Jan 2021 16:44:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B236F80259; Wed, 27 Jan 2021 16:44:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5734F800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 16:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5734F800F0
Received: by mail-oi1-f173.google.com with SMTP id x71so2559607oia.9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 07:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKSsdWM+4/PJcslQINc+CYwOklvwIWIB07uvc/J/vlk=;
 b=WfeTVxu5I3j5VRMgjy3PDS797eJUrE63u/FyAJf/g0CKo4dvjXxHH+sVOrqTk+cLEq
 0mfRkE3XHsH+ygL4olcjAd6lI/T5/kgiz4qvIYGFPPzQk91CYHgaty9XDwzvBUXK3xiX
 SU0lat6eFR6DozwTdzBe5ds308lq4mFKWJcMEeNUa68alUxnHETJOVzEhZkyNUeMRMhC
 +ZnIFsOMactfG9r1LZdY20p1ig28PkfK0Ey8rkH5clVDMdVYaVbgxLXPN/XRXx2QFHkt
 bG4OvU16mCurJLyCdrnLmnA+zrt1a4q0PHMMEPUt0K1b+M48abXUHxWK0R876i5GDlPd
 12Qg==
X-Gm-Message-State: AOAM533Gwe+ODu3YAiVE5uHjtbcsWhZi8iwajeliz06ITe5pCWa7tmsN
 FgbUxLJJ1jeDSLEXaHXHQuTSpC2w41xH+tRbtB4=
X-Google-Smtp-Source: ABdhPJyGYnzCLCgmUpX6BZg27NxRlq7hf3IvEKBXZL0LTkdyV6wPNtwJmSJGeCPint6S81BushRMZF17XVyz6Aa3ljk=
X-Received: by 2002:aca:308a:: with SMTP id w132mr3432211oiw.69.1611762253600; 
 Wed, 27 Jan 2021 07:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20210126202317.2914080-1-helgaas@kernel.org>
 <20210127151426.GA2984275@bjorn-Precision-5520>
In-Reply-To: <20210127151426.GA2984275@bjorn-Precision-5520>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Jan 2021 16:44:02 +0100
Message-ID: <CAJZ5v0ir4=urUviCR_4N96revWZkHVDyNNUiaJ3jjGzpX8zLVQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-hwmon@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Jean Delvare <jdelvare@suse.com>,
 acpi4asus-user@lists.sourceforge.net, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Takashi Iwai <tiwai@suse.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Corentin Chary <corentin.chary@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-spi <linux-spi@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>
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

On Wed, Jan 27, 2021 at 4:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Jan 26, 2021 at 02:23:17PM -0600, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
> > Replace it with "if (ACPI_SUCCESS(status))".
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >
> > This isn't really an ACPI patch, but I'm sending it to you, Rafael, since
> > it seems easier to just apply these all at once.  But I'd be happy to split
> > them up into individual patches if you'd rather.
>
> Thanks, everybody.  Rafael, I'll just merge this via my tree to avoid
> burdening you.

It may conflict with some janitorial stuff I'm doing, though, so
unless you've already applied it, I'd prefer to take it via the ACPI
tree.

Cheers!
