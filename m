Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98AA557A5B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 14:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F7F1DF9;
	Thu, 23 Jun 2022 14:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F7F1DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655987463;
	bh=kzFX9uPlDUEYsAhV34ZtAjxOc+U6+JKZhTmu1w/6a+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4EkTlZML0oLKzUwA1FCjAP1bW/quNk4JQUw87aW315Jyff2p12wC1vbJgTp3CXKu
	 NlCND6/9FIXYLMJqkfqhWNbbMPZ+xrl9dt3f4U0zVOW8/ru1yimr8xy3AGmwPQUZh2
	 p/kyhUNWLuwBWsIjmlB4XvvlN7Oj1F45naWBgWOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B162AF800D0;
	Thu, 23 Jun 2022 14:30:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31664F804C1; Thu, 23 Jun 2022 14:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47287F800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 14:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47287F800D0
Received: by mail-yb1-f176.google.com with SMTP id p69so23846516ybc.5
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 05:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzFX9uPlDUEYsAhV34ZtAjxOc+U6+JKZhTmu1w/6a+Y=;
 b=NFh91Ljq8cNsFWrWxyjSDGsjn2bvRI+kKmJ3rkNVR4mVdTBbN6+IhiEZ/bsPzIlps7
 Fx41R8LvGLgndfUzvUTxgY8ys56H7XSPlcZSYGJtXmBantpH7HCg0NPYGJXTOs79bKXu
 7nJUUWo7YD18xM6nPjvhsZFR3TbiO4cqzO3TgdrBtMFbhVyRX4KdkCXAYix5kR7M+MUW
 CtUvlqnU7MOc8HfZtEjzoqmX8brXHUl5/8qctMNu9D+5M1xCZRMJw8oINhRW2a+3yfqX
 RsOL6XeYrxxi46oBLYtg09Wo1aJsMlHGywLnf7qbysipyPB4zZHl8vKPjx7npAHwY3l0
 JjEw==
X-Gm-Message-State: AJIora+ZjEMbYK/HSHd6gh4fmLgVLFl00cJQU0npkfL6DR6HzAwl8K7U
 w+FmGABWaylYJJOuZ6FeDyi1EA1Gfq6CTqpFNCc=
X-Google-Smtp-Source: AGRyM1tXGaLDWsFNRmpcUvDiQXcvKf5vbvGE0SYSdjd6pSKBEWMK4GtCcbw3Fr8yNYZofzzakRnR88Z81ekER5srYkw=
X-Received: by 2002:a25:d841:0:b0:668:ab2f:7b01 with SMTP id
 p62-20020a25d841000000b00668ab2f7b01mr9116719ybg.482.1655987391906; Thu, 23
 Jun 2022 05:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <1843211.tdWV9SEqCh@kreacher> <2653857.mvXUDI8C0e@kreacher>
 <9017824.rMLUfLXkoz@kreacher> <YrQf/W/Kmo954hAm@matsya>
In-Reply-To: <YrQf/W/Kmo954hAm@matsya>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 Jun 2022 14:29:41 +0200
Message-ID: <CAJZ5v0jY5M-L-XdgY+LT=iSbABzL6cLuSdLiuUEQ+mEjYYk=xA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] soundwire: Use acpi_dev_for_each_child()
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Hans de Goede <hdegoede@redhat.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
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

On Thu, Jun 23, 2022 at 10:10 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 13-06-22, 20:35, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Instead of walking the list of children of an ACPI device directly,
> > use acpi_dev_for_each_child() to carry out an action for all of
> > the given ACPI device's children.
> >
> > This will help to eliminate the children list head from struct
> > acpi_device as it is redundant and it is used in questionable ways
> > in some places (in particular, locking is needed for walking the
> > list pointed to it safely, but it is often missing).
>
> Applied, thanks

Thanks, but the export of acpi_dev_for_each_child() is being added by
one of the previous patches in the series, so this one will not
compile without the rest of the series in the modular case.

Is this not a problem?
