Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 775816FC044
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 09:14:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24551129;
	Tue,  9 May 2023 09:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24551129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683616442;
	bh=A0xPZgIeDZFPx32s6wJOb0SsT6ZvrFd2u8VpMTI3HJg=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iTIrSdagMjtUFj5NJy+cFXG69CkQbXf1HvYY1sxwfiiKU5KIQZRPzy/CGRq+xwYHm
	 T63quELYkGn3NSKNpcFEGyGiPktyD/P1q5J29W1zydWW2rRv8BzgqLYhYZwJe/CcKB
	 a9nIoLE84lwa/AqttxhpMjFGIFDD9ux8QM5WYeRo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 586BFF80217;
	Tue,  9 May 2023 09:13:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10D06F8032D; Tue,  9 May 2023 09:13:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D533F8014C;
	Tue,  9 May 2023 09:13:01 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A5DD111EF;
	Tue,  9 May 2023 09:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A5DD111EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683616380; bh=kJd//xxuKk8y6k6kDgGap7+7vvkWFwOK7nJKfrjxYnA=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=bn2R+3+chyekCZoEsEO1eoxNZ+onI4euml6zFp16xXtpij1h9dNxwaXUelgyMWJZ3
	 BEHKVkGxRlCKlg1Xd8iLi1zJXTMUyohsEOhpTBlFTlPRm62HLaey40LxftOkyGnguU
	 S8BwSprdshXQdM9CGQyCzP+jR+tUdndwUPWc/8Xc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  9 May 2023 09:12:55 +0200 (CEST)
Message-ID: <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
Date: Tue, 9 May 2023 09:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: <87wn1jdzuq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BO6Y2FNWTHF5O6PR427XZDCMUY5XG7I5
X-Message-ID-Hash: BO6Y2FNWTHF5O6PR427XZDCMUY5XG7I5
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BO6Y2FNWTHF5O6PR427XZDCMUY5XG7I5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08. 05. 23 9:52, Takashi Iwai wrote:
> On Thu, 04 May 2023 09:58:44 +0200,
> Takashi Iwai wrote:
>>
>> On Thu, 04 May 2023 09:35:38 +0200,
>> Takashi Iwai wrote:
>>>
>>> On Thu, 04 May 2023 03:09:45 +0200,
>>> Mark Brown wrote:
>>>>
>>>> Hi,
>>>>
>>>> Here's another mail (one of several in this series) that got completely
>>>> mangled by the alsa-project.org mailman to the point of unusability.  I
>>>> didn't see any response to my last mail about this, is there any news on
>>>> fixing mailman to not do this?  It's extremely disruptive to working
>>>> with lore.
>>>
>>> It seems that alsa-project.org mailman re-sends the post with
>>> xxx@alsa-project.org address sometimes, indeed.  I don't know the
>>> condition, but now I noticed it while checking the pending approvals.
>>
>> And, I guess it happens when a post comes from a non-subscriber.
>> (But not sure whether this happens always...)
>> It waits for approval, but also mangles the sender address and co.
>> This behavior is new after the mail server update.
> 
> Jaroslav, could you investigate it?  I checked again, and it seems
> that all "approved" posts from non-subscribers are modified to the
> sender addresses with alsa-project.org.  I guess there must be some
> option to prevent it.

The answer is DMARC. And the "mangling" applies only to senders which domains 
have restricted DMARC settings (reject or quarantine) - collabora.com has 
quarantine. More information:

https://lore.kernel.org/alsa-devel/6f003598-4cae-a521-233f-2c19eb439359@perex.cz/

I am open to any suggestions, but the default mailman settings (do not do 
anything) causes that some (mostly gmail) users do not receive their e-mails 
because the ALSA's mail server has a bad reputation. Many companies are using 
the google mail service for their domains nowadays.

The information is not lost - the original e-mail is just encapsulated (as an 
attachmnent) to new with the "allowed from" header for DMARC. But yes, it 
requires some more work (reply to the attachment, update scripts).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

