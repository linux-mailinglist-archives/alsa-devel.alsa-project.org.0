Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A3502C1F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Apr 2022 16:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D551779;
	Fri, 15 Apr 2022 16:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D551779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650034020;
	bh=IU5j3TFi3aBzwBmakTMOFr/g0G93AM0oTluxvE7HSI0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5EEDFUN5e1DvKMpA8V6Qy0xX/iR7hISZI9beug7BX7xfkgC4f0RivIe8yYsYpauT
	 DxFIYBEVCgUC9Fmdh+VKtpzYlmj8PYdUsTiRxgKBmwCdoluhbCwOinsMQlY1gHm90S
	 WQisUueAxaGw3E0DDAy8pI/eMnWXDXdjLT6p7xOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFAECF80095;
	Fri, 15 Apr 2022 16:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D41D5F8016A; Fri, 15 Apr 2022 16:46:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05025F80095
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 16:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05025F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="W72ZZbjG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=QWxdhbL8bXm/fNhn6GXmwt668iO5RiNBagKq9feE/Fo=; b=W72ZZbjGfB/fnnZ02Pihi6NHkn
 lrIO5UceziNVJjvzdRS0PYq8kLQoAK4Nu7zkrC94GwEA6j6J8UkSOIrhn4/+Ov76aGj3L+uOBmGor
 33xN1DmIGjgc1QrGRRBImTYhAr5iz8osT03d8vhGH339njujF5sp2EqEh2GSCAh9r4dy1MFeqYnvn
 1ciFtQbbdtTMBgrPFtAAGfJInAY0CXnWy7lm6NwpBKX88N6w/q1rrB6BkD5R6cJYvq3M6m0QgWfMy
 k4IqwvWONH8AsfDUiSd4ly6HumNXofrhxV4XYxnWDlmgOfxmKjX7fx3tR+lLFsbRuHidSALWfyYZw
 mM/BlECQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfNCg-005Ppn-1C; Fri, 15 Apr 2022 14:45:42 +0000
Message-ID: <34f3fe4a-7d75-d007-2b22-54d44f49a435@infradead.org>
Date: Fri, 15 Apr 2022 07:45:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] sound/oss/dmasound: fix build when drivers are mixed
 =y/=m
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
References: <20220405234118.24830-1-rdunlap@infradead.org>
 <20220415134852.GA2271702@roeck-us.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220415134852.GA2271702@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
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



On 4/15/22 06:48, Guenter Roeck wrote:
> On Tue, Apr 05, 2022 at 04:41:18PM -0700, Randy Dunlap wrote:
>> When CONFIG_DMASOUND_ATARI=m and CONFIG_DMASOUND_Q40=y (or vice versa),
>> dmasound_core.o can be built without dmasound_deinit() being defined,
>> causing a build error:
>>
>> ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_atari.ko] undefined!
>>
>> Modify dmasound_core.c and dmasound.h so that dmasound_deinit() is
>> always available.
>>
>> The mixed modes (=y/=m) also mean that several variables and structs
>> have to be declared in all cases.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Link: lore.kernel.org/r/202204032138.EFT9qGEd-lkp@intel.com
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: alsa-devel@alsa-project.org
>> ---
> 
> m68k:allmodconfig fails to build with this patch in the tree.
> 
> Error log:
> sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used
> 
> ... because __setup() is empty if MODULE is defined.
> 
> Guenter

Takashi has already merged a patch for this from Miles Chen.

thanks.

-- 
~Randy
