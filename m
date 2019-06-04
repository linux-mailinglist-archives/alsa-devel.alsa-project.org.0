Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1B3A0B2
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 528201657;
	Sat,  8 Jun 2019 18:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 528201657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012184;
	bh=jZIDsTvx/KiuaqpgFOZVbCrzBsJP0qP/alP6fjp4A30=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=nSrEgYF97u2qcZL5yXSZF/Wo9gjng2fCwPqA6GDw6GoSKhbRFU6VWGW54DO8NmD/v
	 qj+w/hYgPlwQdQ5EQTHUAkhZa9YMCNMgJE1zjEQjyjkXWRMah2DmyDCT7zJilgXPxJ
	 VT/zW5EzqtyorS97eAHCf3hV76ftQKwstZPvbakM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92AA2F89731;
	Sat,  8 Jun 2019 18:39:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E8D2F896F7; Tue,  4 Jun 2019 17:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04204F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 17:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04204F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ft48VaRx"
Received: by mail-wr1-x431.google.com with SMTP id m3so425863wrv.2
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 08:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rJNvsk6x67r3Ua19nmZWJALxxjBo1tA/1LweXhS5qOw=;
 b=ft48VaRxhuyObdLw3Wk5+i+tw3JVwQ3sfouoB5QAq6nqLnVwRoxUo6Lb0IHsL/hx0B
 TwE/OyOzGTHbvbV7ZqgdMltqoxkVj8u5becLC8kYACcmvkgAynKgmcWlf1PAx27uOXcN
 77hUxxuQLjbwNSYSOC021M5sPufrOpyej6g1odZs2sEDeXyDmCE/ki9nWRzYowhsX0Xu
 84ohF3PTjXK8wfa2rn841X0j1tsmzcsJpIO/FvVjsBq2dLVc8yz/qavG6QhvCs3+2ZbV
 6XQSzmhmriMsMoewSVNGEUNYEB2ZM+Q8sEtvesyTW0lTorNEd6RNqNqgvA7/fw2GflrU
 wEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rJNvsk6x67r3Ua19nmZWJALxxjBo1tA/1LweXhS5qOw=;
 b=ebWfyFVWSDZsvzlyXl9HjGN/tBtf2KNJTj4HrlhpfWnX1AivN7cX1K+gicyOFzHMjp
 zJ1IZqZqmcBHLKXO4F4vfQQyoYfY3+849CQRq5Uu+mepGnZAJXOe3yN6wrXIBCGxudz8
 Mo8weB3Pigg69/vIY8VS1+Eq7/FZgKllKEGif2212YhrEWx4rV7AwNW9bavEXGSO+8ME
 9mEGCUy5cyexjbRw22cTei89gQSmMmiPZ7U/hWfFKuAf+OfswgHgfYOmzV+Vd09WicDP
 ADPghDDSG2RCE0p6HqCrHSd4GdV5uLa3ftrv8flthkVcS6erbUnvHD+cAIfUtL27rVFp
 ZQAw==
X-Gm-Message-State: APjAAAWOv5bCEAjUEU5DD2CPji00dU+/RfQZluhw6YZnZkj0dMPIRUrB
 34ldliZX8Pe7wB6LCzs++rTOnoug
X-Google-Smtp-Source: APXvYqx4zZGPS6XxMt13hHUo6ndNnVlwu4M5ftKarw7xNDLtPCp68ZTnRRGepyZU2+MalgR0LCx8mA==
X-Received: by 2002:adf:e843:: with SMTP id d3mr11497019wrn.249.1559661307150; 
 Tue, 04 Jun 2019 08:15:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l1sm6843852wmg.13.2019.06.04.08.15.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 08:15:06 -0700 (PDT)
To: "Ser, Simon" <simon.ser@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <sunpeng.li@amd.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
Date: Tue, 4 Jun 2019 17:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Subject: Re: [alsa-devel] Linking ALSA playback devices and DRM connectors
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am 04.06.19 um 17:05 schrieb Ser, Simon:
> Hi,
>
> I'm trying to link ALSA playback devices and DRM connectors. In other
> words, I'd like to be able to know which ALSA device I should open to
> play audio on a given connector.
>
> Unfortunately, I haven't found a way to extract this information. I
> know /proc/asound/cardN/eld* expose the EDID-like data. However by
> looking at the ALSA API (also: aplay -l and -L) I can't find a way to
> figure out which PCM device maps to the ELD.
>
> Am I missing something?

Is that actually fixed on all hardware? Or do we maybe have some 
hardware with only one audio codec and multiple connectors?

>
> If not, what would be the best way to expose this?
>
> - A symlink to the ALSA audio PCM device in
>    /sys/class/drm/cardN-CONNECTOR?
> - A symlink to the DRM connector in /sys/class/sound/pcm*?

If it's fixed than those two options sound sane to me.

> - A DRM connector property?

If it's configurable than that sounds like a good option to me.

Anyway added our DC team, stuff like that is their construction site.

Regards,
Christian.

> - Somehow expose the connector name via the ALSA API?
> - Expose the connector EDID via ALSA?
> - Other ideas?
>
> Thanks!
>
> Simon Ser
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
