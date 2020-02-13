Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7515C9A8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 18:43:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4670D16DE;
	Thu, 13 Feb 2020 18:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4670D16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581615802;
	bh=4apR0HiGO6QTOATCUBjFNHr85zcoQvEz/rxmpPPmdSQ=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryHxfvj/g/cnM6Afl8eFVCqrHJWLHIoaocj1FKzlCvJoTCH8tw4lz70Dwu9eUkMZs
	 fuKWAvTMRMYZtUOCnIHG/pEoxmNVvpiSTFbUj8PWHslpntxwu+fG37XSCoCPwpJ12j
	 h96r/uD2M0rUEuTcnOH4Oy/a9R4SrIEn2LHg2pyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB34F80218;
	Thu, 13 Feb 2020 18:41:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5EA9F801DA; Thu, 13 Feb 2020 18:41:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0907CF80146
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 18:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0907CF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="G2IrNlrN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=g0qlXJoh4ngb/QmDMiYQd823EO/vda2eM/qz6r97Mmg=; b=G2IrNlrNBazBWx5ojTUFdydJxn
 IUfqKxJrVJo8KfP5XVw7LCCGTVga2u29p1D/c3nXC+DUk6ZXcCE+XbcLVo7pkVPRWsxLezPI8HfYT
 4a6v+Mp6fRD5CuQLC9xVi1H13rgBNcYUJttqsERAw3F4TzXyAgAUjHZtypT1JDPwoim/dKij5FyiK
 mRRl9PO8Ds9p8XU/5SdM5K24u/XpuAvOlpTJ4AB+/xoiAtX+NzVWcZeYNHOIA3/w7gm5u9rC7qZ8/
 r/5lO8k1w7eylvq+FthaQyZe2ShRCkjIjzCKFtYWvxchc0g+ePXRJ+f3cdJtHAZP6+qRtR3ITBkDI
 NXA5xnow==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2IUJ-0002HY-3a; Thu, 13 Feb 2020 17:41:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200213145240.2ff2b6a2@canb.auug.org.au>
 <d8dbd288-5270-42f1-0d55-b0f1516addb1@infradead.org>
Message-ID: <d0d9a245-f336-1334-90a8-631faf95d071@infradead.org>
Date: Thu, 13 Feb 2020 09:41:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d8dbd288-5270-42f1-0d55-b0f1516addb1@infradead.org>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] linux-next: Tree for Feb 13
 (sound/soc/codecs/snd-soc-ab8500-codec)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2/13/20 9:06 AM, Randy Dunlap wrote:
> On 2/12/20 7:52 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200212:
>>
> 
> on x86_64:
> 
> # CONFIG_ABX500_CORE is not set [this is in MFD]
> 
> ERROR: "abx500_set_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!
> ERROR: "abx500_get_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!
> 
> 
> Full randconfig file is attached.
> 
> 

[adding Geert, dropping 3 ST people due to bounced email addresses]

-- 
~Randy

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
