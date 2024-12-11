Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7F9ECB53
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E4AF2C2D;
	Wed, 11 Dec 2024 12:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E4AF2C2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916905;
	bh=Gri998DLOiEDYK4hbdpUrZQng2GZm/AcgRTGKsy0hgU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LjTO54ep6Qfsnns36oMSUeSdNzWeL4GwnpaOnz5hOFYTRJlMBqd5/tGYEp2g3d7yF
	 2eTsHYVyCXMg6EP1PjnnfN8RMQL09L6oG78PreodmKU6qoEQwNkNjzcQ85pflhVSp7
	 5QaGssOKVZlVt6RaohbD7WmGqK+6ysCvydXTjgO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8548F80635; Wed, 11 Dec 2024 12:28:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7705AF897B1;
	Wed, 11 Dec 2024 12:28:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2804F80617; Wed, 11 Dec 2024 12:28:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D9CBF80616
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 12:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D9CBF80616
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com
 header.i=@fireburn-co-uk.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=zYys6uHD
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844ce6d0716so43148039f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Dec 2024 03:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733916506;
 x=1734521306; darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gri998DLOiEDYK4hbdpUrZQng2GZm/AcgRTGKsy0hgU=;
        b=zYys6uHDj8LyQnYqPGbBvob9N2UTy3bvtbCNgNffJSvVQvIWapbBeou7jomIIfBdiO
         ZWi92eFbBOFxlyKxcPWinq+pUvVeb8ZXoNVFji/J6nJxkkYnKkBEf11HvfS/SbA7x9BQ
         iaaVx+ToCtx5g75ibC4iJRvowLL0untGr9bER+JoYuKlrZ6SAM9PTPVGNkt+5vHlGfx6
         tRUni4BWvao2aTDa8an7FyE8hmhfXM5SZL9QbsV8MJhnPh8gys200cNZHQc6FllcWj00
         G0BLnKL9TB2/oNPtEpBAqvmkGLs0VpEzFYtI9zcy6VrVg3BsI6Z5UuECoxtcxz2zRilm
         AvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916506; x=1734521306;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gri998DLOiEDYK4hbdpUrZQng2GZm/AcgRTGKsy0hgU=;
        b=K9LZfO2gzyv1rM5TuPoE7bqqEl2PlgSe7iwP9dF60FsFnX2FPtvTEEnz9Lue8CYwfh
         cDSD3FsKMT75hW2uyjxPHiRX6ULOyk/AOo6xGYyR85+VYx+f405j5noUegGcieBvT4kY
         6r+p9lCWAdxIrgaDKdihelQ/8aOD0aFH3cKD3JXS/VgF8WZsV+WRSq0mJAZrRJVbU/Yd
         JUH8mrshOWwW/Y8pOJqauXSEuHcKwbchHE4cWOC03/vLxIRyWeIt+PXIWs1CxP+rKZNc
         eOdcWJQtbZsQXBFXnU8bDS03othUOX9deAkIeQNlDel5BuwCFr8DNLB5LuiOaUXsyYdh
         uJHg==
X-Gm-Message-State: AOJu0YzFAi9hsGgNm+8h1WQG7N4FpUZebAgcBCHA7DTsGpoR/zUwVcDU
	FKv2RkdrstqI6LR1ma6TsQqsl9/gOtmStz/2LidFDSc44wvt/8AoEmBHn2sdUdRNg0nrmMzP0MY
	YYaSc1F+8G3oUi2iHMt2CmFHpGZ4KjlN5mwsfvX6f40EYLd62FK4S
X-Gm-Gg: ASbGnctGA0rC0AyZdYADh0n+RGAkuhVhaKmV3UNP5Wp8kKgQJ3pn9CM2qnlZQx5fmzx
	Nil4JoixeBQJrqwXtYeyEAVfcTAxwqOKwUTN38efvzmsCZGpdJTqWSOQL/iwT7Lo5hZ4oPg==
X-Google-Smtp-Source: 
 AGHT+IGuULJtPxz5QYZMZX6hwgzdsEZpoUVDw6eBwgz/oyGbpW2xSkim8XZFkyP5S3F51bVfSW6pnozif+uCVPlwDjc=
X-Received: by 2002:a05:6a20:a11b:b0:1e1:bf3d:a18a with SMTP id
 adf61e73a8af0-1e1c138ab36mr4843973637.32.1733913320318; Wed, 11 Dec 2024
 02:35:20 -0800 (PST)
MIME-Version: 1.0
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 11 Dec 2024 10:35:09 +0000
Message-ID: 
 <CAHbf0-HuzfubZiLBsPhc24HrmS54sAsoDd_DVHPj+nTFqtuFAQ@mail.gmail.com>
Subject: Re: [PATCH v2 30/37] ALSA: seq: Automatic conversion of UMP events
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: XVU24OI65X2SGZNI2WF73NCADA3W65XB
X-Message-ID-Hash: XVU24OI65X2SGZNI2WF73NCADA3W65XB
X-MailFrom: mike@fireburn.co.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVU24OI65X2SGZNI2WF73NCADA3W65XB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi

I'm not sure when this first appeared but I see the following when
compiling/linking with Clang 19.1.5

vmlinux.o: warning: objtool: cc_ev_to_ump_midi2+0x5a5: return with
modified stack frame

This is the only commit I can see that has cc_ev_to_ump_midi2 in it

Cheers

Mike
