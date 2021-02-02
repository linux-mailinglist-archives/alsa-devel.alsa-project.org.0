Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7A30B948
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 09:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A27B177E;
	Tue,  2 Feb 2021 09:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A27B177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612253654;
	bh=SdbfCq6OO7kXXsjlO6G/ccKzfpcaIE1PianSX5xM2Ow=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nEdqNJRMAXDBbQfdg8qGo10yp4FsL1L79zklrxeB8m0foyAay1I7utYE+JGye3ZAM
	 oi7KE6ildq+p4klpixwsCUqMz6unyzbDjeDdrtW7BI7ZbQswq1qGmRjGCa8LEdOah5
	 1cHOWT+I3Vuxk6WuS5/SWtnvQY64pj4pMkUYxS58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55869F801F7;
	Tue,  2 Feb 2021 09:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21F5DF80171; Tue,  2 Feb 2021 09:12:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F055BF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 09:12:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F055BF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="eNL6GGdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1612253554;
 x=1643789554; h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JomFmvAcqxcgt+Zf459veOHN7JFBnYNS2auowOkKYUQ=;
 b=eNL6GGdqcYbTgD8njStrVKlt7np0SPZUEkqtPqdKNIsD7hFlAC3PRfTg
 CoGOqph3F4K5khb7VMmK2Z1j36EgyTHcIpUR3sKuF+uhL85VckhpavvfU
 B5K1qCKMrwWJsBWk97wuiMnJMaDCydzfejgXRuac4lJqX8bSoTiEGMcLc
 OL9VlvDLH5Q+vruzsrkq+wqelX1P48NE1RFs8NUU32gnewnudhGH2pdDb
 yZQYzhoGVSP+woKKjNs30wwbvj4k97JY93YHZmJph9F5PrBR5xEJsi+Y3
 oOS13U7TZTk1u/xIwahrbMNHHR3qOjRBT9pjuVmbH9ANBsk3oK9KYaodi g==;
Subject: Re: [PATCH] Add support to expose controls of ladspa plugin
To: Jaroslav Kysela <perex@perex.cz>, Camel Guo <Camel.Guo@axis.com>
References: <20210201150352.6342-1-camel.guo@axis.com>
 <c94055e4-20f0-f4d5-8aa2-26d99fa30486@perex.cz>
From: Camel Guo <camelg@axis.com>
Message-ID: <23722bcd-a592-662b-2179-a0c607117a96@axis.com>
Date: Tue, 2 Feb 2021 09:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c94055e4-20f0-f4d5-8aa2-26d99fa30486@perex.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To xbox06.axis.com (10.0.15.176)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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



On 2/1/21 4:32 PM, Jaroslav Kysela wrote:
> Dne 01. 02. 21 v 16:03 Camel Guo napsal(a):
>> From: Camel Guo <camelg@axis.com>
>> 
>> In order for external software components to adjust ladspa plugin
>> dynamically, this commit adds an option to exposes the control array of
>> input control ports of a ladspa plugin to a file, through which any
>> applications with proper permission can control this plugin.
> 
> It looks like a pure hack (although the implementation is interesting). The
> controls may be exposed via the ctl (control) API like we do in
> src/pcm/pcm_softvol.c for example. The floats can be mapped to integer64 
> or we
> may discuss to add the float type to the control API elements.

If there are not so many input controls of a ladspa plugin, I think it 
is okay to implement it like pcm_softvol.c. But the problem is that some 
plugins might have more than 100 input controls. For every input 
control, there will be a system call ioctl in order to get its value. 
This will make performance really bad. If a ladspa plugin like this 
needs to support per-channel control, that will make it even worst.

But with shared memory like this, it will become a pure memory read, 
this will make performance acceptable.

Another benefit of exposing ladspa control array to shared memory  is 
that it makes it possible for any algorithms to connect with these 
ladspa plugins. The ladspa control array is basically a float-array, 
which is exactly the input, output of lots of machine learning, deep 
learning algorithm. Imagine an algorithm listening to the audio stream 
automatically applies privacy masks on audio stream to mask human voice 
via ladspa plugins.

> 
>                                                  Jaroslav
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
