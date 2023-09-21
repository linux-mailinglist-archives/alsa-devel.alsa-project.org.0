Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A57A91A7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 08:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D143822;
	Thu, 21 Sep 2023 08:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D143822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695276699;
	bh=uXWFcbA0PnSkMi+OuL2MO75tad5Ivzpq15Xd3RcHICI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OZ6Noc5iaqaoaZGxNRdsvVlp8lTI7UUzN2va5QqAvdaGgdq4WKwZRIxnrR/pHD2/z
	 kZKKAC1RxSdkPD5+VKBBAwDnLTtyA7+LaY6z2H0jBs4kehfcMO2Iho1OXE5TtBImNU
	 50Yd8DVGn8KYETQMaKBtYjLuofIR4lwmXiCrB5jI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F13F8055A; Thu, 21 Sep 2023 08:10:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF50EF801F5;
	Thu, 21 Sep 2023 08:10:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59AFFF8025A; Thu, 21 Sep 2023 08:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C27E3F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:08:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5DBAE1624;
	Thu, 21 Sep 2023 08:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5DBAE1624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695276502; bh=TX3HwdkmE4MzYgRaFjViDafPL824M36FBOqMSpRbUdQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rJtLwjnfXAu8GhKX2zGs01s96mHJexrISFBXuVSjH20E+PnXUGXfZAA/NMSjwhw7z
	 n4Dxe5RNReB8pVi2bRH84Ayb1wQ9v8UJcUEyYH8mCKrBF4QGSIr9ZM+t/oDFdo7IGw
	 gOHTzmLD5HIP3ChrbllaWNUM6Boer7KBdVaSvVZk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 21 Sep 2023 08:08:03 +0200 (CEST)
Message-ID: <2a3b1a19-1eef-0574-cb24-43432713db3b@perex.cz>
Date: Thu, 21 Sep 2023 08:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 01/11] sound: Fix snd_pcm_readv()/writev() to use iov
 access functions
Content-Language: en-US
To: David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>,
 David Laight <David.Laight@ACULAB.COM>, Matthew Wilcox
 <willy@infradead.org>, Jeff Layton <jlayton@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Oswald Buddenhagen
 <oswald.buddenhagen@gmx.de>, Suren Baghdasaryan <surenb@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org
References: <20230920222231.686275-1-dhowells@redhat.com>
 <20230920222231.686275-2-dhowells@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230920222231.686275-2-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 37EMNGMIOJRR6ZM66EPG5OPVIH3TYCHK
X-Message-ID-Hash: 37EMNGMIOJRR6ZM66EPG5OPVIH3TYCHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37EMNGMIOJRR6ZM66EPG5OPVIH3TYCHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 09. 23 0:22, David Howells wrote:
> Fix snd_pcm_readv()/writev() to use iov access functions rather than poking
> at the iov_iter internals directly.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jaroslav Kysela <perex@perex.cz>
> cc: Takashi Iwai <tiwai@suse.com>
> cc: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Suren Baghdasaryan <surenb@google.com>
> cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> cc: alsa-devel@alsa-project.org
> ---
>   sound/core/pcm_native.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

