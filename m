Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060E4A5EAF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:55:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0375E17CD;
	Tue,  1 Feb 2022 15:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0375E17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643727346;
	bh=uL69nQx5mgOQ3KLqeLNqnhxJXhMWYpTXp1+SCgrP/2s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpDMjGa7CQHYotZd56gha6M94I1jShmb4goxbbvXXXFebfl9XgmCIEA2vxu5MRCvg
	 lcSbU2UGbpfxzjcD59aYfNL2V9KsoUVsQ7HvDKyQebHA+6uwr01gSLboSHTQAtNgrW
	 HbTqJbdrWIoKMinxqVSWh+Q0ti5IJjqvTAVa/3r8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0BCF80089;
	Tue,  1 Feb 2022 15:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F36C2F80130; Tue,  1 Feb 2022 15:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC745F80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC745F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="S7uhBO54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643727269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFwpy9fOZO6ssV96jv+obSGnqOS+dofnT9+Jw0dBzFY=;
 b=S7uhBO54aqo7j9zxtvYH0g0EXYdU314fF9UD2wxO/4QslIMl7BKy4SHO6MtvS1SSoAUjQz
 RvhkP/mu4wK+5r23PjjBH861iqqA7mMeuTtmO2+Lo/ThTVhMyv9PzRXAm900DMUcCCFum3
 Fp+ZRtkO1ktvinEUwVjTp9+qkGUZjy0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-0-kT6JfgOkeYXvNePGxrlQ-1; Tue, 01 Feb 2022 09:54:29 -0500
X-MC-Unique: 0-kT6JfgOkeYXvNePGxrlQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so8779880edf.22
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XFwpy9fOZO6ssV96jv+obSGnqOS+dofnT9+Jw0dBzFY=;
 b=XIRW5jE70i6bLIIpLlSClXxsyHRwpEbrhHiPcjr6iR825K40WlVZxRmv3Ar4PSdmyE
 Qhv9sOVFHx1aP2hk0fdY/8kE+a8QuPaG9NVwPnEci5JWhfdFEwny60LZLzDdOxiaCUxj
 7ls93oN39jL7SvyHVJTLq2gKrBGrNXOHX5SqkSDltnj2BGEZkahM5hHyqkX2HaY82WTF
 jMI6eXBFD5awQVWp9v7aIBNvtwZlWYZN7DJpb+Ew8U/+jmGj7n85VUMStTcWdUjzPiVZ
 h7ptyMlwTEV7cLWbXWmrMkeZdz+L54zZrSveU4um3NltSdxTRTHACysGUYYkMQ/X7W0L
 RDZg==
X-Gm-Message-State: AOAM533i+6GjkcNBV0m+W2EYuLr2p1WE3QbyEWxjNURtc6JTWOztzcw7
 MyAy7+zUTJXUM0b/jY+eiUS050MsFX+xk3aM1W9yon8tCLx9wsEuTv5KgXbmubDSRBV6rgMDb0O
 rqCAMmRo5Zff/+IT1MsZa3SU=
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr21186654ejc.365.1643727267192; 
 Tue, 01 Feb 2022 06:54:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEkNSH5vVbDhhRxtI2/WVmnkgqtbEUGR0iAiSf9moRNqfjGp9ibnT3pF8ifw/vhLJcbPc/cw==
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr21186615ejc.365.1643727266772; 
 Tue, 01 Feb 2022 06:54:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id a25sm4283157ejs.149.2022.02.01.06.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:54:26 -0800 (PST)
Message-ID: <f9b67b36-4b33-2557-0f0d-2819cc616cff@redhat.com>
Date: Tue, 1 Feb 2022 15:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 1/9] spi: Make spi_alloc_device and spi_add_device
 public again
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-2-sbinding@opensource.cirrus.com>
 <c821953a-6572-d60d-6a00-fccd541268c5@redhat.com>
 <CAJZ5v0jGqUvZS113VewgsGm8cMJc2B=M5KyqmOHTPNy+R8KeEQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0jGqUvZS113VewgsGm8cMJc2B=M5KyqmOHTPNy+R8KeEQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 linux-spi <linux-spi@vger.kernel.org>, Len Brown <lenb@kernel.org>
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

