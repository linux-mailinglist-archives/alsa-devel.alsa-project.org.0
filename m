Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C517B7A5315
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 21:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B95A826;
	Mon, 18 Sep 2023 21:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B95A826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695065216;
	bh=Tp/n3MW/fZ1MyfSEEJG6HY6qZy+DiEs4NIFo0fqvaF0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rj2h3ENjM/lfAw3JP8wdQpZF7zjeZkGP4s3HztHuPG1M/CuxXKfZtZ4ArEIBcArt+
	 EnvacbhHnwIGdoA+rHc1RdPz0+xOqtb2RI++af8cXAsN14ctVvJzBSuEL5zb6g4Rjy
	 7BCh2IfFyZgXj3x6AxSSbWrT4vc8dKdhYZvZxbuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5154F80551; Mon, 18 Sep 2023 21:26:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6248DF801F5;
	Mon, 18 Sep 2023 21:26:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 846E8F8025A; Mon, 18 Sep 2023 21:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2D1CF800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 21:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D1CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MR38MTbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=41KJ6LcbdZqGjDW3rkDYYviXldx9YgEr4ngYT/Z6zj4=; b=MR38MTbqx/bZqQzh8zj3D6UTgu
	6NplLBKzC3IV7xy0h4F9CaKjb/a0rHAA+ydyKPTW5+JK5D4q4FIgXZVZKAw7dhHJFgy7W7HYYPU9n
	XUFGxSNzRxCLNhYPCMhLR86qCq9MrAKcgW2a/MGR0eyIk0JEHQVYXK+mtlq19knHg4zIp+J+0Oi+P
	OF05XKlx11z3cnKjGqIaczDWvGiGbeN/7rnzkcyLjpOhocpQRa11/Purm6i671xLRB8DePwyXKz0Z
	HzqqN/Ni4OecVEt5ws5fXxaf5hSKJmyVnR23A0RJ+f+JJuic1FgXmBaUdjMIAYLBKFEs2Io+dL7Ku
	r5OtemMw==;
Received: from [2601:1c2:980:9ec0::9fed]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJsQ-00GBra-05;
	Mon, 18 Sep 2023 19:25:46 +0000
Message-ID: <5baf9fcb-1c53-48b3-8742-ca3c98d82ebc@infradead.org>
Date: Mon, 18 Sep 2023 12:25:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 15 (drivers/mfd/cs42l43.o)
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20230915120127.1bc03420@canb.auug.org.au>
 <fb3f00ab-178c-45cf-ba39-baf61bb3f117@infradead.org>
 <20230918144033.GQ13143@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230918144033.GQ13143@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OJNKJ3QVINDBPSPIF62AWYTWGBIJMYLU
X-Message-ID-Hash: OJNKJ3QVINDBPSPIF62AWYTWGBIJMYLU
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJNKJ3QVINDBPSPIF62AWYTWGBIJMYLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/18/23 07:40, Lee Jones wrote:
> On Fri, 15 Sep 2023, Randy Dunlap wrote:
> 
>>
>>
>> On 9/14/23 19:01, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20230914:
>>>
>>> The btrfs tree gained a conflist against the mm tree.
>>>
>>> The device-mapper tree gained a build failure so I used the version
>>> from next-20230914.
>>>
>>> The kspp tree lost its build failure.
>>>
>>> Non-merge commits (relative to Linus' tree): 5026
>>>  2501 files changed, 391711 insertions(+), 34318 deletions(-)
>>>
>>> ----------------------------------------------------------------------------
>>>
>>
>> on arm64:
>>
>> aarch64-linux-ld: drivers/mfd/cs42l43.o: in function `cs42l43_boot_work':
>> cs42l43.c:(.text+0x19d4): undefined reference to `devm_regmap_add_irq_chip'
>>
>> Using GCC 13.2.0 from kernel.org crosstools.
>>
>> Full randconfig file is attached.
> 
> Who is the intended consumer of this report?
> 

I Cc-ed the driver maintainers and the subsystem maintainer.
However, I missed Cc-ing the person who git blame identifies
for this patch. (added now)

> Are you planning on following up with a patch?

Sure, I will do that.

thanks.
-- 
~Randy
