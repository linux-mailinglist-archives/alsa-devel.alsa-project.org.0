Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE176FCD2E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 20:04:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A94F93;
	Tue,  9 May 2023 20:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A94F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683655493;
	bh=/+pf3D1P3cVWgwh5BuEFULDaB515AWFQM8G1gKFJ0T8=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vO6SaYoUdIdizGjPECtEWvrtTLrxdt38ghNkG41Zcors0PMxnfnhEsuXU559Z/+pm
	 ECeuhm+btmBWvpjPAR4MC9SmPc+mitE8QNMUpHos7SwYmHGNkNo4ff10TBiJzsL/N0
	 RiyDfH+VOskGAUe49J07Hf6g9q2P/IH2gbdR4/60=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3401F80310;
	Tue,  9 May 2023 20:04:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24250F8032D; Tue,  9 May 2023 20:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24846F80087;
	Tue,  9 May 2023 20:03:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 479D311F7;
	Tue,  9 May 2023 20:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 479D311F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683655426; bh=BbdiZOCCeosaHGdrhPhqVfkMHGsoKiH1sDi3LMaFju8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=Lz+BUT7mMtYQ80xkJxtJsMKm/TnIE6TQgrskmr4xxfN8rloQUuQt7gdHjfQGyFBZf
	 fqJiehKErrULc8b8Q35NIUwyrZhxs0pGQeL8DiQqsPcOLfPKa6BS8QtNzbMHIPKwp2
	 R4GHiJPkb7R/nzZZZMu0TFcl58hPqSlHKDkmCCN8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  9 May 2023 20:03:40 +0200 (CEST)
Message-ID: <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
Date: Tue, 9 May 2023 20:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de> <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OJBFNHCURGHJLTHW5YQHH3DH6UMNJVZD
X-Message-ID-Hash: OJBFNHCURGHJLTHW5YQHH3DH6UMNJVZD
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJBFNHCURGHJLTHW5YQHH3DH6UMNJVZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09. 05. 23 16:35, Mark Brown wrote:
> On Tue, May 09, 2023 at 11:54:18AM +0200, Jaroslav Kysela wrote:
> 
>> The signature is correct in the encapsulated original e-mail. The b4 should
>> be improved in my opinion.
> 
> It's not b4 that's the issue here except in that it causes me to fetch
> copies of the message that went to the list instead of my inbox which
> didn't get mangled by the list.  git am just does not understand what's

b4 can detect, if the e-mail is wrapped and use only the wrapped message. The 
wrapping is the correct semantics per mailman 3 not mangling (see [1]).

https://docs.mailman3.org/projects/mailman/en/latest/src/mailman/handlers/docs/dmarc-mitigations.html

> happening with attachments.  For example for:
> 
>     168198605952.26.13645408104113633580@mailman-core.alsa-project.org
> 
> if I try to apply it the top of the commit message looks like:
> 
> | commit 8f0e0ee514b189cf7b4e7fa09581e3f1d246fa09 (HEAD -> tmp)
> | Author: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
> | Date:   Thu Apr 20 11:20:43 2023 +0100
> |
> |     ASoC: cs35l56: Remove duplicate mbox log messages
> |
> |     Received: by alsa1.perex.cz (Postfix, from userid 50401)
> |             id 7A47CF80155; Thu, 20 Apr 2023 12:20:56 +0200 (CEST)
> |     X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
> 
> with all the headers dumped in there which is just completely mangled.
> Note the rewritten author.

You should apply the wrapped message not the capsule.

> mutt also represents this incredibly badly, it just shows the
> "attachment" as the body of the message with all the headers dumped in
> like they're just plain text in the body of the mail - I wouldn't have
> thought this was an attachment if it hadn't been mentioned in this
> thread, none of the atacment UI shows.  To reverse the mangling you have
> to view attachments then save the root of the message to a folder.  AIUI
> mutt assumes that whatever the root of the message is is intended to be
> the message body and does the best it can to display it as such.

I think that you can configure the tool to process this attachment in mutt.

> Lore *does* show the body of the message as an attachment.

Yes, the original message is in the attachment - no information is lost.

>> As you see, the header and all signatures are correct in the attachment:
> 
> None of our tooling or processes understand this, they're working with
> the top level message.
> 
>>> Is it possible to take steps to improve the reptuation of the ALSA
>>> servers so this isn't needed, or could we migrate the lists elsewhere (I
> 
>> It is not possible to talk with gmail administrators. I tried that several
>> times. The outgoing ALSA server is not on any spam list.
> 
> I know there is a lot of discussion going round about which hoops to
> jump through to play nice with gmail, I don't know if there's any new
> stuff that's come up there recently.
> 
>>> know we set up linux-sound@vger at one point with the idea of
>>> migrating).
> 
>> I guess that the vger servers have similar issues, because servers with
>> DMARC enabled on the ingress side can reject e-mails. It's related to e-mail
>> standards.
> 
> The issue I'm seeing here is the rewriting which I'm not aware of any
> other lists having turned on, even infradead ones which are also mailman
> based.  Either they're just tolerating people having issues with gmail
> (which seems reasonable TBH) or they're jumping through some additional
> hoops to avoid issues.

I checked infradead and they're using mailman 2. Mailman 2 does not support 
DMARC mitigation.

> I believe vger does sometimes manage some backchannel which probably
> helps it somewhat.

Using a non-standard mechanism is not a big win.

DMARC is a internet standard - see RFC7489, RFC8616. It means that the mailing 
lists cannot send e-mails with From from other domains which have restricted 
policies set by *their* administrators. So basically, all mail servers 
violates this if they keep the From header. Mailman 3 implemented several 
types of mitigations and the message wrap is the best one in my eyes. The 
mangling of the From header or reject e-mails from those senders is even worse 
(see [1]).

When I turn off the mitigation in mailman, my ALSA server will have bad 
reputation for gmail users soon in an unpredictable manner. I also saw that 
ATT incoming mail servers had similar issues. We can expect that the list of 
the ingress SMTP servers not accepting e-mails based on the DMARC policy will 
grow. It's something that we don't have under control.

If we don't find that it's time to move forward and accept this policy, I can 
turn off the mitigation, but in a cost that gmail (and soon maybe other) users 
will bomb me (they already did last years) that the ALSA mail server does not 
deliver e-mails for them. Are we a community on internet or not?

Ideally, we should start upgrade and fix our tools...

Let me just know, if you (and Takashi) insist to turn the mitigation off after 
this discussion. I'll do so...

					Jaroslav

[1] 
https://docs.mailman3.org/projects/mailman/en/latest/src/mailman/handlers/docs/dmarc-mitigations.html

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

