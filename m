Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F5A788D5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Apr 2025 09:29:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02DA86018D;
	Wed,  2 Apr 2025 09:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02DA86018D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743578976;
	bh=GeEBJRqdVDMbDnd4tKKwaLqLImegAc8CzKZ7gAtO1Hg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HdE4raMc8PWXTbWF9dFmKA73cTFhiaudiUfNwtCFKKzQWsTnp25TTLTLnQCJ41AlG
	 eXcapl0OCj/Xsu78yUdhs34lq5e0jAt8I6jwjaE5nN5yiW+spc+KqAq1UpELEmmgTI
	 FzkPegATSG337KrKE7fi+WkrmCth0gH2ABh5/vA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D999BF805B5; Wed,  2 Apr 2025 09:29:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA6F5F805B6;
	Wed,  2 Apr 2025 09:29:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66AF1F80301; Wed,  2 Apr 2025 09:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70AE4F800AC
	for <alsa-devel@alsa-project.org>; Wed,  2 Apr 2025 09:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70AE4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HMHZcR6R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HoosVOq8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HMHZcR6R;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HoosVOq8
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BC15211AA;
	Wed,  2 Apr 2025 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1743578935;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HMHZcR6R9CU02f9anLF0zC32gE3A024b20/Fjo37c+N+AGnQtHIaEBdkS2F1Za81uSnzeG
	yVWIMoVJvDY7Vd/vceorniPowdkKwQkU0FRip4MQP402EbkWiuaPZghAs0pGKYc1Lh2Q8v
	j4swDRgmkuOorVF1unR9wutfqXs6NZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743578935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HoosVOq8u+xR/sNoeWHlBCtGQYtWnnIb70B1jR3AkiPTaeviTC3YRrVqr5aOQDRYMyRa/w
	ibd/OACeGmsOe5AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1743578935;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HMHZcR6R9CU02f9anLF0zC32gE3A024b20/Fjo37c+N+AGnQtHIaEBdkS2F1Za81uSnzeG
	yVWIMoVJvDY7Vd/vceorniPowdkKwQkU0FRip4MQP402EbkWiuaPZghAs0pGKYc1Lh2Q8v
	j4swDRgmkuOorVF1unR9wutfqXs6NZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743578935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HoosVOq8u+xR/sNoeWHlBCtGQYtWnnIb70B1jR3AkiPTaeviTC3YRrVqr5aOQDRYMyRa/w
	ibd/OACeGmsOe5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BFBF13A4B;
	Wed,  2 Apr 2025 07:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XugPETfn7GfCHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 07:28:55 +0000
Date: Wed, 02 Apr 2025 09:28:54 +0200
Message-ID: <87bjtfyqbt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Support mute led function for HP platform
In-Reply-To: <2c960ab58b4d4090ad4ee075f8cfdffd@realtek.com>
References: <2c960ab58b4d4090ad4ee075f8cfdffd@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: 6ER5HO4JWHKMDQA2WJ4QQWLJPCIVP7XH
X-Message-ID-Hash: 6ER5HO4JWHKMDQA2WJ4QQWLJPCIVP7XH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ER5HO4JWHKMDQA2WJ4QQWLJPCIVP7XH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Apr 2025 05:00:10 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach was fixed mute led no function with HP platform.
> Many Thanks.
> 
> BR,
> Kailang

Applied now.  Thanks.


Takashi
