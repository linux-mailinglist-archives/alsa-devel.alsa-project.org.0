Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C93662995
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 16:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB52AB3DD;
	Mon,  9 Jan 2023 16:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB52AB3DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673277283;
	bh=JVWO+P5CYVAglZX/1tTUTPQ6NwcQ9vUC5QzY4oBpUjs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MwHnH2ZfJZCaa9MQ/IeCa+S2LTT11LV/qviLR4uoHCiK0m7rGTmjSfLqzcEx/vMZ/
	 mo1Nr1ZH+PFwizgS1ifnp/cS6y4T3JMJhO+1vXyiYepJTBN+u81da5QVJUt+4KKJPz
	 x3ymhqBTgLRJTBBy6HE7VMS3NIJO8tFMNLMkQBzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780A9F802BE;
	Mon,  9 Jan 2023 16:13:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75318F8051B; Mon,  9 Jan 2023 16:13:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D65F8030F
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 16:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D65F8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=5tWLPAcw
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C912DA0042;
 Mon,  9 Jan 2023 16:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C912DA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673277228; bh=JOgV0HrPLnwj9pZW17Xj5Dva1AUOBQ8aiY9pRGXMYWw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=5tWLPAcwwe/BjcGo1DrBO+lem97FpWvDkV3Zoe4pPZBVI7dRtnF/MPNhClhMSwcnP
 z9ES9+6IezcH4pGykZGx3VEsLsmEjY/Q76gVRRu4uT5iFRRu+JA4kfAVsA8pJ1MnaT
 cA2pAXwobzHCNw5WaYveGjurVwMSKAJBvYUqiTUo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Jan 2023 16:13:44 +0100 (CET)
Message-ID: <c117caee-cd9e-02a1-d38b-489d8611b340@perex.cz>
Date: Mon, 9 Jan 2023 16:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] ALSA: control-led: use strscpy in set_led_id()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230109150119.342771-1-perex@perex.cz>
 <87h6wzg35b.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87h6wzg35b.wl-tiwai@suse.de>
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
Cc: yang.yang29@zte.com.cn, ALSA development <alsa-devel@alsa-project.org>,
 stable@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09. 01. 23 16:04, Takashi Iwai wrote:
> On Mon, 09 Jan 2023 16:01:18 +0100,
> Jaroslav Kysela wrote:
>>
>> The use of strncpy() in the set_led_id() was incorrect.
>> The len variable should use 'min(sizeof(buf2) - 1, count)'
>> expression.
>>
>> Use strscpy() function to simplify things and handle the error gracefully.
>>
>> Reported-by: yang.yang29@zte.com.cn
>> BugLink: https://lore.kernel.org/alsa-devel/202301091945513559977@zte.com.cn/
> 
> Let's use the normal Link tag instead of BugLink.  The former is
> preferred.
> 
> Also, it'd be great if you can put the Fixes tag, too.

Done. Sent v3.

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
