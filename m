Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732246377D2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B0E16E7;
	Thu, 24 Nov 2022 12:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B0E16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669290121;
	bh=M0KP9sLmJ6HzLMjJHhGJaOXbaXuCHnFl/Sgp94OMHJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PneIIZb+LFB+w/+otKLHEpi8vsacWVu9nsKsJi0VNES8/mZH+KYkwGf0nmGcAZTuw
	 nRSAIZMcTtkLOLqb+2cYCNxKaiPgs8Wtk2u961GUICoSs1Dkxb9Bl1EVVHjTh4BFn/
	 +boZwIScsDZeq5NXROdMEEGE7DR1Np7limoqlAsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C037F8014E;
	Thu, 24 Nov 2022 12:41:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E3B3F80431; Thu, 24 Nov 2022 12:41:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2DE4F80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2DE4F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ra/oS7fF"
Received: by mail-qt1-x836.google.com with SMTP id w9so863439qtv.13
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 03:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YW65nmzWJiseN5RQVR2kexQ255Synbbi/eoozzZAKxc=;
 b=Ra/oS7fF6qlZuXNzVzunYzTLirz+kr69JHws8QXEJsPwZwbyD5bvSK7ieoB941wU0z
 Qj974L4ZCsJBzJl1h+VGmvXhQILXEuV/X/E0MTxvOx36e/39eWTRIjMgeej6aRCT1gNK
 3ftjZvw11jicQ1m+7IkwKPd17Tv00SgOljtJbbRefIVcE8Vj3wsOVdDnaxCojx74I1m9
 HkpgUNrO06C1O9htZlWlwIpuswNmcyAa+RcxE8bkiJ2t/jsQ72Y3VaErkalzIkbywFQQ
 rExSEkaUMdIE1ZPPKM/9vW68xo/d1Y2L11yNrAr5p9w5FVgfBBfS/dbILXob/Ia9cF0P
 A30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YW65nmzWJiseN5RQVR2kexQ255Synbbi/eoozzZAKxc=;
 b=p+JIxEhovaMsa7tXJh5vsUVE8d5pTYvad+wY/f703GpMAp1DGf1MAEM7M2kiIcDB4u
 ij5nBm2/s27rJ78M8xy0i2VdS+M2t7AEYg7Cw0RpbMguagIgQgjt44ZqkclUMxgIslY3
 co1Gc8HoPvWfbz6mVNnqJZy1ZQavUU91HdIy68iye71N1jgOqLKmjBxI+n+k68X4rDoi
 +zywO/VjXVMgbOKLlu7cRU2qwB0JebHn48bXt3QfoMkJ+Q90sdpx3RCPOMZK1GsLm8pb
 A1FjiFSxtc2jXaPLDuBofJapjIaFBi5jJeXPEIPylMDG25u+mez5W/G36ltxpNaN71WL
 juNw==
X-Gm-Message-State: ANoB5pkuXEFlDKxs2xtKGdivOxzsPtIp5kHansY4EQWB2YMAoo+2vxdu
 9WBgeBbOTMOzxeSjEZJCTVs2GTobmh/cmrxx0eU=
X-Google-Smtp-Source: AA0mqf6EVMaKyGsT8Yf0GvAO/D+kqDDFYaS6AiQ46hc9hnelIYsTl23j70SLgM9m6BIWF9jcltR9rJgMp7U0DwE5tkE=
X-Received: by 2002:ac8:7eeb:0:b0:3a5:2615:5694 with SMTP id
 r11-20020ac87eeb000000b003a526155694mr15003828qtc.429.1669290055940; Thu, 24
 Nov 2022 03:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-3-sbinding@opensource.cirrus.com>
In-Reply-To: <20221124110718.3925934-3-sbinding@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Nov 2022 13:40:19 +0200
Message-ID: <CAHp75VcCfCxfEJKcKpu18tJZHjVBPMScrE8ADmaMYvmjkUZokQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ALSA: hda: cs35l41: Use ACPI_COMPANION to read
 acpi properties
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, patches@opensource.cirrus.com,
 platform-driver-x86@vger.kernel.org
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

On Thu, Nov 24, 2022 at 1:07 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Currently the driver finds the acpi_device used to read certain
> properties using the HID, however, this is not necessary, as the
> acpi_device can be obtained from the device itself.
>
> With the ACPI_COMPANION correctly set, we can also simplify how

ACPI companion device

> we obtain the reset gpio.

GPIO

...

The idea seems to be an improvement to me. Thanks.

But I have side question, are you going to address the
https://bugzilla.kernel.org/show_bug.cgi?id=215993

P.S. It would be nice if you have an account there, so I can reassign
that to you.

-- 
With Best Regards,
Andy Shevchenko
