Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C476FDBF
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638F2857;
	Fri,  4 Aug 2023 11:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638F2857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142431;
	bh=m9NTF/PQTwCK0149Pvtoc1YatTEWGaEmB1RjBVyr6hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NaroS6wPinuWUgk0gK8L1P3QSVhBuH8SAhF8d2eoyd5oq5oM8kLjQuQ0PpsOywFG8
	 3HSqcGqRQ4x0CR/8Lhjj5/wmsX/itqE6BKckC7JipMNuV391PKutYGrMpESUFCCbxG
	 2GQSuEFhcT/fx+DhPMSemARjw40CN8wY24kl6ETE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C71F1F80557; Fri,  4 Aug 2023 11:44:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32AFCF8055A;
	Fri,  4 Aug 2023 11:44:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85DE5F8025A; Thu,  3 Aug 2023 11:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABE78F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 11:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE78F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ykjDA7wr
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99c47ef365cso108288566b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691055982; x=1691660782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGpq+iEica3ryLXvW18eKkvU88YFvdGjEJVEPdEMNKk=;
        b=ykjDA7wrVZ6sUI5GCUCb2036lu1QgWeqLxpuVuJaXLxtY0JSXI631bqzXFOb8C4TGk
         wxl628WdMpVASIu/kaGjNq/EcXhSaXRRLaB2E1r2CtHWRB4UsqaJJMwp6lODAglV1KXz
         3npdmn650WXExcS0cpQlds0DpuLKcggDWOBfR7vMWQjcDSmcmIe+jKObvI4mvcLCC+rQ
         YLOBX4Eibvj/bo2MeIbVxWGwAU28xggUWzO9HoyW9dIYLe1kTdu6qzZd4Lt1DPlYfRKf
         YfwP5khKo/S4kIe+tinaHRj6ThD2wdWe81ydOdZMHkSbjdLw8VOH2oFkSESxkgMoVpL3
         hr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055982; x=1691660782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGpq+iEica3ryLXvW18eKkvU88YFvdGjEJVEPdEMNKk=;
        b=OupF08GYnYFBNwSZ/kk7cmSQeHplnbWCwuKabbfpANtMZK3ji2hn35BoBGtU782+XE
         Wa9piLoPD1STi5VBPNw/TKkIgifNZb3PXiMpdXGSIlEEQZRxORLZVK8bgYFWCdAf0Qiq
         bpLimo8Bm5Zvwzzg0x/yTLejNo7zBAFdtKmptYdSTm1Sj/FmF93A42gakqdUi+DwyLbE
         OEWdNL71xQ3R6NQ/7KDaN3UYxF7DUHyC8fQVk2vADpuL5Ra6cEtkA2hrCbiju9WW3aDj
         ovC3R35InYsWn//AWmGbaXGC5fK2To39W6Er+KmnOv49r+6U9EHlAo3htApQAr/ia2DX
         VHbQ==
X-Gm-Message-State: ABy/qLaA7yiHw1AifR/U7TGBy1Tc3oyx5RP8nEdH/AdmIRVKhj1lDLug
	wwUzUXa9doG1EzsHtcgEXHjuwA==
X-Google-Smtp-Source: 
 APBJJlERif/Ou9wDazY/xvMH406IdZtS18Pj+LVbAXMoXPNjJ2mOQeZlWiqdGUfvIMhHsLt1j7H05A==
X-Received: by 2002:a17:906:20dd:b0:991:cd1f:e67a with SMTP id
 c29-20020a17090620dd00b00991cd1fe67amr7800334ejc.29.1691055982618;
        Thu, 03 Aug 2023 02:46:22 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id
 cw25-20020a170906c79900b0098d2d219649sm10327933ejb.174.2023.08.03.02.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:46:22 -0700 (PDT)
Date: Thu, 3 Aug 2023 12:46:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org, Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Zheyu Ma <zheyuma97@gmail.com>, Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH v2] sound: core: fix device ownership model in card and
 pcm
Message-ID: <1b9202af-a68a-47cd-b4f2-5c30447895f6@kadam.mountain>
References: 
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
 <20230802174451.3611976-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802174451.3611976-1-cujomalainey@chromium.org>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NDV4VE25L2U7QL3WWFTDYQZYF7ISR4ZV
X-Message-ID-Hash: NDV4VE25L2U7QL3WWFTDYQZYF7ISR4ZV
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:44:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDV4VE25L2U7QL3WWFTDYQZYF7ISR4ZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since you're going to have to resend the patch anyway could you modify
this commit message some more?

On Wed, Aug 02, 2023 at 10:43:49AM -0700, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> The current implementation of how devices are released is valid for
> production use cases (root control of memory is handled by card_dev, all
> other devices are no-ops).

I don't understand what "root control of memory is handled by card_dev,
all other devices are no-ops" means.  At first I thought this was
refering to code that is out of tree but now I think we are talking
about a CONFIG_DEBUG option.  Could you spell out which option we are
talking about?

> 
> This model does not work though in a kernel hacking environment where
> KASAN and delayed release on kobj is enabled.

I don't think KASAN has anything to do with the bug, right?  KASAN just
finds the bug, it doesn't cause it.  The bug is always there regardless.
The "delayed release" is CONFIG_DEBUG_KOBJECT_RELEASE.  Could you please
mention that specifically.  Say something like:

    "KASAN detected a use after free when CONFIG_DEBUG_KOBJECT_RELEASE
     is enabled, which, hopefully, no one does on a production system."

I feel like a KASAN stack trace might help clarify where the use after
free happens.

> If the card_dev device is
> released before any of the child objects a use-after-free bug is caught
> by KASAN as the delayed release still has a reference to the devices
> that were freed by the card_dev release.

Ah...  I think I understand.

   "The CONFIG_DEBUG_KOBJECT_RELEASE introduces an element of
    randomness to the release process so we could free the card_dev
    before the child objects resulting in a use after free.  But
    if we don't enable that the releases happen in a nice fixed
    order."

> Also both snd_card and snd_pcm
> both own two devices internally, so even if they released independently,
> the shared struct would result in another use after free.

Does this second use after free happen regardless of
CONFIG_DEBUG_KOBJECT_RELEASE?

> 
> Solution is to move the child devices into their own memory so they can
> be handled independently and released on their own schedule.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> ---

Also I know it's complicated here, but could you try identify a Fixes
tag where this bug is introduced or first starts affecting the things?
This looks like a pretty core bug so it's possible it predates git.  I'm
not sure what to do in that case.  I normally just mention it under the
--- cut off line.

regards,
dan carpenter

