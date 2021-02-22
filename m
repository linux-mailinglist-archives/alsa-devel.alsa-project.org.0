Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C2324F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4677B16A0;
	Thu, 25 Feb 2021 12:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4677B16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252580;
	bh=b0PG0w5bkyhQiXBEA3gu5ztJlKe8IQBZFBD9qeIA77o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WI5ttldg81B8MNWn6WoWrtjZS+GSfvcOHjvlLieSl/JvKgqXCvkWKgjfYsKic9q/7
	 /bBJcegJpdThYLEcwe3W4vMLPB+awP5MtdRV1E9Q41b2IqYJomr+lrmgwG6rn/akEc
	 3J6w3TzAT2UrSQiq5oJL6W/6+6R9mElfA1otifoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F94DF804AA;
	Thu, 25 Feb 2021 12:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1672DF8016C; Mon, 22 Feb 2021 17:37:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03963F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03963F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="JgIAcXbm"
Received: by mail-ot1-x334.google.com with SMTP id c16so12595707otp.0
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 08:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CQtzj2ET+OspvcT7VasFUJh31XI2DgueE7K7chQefu0=;
 b=JgIAcXbmqnUtAzeQggrQMFDw+iRD7712f5b6XLlsNpGFq/2OH71ZR8eVPcYSvV8O9Z
 Q4ZFhr/HY3qIL2VVw5am2ZXMqQjcHv6oQm57icBzxpF2r/H6pUN28Ic0UVcMNAWR0oM3
 Nk4pk+06r39DoxUQo5VbU8V6VX0ewSDT/6fu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CQtzj2ET+OspvcT7VasFUJh31XI2DgueE7K7chQefu0=;
 b=HrkzxhZYvZmqGEIOqUNvWnQ0RUjlwYA8uJE2EZI8XsFA7jh8lwXK6RpTRfyJdCDtNZ
 CT9rwyrVocFULuzFcIUK4J4GFJrg83Pmbx7dNqBUr7OSdlJ0XS5rW44Wg8Xbp57+piMY
 eanE6p306l6TZ/LPUcgCKrKuPsCd8zcFJaNWQ3RCs482raiP726PKPNKfhZKC/0D7Fw5
 YA4dPJmIz4BpGU6EwUeM0jZSRbPcMySM3sWF1X8O0a1sgZgLaaIdi5M2n4ZVA3KnQD+q
 3XLXEyhikK/Xi68j4HlLJ634YLZD2GYDr/KbXAZX+IexzA6cHtgvLNVuanicb+QWp3+S
 jm8A==
X-Gm-Message-State: AOAM5322OV1FlORCM5ruyPXkwfClot5NPP+c0SiqCq42tR9cjhnY4uIS
 Gq/GARZuwfXJCZqz06Ml9RP0Tg==
X-Google-Smtp-Source: ABdhPJyA692d/UkhfnySsVsus41uILuIidqyduT1DxwFO8wUlVI27VDOIjP5WOhWxUUsjwOOYq7M6Q==
X-Received: by 2002:a05:6830:314d:: with SMTP id
 c13mr16134049ots.124.1614011814286; 
 Mon, 22 Feb 2021 08:36:54 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id 7sm3712035oth.38.2021.02.22.08.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:36:53 -0800 (PST)
Subject: Re: [PATCH 00/20] Manual replacement of all strlcpy in favor of
 strscpy
To: Romain Perier <romain.perier@gmail.com>, Kees Cook
 <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jiri@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, "J. Bruce Fields" <bfields@fieldses.org>,
 Chuck Lever <chuck.lever@oracle.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jessica Yu <jeyu@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Steffen Maier <maier@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20210222151231.22572-1-romain.perier@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <936bcf5e-2006-7643-7804-9efa318b3e2b@linuxfoundation.org>
Date: Mon, 22 Feb 2021 09:36:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210222151231.22572-1-romain.perier@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: linux-hwmon@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-scsi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-m68k@lists.linux-m68k.org,
 target-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org
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

On 2/22/21 8:12 AM, Romain Perier wrote:
> strlcpy() copy a C-String into a sized buffer, the result is always a
> valid NULL-terminated that fits in the buffer, howerver it has severals
> issues. It reads the source buffer first, which is dangerous if it is non
> NULL-terminated or if the corresponding buffer is unbounded. Its safe
> replacement is strscpy(), as suggested in the deprecated interface [1].
> 
> We plan to make this contribution in two steps:
> - Firsly all cases of strlcpy's return value are manually replaced by the
>    corresponding calls of strscpy() with the new handling of the return
>    value (as the return code is different in case of error).
> - Then all other cases are automatically replaced by using coccinelle.
> 

Cool. A quick check shows me 1031 strscpy() calls with no return
checks. All or some of these probably need to be reviewed and add
return checks. Is this something that is in the plan to address as
part of this work?

thanks,
-- Shuah
