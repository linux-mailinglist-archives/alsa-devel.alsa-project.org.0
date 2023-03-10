Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F516B4090
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:38:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A423C17F8;
	Fri, 10 Mar 2023 14:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A423C17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678455481;
	bh=aAy0Lj+fHM1y5bA4dye14eUV1gEszDc0S4fp9Vd/pC8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OmwMslKazSygtQ2TUxZPQssbq5+FOWmqwqRGC6ckTzwnkLuBvKOLUHtXg47Vz9Slz
	 NAlv0LbkvUqPfo8WG87wAIPCrc41jnUStUJqu5CyeXYYfa+Pu1xUp9lxJdr27TsSMu
	 yVJ18EgMpAai9xkPq2RueKQEgxhCmhFmTP02ukhE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5447EF800DF;
	Fri, 10 Mar 2023 14:37:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9686F8042F; Fri, 10 Mar 2023 14:37:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7011AF800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:37:01 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F109011C8;
	Fri, 10 Mar 2023 14:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F109011C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1678455420; bh=RinGyNJpsQxHWm4s5hWPI2K0uUCSkIS8RckCaICpbsY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=FR7dvmbrGm/BDXDT4ibTGTUWcBTppgVv4G81sUer/PO7qpUqAlI/a7qWb8PNBVoke
	 Uh72D0I76enE4C7BxWnRQNrLybwEZQxFU6XSA7YuG2Wq2sVrIFg4OlxQi4Cw27Ymyf
	 apUUtUZZ293SF/rKmkCFpB/wPyDu52K7HVZhbT7k=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 10 Mar 2023 14:36:57 +0100 (CET)
Message-ID: <6f003598-4cae-a521-233f-2c19eb439359@perex.cz>
Date: Fri, 10 Mar 2023 14:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: alsa-devel - message mangling?
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
 <167818863631.26.6699494131684260973@mailman-core.alsa-project.org>
 <1232949a-0efd-9814-5587-bb5e0417bf1d@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1232949a-0efd-9814-5587-bb5e0417bf1d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 74TIX76ANYZDWRAEHWRO2LTVGQMFLK4B
X-Message-ID-Hash: 74TIX76ANYZDWRAEHWRO2LTVGQMFLK4B
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74TIX76ANYZDWRAEHWRO2LTVGQMFLK4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10. 03. 23 9:40, Amadeusz Sławiński wrote:
> On 3/7/2023 12:30 PM, Charles Keepax via Alsa-devel wrote:
> 
> Hi Jaroslav,

Hi,

> any chance that you can take a look at mailing list settings, it seems
> like from few days some messages to mailing list come as "Someone via
> Alsa-devel", like in top line, also content is attached as messages, so
> when I clicked reply it didn't quote the email, as message body is
> "empty", because all content is in attachment. You can also see it on
> archives:
> https://lore.kernel.org/alsa-devel/167843595709.26.931771458197876919@mailman-core.alsa-project.org/T/#m543a4c13e2f291684e54807a10ba638d906006de

I've turned on for the testing purposes the DMARC [1] mitigation which 
encapsulates the original message as attachment [2] in mailman 3. The original 
message is not mangled. You should use the attachment as the source for the 
reply. The other mitigation option is to mangle From, but I think that it's 
even worse for the replies.

Note that this mitigation is only for senders which have strict DMARC rules 
(reject or quarantine) in their DNS records like mentioned cirrus.com, 
bootlin.com etc.

It is really difficult to play nicely here. But breaking DMARC rules means 
delivery issues and putting the outbound SMTP server to the reject list (as a 
spam source).

If we cannot live with this settings, I can turn it off, but consider to:

1) ask the senders with the strict DMARC to use another domain
2) work with the attachment (original message) for those senders
3) if the message is not delivered to all members, the purpose of this mailing 
list is lost

					Jaroslav

[1] https://dmarc.org
[2] 
https://docs.mailman3.org/projects/mailman/en/latest/src/mailman/handlers/docs/dmarc-mitigations.html

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

