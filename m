Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A676D9136
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 10:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA82836;
	Thu,  6 Apr 2023 10:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA82836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680768603;
	bh=2RcXY2oO93mm0JtWNdG2Ouvh5Du1cRq3kk+qEa5CrFw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h9WcENHpyGZOpQyrD3hGvCrpxVfsjH37nIU5SvVkorT/LjcYzw5BY8JlD2wRZ+iLy
	 9txU+NennwvLQLbPNrgC5D2O12vtQgEU3wkJsIWVkPTEYoMIASeILZ6ylfG9ZgW/k1
	 P/0tsU9id/K2rJEMhIFNYb5kP9e1N6Avm1QH8c0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EDFF80149;
	Thu,  6 Apr 2023 10:09:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 350EEF80246; Thu,  6 Apr 2023 10:09:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B441F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 10:09:03 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5FE0A11D5;
	Thu,  6 Apr 2023 10:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5FE0A11D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1680768542; bh=/TLojvzWDIUUy0CijBGfwhAg+77Da3/JbI5/KgXe1zI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQSXIV5Za3IcOlIKkoGsk3LbI8Iu7jx71M2QQ59F7tXOfqQhHWxficfBCsqhJZ621
	 J3BjHt6UseUTnA0A551dB20Cv1XBzNvALtEgTLQv/Sh9xYRAOa27yZT9OQr3nCGbMX
	 R6ZwIbsEcnJA5MZhJUlummIP3u4nrJgNiLOxSqu0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  6 Apr 2023 10:08:59 +0200 (CEST)
Message-ID: <119dd23f-8cb2-3a64-fc16-8429ca029983@perex.cz>
Date: Thu, 6 Apr 2023 10:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] docs: sound: hda: drop mentions of hda-analyzer
To: Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230405201220.2197848-1-oswald.buddenhagen@gmx.de>
 <87v8i9v8h5.wl-tiwai@suse.de>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87v8i9v8h5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HZALPIXEOBZHP66ER7TP3GQUWE7YA5TF
X-Message-ID-Hash: HZALPIXEOBZHP66ER7TP3GQUWE7YA5TF
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZALPIXEOBZHP66ER7TP3GQUWE7YA5TF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06. 04. 23 8:19, Takashi Iwai wrote:
> On Wed, 05 Apr 2023 22:12:20 +0200,
> Oswald Buddenhagen wrote:
>>
>> It's gone from the repos, presumably because nobody ported it to
>> Python 3.

The "gone" is no longer true. The gitweb was misconfigured on the ALSA server 
after upgrade.

We have also preliminary python3 work at 
https://github.com/alsa-project/alsa-utils/issues/134 .

I merged those changes and did some cleanups so the code can run with python3 
now. I suggest to remove this doc change (drop this patch).

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

