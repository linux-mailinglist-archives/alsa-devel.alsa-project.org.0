Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C078F1AF
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 19:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6FC3741;
	Thu, 31 Aug 2023 19:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6FC3741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693501669;
	bh=c5mz+344UmmgI6dNvskJWdwLuHHgH5xlnwcD7ftu25A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gufhqu0L4NzPNKlJoi8H2Wk33YhyG9K7xkXShADLxw/h6++AYbqyuX6ucfy539LZt
	 I5w2luPXfD6ZzaZBm9F2RSsP02aPdWXO6h3H3gPSyfPWa3FADX3dLI7OxxZVzSpHet
	 z8DDswccKwc+9Vwrq5PTuiO8BMlnKxv/NzP9l1mI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2160DF8032D; Thu, 31 Aug 2023 19:06:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E2BF800F5;
	Thu, 31 Aug 2023 19:06:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63229F80155; Thu, 31 Aug 2023 19:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9490F80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 19:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9490F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=FW6P4lW3
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26d49cf1811so729916a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 31 Aug 2023 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693501580; x=1694106380;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sja+jmaTqUD+ye9Syt/TQXKGhrotxJMvaq3YbJWCT3I=;
        b=FW6P4lW3wka173qVH1jWxSX/VJ4qNAp7IZHE7jbJF3/95jEHBLBTOVzwaDlKvexnvG
         kV3RSrP3RfxAT0z5kjjnsFgYcxHVfZNc+lLOoSvPooMlWb/CMxqijgAfhkULCY0NYw9y
         q1wyzYk+k8CVpgWtdTNMVz0r15q9Z+/Xq0/arLwiBJD9sr9L8Q7n1QpgpLJpAwU0YZ8E
         dwIm9SXOuPGaO/Z0+YwYlLnXf2GK1Z6Po9plySXMeqTrouC3PgODIoVXfIchbRWfbYTn
         P4IHpSdQvT0l1P1rfERg+Txz8fNykfs8YdBq+itrd4umwN6E5t8RyN9otS06rjQvGXYT
         HLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693501580; x=1694106380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sja+jmaTqUD+ye9Syt/TQXKGhrotxJMvaq3YbJWCT3I=;
        b=lAxWn4n/E579Ctb8WXmUU9h6F+LX2STj3senhS72cjHtjMvU0E+JR6MZT5rcSV8UIu
         N2DP2a2P/3YXavdLXBvcvuEgPTWRk2nFhX7JpVPxlIhESEJD2BYscZV9b03TwVHAfySy
         WEjXyYLNtWSqNDyeruHaOtZC+pSGdWE2ORANflM0Ye5H/aGEdJDnylIirm/nf06GQHwB
         HAiD9npgfzTDiNrGrmzaBM/SS7R/tmtsgE+q8P3gubhfMRl9dncrLT7KGh3gqTs2lBsS
         uTPWcrnpBQfqopsir4mNkyJuTTOm0qTHl0b2+/gVQEB3DX0ywEY5XWZaUcZt3fs80oxW
         kaaQ==
X-Gm-Message-State: AOJu0YwfMmfYGZ6o3G684pU6WVU5tFASPZKQ9n0RAUP6I2cysIipyDuV
	j0wLyjW3sR2BoHAi4K5Epe9DJVqYbhXe4M5/nJybJw==
X-Google-Smtp-Source: 
 AGHT+IHGWgmT7IIUVHqdh/itPhpPVMogdqJeeZav6/BM4pSj6tDRePRvwF7NLkVeAwN1UVlTv00cBOdubvqffcV/OeU=
X-Received: by 2002:a17:90a:8b8c:b0:271:dc63:a19b with SMTP id
 z12-20020a17090a8b8c00b00271dc63a19bmr2797402pjn.32.1693501580063; Thu, 31
 Aug 2023 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <20230824213312.1258499-2-cujomalainey@chromium.org>
 <73a6f02e-0df7-243a-85ac-48ca5a650cba@perex.cz>
In-Reply-To: <73a6f02e-0df7-243a-85ac-48ca5a650cba@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 31 Aug 2023 10:06:09 -0700
Message-ID: 
 <CAOReqxhSsi_6+3SuBi3nMEVpZ5M7qQLDLhh7bJfkJufQP6dEAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ucm: docs: Add IVEchoData
To: Jaroslav Kysela <perex@perex.cz>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
	ethan.geller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YPA5TXN2EVTQXQ2SHH2OD7HZJ4QRUVAV
X-Message-ID-Hash: YPA5TXN2EVTQXQ2SHH2OD7HZJ4QRUVAV
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPA5TXN2EVTQXQ2SHH2OD7HZJ4QRUVAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Curtis Malainey | Chrome OS Audio Senior Software Engineer |
cujomalainey@google.com | Sound Open Firmware Lead


On Sat, Aug 26, 2023 at 4:31=E2=80=AFAM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > Provide a UCM value to mark devices which are needed to be opened only
> > for HW purposes but should not be consumed for userspace.
>
> It would be probably better to describe this in the standard ALSA PCM API=
 than
> UCM. If the device is special, applications without UCM should be also al=
lowed
> to identify them.
>
>                                 Jaroslav

Would something like an additional device class and a format subclass
be acceptable?

Curtis
