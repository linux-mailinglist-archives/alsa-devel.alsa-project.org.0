Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFC45D8C0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 12:06:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6208D1891;
	Thu, 25 Nov 2021 12:05:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6208D1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637838371;
	bh=3+5jwHZvudHojAHNLl8zxRL6lLP2Jrr9H959gQx1ek8=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hGU8JRANujIWSY36nQd9Fu/uP2LIvIRXcWY2PH/S+4RFfPumPaJsK8B+o9Wt0wa1u
	 mICmgtMBp9wqE1OozPCZWwDTVqtN9vc6pVdvAynV6llJtOxmPRoezA2iveRnxeJucS
	 /+q46LClQOCO+tWrlJAP7b3QVkZzKSUrL6oqEYaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6751F804AB;
	Thu, 25 Nov 2021 12:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC96CF8049E; Thu, 25 Nov 2021 12:04:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5F0F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 12:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5F0F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="QHIVzc3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637838286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3+5jwHZvudHojAHNLl8zxRL6lLP2Jrr9H959gQx1ek8=;
 b=QHIVzc3ewpSwri21SIVxbZ010LyvZkXcHEE20G41lxwRpkQxigH4LzN5qBYtFWkm7Ou714
 CQKCcjFOJDmc21aaCMRIiMFc2s7CQNI+FGAXS+zmurcbzcqRm7nw/iMGaajM1G7oHtZY3X
 04qY/pdedGBlJ284oVGAc+mMFGoNkOY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-521-LkBepe_5MEKbXkXxlPLPqQ-1; Thu, 25 Nov 2021 06:04:44 -0500
X-MC-Unique: LkBepe_5MEKbXkXxlPLPqQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so5220150edr.1
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 03:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=3+5jwHZvudHojAHNLl8zxRL6lLP2Jrr9H959gQx1ek8=;
 b=r58nzF6/Wd/M1vunPNzKB1sA4RvqvyFNnDkQdN2ILSlHMczBz/U3RTGwgFXMVpVnLT
 0+QrBi3cj+8gg9stU/NDuv1h8Y16JpJhi0mDcLiT0AixmwLoyHDGAhYp3cU8zzMZRFcV
 VZHWfO8MrDZxKyFxkzFESXXTRhiodx9vWnRdU4CzX8wAqhbslVPUV47qcbrf/OsxrfeW
 r/6dKREw4G7gaPWGDaHf4vz4GixCmAwSgR6cZPPDpNmH36sV7fWOyvMrfDAX4+jK/obo
 NM81V9zIq9llxq2mu7X+VqMYjohdxy21V91dZoZZLevQG5cvGWvkMWu488xEKkTFl2rB
 AsMw==
X-Gm-Message-State: AOAM5318UTm/TSbEoKZl2x/Lrnh9YuCZbF71kH0W9R20PEOHY3zF8zDA
 bgKyZSytdL2UhW9DDORLbW/WftyvyWUxD9Wi6mh0T4Gs1PEDqQBmOBtffvw9gXrtT+FmWPn38oj
 PQ2S0XRJzEN/mo4fCLSCUsaZSM6UM+97Cqk2HtmMSHX8sYymHeAtscshXjPHIDKIQ9kHryFfIxe
 8=
X-Received: by 2002:a17:907:7da0:: with SMTP id
 oz32mr30157424ejc.176.1637838283048; 
 Thu, 25 Nov 2021 03:04:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwWnP3XJ5KJDBt1CB3XpV8Rnz0n0tlCnxxhMNoFtROD4hGKI5rTuv3A4saZIoefy5tCu1u1A==
X-Received: by 2002:a17:907:7da0:: with SMTP id
 oz32mr30157387ejc.176.1637838282843; 
 Thu, 25 Nov 2021 03:04:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id h10sm1698624edr.95.2021.11.25.03.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 03:04:42 -0800 (PST)
Message-ID: <cf7dd2f0-512c-1b8c-efb1-53f79ddfb41e@redhat.com>
Date: Thu, 25 Nov 2021 12:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Logitech Z10 USB speakers need a volume change before audio works
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

I've a set of Logitech Z10 USB speakers, which act as a USB soundcard.

They have this weird glitch where after turning off my PC (and their
power-supply as well) and then turning things back on, they are silent
until I change the PCM volume control for the speakers inside
alsa-mixer.

It seems like they need some "set-volume" command to be send over the
USB bus to unmute them when initially powered-up / turned on.

Is their some existing usb-audio quirk which I can try to work around this?

Regards,

Hans

