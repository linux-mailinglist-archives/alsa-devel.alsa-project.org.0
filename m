Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AB68F68C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 19:05:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B72836;
	Wed,  8 Feb 2023 19:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B72836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675879510;
	bh=7E2viT0+GCzgwz4i8I33fv5Tvcin04GxuSK6KxoKwnM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MJE99QqXMXP0jDHivnds2XNGTHrUfeS9VzpBK00PjwFLjE+FrZ5M3dOgMnSMES/2l
	 Lcyx+gxoAuZHbWxc7g99w4JPQ+JxLWI08wKpkAMS4vYI/Hq3/tk1OkEg53MrabrIaU
	 B7g2cNTaH1AAFECXODbv1tEUnOuT/6cIFPPMeOqI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F1E3F8010B;
	Wed,  8 Feb 2023 19:04:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 426C6F8012B; Wed,  8 Feb 2023 19:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35C7DF800E4
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 19:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C7DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RzQC+g8V
Received: by mail-oi1-x22f.google.com with SMTP id bi19so740725oib.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/yYLbDmVAKhtP8X+LmC29BJSStWEUQPLeH77WHP6dc=;
        b=RzQC+g8VDw5QUgQluU0fadg6ShuYtqdzeVThydyjTbD4pEBH2WvZFVLK85twqKgQxy
         w6fQE3djW2HasC9GxNBEQFavQJEwuhGo0UjJIxhfEICZg1YjdbTT0zjn4dl+D/DsJVor
         6GnAvV4YTVmTfS4rUBbqxT4fk863nSc4c/jaz0la6ml3QDAkdhDBTo9v8vJ/Gz8yDF8r
         GvArRJzN1/RMer+xeR6rnuCjVDcb0R6BPmbe3HZKs5nKywtg5R9o5vgo0i82nZ3wSl6D
         M6iSfhkf+ZzKvbI8g3tyqovsBd77aG45e5f7EvX9aRM2QsMe61nExaa/RLQCisNJdth4
         Du0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/yYLbDmVAKhtP8X+LmC29BJSStWEUQPLeH77WHP6dc=;
        b=UTPWl7WYm1mvQyZHcBR49DOKaYx16A8mnvCCIG0Sv8c6niakX8KBE/JQSOFsvA0fol
         mYLyBjIlFPQ4d/ToiVCfWEhuXayROZfxIHZ0hXVr+m/zc6uOklpTkIjAcL3fs3RaYUtf
         /p1XBO/d9dZ3W7xj7UwxLQaUMlBvMf/1ZSU+jA3T2/G5NMwitTtVxj5Q8mXSr8iXdBOv
         eoJnWY7411GlxnrL4NB5LtSOIk2O0Ai7yMwyyetv1slW5h7OVtELNM+8I+SK+W84u3zV
         QShm8mDNBGHPHZQetSj2Klk2ZEVCeXbTuo2tHPTGj3wThOOxpYR0AfYOUziaWyk/FaQ5
         0VhA==
X-Gm-Message-State: AO0yUKXlokW6ZiyTDODXa5u+2LyHEdDcIqQ2qG3Y2jzCO2gDKCgvlMWg
	QIPr30kKh6QHjemuUA9fcTE=
X-Google-Smtp-Source: 
 AK7set8qcDe8W2WKf0+i5hQvRiLJ68yKZLpDh2UBtRqIYNqX7CH3WmvZbxys0yr8x9gcP/CFr4msng==
X-Received: by 2002:a54:4704:0:b0:37b:77fb:235a with SMTP id
 k4-20020a544704000000b0037b77fb235amr1393394oik.50.1675879448493;
        Wed, 08 Feb 2023 10:04:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 q130-20020aca5c88000000b0037ac4a18acfsm7260948oib.48.2023.02.08.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:04:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 8 Feb 2023 10:04:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Rau <david.rau.zg@renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-ID: <20230208180406.GB3065515@roeck-us.net>
References: <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
 <Y9kE1cSUg2CQM5vq@sirena.org.uk>
 <20230202155101.GB1373010@roeck-us.net>
 <Y9vtIISfmpICi+9u@sirena.org.uk>
 <8f89eeac-b3ef-4137-80df-6cf044873b05@roeck-us.net>
 <Y9wQygzbFyOWl54r@sirena.org.uk>
 <20230204154222.GA877819@roeck-us.net>
 <OS3PR01MB6641CA1DB8524BCA0F9867D9CDDA9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <1ba5cedb-0f0f-69a9-96f0-d93ba060745e@roeck-us.net>
 <OS3PR01MB6641BD5C3B3BA89F82245627CDDB9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <OS3PR01MB6641BD5C3B3BA89F82245627CDDB9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
Message-ID-Hash: KYHIFCK3HNKDZKA2IBEYIN4PQRZ34F4A
X-Message-ID-Hash: KYHIFCK3HNKDZKA2IBEYIN4PQRZ34F4A
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYHIFCK3HNKDZKA2IBEYIN4PQRZ34F4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 07, 2023 at 02:42:14AM +0000, David Rau wrote:
> 
> > You mean just keep the above two patches and revert 969357ec94e6 ?
> > Sure, I can do that, but feedback from the field would take some
> > 2-3 months. Is that what you recommend to do for now ?
> 
> > Thanks,
> > Guenter
> 
> Thanks for the feedback.
> What I mean is just do rollback to remove the "sleep" patch I did in your repository.
> 
> After the rollback, could you please let me know the average number of crashes per affected system with the same test conditions?
> Will it still take some 2-3 months?
> 
The msleep() patch has been reverted in R111 and dev
releases of ChromeOS. I did not get permission to land
the revert in R110, meaning we'll continue to see the
crashes there. R111 is expected to go to Beta shortly,
so we should get _some_ feedback in the next few weeks.

Still, it would be great to get a more permanent fix
for the underlying problem. Also, the msleep() patch
is still upstream, so a solution is still needed there.

I can try to get and play with one of the affected
Chromebooks, but I don't think that would help much
since we still don't know what the undocumented ground
switch is supposed to do.

Thanks,
Guenter
