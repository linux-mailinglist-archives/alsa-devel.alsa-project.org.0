Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70514283F8F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 21:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138BE17C0;
	Mon,  5 Oct 2020 21:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138BE17C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601925878;
	bh=cdOSA8nPpArmj2tVLF7U36l0B+Napht62JpDLxWuQuo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y5AbEcvZcbXC/rvr01U0SR+aZVruK8p2w9aFxersGTnyt0LReC9Yb2TJ9xeDYDNLl
	 qJKXH0kvZ3M0qkFi+7FLd6dZx4qxjTLoKHqco7Pb/faogO0HIO59kpIJei3dUi4S7N
	 gQslL9lL61+ds1T91tv8+wCNfulYR1bg9Gcc7XMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20872F80121;
	Mon,  5 Oct 2020 21:23:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0312F80269; Mon,  5 Oct 2020 21:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D04F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 21:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D04F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="rmNS8zN8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=KlYHzF1kfXAq/Cc2HDvXD5GjEU5+8TAzq4Axo6GqLTA=; b=rmNS8zN8e8/KXI5/TmQ6KZJ3e0
 rvNcWTBFlBIaXY3V6Q3RcmXuOgQJyK8cqaUkznGXMXMTzZ0fTE9PO8NfM5iXttX7CCUQminjhOcni
 JubHMqbpQjpBWDbvQ9s2clke7n7FNBv89u+22hAbnxHlhLorXMuc/Ww46Kd1NxisdolK9hRwu7FQI
 XDWIWCAZNMrc6TlGtSHyQ4UuFmAiDdWpYGSRcm976LJAZfCPPhPF8vOQehRBmsdy4PsOH/RLh9Aa7
 CPsuby1fnVJ2IyF3I23qpDao+3VrE0hjyEwxGDZ/nS0zjlaCiQoTQwY2FltqtEwCqS3wVy8PmQdAA
 7tzfcM1w==;
Received: from [2601:1c0:6280:3f0::2c9a]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPW5A-0007r6-Lf; Mon, 05 Oct 2020 19:23:37 +0000
Subject: Re: [PATCH] sound: sparc: dbri: fix repeated word 'the'
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20201005191234.12715-1-rdunlap@infradead.org>
 <714e5d92d8b9f3ba365ec0cabf1406ea1a847d69.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e8488a43-4f89-604a-0f25-c906d138ba82@infradead.org>
Date: Mon, 5 Oct 2020 12:23:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <714e5d92d8b9f3ba365ec0cabf1406ea1a847d69.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On 10/5/20 12:21 PM, Joe Perches wrote:
> On Mon, 2020-10-05 at 12:12 -0700, Randy Dunlap wrote:
>> Drop the duplicated word "the".
> []
>> --- lnx-59-rc8.orig/sound/sparc/dbri.c
>> +++ lnx-59-rc8/sound/sparc/dbri.c
>> @@ -620,7 +620,7 @@ A circular command buffer is used here.
>>  while another can be executed. The scheme works by adding two WAIT commands
>>  after each sent batch of commands. When the next batch is prepared it is
>>  added after the WAIT commands then the WAITs are replaced with single JUMP
>> -command to the new batch. The the DBRI is forced to reread the last WAIT
>> +command to the new batch. The DBRI is forced to reread the last WAIT
> 
> Maybe Then the?

Sure, I'm OK with that.

>>  command (replaced by the JUMP by then). If the DBRI is still executing
>>  previous commands the request to reread the WAIT command is ignored.

thanks.
-- 
~Randy

