Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D77455481FA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 10:47:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67144181F;
	Mon, 13 Jun 2022 10:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67144181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655110065;
	bh=WDdxPYfDPDVNWmCVfj+MxmToaXeuP5dXhUF7ZoYA9BQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zc8KVOlF/Ue1nWENNbrUtX14gwlnWL7dlRSGhVTsAsyd6triSSqiSN3ikM9SUcE/Y
	 lmhARk8O9K/dr1jiURBbA5Tv2Uz1s6u+wYHtSDGRvaAH1XZW7AS4qkmgRWEary3jbv
	 PIne6IBLsIbK0FY2berMG46LEg/ZA8Jnw2p2xD5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C95D4F804CC;
	Mon, 13 Jun 2022 10:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 527A5F804C1; Mon, 13 Jun 2022 10:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50DA3F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 10:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DA3F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GRDTYrLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655109996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cS8G57sFhFp1YHMWkjR4hgEVKmHLztM42dadVSCcBBo=;
 b=GRDTYrLOf8ar1KF6jQGdiBDjuEV0iGL3YC//2pKzn+6v+gPlOCKidP3a0+tD1+AehKWf/V
 wkNrDJBstFpyXNZy/KrFwdbpBxHwczhg0/Rcb/CP0GmJiWY3MaonRM+aSSTwsq5JYr3+WV
 n4O3OEuORLf6gHfc+8Wu0ViAUPf5Bbw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-efP0xqU9MemfHVBJ0-aYMg-1; Mon, 13 Jun 2022 04:46:31 -0400
X-MC-Unique: efP0xqU9MemfHVBJ0-aYMg-1
Received: by mail-ej1-f71.google.com with SMTP id
 gr1-20020a170906e2c100b006fefea3ec0aso1509083ejb.14
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 01:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cS8G57sFhFp1YHMWkjR4hgEVKmHLztM42dadVSCcBBo=;
 b=ww7jA/PWV33yzH7xGZiGJ0+35mu1AycbwH2XzbmW4XBOlxK//EW/0xlEuWjnKuDJ3+
 Otjj1EsGGAJe/E64wmsQwYygIb9vcN/xNbPZIXi/Svf2bm34NDXfbj4Fize13U7PEjLC
 2xvzoyKys1Zkwer8UGAluUQPDrjEvDneY7oTIhhP5W5eMzdsmgRi7jNV2QEorjPGKtYK
 DtxWLbis8hQvvRT6h6crU+BDGLrVtVmTnGzSLN/htnueCwWNZ/4wYb+SJyE5IXzwTyuG
 hJ7emAVWeIhAYFD682X+WqMsOhk88Cqrknv4lOemrh848MjxKZeAZLIIn0XZU3XH/J2y
 9owA==
X-Gm-Message-State: AOAM532wQK3ToVijgtDo/TBTc+93fAbLjaGxzYY8Al0TBuJRI+bEB66J
 5Wru7fcUHwZroYeF/YoS6tFmadFokDADp3wPSPmol1OITfvi37OE49Sf2waTgEBR3id8YXViOmw
 mjRYhEq4TPc1IH6uHbnjv4U4=
X-Received: by 2002:aa7:d143:0:b0:42d:ca9c:aa76 with SMTP id
 r3-20020aa7d143000000b0042dca9caa76mr65166711edo.163.1655109990126; 
 Mon, 13 Jun 2022 01:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynKfM05niysYqRnGnJhh9hGo+CwtESeSRPe0V1/WJphMLu45sbwYXwXFaw5jkK/YSDmbKOvA==
X-Received: by 2002:aa7:d143:0:b0:42d:ca9c:aa76 with SMTP id
 r3-20020aa7d143000000b0042dca9caa76mr65166697edo.163.1655109989974; 
 Mon, 13 Jun 2022 01:46:29 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a170906c19200b006fecf74395bsm3566682ejz.8.2022.06.13.01.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:29 -0700 (PDT)
Message-ID: <5ca147d1-3a2d-60c6-c491-8aa844183222@redhat.com>
Date: Mon, 13 Jun 2022 10:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: How to add 2 different SND_PCI_QUIRKs for 2 models with the same
 PCI subsys vend + prod ids?
To: Takashi Iwai <tiwai@suse.de>
References: <7e3aa97a-77c9-3367-8929-a86049286d75@redhat.com>
 <87k09l7ys7.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87k09l7ys7.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "nikitashvets@flyium.com" <nikitashvets@flyium.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 6/13/22 10:28, Takashi Iwai wrote:
> On Mon, 13 Jun 2022 09:54:47 +0200,
> Hans de Goede wrote:
>>
>> Hi All,
>>
>> There is a problem with the sound on the Lenovo Yoga Duet 7 13IML05, which
>> requires a SND_PCI_QUIRK to fix. But there already is an existing quirk
>> for another Lenovo laptop using the same  PCI subsys vend + prod ids.
>>
>> For more details see:
>> https://wiki.archlinux.org/title/Lenovo_Yoga_Duet_7_13IML05#Audio
>>
>> So I guess this means that we need to add a way to also include a DMI match
>> for SND_PCI_QUIRKs ?
>>
>> Maybe add a:
>>
>> const struct dmi_systemid *dmi_ids;
>>
>> member to struct snd_pci_quirk and a new
>> SND_PCI_QUIRK_DMI macro to set this?
> 
> Do both machines have the very same codec?  I couldn't find
> alsa-info.sh output for Duet 7, but at least, C940 seems with ALC298
> (0x10ec0298), judging from
>   https://bugzilla.kernel.org/show_bug.cgi?id=205755
> If Duet 7 has a different codec (e.g. ALC287 0x10ec0287), we can
> distinguish from that.

I've just asked the reporter of this for alsa-info.sh output.

So assuming the codec is indeed different how would I go about
fixing this ?

Regards,

Hans

