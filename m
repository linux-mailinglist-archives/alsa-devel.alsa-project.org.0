Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0F9DA20C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2024 07:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020C622AD;
	Wed, 27 Nov 2024 07:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020C622AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732688166;
	bh=OGkbtmZImDn3HweExT0jKE0mBrCCcS/nHmbKRJw4NDM=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TdqOU2Lnnyw4VS+FssO2wWAyx6Xl+d5QER0JzyBl0G/iR4u5rhcVcqLjSpoKh5Xcj
	 JGRwEi+s+nXgOyodcmyVKZoU8jwXFoKPZaZRjeGLNfQ3XwRC1GcutHPjaub4OWkas1
	 MnduUBuktR65zLqiB2TltAXJI2fORowQf/nTXKgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE91F805B1; Wed, 27 Nov 2024 07:15:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6ED4F805BF;
	Wed, 27 Nov 2024 07:15:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90157F80236; Wed, 27 Nov 2024 07:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL_A shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A67C6F80134
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 07:15:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67C6F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZCAzFl2E
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de5ec22adso3475001e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Nov 2024 22:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732688058; x=1733292858;
 darn=alsa-project.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQvgi0LXLrpOahla8s3Di7M2RES8PSdpe4s7MQPLm5w=;
        b=ZCAzFl2E0LwKFqlAJAXKC7aLCDL37Z9feUqOwEdFZ7kRc16xki7/ADaP19k5zufldR
         U65GhdV+dhelh9pg2laMsUnb+DwppRAiUOK+bOFi6NgpAv4rFFdYNcbc/CdC/HY2EkYf
         UITHiOhyTo8pQ6Z4hpLbn/FUt9e6gD9b4pUUlXwrXD4iAMC3tR/CapP7TlP/sO6t6VQr
         xLU76q0tIu5+8rERSINMpP2Fogkt3NQp8WtD2ceB+6q/TVgSWmGGg0lhLRawbSkzbdhX
         5tvBAxXRhhJ43A2naqPieZpyzS72Sz1ma2dq/H7rjMv3WC0EJ83MIcuXOXmsRGECO3PG
         fiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732688058; x=1733292858;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQvgi0LXLrpOahla8s3Di7M2RES8PSdpe4s7MQPLm5w=;
        b=VAYkL/ROiRCClK7Ikg3WyJhzQnppP9CE4ZF4+VIaW6eSLMwv7crfTWwzy6Pa/S97Fb
         QsvYMGKhxISObLsYjmsqnfO4cEl5tFS35vhRhI5FcTuQYpM2zNuDOcdNkMB6iOZfeP99
         8f2v+lday/h7chyvTmgAuOhNlAx2GTQWYrcr21iPwMoqXQPgYAO9QezduZ8DQoQEjeDX
         b8fGo2EUrlgUyA/HIutPQFlCHbdXouQ/a+7+OsQzlvHmDPpvqlw7u/8mLVSphANiq7dh
         Xvw/UM5e841R05p4VyUxpYbQHNQ8919oZeV58WknYZJejjDRG2+O00/THX7t+Oj1eJbF
         l+5g==
X-Gm-Message-State: AOJu0YynILy4jVbFBaVciVGkQgTvlX1v+eYEsj6Q7ceIT5NchFxQw64Z
	1XPC7RiWsCqb7giYWZP7lv23Lv3jDZVKWM0feDuNIjWPT0zlH054Ypi+IA==
X-Gm-Gg: ASbGncuNTmMisxKZC1Ozorv8/Txei/Zdenls0V5f5JAWkgy43/yQUbqO2EHVG4ULajU
	RXpVZL9y1N3hZklEU2GvvLsnPVpdS0ShxOfuICDPDH4CrJvdHak+Ca1B9QlwJ3SnF6BeEr2ptow
	uALNUYjuxhmkt7FZEcdmTIswdWH/yZ26rpafJCmrs/FOydsYv0viq0Dl8nA4ofoxF11cq02ngG4
	wvyk3liShOhmgrYENk5rDNHJpFSPnipyBX/wv/5MGzbrjTkzsgrHdENdpPhjSY0mp76WSQ7/bNz
	X1aj5LuRbqx4SR0SwXc39wO4yDAJ
