Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597BF2E83DA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 14:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E31F216C1;
	Fri,  1 Jan 2021 14:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E31F216C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609507588;
	bh=s8PkXsyDTa8Nq+XJUTcsoy53HVxuWdg4Ggsi9J//vmM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I32g8ocSoO2+RxN9xDcXCLABrEOC7R6DB82nSKzqSjHwJ4RO/RsdMP1PFJVDWWuL4
	 tOQa4/WnVQzb1lVfEn2ma1DbIzgIclGiToNeaW03kn+R1o06kpaniH94IXVC1Va2wa
	 na+pXXzz57tRR3R0K+3t4qH0HCoyieGLXGD0DcX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53FF1F8020B;
	Fri,  1 Jan 2021 14:24:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 309D6F801F5; Fri,  1 Jan 2021 14:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F41BF8012B
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 14:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F41BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ifg8Q1B9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609507482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlUf3RFrTX25sJTt0DKiuNwG0dF3j8VQJM9/nMs04SU=;
 b=ifg8Q1B9sVhxs/HuhZtQ3f2LV3xJlFalrwgfIzZnLC4VddP2qd6ejOnmSKrERZXSiXGiPY
 xad/1jHvCmmHjbdHgeYuxwvyg1odVUzw7QzQ/krUwDRghxWkDAFP4x9Fh5MS6L7CSI7BsH
 4v0j3QN2jJ+e3afKpIQXLLV4O8ppKlk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-GlwDLzGvNOqLVCq-bnAIhA-1; Fri, 01 Jan 2021 08:24:37 -0500
X-MC-Unique: GlwDLzGvNOqLVCq-bnAIhA-1
Received: by mail-ed1-f72.google.com with SMTP id e12so8272342eds.19
 for <alsa-devel@alsa-project.org>; Fri, 01 Jan 2021 05:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NlUf3RFrTX25sJTt0DKiuNwG0dF3j8VQJM9/nMs04SU=;
 b=b/GHpVY5MF4T9vZaqwOmb0vaMoHj1sq4I6n6ZqmadGJinoWKM0P+usD9H/RXahORvR
 u/pPTKg1y9V5mBsP6WmJdsoIjRjC93FCC+utqz94y05gWvyUFRhJilxDxWc07R00QFoJ
 0QdGoeUBlTA1qrU5eL3DG5JIXjsVAkxRJ3Ci7lNzPgcMyYMzGz7OvOES/JfM3MAFLdcf
 F/e+rihbQRHZfSqbWkrBBaXcq+BsydX8k5HcF8S/MWSN2VQdGu9ONLm2v0EpkR5btaB/
 +yFpcV17eUQANnwv0EriP3+xvDVORvgDfghMwbHJeg9n/QQk+PkrmpB1minRYXYNbXXr
 GGKw==
X-Gm-Message-State: AOAM530SJNEee/qtGFljiDEN04VcnEwSHIOpvxx7AcftVIc0JfsIw1Fs
 QGx1qAyBMMz0vVuHJ2cAaNr5qt9ncoqeCWgQc3zdk9bvT2gptGsEfL9rIS13Pej01/A9q2dJo+0
 bv83iVIrjdeXIGWbm4uHGoGKi5WxFUEPn7hoe7X0F4l0iCjNVn2o26T+3EPtTrwUd0RznaljxMw
 M=
X-Received: by 2002:a17:906:2c54:: with SMTP id
 f20mr57560684ejh.318.1609507476462; 
 Fri, 01 Jan 2021 05:24:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOkcdqEPEYFudNaC7S3egmI6FCqsKLaZbnzjTvYAnMq7f7U8r4OTu9efaWXmITnAXsrwDSCQ==
X-Received: by 2002:a17:906:2c54:: with SMTP id
 f20mr57560669ejh.318.1609507476213; 
 Fri, 01 Jan 2021 05:24:36 -0800 (PST)
Received: from x1.localdomain ([185.200.132.250])
 by smtp.gmail.com with ESMTPSA id r23sm20864486ejd.56.2021.01.01.05.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 05:24:35 -0800 (PST)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Mark Brown <broonie@kernel.org>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150807.GF4786@sirena.org.uk>
 <07037a8a-1d35-362e-1b82-b73b81f7c6ac@redhat.com>
 <20201230133803.GC4428@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fca91ed2-408b-bb31-f6e8-4391f06b0ccc@redhat.com>
Date: Fri, 1 Jan 2021 14:24:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201230133803.GC4428@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On 12/30/20 2:38 PM, Mark Brown wrote:
> On Tue, Dec 29, 2020 at 04:33:09PM +0100, Hans de Goede wrote:
>> On 12/29/20 4:08 PM, Mark Brown wrote:

<snip>
 
>>> The whole purpose of creating sound/core/jack.c is to abstract away the
>>> userspace interfaces from the drivers, most audio devices shouldn't be
>>> working with extcon directly just as they shouldn't be creating input
>>> devices or ALSA controls directly.  The missing bit there is to add
>>> extcon into jack.c.
> 
>> So what you are suggesting is making sound/core/jack.c register the
>> extcon device and then have arizona-extcon.c talk to sound/core/jack.c
>> and no longer do any extcon stuff itself.
> 
> Yes.

Ok, so this seems to be the same solution as which the opensource.cirrus.com
folks want in that both you and the opensource.cirrus.com people want to
change the arizona-extcon.c driver to be changed to stop reporting extcon
info directly itself and instead do all the reporting through sound/core/jack.c.

Where the thoughts on this seem to differ is that the opensource.cirrus.com
folks seem to be fine with dropping extcon support, where as you suggest
to extend sound/core/jack.c to register an extcon device and have it report
extcon events.

I'm with the opensource.cirrus.com folks here that ATM it seems best to just
drop extcon support since the only user is Android, which also supports the
input_dev API.

If the need arises we can always add extcon-support to sound/core/jack.c
later.

So I'll start on reworking this patch-series to change the arizona-extcon.c
driver to stop it reporting extcon info directly itself and instead do all
the reporting through sound/core/jack.c.

Regards,

Hans

