Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED83B6663
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 18:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F2A11681;
	Mon, 28 Jun 2021 18:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F2A11681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624896321;
	bh=cp/xqyobOHmx/QqlPaQYSkntN79SYauu4dSvbdyFZwk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l4NxTQYjiMBAT2EDnCs8kqbJrk16IZA8DIkhAG8WbmqYCsYmdtLCduHc8sNetiaxq
	 AV5sMJNKK345SJ8EeXsF/sJ4/TWdsfI/VM1wBp5X5ZDqcehSjTjW/07R7sxnvPf5vX
	 xp9lJ9BTM0P0zXa6cuu03fvAslvVK9n41HNxheug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9355F8012A;
	Mon, 28 Jun 2021 18:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC35BF80229; Mon, 28 Jun 2021 18:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 826C2F8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 18:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826C2F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="qaNuiySb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=d0oLH0yMmNocoX6aVWixqwCRit5ll2P90SYDRMW8gZA=; b=qaNuiySb9526gAc1xGBm1CJzzk
 R3Mwk+kGTZ34YiZSeHkbavkdbDaWIR0eAZIa1A0Aa2NkW2HIj9/2+5bwJxrp6x2tLvS41YkmhbYc+
 kEK9RblyHBBxWInzAU/qUKJ5zKw/68uFPw4HHi3OqsBvo1v24eWo8+dDw4DRn66WGNUWgc2DTaWmq
 Bx3wTWtL4CSVJswbbKjTEw+pBfg9E5I9lSE+9uKPXFIb2twaIFdhw0KTgzr8zuPJ+Ng/p4Sli8CEy
 z6vtoa1kbPjgEcrZCQ9Ws17wP/0/z2MZplf7TiTMEDjYbM6qC7hRVTR6SkemC4GaD69IFmgt5vX5u
 lhef6ddw==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxtjK-008XUh-Eq; Mon, 28 Jun 2021 16:03:26 +0000
Subject: Re: [PATCH] ASoC: atmel: ATMEL drivers depend on HAS_DMA
To: Mark Brown <broonie@kernel.org>
References: <20210530204851.3372-1-rdunlap@infradead.org>
 <9ba0da3b-dbdb-c91d-2def-f3dcd30cbde3@infradead.org>
 <20210628130214.GB4492@sirena.org.uk>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6734cd67-ae14-74f4-a78e-b6a810c1cdec@infradead.org>
Date: Mon, 28 Jun 2021 09:03:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628130214.GB4492@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Bo Shen <voice.shen@atmel.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

On 6/28/21 6:02 AM, Mark Brown wrote:
> On Sun, Jun 27, 2021 at 03:28:59PM -0700, Randy Dunlap wrote:
>> [adding LKML]
>>
>> ping?
> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.

a. The entire email/patch was there. Should I put the ping _after_ the patch?
Would that help?

b. What do you consider a reasonable time?  The patch was sent 28 days
prior to this gentle ping.

> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.
> 

Yes, I shall resend the patch. Thanks.

-- 
~Randy

