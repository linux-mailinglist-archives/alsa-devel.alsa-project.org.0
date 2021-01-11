Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BA42F1CA0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 18:39:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4445C1738;
	Mon, 11 Jan 2021 18:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4445C1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610386762;
	bh=bGI2BNm/iRYclVjeI6i/xtNy6UOu6/aTU2EaoSYObkM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRDPY1YkO7edcsgst8GPG0NC5Wm8M2MEocWDaqk57FC3GrBIJW6hHZiJWtDsuvAbT
	 fMXjnAKZs2PAOcH6yuB3OKmD6u75M3bnfR1rLrX5ggJARL40W4T3+ZJo5RZ3ftkKDC
	 2ZsHuHJHaMFU+Ly/q9emc+jdKu+B7mPvv4wyUOAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5730F80254;
	Mon, 11 Jan 2021 18:37:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F31BF8016D; Mon, 11 Jan 2021 18:37:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4469CF800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 18:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4469CF800BE
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kz18K-0004GW-RF; Mon, 11 Jan 2021 17:37:36 +0000
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in
 variable ret
To: Mark Brown <broonie@kernel.org>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
Date: Mon, 11 Jan 2021 17:37:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111163551.GA33269@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, =?UTF-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

On 11/01/2021 16:35, Mark Brown wrote:
> On Fri, Jan 08, 2021 at 12:35:46PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently when attempting to start the BE fails because the
>> FE is not started the error return variable ret is not initialized
>> and garbage is returned.  Fix this by setting it to 0 so the
> 
> This doesn't apply against current code, please check and resend.
> 

Current ASoC tree now has two commits:

commit 4eeed5f40354735c4e68e71904db528ed19c9cbb
Author: Souptick Joarder <jrdr.linux@gmail.com>
Date:   Sat Jan 9 09:15:01 2021 +0530

    ASoC: soc-pcm: return correct -ERRNO in failure path

commit e91b65b36fde0690f1c694f17dd1b549295464a7
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Mon Jan 11 12:50:21 2021 +0300

    ASoC: soc-pcm: Fix an uninitialized error code

..both set ret to non-zero, which I believe will throw a subsequent
warning messagethat's not strictly related.

my fix was acked by zhucancan@vivo.com, so I'm now confused what is the
*correct* fix.

Colin
