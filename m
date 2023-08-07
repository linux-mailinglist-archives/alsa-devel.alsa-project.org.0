Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3B7732FD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 00:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E45E827;
	Tue,  8 Aug 2023 00:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E45E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691447764;
	bh=lxj3n9ivoZ6EJxD5F8vLZNSlFNjYLy4BBHHVC6uz1Zw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GKUFTRNESMf7E3Tjwsm2LkvDIZaSvi80RtrOQg9PEucnAqbSM4orTv3ePVYf/d167
	 MlZIP7tRbJY6/vqGK85AkGDQtVqd2bJ0LjgI+Md5rPICZezA8jFjvsJHTjsQL3wu6j
	 +PXZrAjn90Z3uotOKOtZoRS2bIgkjCt89Y01VBV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFFE9F8016B; Tue,  8 Aug 2023 00:35:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3B2F8016A;
	Tue,  8 Aug 2023 00:35:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE92F8016B; Tue,  8 Aug 2023 00:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF300F80132
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 00:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF300F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=OOYmBj7B
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686f19b6dd2so3421221b3a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 07 Aug 2023 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691447699; x=1692052499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WonXg5twxW3p5wGXk5WnulqfeWrYrhDo5ZRv56vpsGk=;
        b=OOYmBj7B1ScwYFt9V6268kr0uNWuL84x/m5hyXKfQ8pdK4F/U1qGnli84CBJhbzNl2
         0O93ve8zArWTOydSV2G+j+SOsTYT6fAnNHwdMdNrZXl1sCI3z1/xbGyjmit/KPlig6rP
         C+GpWL+eIoRUs+AVd9fcxC8b6lim8sXKk48Z6zGKFaWwqgbL3ZBSlHgoY970piY2pZMI
         dlhrVR9w+3hBa9nIjdRyNZjkXIzk+VquSigrub0viZdIvxjoLZqX3xRRB/I+8uQcCr7z
         VmwpI3yfvTKuh3scFC6Spft/yacNbaWacMcVn0mb90R5b19Pp3ZFi2r8ImRwSmIB10oQ
         ejgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691447699; x=1692052499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WonXg5twxW3p5wGXk5WnulqfeWrYrhDo5ZRv56vpsGk=;
        b=Otb7nYlOsVu6K25kr0DutFJcMaqrOyHTX+m4RhkAR/Q4I21JHJehht4pQJXgSZZ7ZR
         CUOOpyLQJyXmYPf/z8Z9ttwMSSpIq6/MyaELDBgIV0PzISjmVkyAz6bd/h84Sj0tkX4U
         7inqbQ2DN9/oG3GRnr0aeJqNJ+RrmPGZTihHljARV0VCxO9aXZQnO+vklILjeIbZGkAm
         wUQZefYweduBrxDvH8yXHxGmN3qEtZ49paIsm1O37mSoSsWYSz3Ddvd0LXaS5625CrgG
         4zwSIQHcJ6q7uL/ul8RzKNlCoxg4h026wnzAIal9beVrDaJNv5NO2ODBPpJtLT2+OBFp
         2Mxg==
X-Gm-Message-State: AOJu0Yyls842mylBLjzwyydo9XKPoB90piNSfdDrzAXR8fhTPa/tsFrX
	7U8Wh1OoU1rsB+tDZk+TxsoTKljhoTCQ6tg6DEap8A==
X-Google-Smtp-Source: 
 AGHT+IEmJSL22e9DNB6jNY7iEomiS+mRYaYIcgkbEEm3CpQiWYydV+ioZm0bDJV2BKCOgLYfsA/TYJAsLzMzG2mlAio=
X-Received: by 2002:a17:90a:f48f:b0:263:829:2de with SMTP id
 bx15-20020a17090af48f00b00263082902demr7819159pjb.2.1691447698449; Mon, 07
 Aug 2023 15:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230807135207.17708-1-tiwai@suse.de>
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 7 Aug 2023 15:34:47 -0700
Message-ID: 
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 575GYMQQO445K46TF7Y3636JM4VC3JS5
X-Message-ID-Hash: 575GYMQQO445K46TF7Y3636JM4VC3JS5
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> It's just a RFC and only lightly tested.

Thanks for the series

I will be hammering this in my test setup for next several hours

> I myself am not sure whether
> this is the best way to go.  It might be better to take Curtis'
> approach, just converting the device to its own allocation, too.
> (But I don't know whether Curtis' patch set covers all cases -- can
> still be a UAF of card_dev due to devres vs kobj release?)

My original commit does not cover the devres kobj release race, only
the race among the kobj themselves.

Curtis
