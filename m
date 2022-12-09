Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1F648746
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 18:07:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81FDD20FA;
	Fri,  9 Dec 2022 18:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81FDD20FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670605672;
	bh=SZcrDy4iX1TWqGpkezjK5jVj9tOycYt8nOI1lIefhs4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tWyHm/vx6XLRtQPjII7SoNNy29D86tXLR0+Hb30nOm1Jc42R/yqQi69kkJSU8zIen
	 156payF0wjBZnP/m8ZFotlySoKDG/7wq69Z7qYjxzUOQzUZK8dUEGAClrRgU/2+9Q1
	 NVnE8MtsQ6Jgnm9i6FsOhQrlKLAk6pBDdQAckKTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C12F8024D;
	Fri,  9 Dec 2022 18:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C81F8022D; Fri,  9 Dec 2022 18:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792C1F800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 18:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792C1F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=tEWPBuWa
Received: by mail-yb1-xb30.google.com with SMTP id 7so6221975ybp.13
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 09:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P7v0Z5SII5lc88SchWlGOU2fHuY/bVMdgG+8xYXDaM4=;
 b=tEWPBuWaeaRHXKVLQf119O3ROzEzV0m0qCU63eeky+tEo5IBLDxDS/wUyD206U4tTe
 dd/CIyzh8kyfWI0AM42MKxiJvHcTAFJmWZ4pneTy8J1hEaGg5LgBUusYPSxEb9L6RadW
 JiX2SzDkItJYEP753ClmfmlXmNXQFnbdylwJIy1qjretyuofSHzjp1eQLbq2maepHf0r
 pJSsAKvXwBiIE54GFeXtZ5PRNjHINCPMqrjAfQQtcYloRR/Fz7jXi4vQRLr7AT28e9IC
 YeJ94a2T37qITRiKlWUFwlPQ6R6wlnPELx+QeCRT8QkqqY2LnTvwS9s9aUa5HJBgVBcn
 W0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P7v0Z5SII5lc88SchWlGOU2fHuY/bVMdgG+8xYXDaM4=;
 b=WkH6YgsxOGB2+3fLxnAmPLIx18qbJOI6/kgblCzwVQv58FUqO6mK+d47qpFX2iqqme
 RwLffwRUCu+pgSshLDaiQwyZf0dQmFLMyA9adrLAlMNawjuqyiNx85ikIg0C8xApDZOk
 nTIqZSUUorWFai6xPzGIZbS9i2E/qNfaXNNeEC2DXtxYtbO16iJ6J8TsSusda75iGwrz
 3aGinZ9gORLpr+m8uUuxKjZ3xQ2eUZ4BkyhRY2vKtKxV8lwppZKXOSxFSFIejFYVTYX8
 NeMKah90LTbPnLISKjS49G09n7NuB4FiYCHmD84SA98PXuVtQc5TIs2qLTkXMyICuxI7
 4Edw==
X-Gm-Message-State: ANoB5pmtPhbnBmLwx26stnIW9bzOs/mIfUs9YqYgSijK0KjN9LMgQu9C
 3WjRlD7hjalAaoCgiaO+50howSbAokpmo3GcTVJWNw==
X-Google-Smtp-Source: AA0mqf5T5MUF/zloobEh7ghw97shyQNQuYyAKTvXIS+ST8HKOfx+pYSxCC4f3/aht2O5lJ5Icoy5jntmn49DjBzF7ng=
X-Received: by 2002:a25:d313:0:b0:716:9baa:18cf with SMTP id
 e19-20020a25d313000000b007169baa18cfmr1009394ybf.453.1670605609116; Fri, 09
 Dec 2022 09:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20221209150503.11875-1-ajye_huang@compal.corp-partner.google.com>
 <eca17001-93ff-d379-1ab2-2927f1831e78@linux.intel.com>
In-Reply-To: <eca17001-93ff-d379-1ab2-2927f1831e78@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 10 Dec 2022 01:06:38 +0800
Message-ID: <CALprXBayJtWRe9J+q7EahgpXrRy_B-tMAf0KXbDtWa+=4RKyHA@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_nau8825: add support for nau8825 with
 amp nau8318
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre

On Fri, Dec 9, 2022 at 11:52 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:

> This looks inconsistent with the commit message. There are separate
> Kconfigs for different codecs.
>
> SND_SOC_NAU8315
> SND_SOC_NAU8825
>
> Which is it?
>

Sorry about confusing you, I think it is better to change the title as
ASoC: Intel: sof_nau8825: add combination of nau8825 headset codec
with nau8318 Amp.

And add some information about Nuvoton chips in the comment message.
***
The nau8315 and nau8318 are both Nuvoton Amp chips. They use the same
Amp driver nau8315.c. The acpi_device_id for nau8315 is "NVTN2010",
for nau8318 is "NVTN2012".
The nau8825 is one of Nuvoton headset codec, and its acpi_device_id is
"10508825".
***

>
> Deep sigh...
>
> This ACPI HID is already used to match with the 8815, so this is not
> going to work if we confuse two independent drivers...
>
> sound/soc/codecs/nau8315.c:
>
> #ifdef CONFIG_ACPI
> static const struct acpi_device_id nau8315_acpi_match[] = {
>         { "NVTN2010", 0 },
>         { "NVTN2012", 0},
>         {},
> };
> MODULE_DEVICE_TABLE(acpi, nau8315_acpi_match);
> #endif
>
> How does this identify a NAU8825?
>

The NAU8825 Is headset codec, we added a new combination of nau8825
headset codec + nau8318 amp in the machine driver.


>
> > +             .dai_name = "nau8315-hifi",
>
> and again this makes a reference to 8815.
>

Because the Amp driver is the same file nau8315.c , so nau8318 use the
same dai_name "nau8315-hifi"


> I will stop the review here.
>
> NAK for this v1. Please clarify which codec you are using and make sure
> all references are consistent.
>
>

I apologize for the unclear comment message, please give me any
suggestions if needed, and I will send v2 for review.
thanks.
