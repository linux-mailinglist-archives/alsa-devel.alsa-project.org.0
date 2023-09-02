Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B5B79054A
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 07:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A0D741;
	Sat,  2 Sep 2023 07:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A0D741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693633068;
	bh=8o7cvGLe+z77t3Y1h1UNmdHueNdKn02gQA5hcc5WNVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXWBc8A84AV5vTVzB5MZ2ZEqfzw5q4okDrFnF9thkqbbn3hQNgrvh+KE8b1p8Szjl
	 jdXTCyiZH/VRQlFZVnIEFbgk2OHOzfqGVRMN+xw8SudPvxQgYbLe+PJP5GV+EbwlLh
	 A0mViQSu6Z9k2wU8iBUygehDscpQd4Oxu/3qs0Jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F43AF8032D; Sat,  2 Sep 2023 07:36:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF49F8032D;
	Sat,  2 Sep 2023 07:36:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B02F804DA; Sat,  2 Sep 2023 07:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55580F800F5
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 07:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55580F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256
 header.s=zeniv-20220401 header.b=scBXjhLb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k+4m61B+T03hiC954QP7GIZExi9kv0zhekPgpjawNLA=; b=scBXjhLbYBOZaH7N/THyCiY+6L
	kCQlrczQODtFSUayXdP0gL3FV2flKOeSoHpX/up4VpcxSfAWJjttw+B9pDW42S8gUzBONdDtSRpf9
	mWaSf1iObrw0efiM3bXielVVq7C1u/Ti7IgJ+CXZPkCgW8hYKX6fPDEVHS5MSih/th6TfeoALLtRX
	yn3EtVcHY1DjfPPh90vz/L6adXrbjjCjAAh95/483aq0oHK+heFjfS4MiSqo1cNjRk1CfvY0o/bCa
	senv2C9z+L2ZZpBFnVZHAaWJe1Mduv4aE77+KO1istkR1ifgaHKiBx7XBkKNfvoiunWGcjKqTnnQI
	LyuYexqA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux))
	id 1qcJJP-002kzQ-01;
	Sat, 02 Sep 2023 05:36:47 +0000
Date: Sat, 2 Sep 2023 06:36:46 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/25] ALSA: emu8000: Convert to generic PCM copy ops
Message-ID: <20230902053646.GK3390869@ZenIV>
References: <20230815190136.8987-1-tiwai@suse.de>
 <20230815190136.8987-7-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815190136.8987-7-tiwai@suse.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
Message-ID-Hash: GGK4LW7WCFWLXMGCG4BMPYO3S5I4JGEH
X-Message-ID-Hash: GGK4LW7WCFWLXMGCG4BMPYO3S5I4JGEH
X-MailFrom: viro@ftp.linux.org.uk
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGK4LW7WCFWLXMGCG4BMPYO3S5I4JGEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 09:01:17PM +0200, Takashi Iwai wrote:
> +		else if (copy_from_iter(&sval, 2, iter) != 2)		\
> +			return -EFAULT;					\

copy_from_iter_full()?

> -static int emu8k_pcm_copy_kernel(struct snd_pcm_substream *subs,
> -				 int voice, unsigned long pos,
> -				 void *src, unsigned long count)
> -{
> -	struct snd_emu8k_pcm *rec = subs->runtime->private_data;
> -
> -	/* convert to word unit */
> -	pos = (pos << 1) + rec->loop_start[voice];
> -	count <<= 1;
> -	LOOP_WRITE(rec, pos, src, count, COPY_KERNEL);
> +	LOOP_WRITE(rec, pos, src, count);
>  	return 0;
>  }
>  
> @@ -483,16 +456,15 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
>  	/* convert to word unit */
>  	pos = (pos << 1) + rec->loop_start[voice];
>  	count <<= 1;
> -	LOOP_WRITE(rec, pos, NULL, count, FILL_SILENCE);
> +	LOOP_WRITE(rec, pos, USER_SOCKPTR(NULL), count);

USER_SOCKPTR?
