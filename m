Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A026FD895
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F38611040;
	Wed, 10 May 2023 09:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F38611040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683705093;
	bh=E5lbOITcCYGQhtYyv/GdwQlnp0R36wuWIDmY6+oXSGA=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B7hlou1A0aLnM3xffRnHshOGU3ZaFxMMN/So66yNB48m6hrNk8Y4MUOBqrBpLiddR
	 KQTVMaLXqs1EY2aCgjnmDDTVsWZGfIH4lrhaLyfkCG/tGBPIw28uWb8bErqz5EuAen
	 vKGC9CsYpBYNGf1m0uVzIHDyggHVrPY64BZca7zU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD185F802E8;
	Wed, 10 May 2023 09:50:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCFD1F8032D; Wed, 10 May 2023 09:50:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 71F02F802E8;
	Wed, 10 May 2023 09:50:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D432811D2;
	Wed, 10 May 2023 09:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D432811D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683705030; bh=O7ROJDG1Cr7jeFez+Xpp5NXPOB2XNTdNI/Cu/lLzPec=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=NbDCq5PJjBLpoGTbt137+w9pjL4U8YMzt/5TEPSBVpkRDScLnLSN3+TpjZ++ZtDz8
	 3vGK4cBA7TIG/REcsOFliY5UFS5aWg1VAvWBa4vkQrIgBhg0tPyL7eieCkP8aYeQPB
	 PLf053l5ePPVBdMSfG2wVarGMAbeVgQe5LQG0g5Q=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 10 May 2023 09:50:24 +0200 (CEST)
Message-ID: <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
Date: Wed, 10 May 2023 09:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de> <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de> <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <20230509-mug-private-mess-6a36d2@meerkat>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
In-Reply-To: <20230509-mug-private-mess-6a36d2@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BZO3DPY7PQBI72QKNGVJLWQTORR7LZ4Q
X-Message-ID-Hash: BZO3DPY7PQBI72QKNGVJLWQTORR7LZ4Q
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZO3DPY7PQBI72QKNGVJLWQTORR7LZ4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09. 05. 23 20:22, Konstantin Ryabitsev wrote:
> On Tue, May 09, 2023 at 11:54:18AM +0200, Jaroslav Kysela wrote:
>> The signature is correct in the encapsulated original e-mail. The b4 should
>> be improved in my opinion.
> 
> This is non-fixable. The "mitigations" send messages with a completely
> different message-id, and this breaks pretty much everything. For example, a
> message sent to another list would have the original message-id, but a
> different one if someone retrieves it via the alsa-project subscription. So,
> if someone responds to the message with the bogus rewritten message-id, it
> would be in the wrong place in the thread.
> 
> This is just not usable for patch workflows.
> 
>> For example, here is the original message:
>>
>> https://lore.kernel.org/alsa-devel/168311377075.26.14919941665402646886@mailman-core.alsa-project.org/
> 
> This demonstrates the above problem. This message has a bogus message-id, but
> it sets in-reply-to of the cover letter. Someone sending their reviewed-by
> trailer to this patch would, in fact, send it with the cover letter as the
> parent (meaning it should apply to the entire series).

The tools should be improved IMHO. The capsule contains References: so if 
tools extract the wrapped e-mail to get the original Message-ID:, we're good.

>> I guess that the vger servers have similar issues, because servers with
>> DMARC enabled on the ingress side can reject e-mails. It's related to e-mail
>> standards.
> 
> It is perfectly possible to operate a mailing list server and be
> DMARC-compliant (at least for DKIM-signed messages) without requiring any of
> the horrible things mailman-3 is doing:
> 
> https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html

I wish that it was as easy. I don't see any references to RFCs in this text, 
so we cannot verify the contents. As our mailing list does not modify the 
headers and body, the DKIM is correct for our messages, but it does not work 
practically (the mitigation was turned on recently, so I know how many bounces 
were present).

Also, RFC7960 does not describe this:

https://datatracker.ietf.org/doc/html/rfc7960#section-4.1.3

especially:

https://datatracker.ietf.org/doc/html/rfc7960#section-3.2.3

and see note in:

https://datatracker.ietf.org/doc/html/rfc7960#section-3.2.3.1

So "keep everything unmodified" for DKIM is just only one part of the problem. 
Perhaps, there's a RFC update somewhere which adds another note.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

