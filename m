Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED6960295
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 08:57:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B6E3E;
	Tue, 27 Aug 2024 08:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B6E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724741844;
	bh=8lsD7Q1hz5lFMVJbuyOlrc8gkWZXzeCeEaNeT/7GnB4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i3tDrP93KzQ4AOA+/VLDaGREbT+U07VAcKHZargSyi12gHGN56YnC5sMjOKH2vygm
	 0OM7qSfc2sDiS/aQZ0G0zh19iA/n7yyOOotlRmTUTlnI0OJ0302HcXvpHomSKwpYKF
	 Z6A3htDxKD6bPZeJtaikviiyKxAlMZztLjPqxKN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9270CF805B0; Tue, 27 Aug 2024 08:56:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D728FF805AE;
	Tue, 27 Aug 2024 08:56:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F10FF80423; Tue, 27 Aug 2024 08:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37B11F80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 08:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B11F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=eYm1yqY3;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=Agi4i3qO
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 0EC421892BF;
	Tue, 27 Aug 2024 08:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1724741215; bh=8lsD7Q1hz5lFMVJbuyOlrc8gkWZXzeCeEaNeT/7GnB4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eYm1yqY38agtjU/hYWyxMxLHNLI54uDG5Lq/HVHWbiBMdcYLnyQ9srdHXXrxWn7B7
	 IqbFASr03eNJtDiF5XIXNo3YuiwbDxM3xfNTtIOP7TIkb4tDAqMjJ7ORFbi1+lj6Rq
	 6eEjFAjHdQdP/Y0pPKkL2XvPDYJuUr8ZqNcZpXIw=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csVXvdnT-3CS; Tue, 27 Aug 2024 08:46:54 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 578AF189F0A;
	Tue, 27 Aug 2024 08:46:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1724741214; bh=8lsD7Q1hz5lFMVJbuyOlrc8gkWZXzeCeEaNeT/7GnB4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Agi4i3qOdpioply7fzJve5mPbDmlSbOYqytZYRGPNg8OEmUEm5hC6/k/9HksiynqB
	 cVbnvFpYL3i/ckPpUbvTXeeuJYME8cImv/OQHuUXTdDADaImIV9agMZZXnyeZQOnQE
	 kmXdRErVAzTxTZgNU++GvlogXvy4ZipN8sUGVAtk=
Message-ID: <5c2b3590-fb0e-d422-c9fe-b1ee9fae83f2@ivitera.com>
Date: Tue, 27 Aug 2024 08:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Specifying supported hw params (channels, format, etc.) by the
 plug plugin in alsa config?
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <24c2052b-607d-3f2a-8733-0aa67bcde874@ivitera.com>
 <2b9a0040-960a-4dbb-b8de-13b5c271dac1@perex.cz>
 <42070a30-18e1-373e-aff6-9dbab9a5241f@ivitera.com>
 <06096d0a-34c6-4255-a16b-d2c8e28e7ff6@perex.cz>
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <06096d0a-34c6-4255-a16b-d2c8e28e7ff6@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6DPWP2I2ME6IA5J2L4GRKROO6INB5PHL
X-Message-ID-Hash: 6DPWP2I2ME6IA5J2L4GRKROO6INB5PHL
X-MailFrom: pavel.hofman@ivitera.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DPWP2I2ME6IA5J2L4GRKROO6INB5PHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26. 08. 24 18:06, Jaroslav Kysela wrote:

> 
>> I am looking for restricting the params offered by the plug plugin to
>> upstream.
>>
>> Sometimes it's useful to fix the input channels or sample format, while
>> keeping the plug conversion capabilities. An example is the a52 plugin
>> which accepts only non-interleaved access. For clients which support
>> only interleaved access (e.g. java alsa interface), the plug will do the
>> conversion, but will also obscure the fact that a52 works with 6
>> channels and S16_LE, runs preferrably at 48kHz, etc. Yes, it will any of
>> the conversions necessary, but sometimes the client would prefer knowing
>> the optimal format instead.
> 
> It would be better to use 'copy' plugin instead 'plug' in this case to
> do just interleaved/non-interleaved stream conversion.

Excellent, that works perfectly for this case. I always wondered about
purpose of the copy plugin :-) Thanks a lot!

With regards,

Pavel.
