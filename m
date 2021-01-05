Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA332EA83F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 11:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246F1167C;
	Tue,  5 Jan 2021 11:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246F1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609841474;
	bh=qxKDK0YQPW3FrIccYY99CB3HteZHjRAq0Yw+cujTRZ0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6pCkZPdYHjIAqxF+OlN4WAndC6Oi7ojc0ji5GJCXMkerVgEINbWlaiKacofXBtZD
	 KLgyHWGGxi8ux2/+uc6gLKTFe952yFB9V8yzFKWTpvIiO9d1xG8Xt2j6Ge30+GK4kF
	 Ng5xHHWZiBKNH2jDL/GbS8AYqOVRLgSiwaRxXZbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA383F8015B;
	Tue,  5 Jan 2021 11:09:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1654DF80258; Tue,  5 Jan 2021 11:09:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79050F800FD
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 11:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79050F800FD
Received: from [114.252.213.174] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kwjHM-0001UK-SI; Tue, 05 Jan 2021 10:09:29 +0000
Subject: Re: [RFC][PATCH v3 1/4] alsa: jack: implement software jack injection
 via debugfs
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 tiwai@suse.de, kai.vehmanen@linux.intel.com
References: <20201228080003.19127-1-hui.wang@canonical.com>
 <20201228080003.19127-2-hui.wang@canonical.com>
 <18eee6df-c77d-0672-2e58-7fa9a442ce40@perex.cz>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <9169ba78-89bc-9277-c2d7-0a34aff7f7cb@canonical.com>
Date: Tue, 5 Jan 2021 18:09:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <18eee6df-c77d-0672-2e58-7fa9a442ce40@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 1/4/21 11:20 PM, Jaroslav Kysela wrote:
> Dne 28. 12. 20 v 9:00 Hui Wang napsal(a):
>
>> +static ssize_t sw_inject_enable_write(struct file *file,
>> +				      const char __user *from, size_t count, loff_t *ppos)
>> +{
>> +	struct snd_jack_kctl *jack_kctl = file->private_data;
>> +	char *buf;
>> +	int ret, err;
>> +	unsigned long enable;
>> +
>> +	buf = kzalloc(count, GFP_KERNEL);
> Debugfs fops allocations should use kvzalloc() / kvfree().

OK, got it. Will change to use them in the next version.

Thanks.

>
> 					Jaroslav
>
