Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755132DC9C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 22:52:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4DC61849;
	Thu,  4 Mar 2021 22:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4DC61849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614894749;
	bh=L6MG9ufQrIst/8ngYkjH5eG0Wm0V4X2NkwxyT0Tv2hs=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2kjdpwVBrXLU3ndAncKjqde4EGf0kjFvfIeReYhrDpO4yuSOZDDWAfkBPLqLPvMR
	 v2ZHiYk4EDJODVsxpEVuKXTLETdJgC9NScPuqjIJqcdVNiKU8/Mr7tzFaBijpp9Eh6
	 hasBdbLvLBBzwA4XF9FuDlwS8EOAgoSXXtw26Dxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E33F800ED;
	Thu,  4 Mar 2021 22:50:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 332FBF80227; Thu,  4 Mar 2021 22:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C32F80227
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 22:50:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C32F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KRxK2PVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614894650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aXTXnA3KIRWAGt96qAbcM5wZ62FXqSv3tAUZlLTOBQ=;
 b=KRxK2PVYLc+DiYG8wOXEO/EzRNLSzlnIasNuj/HgaWa13YCuL7XaXFo/4e+8P+N7dlHdz1
 D7gacXnIslkxaCS1OANSmqGG9rqfrq01y33wkIk2zM4HkNp+KaKstHisoJ/JO0nS3cQDNH
 46kBLaGFDyrG/9Ihb7N/D6f08bkytAI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-naYVDUPWNGOh8XmhqaU-8w-1; Thu, 04 Mar 2021 16:50:45 -0500
X-MC-Unique: naYVDUPWNGOh8XmhqaU-8w-1
Received: by mail-ej1-f71.google.com with SMTP id r26so7225700eja.22
 for <alsa-devel@alsa-project.org>; Thu, 04 Mar 2021 13:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3aXTXnA3KIRWAGt96qAbcM5wZ62FXqSv3tAUZlLTOBQ=;
 b=Qbx7ZUyX1ZT5/NJJdlvX6gLGPYU40jrkSzJKIcOu5wvNDF998xgn5LARxqS+YA/Rgo
 Pa1BZrZhWUH4eIcDdbrNY5epsyXut4MU3wy9eJeSdfiept2yT6wOYt192C/ZnkhjZD40
 lwSyOTgWtsbJkGMBucf+S2oPDt62zPmrYFz0Ue+LhMajJxCTh1qaya9H4wHpw11xFVK9
 fmj5WnwuIhj/RFbilsp3dLibQHgNhGe7O0NcxWUsUzNPhhQqy5h2GY/JdxLJghhY9Lsk
 eRiB/kCPMIpNK0COUtif8fRmD0BGRlFJFD2WNpx95WPpa6/jHAzxr/sAFMfVsg6Bssp+
 vjag==
X-Gm-Message-State: AOAM530Xc/bXgU8oWHcFemQxhSH1caqq3HS6LFtLfogHfb8ulc3g6Ixa
 Y3y8c4mPFwwaDQybx9Nhu2M1HFjpdFIFDs0MbruukY6l7zCjkoASmmebVl34OMi+BiIJVezi34f
 hkAaYSdJdKFRi3bKDdXtzLevHO20zW+gulhHrwrOHuU6ii/vE8+2lM1XhOSSoJ9n1k0I2JJZsJ+
 s=
X-Received: by 2002:a17:906:3fc3:: with SMTP id
 k3mr6494733ejj.522.1614894644542; 
 Thu, 04 Mar 2021 13:50:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeF6ANxRhvEJD4JYfWpRAKmqnCx+i1R+avRYN+pLHSA4e/Lktg43x/w6r2DeGhHYW+W17n0g==
X-Received: by 2002:a17:906:3fc3:: with SMTP id
 k3mr6494724ejj.522.1614894644364; 
 Thu, 04 Mar 2021 13:50:44 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id t6sm386669edq.48.2021.03.04.13.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 13:50:43 -0800 (PST)
Subject: Re: [PATCH alsa-lib v2 0/3] mixer: Volume control fixes
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210228161304.241288-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d879513b-7047-8e95-d037-cd45669bb0b3@redhat.com>
Date: Thu, 4 Mar 2021 22:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228161304.241288-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi All,

On 2/28/21 5:13 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my series of alsa-lib volume-control fixes which I wrote
> while working on adding hw-volume control to UCM profiles for various
> x86 ASoC setups.
> 
> New in v2 is adding an extra entry to the capture_volume_names array
> for the "ADC PGA Gain Volume" control used in the es8316 codec driver
> in patch 3/3.
> 
> Note that patch 3/3 is not strictly necessary to make hw-volume control
> work. At least the PA hw-vol-control code does not care if the controls
> are wronly marked as global-volume-controls instead of
> capture-volume-controls. I mostly wrote patch 3/3 because for
> correctness reasons, so if it is deemed controversial we can drop it.

Self-nack, I have some plans to make this more generic and I found
another set of control-names which need special handling (which is
the motivation to make the exception mechanism more generic).

I will post a new version sometime this weekend.

Regards,

Hans

