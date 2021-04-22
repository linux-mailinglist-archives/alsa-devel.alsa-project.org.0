Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6439368362
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 17:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66048167E;
	Thu, 22 Apr 2021 17:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66048167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619105633;
	bh=22wL5b8rKuFiL1bcvb7+yb74U34obr0IfRBG2fRm958=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEjqgYXN08dbN5q//WPEQCwZxWZytbgU/4Vr/57BU9kVqFT3UKNQ9w5u46fpYWW1G
	 OelG8KcCbTJVDACBVrMzBTQvI4qrwGAI0n5pxDEIKqmfm1gfZJjrLIC3dSkamaYPv6
	 /F7y9Hl5zF4HzxgRf5Y4sl3hAZfHpXe2N/g9M/1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C0AF800AE;
	Thu, 22 Apr 2021 17:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53681F80059; Thu, 22 Apr 2021 17:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0849F80059
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 17:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0849F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B8okTUE1"
Received: by mail-ej1-x634.google.com with SMTP id r20so19667551ejo.11
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D3cR5qI11gyjNwBlLXlPk+oQNoEGZ/vDH6GERz9bWXA=;
 b=B8okTUE1VIuw9JaW/l6MedMLx+Zmx/BFFu6Z3QlsxqcpFTD0IWHzkZhX4lxbbKGouE
 uszc1txaXYfUVtMujLhSv5oIr883thupAuSJygodCw0NQgGf3Lk+Yj868pWTN+z3Gv86
 Nj8Dtq/uvO8cmbAp0Cv1/A3NF0Yprk1MeSj/Zk43qCYTynoo/YXNN2iLOeUxm2qOTAFD
 gY4udZtoAxYQlqzL2SWkJMwsYugajm/bhNpVIKPLl8YXp/0ZgD3hITY1JMQmaWowgbK8
 7U/i+f5d7kTaDTQ8pgpAy2eax8WYOxchwMGtnqHuQyjaLD+XUnntTycptchGWVBAyBSc
 JhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3cR5qI11gyjNwBlLXlPk+oQNoEGZ/vDH6GERz9bWXA=;
 b=uCDTrLDn6ce9D+8gCwU8xaHXMtZsSMjoapkXH42H31EdSfuRIP074Wa40pSBh0VYE+
 MHzNX1P8bV1nyjabObuu5ESX+wHa5CbPUQaOhQWsC1VRAmOoIpupppfqV+lJOCv4djl9
 q12mt60WA30lASrrrkzyHj9vl2PiqkhAWJXDa3AEv9EaLQhZWMPdzADqljOWbqHShL7a
 lMKq9MRJG4QU0wgiO6IGiIy1pmg/nI/hPB1ud4PF9h6Q8ZXk/sCQgoYQmXXreW3bc8Fu
 Mh1qEBJBjwsZ9griRsXaHAaSjiPbV4ayj846JNO8sNOg2QjoPXzDafvZTf98UdvAVtfo
 4qhQ==
X-Gm-Message-State: AOAM5333WTnFRplD0HVVO3Cvot0QtqxyC1aCOUBmoGTqLeAlpqWkJ/04
 0SkQPAe3tOjIT5gdftEob3D5PUAX0WtheutcVK/vaa4TNas=
X-Google-Smtp-Source: ABdhPJwkZndsmAqJxbpGmt7VaaqBpHIXe9hA0vYT1sR5v/IcI1/xJ9rgXBhwcjstKChvN2y5foxxYbUoOHfHXb1lNNE=
X-Received: by 2002:a17:906:81d5:: with SMTP id
 e21mr4052727ejx.134.1619105527114; 
 Thu, 22 Apr 2021 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
 <12753665.uLZWGnKmhe@kam-desktop>
In-Reply-To: <12753665.uLZWGnKmhe@kam-desktop>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 22 Apr 2021 10:31:55 -0500
Message-ID: <CAOsVg8q_niB1EA7t8k=Nmtvq+=OeUBTqn=CrN8WyyQQKSr_0aQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: "Keith A. Milner" <maillist@superlative.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Does it help if you use this line in "static const struct
snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {":
        IMPLICIT_FB_BOTH_DEV(0x0582, 0x0109, 0x05, 0x01), /* BOSS eBand
JS-8 */

For it, I attempted using your specific 0x05 ASYNC OUT endpoint address
this time.

I may be wrong, but I think Takashi's current patches are reading endpoint
addresses directly from the hardware, and if so your BOSS eBand JS-8 would
work if that line does.

Takashi would know best, though, so I'm bracing myself for any corrections.
