Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642C7244AE
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 15:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0F182A;
	Tue,  6 Jun 2023 15:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0F182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686058871;
	bh=vEmLnti/HNJdZGPvKrqkln3cxaD2x/GHJ+tzC/0P7vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pEVx0Tm1axT7bgt7zEtzZgIJdVcLSpzSoSVzmWp7lx7pcQZont3PvoXCCn45gbY3l
	 OYZxFUYIVuhxa2KU9gdCUmn7W9+ZJ0QYTa9KeiDIMbenNq5IQJFmc21BPnoKFlzXwG
	 SCd8LqpObqcvYjzpWBegvzGIPl9r1BHg3F/zls/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15995F8055A; Tue,  6 Jun 2023 15:39:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1AC5F80548;
	Tue,  6 Jun 2023 15:39:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C25B7F80549; Tue,  6 Jun 2023 15:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E509F80520
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E509F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Zz66Txsl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z3sYPSSk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 26C4D1FD5F;
	Tue,  6 Jun 2023 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686058784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=462N3FUOdYKZv5klJJlq8qn2E+eAQyYPufKvS8K1hzY=;
	b=Zz66Txsl+K0h46u7myvm5DnhCY+xPElI6UTObP03mw8KGm7+SGOX3DtoB+kXp9onuM22yT
	+F/zY24CGM50fAT6UinKY+yK3HQdjLZ5i0o5xUt7uTjvAMzrIrRa3qrZzUxYCQOdaFgZ3/
	UgeIpK4ZBqBfU09x8q5YsK/TYzWGdbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686058784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=462N3FUOdYKZv5klJJlq8qn2E+eAQyYPufKvS8K1hzY=;
	b=z3sYPSSkXavp/ZYI9IHPbmYQAIgpXrBLFwHeBQXM5MyY20TJRRto6Ad6CPznOd6jU5nbuD
	WZ7SAtJaRSyBlWBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EABF313776;
	Tue,  6 Jun 2023 13:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PWtaOB83f2SuYgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 13:39:43 +0000
Date: Tue, 06 Jun 2023 15:39:43 +0200
Message-ID: <87v8g0g15s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: Re: [PATCH v2 3/4] ALSA: hda: Workaround for SDnCTL register on
 loongson controller
In-Reply-To: 
 <5e1de6145ad6fd32814165f596be38ef03137c8d.1686057365.git.siyanteng@loongson.cn>
References: <cover.1686057365.git.siyanteng@loongson.cn>
	<5e1de6145ad6fd32814165f596be38ef03137c8d.1686057365.git.siyanteng@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6LMZ6WNETDJPBWEGH5DV7QUMPBQBWVQE
X-Message-ID-Hash: 6LMZ6WNETDJPBWEGH5DV7QUMPBQBWVQE
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LMZ6WNETDJPBWEGH5DV7QUMPBQBWVQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 15:25:29 +0200,
Yanteng Si wrote:
> 
> On loongson controller, after calling snd_hdac_stream_updateb()
> to enable DMA engine, the SDnCTL.STRM will become to zero.  We
> need to access SDnCTL in dword to keep SDnCTL.STRM is not changed.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  include/sound/hdaudio.h   | 1 +
>  sound/hda/hdac_stream.c   | 6 +++++-
>  sound/pci/hda/hda_intel.c | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index a1dcc7f97d08..859becb0eaba 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -348,6 +348,7 @@ struct hdac_bus {
>  	bool polling_mode:1;
>  	bool no_intr_polling_mode:1;
>  	bool needs_damn_long_delay:1;
> +	bool access_sdnctl_in_dword:1;

It's worth for the comment here, too.


thanks,

Takashi
