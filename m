Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED13F1AF3DB
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3A31671;
	Sat, 18 Apr 2020 20:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3A31671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587236097;
	bh=6kt3tap4fI3c+zYAqNSJeTuK4NhgqnVfNnl+lumdgTU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHC1U2GPU10orswkJcXq5oalbHhODGk2Gwrx1fBLkHYNj6fFnJpylXJ5BEv3aPAA8
	 Hc8k8ReDxk8H922I+PMiAJ6toMaxJox6J+Uc3WEsJsKTsTNXoa29DcWYj0pbErvSDE
	 zxGM7WiB1JC6C7OM/2ZTh8/cKAzcrdOaYK9ro4XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4C43F8016F;
	Sat, 18 Apr 2020 20:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18338F8014E; Sat, 18 Apr 2020 20:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 669D6F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 669D6F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="GwZqVX1h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=KGgaI7/aF8gM/DdPVeh3iRDUqP5nlN3BG5/ZUjntmeQ=; b=GwZqVX1hBQ8NWcNug1tIYKrz4R
 U2IRF1+FEjojk+ZQVifHKsqFCF+H1fiJMydhq8YjDjbW9KtWGwn3olr7vK/HGNSu1WehIvKQtWosh
 BMoPriJK/H+0lffwLs5E6nvv2/JNTOwtoaK7zBEb/dn8JEcPRvepUcxaZHR8H7DkIeSlWVcUS1WWV
 CVUMlz5qooHHwL7XywdUi73jCtHRZnEwK1/5MDK68fwQFNLP2YhETImwB/mvOFWt+m48ND+munIaR
 O+7wJI5R8Vlj3BiAZo2gPs9W/wVQEXfyqPWT2fnEqJLIFpbeht4HH8Yn4gA8r97+CDZtM4p+B4qCJ
 wy6wnDqA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsaQ-0005zR-VX; Sat, 18 Apr 2020 18:53:07 +0000
Subject: Re: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
To: Matthew Wilcox <willy@infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-8-rdunlap@infradead.org>
 <20200418185033.GQ5820@bombadil.infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b88d6f8b-e6af-7071-cefa-dc12e79116b6@infradead.org>
Date: Sat, 18 Apr 2020 11:53:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200418185033.GQ5820@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On 4/18/20 11:50 AM, Matthew Wilcox wrote:
> On Sat, Apr 18, 2020 at 11:41:09AM -0700, Randy Dunlap wrote:
>> @@ -294,11 +295,11 @@ void dev_coredumpm(struct device *dev, s
>>  
>>  	if (sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
>>  			      "failing_device"))
>> -		/* nothing - symlink will be missing */;
>> +		do_empty(); /* nothing - symlink will be missing */
>>  
>>  	if (sysfs_create_link(&dev->kobj, &devcd->devcd_dev.kobj,
>>  			      "devcoredump"))
>> -		/* nothing - symlink will be missing */;
>> +		do_empty(); /* nothing - symlink will be missing */
>>  
>>  	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
>>  	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
> 
> Could just remove the 'if's?
> 
> +	sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> +			"failing_device");
> 

OK.

thanks.
-- 
~Randy

