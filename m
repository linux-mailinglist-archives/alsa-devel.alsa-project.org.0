Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0916D9FF6
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 20:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC52F75;
	Thu,  6 Apr 2023 20:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC52F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680806209;
	bh=BzzXCEBCd4KObCiCKujFYK2DVa8D93Y10970DiU9YgY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YfeSEKDdfx3tbNkE/tkmj1vZ2H9+d7ojpvl5vj8wlgGuZDuUf2Z31oTu+1pmGzO0H
	 aMbkXNS1NV4B6Fv9V70EZ+qbqsHvN6PnNrdeFsFId/1OnCQjRXqN8oW1vhzCUMF1/K
	 QgcdSaNUahtrbk+oKjsOZ7+HUoDGVyG3eV+X+WTI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7140F80171;
	Thu,  6 Apr 2023 20:35:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B36F80246; Thu,  6 Apr 2023 20:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA107F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 20:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA107F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=orange.fr header.i=@orange.fr header.a=rsa-sha256
 header.s=t20230301 header.b=hkPA3xO+
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id kUSTpODywxZmMkUSUpEAxX; Thu, 06 Apr 2023 20:35:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1680806148;
	bh=UZh5/Mo43daJTwcFuQEwoE2zsf6dokq7Oj4UPELT3is=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hkPA3xO+BHGLZ6etPEH/S1JPDsOIS02G9QUIuSSJcdqYm4+pOpc/pyD4KZIjZcPyj
	 4du/rkxggd9KUqW/gWqm09dVgVPSGj/G7iT0Z9YDU+rfkGULbOcevZA0eS793pyNm5
	 nBKkFsYu78JEToy/kcAq4CLH28CnQHkwKJQNfE09Q064sVcP0QKpuE4UGBzQorgLMg
	 ghlq6LOfQvN1dJo2ZybQOJaxS6or4aY+2v5cYoVAmlQ0C4a2/YjjDG7QM4Nn+Wn+OU
	 o+9dT/ckL6stPOPhYE4ZgAgrMJzJR+sESSAiDmQvw8BYfk5Q1MbdcOcFFtQ6RLz5aN
	 MSjeRNUkNmrpg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Apr 2023 20:35:48 +0200
X-ME-IP: 86.243.2.178
Message-ID: <9628fe5d-62c0-b761-967b-357287e99a3e@wanadoo.fr>
Date: Thu, 6 Apr 2023 20:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: RE: [EXTERNAL] Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
References: <20230329100107.8181-1-13916275206@139.com>
 <8d0d0478-1e45-ea52-f1b7-910b747d6282@linux.intel.com>
 <7a0cfa60e2a244168edd49c3d2f6a2bd@ti.com>
 <458d7c2f-bcee-9ec3-e955-9661a06a3349@wanadoo.fr>
 <bbae9e35f2bf4cbcbc78f852041e4b2e@ti.com>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <bbae9e35f2bf4cbcbc78f852041e4b2e@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UM6KPD5OHOV2KBGEIGEBC3XSMNNSCY2C
X-Message-ID-Hash: UM6KPD5OHOV2KBGEIGEBC3XSMNNSCY2C
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu,
 Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 Shenghao Ding <13916275206@139.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UM6KPD5OHOV2KBGEIGEBC3XSMNNSCY2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 05/04/2023 à 13:21, Ding, Shenghao a écrit :
> Hi Both
> I wrote a test code to verify the be32_to_cpu & be32_to_cpup,
> static int __init lkm_init(void)
> {
> 	char test_buf[]={0x12, 0x34, 0xab, 0xbc, 0x56, 0x78, 0xef};
> 	unsigned int *k, p, q;
> 	int i;
> 
> 	printk("Hello, Shanghai!\n");
> 
> 	for (i = 0; i < 4; i ++) {
> 		k = (unsigned int *)&test_buf[i];
> 		p = be32_to_cpup((__be32 *)k);
> 		q = be32_to_cpu(test_buf[i]);
> 		printk("%d: *k = 0x%08x p = 0x%08x q = 0x%08x %ld\n",
> 			i, *k, p, q, sizeof(unsigned int));
> 	}
> 	return 0;
> }
> The output is:
> [ 9109.722548] Hello, Shanghai!
> [ 9109.726287] 0: *k = 0xbcab3412 p = 0x1234abbc q = 0x12000000 4
> [ 9109.727665] 1: *k = 0x56bcab34 p = 0x34abbc56 q = 0x34000000 4
> [ 9109.728553] 2: *k = 0x7856bcab p = 0xabbc5678 q = 0xabffffff 4
> [ 9109.729308] 3: *k = 0xef7856bc p = 0xbc5678ef q = 0xbcffffff 4
> Apparently, be32_to_cpup's output is what I expected.
> Looking forward to your comments. Thanks.

Hi,

thanks for the clarification and code sample.
You are right.

I had in mind that something like: be32_to_cpu((__be32 *)data);
would make it. (thanks to the cast)

But because of the need of "&" and "[offset]", it would just make the 
code unnecessarily complex.

I think that your approach is better.

CJ
