Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B621A9746
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 10:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9141665;
	Wed, 15 Apr 2020 10:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9141665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586940464;
	bh=JEc+fyTCF+d5fRWowAvnoKdusdrIM6LD/JJ3oxwIGxI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4hDTguqbJm0h9LN3t8kT/AGnjxtpC+D4DAHm9d9okwFex6580N/VokOmsUWx9kOE
	 zmK+pl4Ya8L6smvfRvMic+ltZ+TCo9IzSltH3cYBC1PJgPKW18kFmERynxuHZm3Jxd
	 TaJO5hqh5CpA86kPIIZaEDyW11VPm5R3ZTDqjRN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE51F80115;
	Wed, 15 Apr 2020 10:46:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F123AF80245; Wed, 15 Apr 2020 10:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D20D8F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 10:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20D8F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="X35vk1Zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586940351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEc+fyTCF+d5fRWowAvnoKdusdrIM6LD/JJ3oxwIGxI=;
 b=X35vk1ZzitB9TMzzwV/Y3BY98FWw9ebZSKDStuouED29HQLEVrFNLpq5EryrrEHu8AtnOe
 AIglkJQ3TMe0HBOs+kPpOehc6/kmUnVVCXDIDWbxbzmJOxN6F4s1o/5sYbFLs1mbuMb874
 ieFuLlEbAYUnI5V9PdbkhGRWKT0Bq6Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-vm9Grdh8PQyugpesuA-igg-1; Wed, 15 Apr 2020 04:45:47 -0400
X-MC-Unique: vm9Grdh8PQyugpesuA-igg-1
Received: by mail-wr1-f72.google.com with SMTP id o12so7179226wra.14
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 01:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NI/dtTREm16u/JAyGuOVtfdwJQAgWz7VWENDNQkee8I=;
 b=IB5CwBhzw+HUi37BAz9oCbytLO5snStZ2ZlL3KucwMghwaC8ppptJL5fe636CITWAJ
 nX3geonyPozG1l1VITrWlxHCvPWjvoI/YxwMHtsSbCK1/LFXkQ1zfzseZjx1mQd1RSrG
 rIXdv1AEI96rPJVvV9HPVtMRnXEIyJUrToUB6/N+gcrRtKS3CV0by858YwCHC/TPRrT9
 Mteuh8Knb5LrI0okdRk1RgFEk/Wh89/zIzHMb4iSg0ZJlW8d0Bsjr+eKSHqgqKT+45Xb
 5rowxq919kX3lBPk4AkJqXahTCGAWQf8+B2fQUCQhD0zY7NGCtQUrajndwhP4CG4rkrO
 W2Og==
X-Gm-Message-State: AGi0PuYdX6xYY57+gNB3Uive/404q8LKdrlgW5rj010fkHcsOEP09QmI
 b5+SRWeAUnB1HW64PVk2BVcE2rK/tnQCuJsYpJMO+agODlKY29hoTeNXPjkBD+7P8hRe8hpmh4w
 9cEYXuDDJqAjiJRoftikUMko=
X-Received: by 2002:adf:ea05:: with SMTP id q5mr30143284wrm.180.1586940345264; 
 Wed, 15 Apr 2020 01:45:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKHwMY+TpNc503CCLsTPSz0078Np2R/iLRL1V0m/6FtvaYF/5igwe2mr56s5a5ZntpUiQWfog==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr30143268wrm.180.1586940345090; 
 Wed, 15 Apr 2020 01:45:45 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id h137sm16896839wme.0.2020.04.15.01.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:45:44 -0700 (PDT)
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: youling 257 <youling257@gmail.com>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
 <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
 <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
 <2c1d70d1-6a77-9d06-96df-86c602c1e2e8@redhat.com>
 <CAOzgRdYsy3MZCO4NvuBL_-SDpSyiLrnc5oesfMhqHdeg+zAhgA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <21488b92-601f-9acf-09fd-4537c8eb9b1a@redhat.com>
Date: Wed, 15 Apr 2020 10:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOzgRdYsy3MZCO4NvuBL_-SDpSyiLrnc5oesfMhqHdeg+zAhgA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 4/15/20 10:18 AM, youling 257 wrote:
> 2020-04-15 16:04 GMT+08:00, Hans de Goede <hdegoede@redhat.com>:
>> Hi,
>>
>> On 4/15/20 8:26 AM, youling 257 wrote:
>>> boot enter ubuntu no sound at all if EnableSeq.conf disable all output.
>>> =E2=80=9C The PA should activate HiFi verb only once.=E2=80=9D i don't =
think so.
>>
>> Which version of pulseaudio does the Ubuntu you are using have?
> pulseaudio (1:13.99.1-1ubuntu2) packages.ubuntu.com/focal/pulseaudio

Ah yes then you are likely hitting the bug I was talking about.

Can you please file a bug against Ubuntu for this?

Here is the original Fedora bug for this:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1818883

And here are the patches fixing it:
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/276/

Regards,

Hans

