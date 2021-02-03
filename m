Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053C30D0BE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 02:26:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD441171E;
	Wed,  3 Feb 2021 02:25:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD441171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612315577;
	bh=+LKUQBHAxKerfiqEQe7uirVh8lUzsnCBx2jq/BkLoFg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drkS/kdQODG5Yc/8Esw13KN/ZdZl9wrqcYj7Y/7rAv0J8pU4Ydi2wr8XKSAWol0uY
	 scp/Q9HSF1LKmnyNtRiV7QX+ep4tVQuJiO/ZGSawzCOQ8lA9916mPkzJQF01sFnoRr
	 bQEkDogbofxB0Zhwlxtg5SsIM6ehZ3Hg5ZMMohnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 326C8F80109;
	Wed,  3 Feb 2021 02:24:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6926F80171; Wed,  3 Feb 2021 02:24:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CAECF8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 02:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CAECF8013C
Received: from [123.112.66.186] (helo=[192.168.0.103])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l76uF-0004ho-I1; Wed, 03 Feb 2021 01:24:32 +0000
Subject: Re: Oops with "ALSA: jack: implement software jack injection via
 debugfs"
To: Chris Wilson <chris@chris-wilson.co.uk>, Takashi Iwai <tiwai@suse.de>
References: <161228343605.1150.8862281636043446562@build.alporthouse.com>
 <s5h4kiue7q4.wl-tiwai@suse.de>
 <161230605343.29124.4948122167882588203@build.alporthouse.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <978c4e92-d9ab-a212-a5b8-8924fcbfe2b1@canonical.com>
Date: Wed, 3 Feb 2021 09:24:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161230605343.29124.4948122167882588203@build.alporthouse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


On 2/3/21 6:47 AM, Chris Wilson wrote:
> Quoting Takashi Iwai (2021-02-02 16:48:35)
>> On Tue, 02 Feb 2021 17:30:36 +0100,
>> Chris Wilson wrote:
>>> commit 2d670ea2bd53 ("ALSA: jack: implement software jack injection via
>>> debugfs") is causing issues for our CI as we see a use-after-free on
>>> module unload (on all machines):
>>>
>>> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9715/fi-skl-6700k2/pstore0-1612277467_Oops_1.txt
>> Could you try the patch below?  The unload test was completely
>> forgotten.
> This took longer than it deserved,
> https://patchwork.freedesktop.org/series/86597/
>
> The oops is fixed.
>
> Tested-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

Oh, Thanks.

Hui.

