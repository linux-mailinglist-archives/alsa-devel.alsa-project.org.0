Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1256DDDEB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 16:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C63DF00;
	Tue, 11 Apr 2023 16:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C63DF00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681223362;
	bh=2xqBbE2oJgYupA0iRGUukQSMHvtCtXoAyjQGakf9EFU=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=d+bITHchTc3W6UrC+Cr7waZiVqmsahNEWRysA8OlZjF6fxkIbtg7vDLvlOxkW8v6D
	 eX/c3BudxgTVJ6m3viUBDDDeD5gPYc1GuBqggAR2kogpY1bjpwuKpLaxC50ODEsacQ
	 u5yCSTEb5uNxln+Xp5vQsk3VivVztmt22Tlv4p5E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E0BF8025E;
	Tue, 11 Apr 2023 16:28:31 +0200 (CEST)
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
 <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
In-Reply-To: <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
Date: Tue, 11 Apr 2023 07:28:06 -0700
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
To: Mark Brown <broonie@kernel.org>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIOKPMVVZEIX7VZVTMXDBWD67WW2KKA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168122331120.26.8736167261358074782@mailman-core.alsa-project.org>
From: Guenter Roeck via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Guenter Roeck <groeck@google.com>
Cc: David Rau <David.Rau.opensource@dm.renesas.com>,
 support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA327F8032B; Tue, 11 Apr 2023 16:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBD47F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 16:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBD47F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YwK8pJ9u
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54ee17a659bso162411507b3.4
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Apr 2023 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681223298; x=1683815298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZfobvlUCC7J3xgHr6FQOiw2LjkyB6gvtu/1JOkJZMo=;
        b=YwK8pJ9uI8qWrURVIeDyg0ZVrNVImO8yisLnVmcklUK2t/1M8MMbwv4A2gPfrIu25U
         bW1pQD/qK8+ep8QAdp2Bgaps4gm5Mzvz9yqBA6V1gB7KUoG0rSgiGefqyR7N0b6mQEiv
         l2MEDSlugMZ44sA5NZZfvAFxE7M32G0G2G+sxmtwOGreMm7EY3k2dW0mcPnzMgdkmedy
         BqktCxoiuO/l/14J1TrtWkc6MZGiq0YKGzcEFqKN6ra8qQLs/DMiJtzKqxEYR8JOZ8fY
         yXpinKCeWS4f9YN5GEgZpIzOyFeU6EiDdr9Or9UTLvPRJVIbCzCUtF0hN6zEfR8LIyFd
         2CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681223298; x=1683815298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZfobvlUCC7J3xgHr6FQOiw2LjkyB6gvtu/1JOkJZMo=;
        b=ZjxDCoD2+D03bY/LO6jY5aiRiQPhqfVPlaX6WvBYk4lEaqdGGXaQPLrbA10+jqUK1l
         PnbPe2P081bNW9B8U8KYx/6Y1jDiGf6e1+IXYo5jrj6xoKlaqyrQyYMjZOAR8Otw9hrd
         yJZkvZNZ2/Ar6D6ein7gqjLoFCEz1B/js6n7MIm8g/BK28A/CtEgi6Ng5NC/jOzRioYR
         zHvpaPh3ziw4QoGOkpvzNV9WYE3ESb1kLbCEXimgGTJ9ZDzlliZPMQgdIMSzhsv79mCK
         lhQSU4OV0nFC6Mo58u29TYXvHjxuEmyvlefZ06FOfvOhjxymDA10uYop0f0MbKvysmGo
         Hwog==
X-Gm-Message-State: AAQBX9fhZRAK8ai8ITh+/PskI18eDabdQD0RziGlvjJVm1kayGXs/AMN
	vZTpby1btxRbyVh9YgMHNlLZHHb8/0kvpSb/fhepsA==
X-Google-Smtp-Source: 
 AKy350Z9kzZbAxs/K4ubk+sdi2/tr79+TIi6vYp2YRsWABCQsOlOkg6Q4ykmV4ttthZT9jYNbA6TdBKab+FdV3LcYQU=
X-Received: by 2002:a81:a74a:0:b0:54c:7a1:ef50 with SMTP id
 e71-20020a81a74a000000b0054c07a1ef50mr6013376ywh.6.1681223297863; Tue, 11 Apr
 2023 07:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
 <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
In-Reply-To: <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Apr 2023 07:28:06 -0700
Message-ID: 
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BIOKPMVVZEIX7VZVTMXDBWD67WW2KKA2
X-Message-ID-Hash: BIOKPMVVZEIX7VZVTMXDBWD67WW2KKA2
X-MailFrom: groeck@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rau <David.Rau.opensource@dm.renesas.com>,
 support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIOKPMVVZEIX7VZVTMXDBWD67WW2KKA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 11, 2023 at 4:32=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Apr 10, 2023 at 09:26:34AM +0000, David Rau wrote:
>
> > This commit improves the control of ground switches in AAD IRQ
>
> In what way does it do this - what was previously unrelabile and how
> does this change address that?

One very specific problem is that da7219_aad_handle_gnd_switch_time()
is currently called after interrupts were enabled. As a result, the
delay time is not initialized if there is an interrupt before the
initialization. This results in a negative value passed to msleep().
Since the parameter to msleep() is unsigned, this causes it to sleep
forever which in turn causes a substantial number of hung task crashes
in ChromeOS. Plus, of course, the code doesn't really do anything in
this situation.

A secondary problem may be that calling msleep() with a potentially
large sleep time on a system worker isn't really a good idea, but I
didn't explore the impact further.

Guenter
