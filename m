Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAAC4A765B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 17:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A581755;
	Wed,  2 Feb 2022 17:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A581755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643821180;
	bh=9yp4CwxwUHGLcr+d+86gN0k0ZlNozZ+zbH0v4eLxN30=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/9cr1wrIOww5YLY/o+EYie0lTPWLes8CJiOdb5y8IVA3h2qDVFi6s6pMvrwVJH7H
	 0XnZ5lOBtQ1kKOgxBCLYpPfVUqFQk+rBjXKZ+ax4oLqUzBSY6UwgvJbu8N9LDSDIf8
	 9+j2GX1wRJ7L9kfbqIML/hF6p/7qvnibSQLbiqqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5203CF804B1;
	Wed,  2 Feb 2022 17:58:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDAE1F804B0; Wed,  2 Feb 2022 17:58:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B5CF80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 17:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B5CF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bvisUxUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643821104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33RJ6ETpJBMEuUVYARi3js6UE/fWbj5Vv0s0IDaoWvM=;
 b=bvisUxUw9QIxWRIHFsiQxxKaJaol8fTYV/PGA5AUMZUxfb5Y2xInErvvpelhGN5uOjBcN3
 1ldHNNwOmMPDOyFbDdD8Y+9/JvqSK+C2ilz9mbxcliSlrViAkWh8IRaF8Bj+Wj/44AGzSC
 ZTiocNRmc4t38ymXnrN9p34inS9HCP0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-c2m-nA7_N8qGBn36aSzfTQ-1; Wed, 02 Feb 2022 11:58:22 -0500
X-MC-Unique: c2m-nA7_N8qGBn36aSzfTQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 p8-20020a1709060e8800b006b39ade8c12so8423076ejf.10
 for <alsa-devel@alsa-project.org>; Wed, 02 Feb 2022 08:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=33RJ6ETpJBMEuUVYARi3js6UE/fWbj5Vv0s0IDaoWvM=;
 b=p265mEJnLaFIOOi89zNN4NoN6E6HjnVzumRUDa7u21YY4eBsKhMvJPVUa71Si0dLXg
 VzXHPFbmk8B985OA4Oi0sWyhmDkA/NyFftB2gu/6XuOdZy2TlY+2Bjbh5Ia7BX7qgOSz
 t86bHuyB5TxNXeHRoNe870gltufWNT85qPnuM7lVUb0pAedKWy//24GWkhmxbQvqHUT6
 7Hl0wihnlUBeSB+krMprvZu0trFSbWvwwxnaa7RLO/ph39vfZonY/A6rdXH6BulDJtEo
 HWHtc7lE1UAMdNKHvH7f9ZLj+uxR0pI6EceMHbFnQ0eYkVx0AKUpwoGimcrBBH8Pipwj
 j9Sw==
X-Gm-Message-State: AOAM533oljOAWksjwFcwx95XW4Wx5dQkPP/Q9R1A7FrUNjjD6BtJrQid
 qub8B6bM9ASnQHttILsX1FB1IS/AH0pKRwYUVzNmMTbnSeXjHYTTjgtWzpzGamJruzQOmSA7XWp
 x1lP8UX+9tDoGSIzioUh6L3M=
X-Received: by 2002:a17:907:9494:: with SMTP id
 dm20mr25174303ejc.148.1643821101414; 
 Wed, 02 Feb 2022 08:58:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSa5+s4V0ZC2uHEnTb8hqOakr0xNNcuxHT6eTOZntN/dBUa1zn7lL5I0NToJaWGLpDqviY1w==
X-Received: by 2002:a17:907:9494:: with SMTP id
 dm20mr25174287ejc.148.1643821101266; 
 Wed, 02 Feb 2022 08:58:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id e15sm21345845edy.46.2022.02.02.08.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 08:58:20 -0800 (PST)
Message-ID: <ba39ac5f-a6b5-8b73-2e51-882cbd96a726@redhat.com>
Date: Wed, 2 Feb 2022 17:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 8/9] ALSA: hda/realtek: Add support for HP Laptops
To: Takashi Iwai <tiwai@suse.de>,
 Stefan Binding <sbinding@opensource.cirrus.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-9-sbinding@opensource.cirrus.com>
 <s5hv8xxzlir.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <s5hv8xxzlir.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 linux-acpi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, linux-spi@vger.kernel.org,
 Len Brown <lenb@kernel.org>
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

On 2/2/22 10:05, Takashi Iwai wrote:
> On Fri, 21 Jan 2022 18:24:30 +0100,
> Stefan Binding wrote:
>>
>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>
>> Add support for two and four CS35L41 using the component
>> binding method
>>
>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> Hans, feel free to include this one into your tree.

Ok, I'm working on merging the entire series (on top of Mark's
spi-acpi-helpers tag) now. I'll send you a pull-req for
a signed tag when I'm done, in case you want to merge 
this to avoid conflicts.

Regards,

Hans

