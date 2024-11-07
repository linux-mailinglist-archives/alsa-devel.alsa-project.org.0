Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D29C0423
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 12:33:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED75FEAB;
	Thu,  7 Nov 2024 12:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED75FEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730979222;
	bh=eGIe0oFw+GHv8xOkX6MBCbhVwuwBtD/s5khyAN8QmvM=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Vra8DSblZ+bjZ8TenxRHXY9Q3jKWdGeDtXFjTEi1EigwQKSv3qYMILh3XarfKHEyR
	 CBMND3BSWXzCL7lYScYbMFGW5c3xdkpNPjnP6tatAeUFan7Ql+VjnN0W0FIgSJVZjw
	 27T1jP9KqzUnqRsuHtUpTxYEc9u6b1NMTIJO79yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4CE8F80578; Thu,  7 Nov 2024 12:33:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C47F805B1;
	Thu,  7 Nov 2024 12:33:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6251AF8013D; Thu,  7 Nov 2024 12:33:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL_A shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 699F2F800C8
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 12:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 699F2F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PD84/w/r
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso139489466b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Nov 2024 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730979177; x=1731583977;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM3xPbYb8EGb2aB7pJUZJEs3h9UVOlus31UR+lG9I+U=;
        b=PD84/w/rH9X0WHJ1KjW+nlRZWh4/7AbXtYNYpLbqpZbnSc86pX2fn/njP0dy3RzSY7
         tl0pJyG0l6EinPV9EyZyK2Fy6GUXXGekRJSisbftNWeROQSZZaTA6Ivrdr3A8HAb4r/D
         5OS9+CaXhdcdz/J8LniKK7/sufxujlgigLExFSsTEopcL1vCkhgiMIgWIc5PvwCEVpky
         YAz2+f7NQ1kxMlPmgqQyFIoAAyysojc4bCzL0jp5DZ1lrXa9f5Ez2d77s/COfoIFi308
         S1RDNbilDgiSLzxMeRJqoSQwfJ3w8FIYuWDpUedPBjOu7/ex0VVhAif6HJD9o3u06lte
         o9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979177; x=1731583977;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vM3xPbYb8EGb2aB7pJUZJEs3h9UVOlus31UR+lG9I+U=;
        b=N8E13+jN5kswqqy3BjfGxS3Otk0uxmWWd9RJVxYZZqwywQ/SNaHqm0Wj1Q/H7dtR4y
         O/LGyI25YQMImTYtSj8u0uuiv9hEKrrP/yOUkkY4Iz/ON6ya9N6z8/m8OzWK1IZ1+InN
         NpvyzLlg+kRq53QcUQcOVNVa/dwR3mLdfwbvLzrCjg5PtrJ6u3Mp9KSh5vZVLj85ZBWU
         Zd6IvUpiy2wA4nGB6/yQvIOQsciVENgpS0s/CujJlYswk30FEsGuMJcCsl0uG7IMmpyq
         AuIGIsCzD282W0yCjU0d/1jY5Fe5f5Mo9yvv4AfnnpYHseyjBNp+85FisKbKcM9ca8Qv
         pnow==
X-Gm-Message-State: AOJu0YwO7Ws6ii6EgHTC2g/RWqam1zKUVN43BizK5OFscFrhqElWFZ3w
	uPWEnjy2SZfoyr+us92NqOTHgcDT8G0QToIpJWRBgP4WbxmulVnjPjZujeHv
X-Google-Smtp-Source: 
 AGHT+IHX2eIsXcf/wPyVmntb16jVYp7CGnx7Q87Voui/QIP4T3LqsqsMF+HEj75LtaVxesPx0Sq3Sw==
X-Received: by 2002:a17:907:86a2:b0:a9a:134:9887 with SMTP id
 a640c23a62f3a-a9de6167ad2mr4018428966b.41.1730979177074;
        Thu, 07 Nov 2024 03:32:57 -0800 (PST)
Received: from ?IPV6:2a02:8071:3484:bc0:caf7:50ff:fe30:727e?
 ([2a02:8071:3484:bc0:caf7:50ff:fe30:727e])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5234sm81279266b.124.2024.11.07.03.32.56
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 03:32:56 -0800 (PST)
Message-ID: <820966f0-7ee4-4922-b458-3855eb9721fc@gmail.com>
Date: Thu, 7 Nov 2024 12:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: alsa-devel@alsa-project.org
From: schorpp <thomas.schorpp@gmail.com>
Subject: [BUG] HDA Intel PCH, HDMI , HDA Intel PCH, ALC886 Digital, no IEC958
 / HDMI output/passthrough to AVR
X-Priority: 4 (Low)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NXTG6SO4O3GV46DSVIE5J5Y3OLQAT4QK
X-Message-ID-Hash: NXTG6SO4O3GV46DSVIE5J5Y3OLQAT4QK
X-MailFrom: thomas.schorpp@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXTG6SO4O3GV46DSVIE5J5Y3OLQAT4QK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[BUG] HDA Intel PCH, HDMI , HDA Intel PCH, ALC886 Digital, no IEC958 / 
HDMI output/passthrough to AVR

ALSA versions 1.0.25...current

Kernel Driver versions 3.12.40...6.x

Hardware:

DFI Mainboard MB330-CRM

https://www.dfi.com/de/product/index/273#specification

Reproducible Always

Steps to reproduce and full report:

https://www-vdr--portal-de.translate.goog/forum/index.php?thread/136519-gel%C3%B6st-xineliboutput-config-f%C3%BCr-dd-passthrough-zu-avr-und-5-1-surround-headset/&postID=1375883&_x_tr_sl=de&_x_tr_tl=en&_x_tr_hl=de&_x_tr_pto=wapp#post1375883

Software crosscheck with CM106 USB Soundbox iec958: works OK.

Where to start in the drivers source code to fix it?

y
tom


