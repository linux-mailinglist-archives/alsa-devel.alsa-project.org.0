Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DF6FC345
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 11:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0323F1102;
	Tue,  9 May 2023 11:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0323F1102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683626129;
	bh=wNt1IuhBtSGoRDfNaAMUqU8T7e4xPf0k8b+iNOTjtlY=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k3TkOd5ixuj9T/DKWiLGpdByxvnraiLmz4VBAuBWrsf645jt3pBu4nqCHChX+Ukns
	 MVxYtH9F1h47cl9POBnCeeIz0U28R0yCYvAQGl8L052W2HcqJkXlP4oZbjAL8zvi+P
	 wkdgyf53RvuyGujGrCrkPNoruElZiNxRPO+RMEUc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 196E3F80217;
	Tue,  9 May 2023 11:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110AFF8032D; Tue,  9 May 2023 11:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94556F80087;
	Tue,  9 May 2023 11:54:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1AD1C11EF;
	Tue,  9 May 2023 11:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1AD1C11EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683626065; bh=jGFFFFuGpYpRjH564c1SG7s4A0TF0GbCq+LSpF0ImhE=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=p/K8EoJo1X4aWgVUgHY4IcUUqy2+xmqAgN/GtNZpy9nxWyNQg+3jBhC62O8nQ1tuP
	 77B54XczLVjiJtgOWWlnvQqNm5ECdIN0joElXxrb60tyEqLia1q0QSkUqC73s6e1de
	 h1gRQfkbF7tso663xpFD0CY0txFOtn6194YyHFnU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  9 May 2023 11:54:19 +0200 (CEST)
Message-ID: <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
Date: Tue, 9 May 2023 11:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de> <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6A4K6JDJQRG7HPJNOOPNCRMYUDMA4IMQ
X-Message-ID-Hash: 6A4K6JDJQRG7HPJNOOPNCRMYUDMA4IMQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6A4K6JDJQRG7HPJNOOPNCRMYUDMA4IMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09. 05. 23 11:37, Mark Brown wrote:
> On Tue, May 09, 2023 at 09:12:55AM +0200, Jaroslav Kysela wrote:
>> On 08. 05. 23 9:52, Takashi Iwai wrote:
> 
> [alsa-devel rewriting mails in a way that renders them useless with b4]
> 
>>> Jaroslav, could you investigate it?  I checked again, and it seems
>>> that all "approved" posts from non-subscribers are modified to the
>>> sender addresses with alsa-project.org.  I guess there must be some
>>> option to prevent it.
> 
>> The answer is DMARC. And the "mangling" applies only to senders which
>> domains have restricted DMARC settings (reject or quarantine) -
>> collabora.com has quarantine. More information:
> 
>> https://lore.kernel.org/alsa-devel/6f003598-4cae-a521-233f-2c19eb439359@perex.cz/
> 
>> I am open to any suggestions, but the default mailman settings (do not do
>> anything) causes that some (mostly gmail) users do not receive their e-mails
>> because the ALSA's mail server has a bad reputation. Many companies are
>> using the google mail service for their domains nowadays.
> 
>> The information is not lost - the original e-mail is just encapsulated (as
>> an attachmnent) to new with the "allowed from" header for DMARC. But yes, it
>> requires some more work (reply to the attachment, update scripts).
> 
> Copying in Konstantin - as I said this is massively disruptive to using
> b4 with anything that's been mangled, to the point where the messages
> are unusable without substantial manual mangling (and signature
> verification fails too).  It'd be more usable to just not have the
> messages from the list getting to lore and manually bounce patches to
> the list.

The signature is correct in the encapsulated original e-mail. The b4 should be 
improved in my opinion.

For example, here is the original message:

https://lore.kernel.org/alsa-devel/168311377075.26.14919941665402646886@mailman-core.alsa-project.org/

As you see, the header and all signatures are correct in the attachment:

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
  unprotected) header.d=collabora.com header.i=@collabora.com
  header.a=rsa-sha256 header.s=mail header.b=HSzFx8Gb

> Is it possible to take steps to improve the reptuation of the ALSA
> servers so this isn't needed, or could we migrate the lists elsewhere (I

It is not possible to talk with gmail administrators. I tried that several 
times. The outgoing ALSA server is not on any spam list.

> know we set up linux-sound@vger at one point with the idea of
> migrating).

I guess that the vger servers have similar issues, because servers with DMARC 
enabled on the ingress side can reject e-mails. It's related to e-mail standards.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

