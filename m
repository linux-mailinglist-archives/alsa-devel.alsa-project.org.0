Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E25133043CD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 17:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78EE9178E;
	Tue, 26 Jan 2021 17:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78EE9178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611678429;
	bh=Bu2gc5t7Jh+9/zGZt7NTws96wkz4P2PGM9gm6sKuYYw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRXTDwk11Nj86JCdhLVpn5AiUsL+j3vJw/Qhn8Ey43+c6JIoDWYDAIgj2YuJO9yUW
	 w4ZjgQDuefFeTpB7YLFCHTIswTtZc058j2y8Ys/KMfOqTmqafWkrUIVHtsBtbG0hD5
	 Xs2LvnW1zmzA0yR+zXFCB6GMTuQGlw5emid3e+Uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847B1F801D8;
	Tue, 26 Jan 2021 17:25:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8059F8015B; Tue, 26 Jan 2021 17:25:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F6CBF80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 17:25:28 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B1CFDA003F;
 Tue, 26 Jan 2021 17:25:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B1CFDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611678327; bh=a2PgN3YdDHwQmitV+sYcJiXcEIRYvKq37r80vVNIqg8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nFp1KrPivOhi0Ar9H9JgNXSSzpJdjSt1b+O4FNTiYFBOjTs90xefzNpdRL8vUYa68
 7mDAUZQNtazFNH6jy3qtDf42bJmT9ehXn3PNVFNARpu9RxHyTxUzddu4FjAZabj5k2
 hjXflGODCxs8HxbicjxPsNPfNVplNi/zEg/PjMKA=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 26 Jan 2021 17:25:24 +0100 (CET)
Subject: Re: [PATCH] ALSA: control: expand limitation on the number of
 user-defined control element set per card
To: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210122082032.103066-1-o-takashi@sakamocchi.jp>
 <s5h35yt83uf.wl-tiwai@suse.de> <20210123031025.GA118864@workstation>
 <s5h8s8k6mtf.wl-tiwai@suse.de> <20210124055225.GA132211@workstation>
 <s5ho8he6ah4.wl-tiwai@suse.de> <20210125005619.GA137024@workstation>
 <s5hft2p5w89.wl-tiwai@suse.de> <s5h7dnz1yik.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <48c7c194-dca6-a951-d47a-633def33c2cc@perex.cz>
Date: Tue, 26 Jan 2021 17:25:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5h7dnz1yik.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 26. 01. 21 v 16:57 Takashi Iwai napsal(a):

> @@ -1226,11 +1227,18 @@ struct user_element {
>  	struct snd_card *card;
>  	char *elem_data;		/* element data */
>  	unsigned long elem_data_size;	/* size of element data in bytes */
> +	size_t alloc_size;		/* allocated size */

I think that introduction of this new member is not required. The allocated
size can be easily computed at runtime (function).

> @@ -1397,6 +1414,7 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
>  
>  	ue->priv_data = names;
>  	ue->info.value.enumerated.names_ptr = 0;
> +	ue->alloc_size += buf_len;

The buf_len variable is the remaining count. The
ue->info.value.enumerated.names_length already contains allocated bytes. This
code can be elimited if alloc_size is not introduced.

Thank you for this patch.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
