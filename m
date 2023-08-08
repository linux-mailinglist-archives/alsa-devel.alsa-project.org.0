Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04310773A41
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 14:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55EDE84C;
	Tue,  8 Aug 2023 14:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55EDE84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691498855;
	bh=Ct//DwqNdXI6fe/xl51r7bLhiQc1+5/lMRXIqFYX7rI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PLe1B8xLAF7Vlhd/kNw8fqJw6eZEFmUBgfQs8cLRnZpxU2uYl9MiA/KgPErREEkjH
	 yNuLDp2An+GDZ209kR+mW3y6ZgrHSIGRqqMtRNuoLIOqUeOgm1ReRNkHqJ6LZqoZ3l
	 xQ2HsL9lKh8SjL+iIP9UK48EB2/CFYQokFGKcp4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14E68F80578; Tue,  8 Aug 2023 14:46:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B15ACF80551;
	Tue,  8 Aug 2023 14:46:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E9D8F800FE; Tue,  8 Aug 2023 14:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0D53F800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 14:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D53F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LGtjAWgw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HB19ZP5A
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D810D1F45E;
	Tue,  8 Aug 2023 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691498786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTTAM2ewHCdNL83Dn8kQGuHuJBbBf1ARyCINKwKh7S8=;
	b=LGtjAWgwhvMtYdsh4CDF8bs3PBoq9wjj8RAHQINh/lmm6yUz6ZijmsHNnRqme0yIcKDnRc
	avZxRP55eUl0waV2+YyCESxmfOvW7hc9NewyzzzhsfkpFxc77lAjN9fLnQye9M2uLhT/rg
	8bB5FBAsWQJOlhKVBKO2P2TOQqblS7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691498786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTTAM2ewHCdNL83Dn8kQGuHuJBbBf1ARyCINKwKh7S8=;
	b=HB19ZP5A+Ezp68cGH3OplEVuBpjs1Ie0b/cj+gcQ8xZz1TUVn0/dLkDZvuWCuo5nqUzKxv
	SkBij4uGd1YSp8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CE9D139D1;
	Tue,  8 Aug 2023 12:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LfdbJSI50mTxAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 08 Aug 2023 12:46:26 +0000
Date: Tue, 08 Aug 2023 14:46:26 +0200
Message-ID: <87o7jhhfbx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Justin Stitt <justinstitt@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tegra: refactor deprecated strncpy
In-Reply-To: <20230807-sound-pci-hda-v1-1-6d9cdcd085ca@google.com>
References: <20230807-sound-pci-hda-v1-1-6d9cdcd085ca@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7LCI2VKC6LC5Q3U7FXB2Z6GQPRPKP77R
X-Message-ID-Hash: 7LCI2VKC6LC5Q3U7FXB2Z6GQPRPKP77R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LCI2VKC6LC5Q3U7FXB2Z6GQPRPKP77R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 07 Aug 2023 19:49:28 +0200,
Justin Stitt wrote:
> 
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
> 
> It should be noted that the current implementation is unlikely to have a
> bug because `drv_name` is a string literal with a size of 9 while
> `card->driver` has a size of 16. However, it is probably worthwhile to
> switch to a more robust and less ambiguous interface.
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> 
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks, applied.


Takashi
