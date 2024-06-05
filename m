Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8479077EC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EEEB60;
	Thu, 13 Jun 2024 18:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EEEB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295062;
	bh=hrPyDWov6xubY4MSU7mruhDQjHQ2rXnYw17/VTNpAHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fv1526TCGTUdAlC6FSHzvqFgfvjPTYJChGbvnOJVHludXDkJg0N/XSEopuQw9uJdY
	 9Sd73gbU7br7AASx9Vi8SJFv6l/1JNb32MMUgehbXojaIArRK88vVZ7x1y7ZAlnJHt
	 mqv3pBOAMR+LqWrecfI/yVdQHUlXr5midT2zUt7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD893F8983A; Thu, 13 Jun 2024 18:03:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28904F89857;
	Thu, 13 Jun 2024 18:03:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F073F802DB; Wed,  5 Jun 2024 19:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9E2EF800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 19:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E2EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=howett-net.20230601.gappssmtp.com
 header.i=@howett-net.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wF601YpM
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dfa65af5367so94433276.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jun 2024 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717607514;
 x=1718212314; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrPyDWov6xubY4MSU7mruhDQjHQ2rXnYw17/VTNpAHE=;
        b=wF601YpMHd8Fos3k5ViA01DAiGZ09oBb60Cn2PKNC3e87uyPrwh/Uhy6ellmfwh+RK
         hYLfB5h85HgQq3cK1DdnUe5cd0/PAstVHcyA7q0RfWYP/pBPm45MOskVL5FSJqr8okWG
         lyL3EzDVZrI/TPGlmP6W8FwPIKJKU6N5CSosxHfCXwPhTXjJqDjWxgh/UiP2JYW9jKBx
         7w64w9yErFDuf9zYiNFx7ReNmo1ER8TUmb97k3BQQODNUVEJYsSM7djtXlgEOpBbl89l
         QQYCgxd/9/fh+jbZx7D5m6vI9QloZuCOdZeLYu/lpN1JwLJ0XzlfRtX20/9t1S8dg9rC
         FqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717607514; x=1718212314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrPyDWov6xubY4MSU7mruhDQjHQ2rXnYw17/VTNpAHE=;
        b=Qff1V0S9Mlqsce4RrppJ1tnuY+pJPq8xIfYYP/oF8ExEJpulEmo8fH15vllxnMceFk
         jDfrzX3w74R2JERVXCGTmXJ9WcY8jG6k+qhy9JmX9j90NFp/gOL44V4HhWem03vsjSvz
         8OUzu3fUzXmbxg1tXVwdONZ0d8SZQXhrlhwfoq46gXL4GiWXyUau1MQdOl8jU6fw6v6c
         ILUYdBS9Rhicxi8YLjOolmol+gdvMYnotK1SO8IneuL6MtlNG61skdEX1k0eGoptLccD
         JoBSSv6iSH5yuZRcJrcmxDzAzkJN/2PdKUjfQ5wt6PJykFgGmbGlLwYnGGmdDpNfepOS
         Nrag==
X-Gm-Message-State: AOJu0YypXDyU0uRCkgpzfz771gDVhDqZxiZWYN/9UOiTDv6I+JLzxi0C
	d3cx65lLsHLTeXsPGAv8uXBo6Ona9kDG7bx6tLB69rZEoXOz0T6Z+X+16HqQS41nnYtAA1GruON
	PVyF94sQ7J6Zb0lLRA6GWJFHJMVZp7tf3kcKo
X-Google-Smtp-Source: 
 AGHT+IGBvm2jqELBqv+grs3Kqq2GulmvVKbrTv3dhK80LZathl1G27hH7Ar+ABN9doS7tCSS5v3HY+xTrJRjEZNzwQk=
X-Received: by 2002:a5b:14d:0:b0:dfa:c421:c7f with SMTP id
 3f1490d57ef6-dfacac47a04mr3320526276.17.1717607513856;
 Wed, 05 Jun 2024 10:11:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
 <2099135f-871a-4d8e-a957-6bc374407fd8@amd.com>
In-Reply-To: <2099135f-871a-4d8e-a957-6bc374407fd8@amd.com>
From: Dustin Howett <dustin@howett.net>
Date: Wed, 5 Jun 2024 12:11:42 -0500
Message-ID: 
 <CA+BfgNLHM66-K6i-mQoAFWdSouSqA8BO=CerMNu2v693HMks_g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Kieran Levin <ktl@frame.work>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: dustin@howett.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6EFSOR5A3DE6EPOKUNFRXCOS5PRW2ZYX
X-Message-ID-Hash: 6EFSOR5A3DE6EPOKUNFRXCOS5PRW2ZYX
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:03:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6EFSOR5A3DE6EPOKUNFRXCOS5PRW2ZYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 5, 2024 at 12:03=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 6/5/2024 12:01, Dustin L. Howett wrote:
> > The Framework Laptop 16 does not have a combination headphone/headset
> > 3.5mm jack; however, applying the pincfg from the Laptop 13 (nid=3D0x19=
)
> > erroneously informs hda that the node is present.
>
> But doesn't the audio card work this way?

I don't believe so - the audio expansion card enumerates as a USB
device that is picked up by snd-usb-audio.
A headset microphone connected to the audio expansion card seems to
continue working properly even with this pinctrl change (synthetically
tested on my Framework Laptop 13, mind you -- it is not a perfect test
:)).

d
