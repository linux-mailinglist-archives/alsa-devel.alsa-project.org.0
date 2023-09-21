Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37437A9572
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 17:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60851DEC;
	Thu, 21 Sep 2023 17:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60851DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695309091;
	bh=prGNADQo93ELIXAdASLeDBAhOX4uXbNfqgi8cPiF83U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gg/xh5zZzbgY8YGQYQ41/Mi+GLwe5/XN4RBd2186jVg0b5jN/oC87sC70V1C7KY8j
	 6APYzl8+FSY1yrnDGcitkIVtDe7xH8epBieUr/GT59UX4UqE1cw5oU983MUZ8E+kIN
	 dhX285WdTQIYVDNG1uRCTijvuC2T+t4uXj/BSJsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E04BDF80558; Thu, 21 Sep 2023 17:10:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31400F801F5;
	Thu, 21 Sep 2023 17:10:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3356F8025A; Thu, 21 Sep 2023 17:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B75F4F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 17:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75F4F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZhL02ap/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2qhkMIKi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA6873377F;
	Thu, 21 Sep 2023 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695309006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0eTKe2XuZQ29/5KHHLZyTd//jnc11IR/vGdwjTaApTI=;
	b=ZhL02ap/z8114SestHHkj/X32LfJyKAawxzSi0z0cG5UMMNUJBiiNu2hMZWUsXYMllpVFh
	UyZNJU+88gHEteRNtFUBR63qeooUlYAUKVaPHnMGf7j4IJrJOcaQDDKYxLNji+8XKgon3K
	VGgn/dFYKdEq/rEkjPj1gSO+F7d3iMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695309006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0eTKe2XuZQ29/5KHHLZyTd//jnc11IR/vGdwjTaApTI=;
	b=2qhkMIKiIIrhDoE9b1Mqgp7UFDZwFtxXvuHXv20tIduMEA5tO9L4G59EMKri9+VLb4ZJhe
	ZD3xbl4RgNFwitCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39BA1134B0;
	Thu, 21 Sep 2023 15:10:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ccT8DM5cDGUAbgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 15:10:06 +0000
Date: Thu, 21 Sep 2023 17:10:05 +0200
Message-ID: <87sf77y33m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Howells <dhowells@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Christian Brauner <christian@brauner.io>,
	David Laight <David.Laight@ACULAB.COM>,
	Matthew Wilcox <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v5 01/11] sound: Fix snd_pcm_readv()/writev() to use iov
 access functions
In-Reply-To: <809186.1695308608@warthog.procyon.org.uk>
References: <87o7hvzn12.wl-tiwai@suse.de>
	<20230920222231.686275-1-dhowells@redhat.com>
	<20230920222231.686275-2-dhowells@redhat.com>
	<809186.1695308608@warthog.procyon.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VAWQUVAVVYEKY6E2ZJJOOIH6F55HWBL2
X-Message-ID-Hash: VAWQUVAVVYEKY6E2ZJJOOIH6F55HWBL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAWQUVAVVYEKY6E2ZJJOOIH6F55HWBL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 17:03:28 +0200,
David Howells wrote:
> 
> Takashi Iwai <tiwai@suse.de> wrote:
> 
> > Would you apply it through your tree, or shall I apply this one via
> > sound git tree?
> 
> It's a prerequisite for a later patch in this series, so I'd prefer to keep it
> with my other patches.

Sure, please go ahead.


thanks,

Takashi
