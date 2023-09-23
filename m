Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E01967AC0B4
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 12:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A181A4E;
	Sat, 23 Sep 2023 12:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A181A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695465704;
	bh=91r+wbTT8WvDf8trCVVlphqtv4RwSQW7BApURqEvdf0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jh3OScNCZfVmFF8kpuzHxuboj+Va1kzkW35H9BTr0G8YnrbD7FOfIAsXUWjyiGFxI
	 154FtOe0xy1NMbqfCsALJTIXw/vMiLHHuypmVZ8tJcW5PHkQhxBHu2lIY2DgMVpWZL
	 R10wNBKYTX05a7fJm70YbM4NB9hqzF0wNIDmOzRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C85FAF80125; Sat, 23 Sep 2023 12:40:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE43F801F5;
	Sat, 23 Sep 2023 12:40:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 060A0F8025A; Sat, 23 Sep 2023 12:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6465FF80125
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 12:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6465FF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FSgtHip3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xhxIYPE9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A71621EAB;
	Sat, 23 Sep 2023 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695465460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbimSB8hk16DzrgoId36w3oQpvvCBjP8s4L3OrChrwk=;
	b=FSgtHip3luYCViGZovKVWsHSPN0VX2a2blYy/xC+gqljYG62O/00ZSVnxCb0Tnizaowt6M
	LezeQ3fcFIUZiyit2CGchiEsyPdYXt4NBvB1/tjN8Ag+NTcFlEhNOHT9r/Vz5K6R2sUBQI
	w4bZ+ENmioLZxoKlrjXoqImMMoQiIWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695465460;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbimSB8hk16DzrgoId36w3oQpvvCBjP8s4L3OrChrwk=;
	b=xhxIYPE9h96CaZ6x5yIY2m892UkJzxh08cQvg40aBnPpu+kMrOkQaDFSZlyQ08OXb7Xq0W
	J61W5S3knZddCaBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDAB31390B;
	Sat, 23 Sep 2023 10:37:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IS5ROfO/DmUmZwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 23 Sep 2023 10:37:39 +0000
Date: Sat, 23 Sep 2023 12:37:39 +0200
Message-ID: <87fs35b2fg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kees Cook <keescook@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Annotate struct snd_usx2y_urb_seq with
 __counted_by
In-Reply-To: <20230922175046.work.766-kees@kernel.org>
References: <20230922175046.work.766-kees@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: EU3IRERCX3V2WENYW5KT4A66HMTPEWV3
X-Message-ID-Hash: EU3IRERCX3V2WENYW5KT4A66HMTPEWV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EU3IRERCX3V2WENYW5KT4A66HMTPEWV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 19:50:47 +0200,
Kees Cook wrote:
> 
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct snd_usx2y_urb_seq.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied now.  Thanks.


Takashi
