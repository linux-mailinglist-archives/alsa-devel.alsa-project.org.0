Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D079CCCC
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA586950;
	Tue, 12 Sep 2023 12:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA586950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694513001;
	bh=otXpSz6gr8KPYm4mMDXXGqK2BsqjN7OA0FhyTrfvxdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JnOIB2Hte1e2LVA6hdhWigqxKZtDfVzO0lCmMbClM18lKdKVnDagNhbPVIXCvLXwK
	 si2/ROMVEZubJX5M8fKX8X4RfS8aK8cl1WBOfGSPhw9/dk5zGPySEBBcP9ph7kHMgQ
	 tsN3O9WMKzAnzGw5PNksfMs5REEemMWOzX+Jtpqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E838DF800AA; Tue, 12 Sep 2023 12:02:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C444F80246;
	Tue, 12 Sep 2023 12:02:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1390FF80425; Mon, 11 Sep 2023 11:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 596E8F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 11:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 596E8F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rIXsWIRW
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso20909205e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694426389; x=1695031189;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8DwGOouAfeTC9dQWWUPc8inKmfQnl7752/OQxdRR2w=;
        b=rIXsWIRWl4l7WaCrARuUNhX7bEVnzAF2wq2CEQCQBNB+p2yqrnzvQ7YDacpYl5F4tG
         i2+6sNgj173VyqoWYJGITzemSmVJ13pXWgqK6RHF7kaWX/yCBthx/ToOYWmKRYKo4qZi
         bn+P46yMt+hQHx8MuohR3iP5eex/8fyN1ddz3aojceNF2IH2vqIHiLjTzI4UkgkK0TCP
         ewkrdDHX3X8nhs3Y7WFupgaV0Ne0dfe2uairw5V/Ot61JBLwcS3e4N7f6WPvtgcx8g0K
         81gyqZI0ii/o44ovDi43JN/Fx+q83f5FXIWEzngE4PLsYePK/nVku8t+4SlT7LJrNTrw
         XN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694426389; x=1695031189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8DwGOouAfeTC9dQWWUPc8inKmfQnl7752/OQxdRR2w=;
        b=QratdtqKE+amdJgec/aIOxzJq2dGk5z7fICcgy254Eq87QSRj5Nn890y4x3tpwiAhm
         fEbBc58MJQMeRyiQjbFAg94E4M+3ulf15uTOybVzid8zYZ9xXYgqEjshuL3VrjNiMbKY
         +AqgUeP4nxQdAMErqnBrmCFQros5fifqbjQAMN2VHjRO9qfRDToxyugBPkQ4NQQZS7gG
         KHMotI5YidEVxWyyL6SI2HYWfALrUNMLMCWm0qdO7/2D8qBPN56kRXppJZbGyOoB4ToG
         t+sQDG/JTt1eVIzTG3G7WqXS+LCWDeQl0vtyq+5Tfje0QFC7BdyCZG17qvlYwfGD2uiC
         yv5w==
X-Gm-Message-State: AOJu0Yzxsjs4BvFSHVuGFYRt6UJoz0DcjocryQTuX43Y7VNX7to12Sx6
	LNbTlWpgASafEoVc5uLglhw=
X-Google-Smtp-Source: 
 AGHT+IFBUY7gHK1mAZy8nG0AfLjBC8XLEJvInpL0oTLiQQfgZnP7fUu+Eo0jMt8J4B/7vYrmK/mfrQ==
X-Received: by 2002:a05:600c:452:b0:402:cc5c:c98 with SMTP id
 s18-20020a05600c045200b00402cc5c0c98mr7693933wmb.13.1694426389291;
        Mon, 11 Sep 2023 02:59:49 -0700 (PDT)
Received: from ubuntu ([2a02:810d:1640:10d8:ac22:c335:c227:5398])
        by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b00402fa98abe3sm8936300wmb.46.2023.09.11.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:59:48 -0700 (PDT)
Date: Mon, 11 Sep 2023 13:59:46 +0200
From: Joerg Schambacher <joerg.hifiberry@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: a-krasser@ti.com, joerg@hifiberry.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Zhang Qilong <zhangqilong3@huawei.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: Adds support for TAS575x to the pcm512x driver
Message-ID: <ZP8BMkDeZakUyACL@ubuntu>
References: <20230907161207.14426-1-joerg.hifiberry@gmail.com>
 <a9c3d43a-af26-44a0-9352-4666107f9f56@sirena.org.uk>
 <ZPn4nsypsSXdB3J7@ubuntu>
 <bb3e5ccf-6eb5-4a36-9af0-b33f2db68445@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb3e5ccf-6eb5-4a36-9af0-b33f2db68445@sirena.org.uk>
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S7W5KV7GYBVR4MSA6BSJU3F3PZB2H5J6
X-Message-ID-Hash: S7W5KV7GYBVR4MSA6BSJU3F3PZB2H5J6
X-Mailman-Approved-At: Tue, 12 Sep 2023 10:02:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7W5KV7GYBVR4MSA6BSJU3F3PZB2H5J6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 07.09.2023 um 17:28 hat Mark Brown geschrieben:
> On Thu, Sep 07, 2023 at 06:21:50PM +0200, Joerg Schambacher wrote:
> 
> > And yes, we cannot be sure that future devices may require different
> > settings, but I can hardly imagine anything completely different than
> > this approach with the usual audio MCLK frequencies.
> 
> They may for example be restricted and just not the the incoming MCLK
> divider, or require a higher frequency for some fancy processing.  In
> any case tas_device is just an obviously bad name here - there should be
> a flag per quirk, not a flag per entire class of devices.
> 
Ok, I see your point and completely agree. I tend for now to leave that
part out of the patch. This leaves the PLL divider programmings
completely 'untouched'. Nevertheless, I'll continue with testing here
on the hardware.
> > > This is probably a separate quirk?  I'm a bit concerned about what's
> > > turning the PLL off here...
> 
> > The PLL should not be used in this specific case where all divisions are
> > just divide-by-2's. Your original code does reflect that and turns the
> > PLL off. It improves jitter and finally audio performance.
> 
> > But in the case of the TAS-devices we even then need the PLL to
> > drive the AMP clocks.
> 
> That's definitely a separate quirk, and does sound like it should be
> driven from the bias management or DAPM more than hw_params.

Then it makes sense to use a DT-param 'force_pll_on' and even
remove the compatible string fixes from the patch series.
Still, I think, this is the best part of the code to act on the PLL.
Simply instead of checking 'do we need it or not' just let it run.
What do you think?


-- 


