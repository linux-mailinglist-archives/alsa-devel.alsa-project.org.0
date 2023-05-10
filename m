Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F566FD759
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8838105C;
	Wed, 10 May 2023 08:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8838105C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683701230;
	bh=MJNQX09rcZP+1Md/HEJbfvkUcTAVa86s9dWv9eX+9r0=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lynT1l9nSJxPp2aDmos3E9mDHiWYHPw9aPRqusTfWrRBIfJLd3OfcmvPGanbVL2lS
	 gDhHJpX+BtzwYVUpUOs4BJcvyKAP2/dn9mQz+lU3ReEGdVCgNAiwd7X4TQYXKQHan6
	 N+GsvowMsF9onV0PvleQEihEED/LJ4DNzywGCXu4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B656F80310;
	Wed, 10 May 2023 08:46:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 209FDF8032D; Wed, 10 May 2023 08:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3A89F802E8;
	Wed, 10 May 2023 08:46:12 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 94E9A11EF;
	Wed, 10 May 2023 08:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 94E9A11EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683701171; bh=GLBh2TE6zcmjHKKOiJKyhBWJbClh8ipKeJfdWI3ai1o=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=2mR/CZdn2CjOzz1djZCYiUZSLBWQ0OcNRrqNIxaN0LaAFaeejBQlEe8sJ5Xg9gXcy
	 wPQ6HqpFSfvUVn2EuLyzbkqaGmDg21tGHEf9dWLsqewcEqvJO+ACmj4LnlksK7anBt
	 eOGHTgtutQDqh81KVtl8kS3Fmk6Mi+AroQnfbTuM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 10 May 2023 08:46:04 +0200 (CEST)
Message-ID: <c20ad4b3-5532-5cb3-993d-8b957eea6e3c@perex.cz>
Date: Wed, 10 May 2023 08:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de> <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFqIGCliFRJ3W/ap@geday>
 <CAGXv+5Eu8Y6PPwJ0iwfSvYMV9TkKqm1G+J=ZM1fw0jZyXUpOBg@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: 
 <CAGXv+5Eu8Y6PPwJ0iwfSvYMV9TkKqm1G+J=ZM1fw0jZyXUpOBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WIZ4AZ5REXXESUVWDNQP3AGN2SBNBPA6
X-Message-ID-Hash: WIZ4AZ5REXXESUVWDNQP3AGN2SBNBPA6
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIZ4AZ5REXXESUVWDNQP3AGN2SBNBPA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10. 05. 23 5:01, Chen-Yu Tsai wrote:
> On Wed, May 10, 2023 at 1:52 AM Geraldo Nascimento
> <geraldogabriel@gmail.com> wrote:
>>
>> On Tue, May 09, 2023 at 09:12:55AM +0200, Jaroslav Kysela wrote:
>>> I am open to any suggestions, but the default mailman settings (do not do
>>> anything) causes that some (mostly gmail) users do not receive their e-mails
>>> because the ALSA's mail server has a bad reputation. Many companies are using
>>> the google mail service for their domains nowadays.
>>>
>>
>> As a GMail user, I can confirm that I'm not seeing any more bounces
>> after mangling started. Usually it'd bounce and I'd have to login to the
>> web interface to turn back on my subscription, a real pain.
> 
> FWIW the dri-devel mailing list seems to implement an alternative strategy
> for dealing with Gmail and co. bouncing messages. If it gets bounces it will
> send a separate "bounce probe" email including details about what bounced.
> It will not just deactivate a subscription due to bounces.

The probes are enabled for the ALSA's mailing lists, but when the incoming 
servers decide to not accept any e-mails (as gmail does), they will be lost.

> Also, ALSA's mailing list now requires a subscriber to register a user
> account to resume delivery is a bit annoying.

I tried to set higher thresholds for bounces.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