On 2/1/22 15:52, Rafael J. Wysocki wrote:
> On Tue, Feb 1, 2022 at 3:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/21/22 18:24, Stefan Binding wrote:
>>> This functions were previously made private since they
>>> were not used. However, these functions will be needed
>>> again.
>>>
>>> Partial revert of commit da21fde0fdb3
>>> ("spi: Make several public functions private to spi.c")
>>>
>>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> The series also looks good to me from the ACPI side, so what tree
> should it go into?

Minus the ALSA patch from 8/9 which should go through the sound
tree AFAIK, I would be happy to pick up the entire series in the
pdx86 tree.

This requires an ack from Mark though for me merging the spi bits,
Mark ?

Regards,

Hans


> 
>>> ---
>>>  drivers/spi/spi.c       |  6 ++++--
>>>  include/linux/spi/spi.h | 12 ++++++++++++
>>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>>> index 4599b121d744..1eb84101c4ad 100644
>>> --- a/drivers/spi/spi.c
>>> +++ b/drivers/spi/spi.c
>>> @@ -532,7 +532,7 @@ static DEFINE_MUTEX(board_lock);
>>>   *
>>>   * Return: a pointer to the new device, or NULL.
>>>   */
>>> -static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>>> +struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>>>  {
>>>       struct spi_device       *spi;
>>>
>>> @@ -557,6 +557,7 @@ static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>>>       device_initialize(&spi->dev);
>>>       return spi;
>>>  }
>>> +EXPORT_SYMBOL_GPL(spi_alloc_device);
>>>
>>>  static void spi_dev_set_name(struct spi_device *spi)
>>>  {
>>> @@ -652,7 +653,7 @@ static int __spi_add_device(struct spi_device *spi)
>>>   *
>>>   * Return: 0 on success; negative errno on failure
>>>   */
>>> -static int spi_add_device(struct spi_device *spi)
>>> +int spi_add_device(struct spi_device *spi)
>>>  {
>>>       struct spi_controller *ctlr = spi->controller;
>>>       struct device *dev = ctlr->dev.parent;
>>> @@ -673,6 +674,7 @@ static int spi_add_device(struct spi_device *spi)
>>>       mutex_unlock(&ctlr->add_lock);
>>>       return status;
>>>  }
>>> +EXPORT_SYMBOL_GPL(spi_add_device);
>>>
>>>  static int spi_add_device_locked(struct spi_device *spi)
>>>  {
>>> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
>>> index 7ab3fed7b804..0346a3ff27fd 100644
>>> --- a/include/linux/spi/spi.h
>>> +++ b/include/linux/spi/spi.h
>>> @@ -1452,7 +1452,19 @@ spi_register_board_info(struct spi_board_info const *info, unsigned n)
>>>   * use spi_new_device() to describe each device.  You can also call
>>>   * spi_unregister_device() to start making that device vanish, but
>>>   * normally that would be handled by spi_unregister_controller().
>>> + *
>>> + * You can also use spi_alloc_device() and spi_add_device() to use a two
>>> + * stage registration sequence for each spi_device. This gives the caller
>>> + * some more control over the spi_device structure before it is registered,
>>> + * but requires that caller to initialize fields that would otherwise
>>> + * be defined using the board info.
>>>   */
>>> +extern struct spi_device *
>>> +spi_alloc_device(struct spi_controller *ctlr);
>>> +
>>> +extern int
>>> +spi_add_device(struct spi_device *spi);
>>> +
>>>  extern struct spi_device *
>>>  spi_new_device(struct spi_controller *, struct spi_board_info *);
>>>
>>>
>>
> 

