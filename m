Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E517469E5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 08:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5631D7;
	Tue,  4 Jul 2023 08:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5631D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688453179;
	bh=shmpR6gm5vXsvB4VFmbdmXjBfVEwfNNA2R4Ygbbo7C0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N6w/QayrrvyjpWpvszprgtQ/2J4hiL4EE2ffP9w/3CXHzYF8t0vnXmzVyKgygsosq
	 WofY/0+2NXoOz88puPzueTpOu3qjP0IBkpCQKsN4B4IhFOUu+dYHY27dAHnRqkKMt3
	 IGIIYYdPgWqkeJtDhGTVTkdA05PBSjDVp6cNuVtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46FE0F80535; Tue,  4 Jul 2023 08:45:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D928BF80124;
	Tue,  4 Jul 2023 08:45:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C04F2F80125; Tue,  4 Jul 2023 08:44:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DE5EBF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 08:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE5EBF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b/ul64N5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=13gvQGrz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E58C320396;
	Tue,  4 Jul 2023 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688453092;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3TY1HXqvRG42uCsWUg0xN2xuzpLS5ghc3fpZ/gucBFc=;
	b=b/ul64N5E0X5xIPo16bSl1Kz1aL81mQKrvmGZzjFWwAg6/94r06p0Jn46a8S6ABbpizBGc
	8BZAwZkpeINcNonswKuIb5JXw112GjilfiXz8nD4DT1u805n/CxSRfZlOeWXtuDbQULLus
	b/KvSwes5w+G/BQeAAlPsissd63Lr9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688453092;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3TY1HXqvRG42uCsWUg0xN2xuzpLS5ghc3fpZ/gucBFc=;
	b=13gvQGrzFMOe2+BBYQ4svUFR5a7AC/DONy8iOFqIO6xszFdAzh/k9VmL5TyjasPOlwyUE2
	Ux9kZfwJId6kL2Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D8F2133F7;
	Tue,  4 Jul 2023 06:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ErWvIeS/o2SbeAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 04 Jul 2023 06:44:52 +0000
Date: Tue, 04 Jul 2023 08:44:52 +0200
Message-ID: <878rbw41ln.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: tiwai@suse.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tcrawford@system76.com,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	ruinairas1992@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/5] ALSA: hda/realtek: add extra ROOG laptop quirks
In-Reply-To: <20230704044619.19343-1-luke@ljones.dev>
References: <20230704044619.19343-1-luke@ljones.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RZTU43OB34MHJN6AF2FVRB2OXG5536WS
X-Message-ID-Hash: RZTU43OB34MHJN6AF2FVRB2OXG5536WS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZTU43OB34MHJN6AF2FVRB2OXG5536WS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Jul 2023 06:46:14 +0200,
Luke D. Jones wrote:
> 
> - Adds quirks for various ASUS ROG laptops.
> - Fixes up a previous quirk
> - Fixes up a whitespace error
> 
> This introduces a quirk chain that is similar to the ROG Ally quirk chain, but
> due to the verb configs being currently tested these new quirks do not use it
> and instead add a new chain. It is likely the Ally quirk will be removed in
> favour of this new chain in future.
> 
> Luke D. Jones (5):
>   ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
>   ALSA: hda/realtek: Add quirk for ASUS ROG GA402X
>   ALSA: hda/realtek: Amend G634 quirk to enable rear speakers
>   ALSA: hda/realtek: Add quirk for ASUS ROG G614Jx
>   Fixes: 31278997add6 (ALSA: hda/realtek - Add headset quirk for Dell
>     DT)

Now applied all patches.  The subject line of the last patch was
modified to match with the standard.  The Fixes tag was moved to the
right place, too.


thanks,

Takashi
