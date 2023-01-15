Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE566B35B
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 19:01:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E94016BC;
	Sun, 15 Jan 2023 19:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E94016BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673805664;
	bh=xfQrPgU/SDEw2n78/utSqcNwUb0j0BWtaRQTqQVNsQA=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NICa0ySKzP35ccemIdvrY5lmiO75emS+KouMsmcaBRcdhKNfqH0VJr6TGtIjimvRO
	 zqroX/jfgBrerydISBV9X9gs2/ULUUnaAppfTPuraQM9Hur1KayiUl9HiYZ3ZfxYST
	 1dBAmting+C4XlHDtLz0J+I9AZBM8yoy4BYZu5As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 664CBF804E6;
	Sun, 15 Jan 2023 19:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C08F804DE; Sun, 15 Jan 2023 19:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D3DDF8026D
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 19:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D3DDF8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=MHRHr7kz
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6DA03A0040;
 Sun, 15 Jan 2023 19:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6DA03A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673805607; bh=GYkpgEbfADBOJlqQZlMfh69r0JntZ1yhb093bOgzG3U=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=MHRHr7kzuclHI1hCjXs1kpf0GUSL66iTmpK7BZvmI1hgBEy/vNNdF8up0NwavCMzY
 xHnFKDCEKKcOn2ixE/6QcmUdSWgJDedpw/WCyah392Qi53BdrqDaJD4OaDUNfoatxa
 7PftUB/FCZ1cpnngDBd211cU1niAVjHdlkT5o+N0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 15 Jan 2023 19:00:04 +0100 (CET)
Message-ID: <7d6c7dd2-c300-98aa-6f76-ffc154dee68a@perex.cz>
Date: Sun, 15 Jan 2023 19:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] ucm: add existence checks to geti calls
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
References: <20230113185019.1500147-1-cujomalainey@chromium.org>
 <20230113212155.2108905-1-cujomalainey@chromium.org>
 <944b3ca8-27fb-01da-a2b0-77b15d7422f9@perex.cz>
In-Reply-To: <944b3ca8-27fb-01da-a2b0-77b15d7422f9@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 15. 01. 23 18:40, Jaroslav Kysela wrote:
> On 13. 01. 23 22:21, cujomalainey@chromium.org wrote:
>> From: Curtis Malainey <cujomalainey@chromium.org>
>>
>> Right now in snd_use_case_geti you cannot tell if the item being queried
>> exists or not when being checked. This also means the only way to check
>> for the existence of something in the client of the library is to
>> iterate over the list of mods/devs even if we know exactly the name we
>> are looking for. We have functions that do exactly this internally so
>> lets return this information in a logical fashion through geti.
> 
> Thanks. I applied your code and and pushed a cleanup + fix on top:
> 
> https://github.com/alsa-project/alsa-lib/commit/c083417b723a3485657234a21da3264419da1411

... and

https://github.com/alsa-project/alsa-lib/commit/496c4e031b49216c2fcda83c052cc243ba425a76

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
