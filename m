Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BA75189A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 08:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6292C207;
	Thu, 13 Jul 2023 08:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6292C207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689228570;
	bh=NOhp7FDl3h9X8XDbZa9Fi93rAZ3wvCUUl+zxnfDSgLA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u1xfvIHEfPPdXfLDu8EsQgOGwL/IcFRchAq9iG9zI+8z6x1jeSRu+iw500PDtPPN6
	 IdX1hnKQs8XgNiXFd7JYW/5NKItwm5APH3CslF89POLYZOwAhXaIncbkb5BYzCsXMk
	 DKXZuBwlQVW6JALUy613SsndKMDCh5kqBFNA/u9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA92F800E4; Thu, 13 Jul 2023 08:08:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FE04F80236;
	Thu, 13 Jul 2023 08:08:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E53F80236; Thu, 13 Jul 2023 08:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49143F80236
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 08:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49143F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dXrwWQhM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Z4SirNNw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 60D741F8D9;
	Thu, 13 Jul 2023 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689228510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LQjoMOuDYWVyTBw8okmanAfIbcPTrQ1gl3sbWKCUhxY=;
	b=dXrwWQhMGcSaIhgFB3ZwGALWDt+omPHExLwdA0WE+EtnfRANm34FO5HMLxboq2ltsVweMi
	Dx1JeRQkaLZUwtscJr+IaFiies7a6gZabZirJzbmRR0OlglOCdzFbmrAkhyXlhrQHm3wnq
	c5F6pQZ+dvU5yg1zV8hsX7DuOx4If3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689228510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LQjoMOuDYWVyTBw8okmanAfIbcPTrQ1gl3sbWKCUhxY=;
	b=Z4SirNNwXt4OQsKULKDcn4lRQ0PduBGfu7fDJ8kJ+dBfF2/Rv8JRLD32QJIQ9azxu+GY3L
	hvXnKSO0lraYG8Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24259138ED;
	Thu, 13 Jul 2023 06:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YPLaB96Ur2TrOAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 06:08:30 +0000
Date: Thu, 13 Jul 2023 08:08:29 +0200
Message-ID: <871qhcgx7m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] selftests: ALSA: Fix fclose on an already fclosed
 file pointer
In-Reply-To: <20230712140122.457206-1-colin.i.king@gmail.com>
References: <20230712140122.457206-1-colin.i.king@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: NPOVPV2SQIYJYXXVKRNCXJNS7523AYUY
X-Message-ID-Hash: NPOVPV2SQIYJYXXVKRNCXJNS7523AYUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPOVPV2SQIYJYXXVKRNCXJNS7523AYUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 16:01:22 +0200,
Colin Ian King wrote:
> 
> In the case where a sysfs file cannot be opened the error return path
> fcloses file pointer fpl, however, fpl has already been closed in the
> previous stanza. Fix the double fclose by removing it.
> 
> Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, applied.


Takashi
