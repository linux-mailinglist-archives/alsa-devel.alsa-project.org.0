Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F13894B2A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412192368;
	Tue,  2 Apr 2024 08:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412192368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712038578;
	bh=44ajMa6ip820bdujnM/3HdMb6uWjK0gqCV+v3GKvT2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PNiZ+0l6nE/B+axgrNkVcM/SomebjbLF/YjA5R/PHaVjyEpHG1xXwufV84w1O4R3o
	 Pxs0w6GnTwhWUvYkQTfNnSsTHSuA8tQKtYrmWFa1YJi8+KLG+2QGV6yKWHdbsaDNjJ
	 ZejlKIrY9mgJjz7LyCxKJs4h9pcus7vbkv+mOCco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6794EF805A9; Tue,  2 Apr 2024 08:15:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9304F8057D;
	Tue,  2 Apr 2024 08:15:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 018BAF80236; Tue,  2 Apr 2024 08:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93539F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93539F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tKbasdCg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/g1qMMXR
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A272F33A5D;
	Tue,  2 Apr 2024 06:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712038430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iv/fyWF76aNzLXkXj5zg/VBmnOb58Pp9Fu3oxtVHIm4=;
	b=tKbasdCgwlRZSTm6TxA+igjJDysJI/GUokirb8LkTaS6SVgNOSOLfWdLQ1hlpoTjE73dIf
	cRXB+bzDSyDi6WuMkgsoDOXk+2Ovz5vtE2LcC2YmVQbIE69EGjk7xPddc6x7WMbdwGhiU5
	vs3gNVTEYX0NLHJpd3MK2LA3FlHY4CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712038430;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iv/fyWF76aNzLXkXj5zg/VBmnOb58Pp9Fu3oxtVHIm4=;
	b=/g1qMMXRLCb5m5gJyb0yaDUk51EtX0abpDdRPnFuNiDZ3fnhl5Uuh0GFdcQJTuFDKnyvz8
	risxnqwZVcFjKyBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DA8713A90;
	Tue,  2 Apr 2024 06:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id LPp5FR6iC2bcNgAAn2gu4w
	(envelope-from <tiwai@suse.de>); Tue, 02 Apr 2024 06:13:50 +0000
Date: Tue, 02 Apr 2024 08:13:54 +0200
Message-ID: <871q7othp9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dberlin@dberlin.org
Cc: James Schulman <james.schulman@cirrus.com>,
    David Rhodes <david.rhodes@cirrus.com>,
    Richard Fitzgerald <rf@opensource.cirrus.com>,
    Jaroslav Kysela <perex@perex.cz>,
    alsa-devel@alsa-project.org,
    patches@opensource.cirrus.com,
    linux-sound@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add support for 2024 ROG Strix G634JZR
In-Reply-To: <874jckti4o.wl-tiwai@suse.de>
References: <20240401-add-rog-strix-16-g634jzr-v1-1-ac396095409e@dberlin.org>
	<874jckti4o.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.23 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-0.999];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[dberlin.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.66)[82.82%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A272F33A5D
Message-ID-Hash: F4XUK63PQHRIKCU5BKYB3XSKJO5X4F2N
X-Message-ID-Hash: F4XUK63PQHRIKCU5BKYB3XSKJO5X4F2N
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4XUK63PQHRIKCU5BKYB3XSKJO5X4F2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Apr 2024 08:04:39 +0200,
Takashi Iwai wrote:
> 
> On Mon, 01 Apr 2024 16:31:30 +0200,
> Daniel Berlin via B4 Relay wrote:
> > 
> > From: Daniel Berlin <dberlin@dberlin.org>
> > 
> > The windows driver inf says it uses the exact same tunings and setup as the
> > older G634, and then reuses the data for ID 1043:1CAF.
> > 
> > We do the same here.
> > Tested on an actual laptop, sound works fine with this patch plus
> > default fallback firmware.
> > 
> > Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> 
> Applied now.  Thanks.

... and now I see that Luke has another patch that modified the entry
in patch_realtek.c, and I took his version instead.
  https://lore.kernel.org/r/20240402015126.21115-1-luke@ljones.dev

Let me know if this causes problem for you.


thanks,

Takashi
