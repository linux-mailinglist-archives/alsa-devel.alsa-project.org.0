Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ED5708FD1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F15920C;
	Fri, 19 May 2023 08:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F15920C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477372;
	bh=XFc1kvTwrjfT59McvY6Cp5Ba6PHLMeThg7tbf3U5QGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gvqyaip52KEUwwAEwbEGKJjbAy0yPh4oTFoCymV+SEwkgmZV/iYUW6pjEi+VmOdrr
	 0zNCfFYyc06AstL1o52PWOaZFETIv++YAxjnvCy2c2ggyOy/v5TQGmn67yRjiIaRgK
	 Xa1pB5BfowSjFllbg+4StBU9fSPOFfUHzzRtDbjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B0AF805FD; Fri, 19 May 2023 08:18:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E36DFF805F0;
	Fri, 19 May 2023 08:18:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A17DF80272; Thu, 18 May 2023 01:42:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DF3DF80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 01:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF3DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=QBIL4Gf6
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1adc913094aso14438035ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 16:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684366939; x=1686958939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+PtovZvYqYzb6rdBWxcjpXWIgQA2DVctfW2duNZpLU=;
        b=QBIL4Gf66xC10MSiEmh/Y4/q+KGXN+g/irHWvDJkTkhDXGyl+AqoRywOth7u5X70A5
         I0meNKmbC6dcrd9TCXaQHUvei/hP1hjW1EDsMBWjo1Zjh1GLzRpBGMI3ytV/qsG83S4V
         rI+RW0v7vVKGMEfP06f6Q7U4WcJUj+AA4kiMTNVPfS6WM6e+qoQo+evXBvOGptcRPgpB
         ZknVgpst9Yvy8VFsJdB8s6QNfYDTOHQNwMolKhp4Q40CpS44SF2sHhj8mL1KZzp+3Jol
         Rc3nQ7C2S+L2TIgZeNYOQaTw7XD3hnFbER/nNdBgHFROyxjgbWYWpnGbRABCLH7KqAOo
         KmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684366939; x=1686958939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+PtovZvYqYzb6rdBWxcjpXWIgQA2DVctfW2duNZpLU=;
        b=JKZ0/KHjdOd/UJor30uh3T1FHA3l+nG48tNepaeZ59FjeaWnqng78V8E2Yj5EYWsy/
         g4FJmTjY4ivXHw2WUqpxZF9f9/wTXEIZ6/6Lp0/uONecSgkwvye9Uj1xZOiR+W5mnqsi
         Nor8yBGxVASJptWC5ssYj50xohB08IfqIz2mfC30n4Vn3Y5WTgUxf60CDMJTERFu9EPR
         0baVIyA+tT5p3AX8kWVTPOY5KJRr8yiTY4PPzpoW+aKuIxW2UapYx/ZbUE/Z4O7GMGiu
         jZExFHxgOKRxY8WGmCDY96P8Jzptl4tRrWU+biB2slS+xOQUWrT7HEog5OiTG3LOyL+J
         34JA==
X-Gm-Message-State: AC+VfDxDjuExsqXwYlPSd2C6mkAo5g7inrhxRoH2//ZV+Y+MZq3SN+AR
	aUFK2b2YBpb4cBRP3XHbW3Q=
X-Google-Smtp-Source: 
 ACHHUZ4if+bS6cRA7xGN6UZkvohloZYh/vkcXS7IWJhQFkuA1C25/lc3mdgoLXr6uU8qmCMsbhvjKQ==
X-Received: by 2002:a17:903:2606:b0:1ac:727b:3a60 with SMTP id
 jd6-20020a170903260600b001ac727b3a60mr574456plb.4.1684366939443;
        Wed, 17 May 2023 16:42:19 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28])
        by smtp.gmail.com with ESMTPSA id
 a9-20020a170902900900b001a2104d706fsm1059809plp.225.2023.05.17.16.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 16:42:19 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	minhuadotchen@gmail.com,
	perex@perex.cz,
	peter.ujfalusi@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: ti: Use pcm_for_each_format() macro for PCM format
 iteration
Date: Thu, 18 May 2023 07:42:15 +0800
Message-Id: <20230517234215.3520-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZGTltcv6hSlJWLnh@finisterre.sirena.org.uk>
References: <ZGTltcv6hSlJWLnh@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZPYRWIFYKRPYG47ABJY53DVZA2IQJKL7
X-Message-ID-Hash: ZPYRWIFYKRPYG47ABJY53DVZA2IQJKL7
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPYRWIFYKRPYG47ABJY53DVZA2IQJKL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

>On Wed, May 17, 2023 at 09:01:22PM +0800, Min-Hua Chen wrote:
>> Use pcm_for_each_format for the PCM format iteration and fix the
>> following sparse warnings.
>
>Please submit patches using subject lines reflecting the style for the
>subsystem, this makes it easier for people to identify relevant patches.
>Look at what existing commits in the area you're changing are doing and
>make sure your subject lines visually resemble what they're doing.

Thanks for your comment. I think the subject should be changed to: 
"ASoC: ti: davinci-mcasp: Use pcm_for_each_format() macro".

>There's no need to resubmit to fix this alone.

thanks

cheers,
Min-Hua