X-Google-Smtp-Source: 
 AGHT+IGG2tBc61GladwBJq8iH//Y4YKYLgN9/I+55STvcKGeA9i0PXoWQhoqHCiaIKCiAjcd5Hiqug==
X-Received: by 2002:a05:6512:b26:b0:53d:edba:d40b with SMTP id
 2adb3069b0e04-53df00dc8d7mr883894e87.33.1732688058127;
        Tue, 26 Nov 2024 22:14:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:3484:bc0:caf7:50ff:fe30:727e?
 ([2a02:8071:3484:bc0:caf7:50ff:fe30:727e])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7b6c30sm9950365e9.10.2024.11.26.22.14.16
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 22:14:17 -0800 (PST)
Message-ID: <eef23463-2a16-4d68-a1c9-cab152e61192@gmail.com>
Date: Wed, 27 Nov 2024 07:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: schorpp <thomas.schorpp@gmail.com>
Subject: [BUG] HDA Intel PCH, HDMI , HDA Intel PCH, ALC886 Digital, no IEC958
 / HDMI output/passthrough to AVR, partly fixed but HDMI AC3 passthrough
To: alsa-devel@alsa-project.org
X-Priority: 4 (Low)
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VXZJFXT7ONMIIZAZEXPZHUHB4YAQDH66
X-Message-ID-Hash: VXZJFXT7ONMIIZAZEXPZHUHB4YAQDH66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXZJFXT7ONMIIZAZEXPZHUHB4YAQDH66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>> 
>>> [BUG] HDA Intel PCH, HDMI , HDA Intel PCH, ALC886 Digital, no IEC958 / HDMI output/passthrough to AVR
>>> 
>>> ALSA versions 1.0.28
>>> 
>>> Kernel Driver versions 3.12.40
> Partly FIXED in Longterm Stable Kernel 4.19.324 and using HDMI DEV 1 instead of 0.
> 
> 2 CH PCM HDMI to AVR works now but AC3/DTS passthrough still not or is not recognized by AVR or some wrong AES setting but iec958 

ALC886 optical toslink AC3/DTS output to AVR works.

> 
> New BUG: No more 5.1 Analog Output on the CM106 USB Box if AC3 stream is selected.

No. Sorry, VDR xineliboutput config error, needs speaker setup 5.1 
instead of pass through.

y
tom

> 
> Your ALSA information is located at http://alsa-project.org/db/?f=5ef8b56450583ba8afbcc705afc02228da4a3072
> 
> y
> tom
> 
>>> 
>>> Hardware:
>>> 
>>> DFI Mainboard MB330-CRM
>>> 
>>> https://www.dfi.com/de/product/index/273#specification
>>> 
>>> Reproducible Always
>>> 
>>> Steps to reproduce and full report:
>>> 
>>> https://www-vdr--portal-de.translate.goog/forum/index.php?thread/136519-gel%C3%B6st-xineliboutput-config-f%C3%BCr-dd-passthrough-zu-avr-und-5-1-surround-headset/&postID=1375883&_x_tr_sl=de&_x_tr_tl=en&_x_tr_hl=de&_x_tr_pto=wapp#post1375883
>> Output of alsa-info.sh is here
>> 
>> http://alsa-project.org/db/?f=fc4734deddd9a92331692bf94b15cf84b7722cd4
>> 
>>> 
>>> Software crosscheck with CM106 USB Soundbox iec958: works OK.
>>> 
>>> Where to start in the drivers source code to fix it?
>>> 
>>> y
>>> tom
>>> 
>>> 

