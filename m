Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8972E07C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD36886;
	Tue, 13 Jun 2023 13:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD36886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686654633;
	bh=Nrog8R3HkvBc1WJjncxEVwDEGIhI/2DjfsdHDnS/wZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uIQ1fDSLRUlH/t29dLKLFgFjouQ6zmKREabZteGyIP1A4z8kTQo6dfOV6/aO+tTCi
	 6CKztWYJLJosR3SRe8iBmXs6ZBaPlW6B09s8+OI4mSSZDUK6SvLDL9lWXQO7f3okuF
	 Qb5vCnDzYVf1cn+2ScFOFGVgpfss8qBn12Dpsds0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C23F8F80564; Tue, 13 Jun 2023 13:09:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D0C1F80544;
	Tue, 13 Jun 2023 13:09:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB10F80558; Tue, 13 Jun 2023 13:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95CAEF80548
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 13:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95CAEF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=adfgtSfA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pXegNaIU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9238421F68;
	Tue, 13 Jun 2023 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686654564;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F534bER5ZYUKxtwTTojGuPlpYjHOsiKfFmO5iqx2CGc=;
	b=adfgtSfAfs2U65q67t2fCbt3EsyDXESujfIIPuiqYcPP31oQkLlVJoUtHjOCnkrXyOjjDR
	hvc9Wp5wzCtcD6+lW45c+LkKLphy7vL/09Z3+qekZGF6c5UIWbthDsFZRXbsQpdzD596Dq
	lEVb5dKtmCDLHJmDm28oU2gY2GcHNWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686654564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F534bER5ZYUKxtwTTojGuPlpYjHOsiKfFmO5iqx2CGc=;
	b=pXegNaIU+i2NUmFTLFD+SWQ1S8YmHPln5lve0fiUFLdvkTqz/tgga7MEUepaKOhc/t5hgy
	25ugyfRYZ80sYBDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 708F713483;
	Tue, 13 Jun 2023 11:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id BLpwGmROiGQ5CQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 11:09:24 +0000
Date: Tue, 13 Jun 2023 13:09:24 +0200
Message-ID: <87cz1zehzv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] regmap: maple: Don't sync read-only registers
In-Reply-To: <e04053b2-897c-46fa-bd1f-e455e01c6152@sirena.org.uk>
References: <20230613074511.4476-1-tiwai@suse.de>
	<b86f7b95-f116-4d06-9aca-7195b01dffab@sirena.org.uk>
	<87ilbrejlm.wl-tiwai@suse.de>
	<e04053b2-897c-46fa-bd1f-e455e01c6152@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: UFDZXQCPMZKP6FCR3BER3ZQLP3UPJNZZ
X-Message-ID-Hash: UFDZXQCPMZKP6FCR3BER3ZQLP3UPJNZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFDZXQCPMZKP6FCR3BER3ZQLP3UPJNZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 12:59:27 +0200,
Mark Brown wrote:
> 
> On Tue, Jun 13, 2023 at 12:34:45PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> > > On Tue, Jun 13, 2023 at 09:45:11AM +0200, Takashi Iwai wrote:
> 
> > > This should be in _needs_sync().
> 
> > I thought it's a different logic?  regacahe_reg_needs_sync() checks
> > only whether it's a default value, and other call paths already check
> > regmap_writeable().
> 
> Yeah, but it feels like that's the reason we ran into this issue given
> that you'd expect _needs_sync() to check this too.
> 
> > But I can put the check there instead if you still prefer, too.
> 
> It should avoid any similar issues in future.

OK, then let me cook the v2.


Takashi
