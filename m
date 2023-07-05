Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB174803A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 10:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B66F7F4;
	Wed,  5 Jul 2023 10:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B66F7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688547400;
	bh=hWj85RnTwj8Yfw0b6a4VFE+k4bJTlETMPKn2gxNA2Sc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mhhLHQl4j+6jjPCG3+H+fXClD49Od9pbIfMN+MjMGvf3ogGgtZXz2X1JPvhohsMTF
	 75sMAIxVTt1CSQACPwYCurelIuLMja6uEUk1TLAnXqYViPrAtwBdxpsVp/EVF4TniB
	 +us0kCyDlSOIH+X3QsNGacoajMiIwwfn++xcrzrM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD27DF80124; Wed,  5 Jul 2023 10:55:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ACC0F80124;
	Wed,  5 Jul 2023 10:55:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7757F80125; Wed,  5 Jul 2023 10:55:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C4E2F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 10:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C4E2F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pHWlUw1n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DmtXsj4z
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE0DD1F890;
	Wed,  5 Jul 2023 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688547337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOmyEHyr0iiLqxM6ByyiTsEOHbd3rdaDe+tLZlMSH6U=;
	b=pHWlUw1nB4HYwtHIKr0PUn2rqxsjFSE0f3F8ydhxzB1QeKnkTRzRDN7sANSCxHOVYJ7cux
	Qwt8MaBUPXiDd4Y3FWMdRJQaluoLXy23zatuvkrzMdQ/Us+6O4j4aVdRQGUwtZgZ906LNd
	JpuQAuvakBrf6yH6Q0HTHtHfN1IckM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688547337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOmyEHyr0iiLqxM6ByyiTsEOHbd3rdaDe+tLZlMSH6U=;
	b=DmtXsj4z6R79cwOUnGi7y4vW3e0vTePbBmW0KSucdooEi3NIrfGlfEYw9Tls9ie7/NKO0d
	obFcaQK0WXRn2MCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78692134F3;
	Wed,  5 Jul 2023 08:55:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WsN6HAkwpWRAXAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 05 Jul 2023 08:55:37 +0000
Date: Wed, 05 Jul 2023 10:55:37 +0200
Message-ID: <87a5waohyu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Minjie Du <duminjie@vivo.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	alsa-devel@alsa-project.org (moderated list:SOUND),
	linux-kernel@vger.kernel.org (open list),
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] sound: seq: check struct system assignment problem
In-Reply-To: <20230705085022.13078-1-duminjie@vivo.com>
References: <20230705085022.13078-1-duminjie@vivo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QNHTTBQOZRK2XOZIZ43JYC2NL2BMPXWU
X-Message-ID-Hash: QNHTTBQOZRK2XOZIZ43JYC2NL2BMPXWU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNHTTBQOZRK2XOZIZ43JYC2NL2BMPXWU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 10:50:22 +0200,
Minjie Du wrote:
> 
> make data->system.parm1 avoid double assignment.
> but note writes "RT message with two parameters to UMP"
> is one of assignment is for system.parm2?

Yes, that should be rather parm2.
Could you resubmit with that typo fix instead?


Thanks!

Takashi

> I'm not sure, Could you help check it out?
> Thank you!
> 
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---
>  sound/core/seq/seq_ump_convert.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
> index eb1d86ff6..60e637149 100644
> --- a/sound/core/seq/seq_ump_convert.c
> +++ b/sound/core/seq/seq_ump_convert.c
> @@ -713,7 +713,6 @@ static int system_2p_ev_to_ump_midi1(const struct snd_seq_event *event,
>  				     unsigned char status)
>  {
>  	data->system.status = status;
> -	data->system.parm1 = (event->data.control.value >> 7) & 0x7f;
>  	data->system.parm1 = event->data.control.value & 0x7f;
>  	return 1;
>  }
> -- 
> 2.39.0
> 
