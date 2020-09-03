Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC8525C332
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 16:47:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DDBA1930;
	Thu,  3 Sep 2020 16:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DDBA1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599144421;
	bh=SRYvuXPRwjA+7v4/SljP/c2fYJI1K+isrqTF1x/JR1E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE+KqpXlGG5ZlsL3geN4u2F5m6Oas3NtyaTRFvvj35o6sCCBa6dlXCXK4+yIjDu9s
	 7n/Ukhcte9fpGQpYTQJR+Mg2TE2cLxie2GNd2eg0/4pglo6MMaQ6lqU7La+IamE7VG
	 1kS4yT2EKjUkC0HeHe/dHmjyQoAl2iUuIROY1Ozg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2A5F800BA;
	Thu,  3 Sep 2020 16:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3691F80217; Thu,  3 Sep 2020 16:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [5.9.50.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB68F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 16:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB68F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="K4QiryZQ"
Received: from [192.168.178.45] (x4db43e9b.dyn.telefonica.de [77.180.62.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id 47B4017A2984;
 Thu,  3 Sep 2020 16:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1599144306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UAgc881jmDd0Q09JEsrBvcJf2n6/0ZaIzzV+Xg5A7gw=;
 b=K4QiryZQtsXEYx3JliWxkaKw5Gbjmgi6w/yeiCwg8eMGLdbbz0i36YFTMFqCh6cwGpbcKx
 5vC9XuAvRG6fnVh5jk62EKMSp+OXD2RbWTBc4tvTh/LQwh2fqfs0+Ou1/l4eX7FtWRL0So
 BarhWqCcvZtfPzrevVsI1CmlEysSiVM=
Subject: Re: [PATCH 1/2] control: Improve general control interface
 documentation.
To: Takashi Iwai <tiwai@suse.de>
References: <20200902092727.2732-1-tanjeff@cccmz.de>
 <s5hzh6772lv.wl-tiwai@suse.de>
From: Tanjeff Moos <tanjeff@cccmz.de>
Autocrypt: addr=tanjeff@cccmz.de; prefer-encrypt=mutual; keydata=
 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
 YAC/BUWuon8xl+Sm7fKHytJTyQ==
Message-ID: <c319593a-a744-1f1c-6cce-f3eff87ec8e0@cccmz.de>
Date: Thu, 3 Sep 2020 16:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hzh6772lv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Hi,

you are right, I should have added some description. I'm still learning.

Thanks for applying anyway, it's a great motivation for me.

Regards, Tanjeff


On 03/09/2020 09:15, Takashi Iwai wrote:
> On Wed, 02 Sep 2020 11:27:26 +0200,
> Tanjeff-N. Moos wrote:
>>
>> Signed-off-by: Tanjeff-N. Moos <tanjeff@cccmz.de>
> 
> Thanks, applied now.  The added / modified texts are excellent, but at
> the next time, please give some more description in the patch itself.
> An empty patch description is always a sign of a bad patch.
> 
> 
> Takashi
> 
