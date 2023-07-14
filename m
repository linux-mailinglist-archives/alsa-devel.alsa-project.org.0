Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAF752ED9
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 03:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DCEEA4B;
	Fri, 14 Jul 2023 03:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DCEEA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689299087;
	bh=uVlnVdvBMyrneLBkPVLOzcvO1ebUvvSwq/qFA5mLTzE=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MaCZK9xvDPa5C/PdzggiLn5OvUk/lW63DD2bvoxjySs9ms9H36dCtD3yu5cvv4KRw
	 axl4b78LCXF7m1eoIERSgPDmdXEbvQ0ihBi6GHZ9H5M9/2yN+Z0B10v3OQ8XkZNdc+
	 STMaEbILm6zdkObYSrMVc+GrYnokcnrGmksItvgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF2E3F80535; Fri, 14 Jul 2023 03:43:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EB9F80236;
	Fri, 14 Jul 2023 03:43:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B41ACF80249; Fri, 14 Jul 2023 03:43:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17DAEF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 03:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DAEF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=KjFOliLM
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-ca9804dc6e4so1969132276.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 18:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689299025; x=1691891025;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O4nZZvplUAd7zOR7HZivWtgB+UmVmrs7GU3i83UKQzw=;
        b=KjFOliLMupRxep34PkcDhFFvWv+R9qByNt/wqzv+g566G4DiJkdJpGCHjMzCsQ3U0b
         FcnU7qcduhENrXJJOQmYc8JbMqVEDnsv2vuUAJcATm2kidWtf/+nEISIFW4IeLPbsAD/
         Ihe2QhOSe4fKRzsPH5r1uUSlVdEq7qZJQSdkCTQyyJHFyaXlwxvNEor8Ob7nGYAMifM5
         K3hEAJ9cwEjow43RDmUILlju74x/FUKBPURBOrCJXfKMtqpyJ9cKDCFxizfm0wgoWjoz
         CXcFvY1nJiyO/7o9Qkqt5gLuhDws/bxDRrS76W8vcAeqsAnm0EdhgX/vTnk+y9NtT88x
         0E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689299025; x=1691891025;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O4nZZvplUAd7zOR7HZivWtgB+UmVmrs7GU3i83UKQzw=;
        b=JFkdBXbxhSrmpob16CIGu3UkL3t3CJGJcjnO67Yd5pX+53nYYF470J4isskxjfRbHx
         2qTtk4FuJjtr7X6zfYNDywh9BNrqmNT60jXOQfe+lT4DQwdpPEj9/co7tquzmJU8xq4I
         6rC29al8Un/NXvmI29N6LPkAPe7juNgW8lLRv+oR7NDS24fV6hGhD519ASueGd59jHGQ
         s54w8qedbWjP4rR/v7cv75Ff7hxyqDq90R0OQL2ALwj9VeMizcfb8FYrXaXuUVEG7M9h
         wBRgiYQvbeWEN7hsvuANT8ClBIlC2oCku66MgLVtXl4IaT3HTAG+pGjSlGokWuDHtAOj
         lsug==
X-Gm-Message-State: ABy/qLaSTV1W7lZqoGu+J4TWKYZabAOSpWn9AA7QTZdIyKa5vvso45Jy
	O4C2cZS92PghW/h00n8Ix4xDRfGUX6jARRNVPgE=
X-Google-Smtp-Source: 
 APBJJlG8Ertp7kNbueOzeCo7sD+CsrwGpZiOWn6rnnoDwAfu/EYsoCI6Rx4oIyLupzWIWx3I8SqwWKSYX3ARQVP0PNk=
X-Received: by 2002:a25:d885:0:b0:c3d:eff4:1c39 with SMTP id
 p127-20020a25d885000000b00c3deff41c39mr1696672ybg.12.1689299024786; Thu, 13
 Jul 2023 18:43:44 -0700 (PDT)
MIME-Version: 1.0
From: Zhu Ning <zhuning0077@gmail.com>
Date: Fri, 14 Jul 2023 09:43:33 +0800
Message-ID: 
 <CANPLYpDwd8EgL=DeqnyePaic27w-PX3hQv4St-9_thpo7SmLwQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: es8326: Fix power-up sequence
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
	yangxiaohua <yangxiaohua@everest-semi.com>, Ning Zhu <zhuning0077@gmail.com>,
	Zhu Ning <zhuning@everest-semi.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: VDJ4Z2XFBIGC4OVTIQA3HEDBQYLXNPQO
X-Message-ID-Hash: VDJ4Z2XFBIGC4OVTIQA3HEDBQYLXNPQO
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VDJ4Z2XFBIGC4OVTIQA3HEDBQYLXNPQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > > This looks wrong, you're resyncing the cache and then start resetting
> > > registers?  It feels like the ordering is off here, and some of this
> > > reset sequence might want to be done with the cache bypassed.  Are you
> > > sure that there's no corruption of user visible state resulting from the
> > > power up sequence, especially around the HP driver?
>
> > Basically the chip runs through the start-up sequence every time in
> > the resume function.
> > Will move the reset sequence to es8326_suspend
>
> That's not going to overwrite any user visible settings?

Registers written here are internal bias/vmid which should be fixed. User
settings like alc and volume won't be overwritten here.
