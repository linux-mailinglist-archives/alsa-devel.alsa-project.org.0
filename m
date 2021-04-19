Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489B36496E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 20:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714ED852;
	Mon, 19 Apr 2021 20:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714ED852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618855331;
	bh=FwzpbGqjBuOU3EFSirPcsvbacZ72ZoZ4c7lUCxeVdvM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDSQvnpLYRDlKzKubwvWQz5DhIDhB7xfSQPjQ1Poe/MHJ1iEgp+ACAkXK/ko1tOB7
	 IKYktfl/f8q4dlFeyfI5W701VA0cnKhdy0lTxeWd3laov1GCPF8t4bxmnEknLUEADi
	 Lo2LTqn5lXluZe5D76lVVNdnJlSSIKgCuxNhN+Oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A1DCF80164;
	Mon, 19 Apr 2021 20:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 008B9F80227; Mon, 19 Apr 2021 20:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27143F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 20:00:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7A763A003F;
 Mon, 19 Apr 2021 20:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7A763A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618855228; bh=w9w+cJOWT0A5VvleL7N9i0AyF57FteA4i24jXuvgHTw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=nsm/fFUAEhZeCMAXl9Pvn6FPM2qFNDz6/Nixa4sdDBaCpNtu15mXh9Pm5ySie4D4/
 +iBu7pqcO4bcoujIN1qyb08BXW0YZNWgNLJjfC4KfdjUSLtc1jLqkm0yCiG+JrIAzT
 Tz5tFrYBAOjZ1iKnF8yzUXdnZ2NEi1UurYC6k3E8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 19 Apr 2021 20:00:25 +0200 (CEST)
Subject: Re: [PATCH v6] sound: rawmidi: Add framing mode
To: David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210419164023.159967-1-coding@diwic.se>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3e6e0cf6-bf65-4e17-5a45-4bc2665abfef@perex.cz>
Date: Mon, 19 Apr 2021 20:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419164023.159967-1-coding@diwic.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 19. 04. 21 v 18:40 David Henningsson napsal(a):
> This commit adds a new framing mode that frames all MIDI data into
> 32-byte frames with a timestamp.
> 
> The main benefit is that we can get accurate timestamps even if
> userspace wakeup and processing is not immediate.
> 
> Testing on a Celeron N3150 with this mode has a max jitter of 2.8 ms,
> compared to the in-kernel seq implementation which has a max jitter
> of 5 ms during idle and much worse when running scheduler stress tests
> in parallel.
> 
> Signed-off-by: David Henningsson <coding@diwic.se>

Nice. Thank you.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>


> @@ -1534,6 +1607,7 @@ static __poll_t snd_rawmidi_poll(struct file *file, poll_table *wait)
>  /*
>   */
>  
> +
>  static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
>  				       struct snd_info_buffer *buffer)
>  {

This is probably a typo chunk?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
