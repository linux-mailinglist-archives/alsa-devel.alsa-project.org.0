Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56A8BFD3A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:34:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A13741;
	Wed,  8 May 2024 14:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A13741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715171692;
	bh=esIqw22Sxp3Shgj+vmXrJg6z4djBqtaf5dv6kUOAiUk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pwX1uHynituvdUzGZkonTCJtQ5kOoMXa9kJTIm31R4CoCnDjuRJgFiPX3eT3CdE7w
	 NR0aC5eFnZWaaf80t1diaXmgVBqKIkHtAdkl6Y2zeT0WCvDS4i0U70FelQAG7L79yK
	 OlXqyHQMkOvK51L6ZQiZvgi6Hn+G+UwGME37VlYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC1FCF805CA; Wed,  8 May 2024 14:34:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B37BF805B3;
	Wed,  8 May 2024 14:34:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15D12F8049C; Wed,  8 May 2024 14:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11A6EF8024C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 14:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A6EF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=blEmAoso;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xOCJ4Q86;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=blEmAoso;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xOCJ4Q86
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA5503511C;
	Wed,  8 May 2024 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715171632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVSKu4W4KVhMzXX4xEofx0YfF4EXa9Q6R7TG5QsoFWM=;
	b=blEmAosoEOEvDPaRgVdZsQkytu7HHdLplEmQ7f+kJazSNKD82quV44oIwN03KpYL6+Pg3j
	OXeCVO3Nou55SSDpWXzyBomeZdCNyJTBcCjg1Rh6RrNpOJHp5B8z99Dpiue+5k6qgICZLf
	y4IoqseV6xQSAdqwIeClOJpEz9X+jOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715171632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVSKu4W4KVhMzXX4xEofx0YfF4EXa9Q6R7TG5QsoFWM=;
	b=xOCJ4Q86BPQYzp2+QfaR+WtC69VDdb74TTsatjoVvupUxbDIuq5zYkLMYxmGNxalSjoEST
	J0Px1HwWaEhPIUAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=blEmAoso;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xOCJ4Q86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715171632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVSKu4W4KVhMzXX4xEofx0YfF4EXa9Q6R7TG5QsoFWM=;
	b=blEmAosoEOEvDPaRgVdZsQkytu7HHdLplEmQ7f+kJazSNKD82quV44oIwN03KpYL6+Pg3j
	OXeCVO3Nou55SSDpWXzyBomeZdCNyJTBcCjg1Rh6RrNpOJHp5B8z99Dpiue+5k6qgICZLf
	y4IoqseV6xQSAdqwIeClOJpEz9X+jOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715171632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVSKu4W4KVhMzXX4xEofx0YfF4EXa9Q6R7TG5QsoFWM=;
	b=xOCJ4Q86BPQYzp2+QfaR+WtC69VDdb74TTsatjoVvupUxbDIuq5zYkLMYxmGNxalSjoEST
	J0Px1HwWaEhPIUAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DC941386E;
	Wed,  8 May 2024 12:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1AR1JTBxO2YmXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 12:33:52 +0000
Date: Wed, 08 May 2024 14:34:07 +0200
Message-ID: <874jb8cwjk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: hda_component: Initialize shared data during
 bind callback
In-Reply-To: <20240508100347.47283-1-rf@opensource.cirrus.com>
References: <20240508100347.47283-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CA5503511C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: AGNEKQYBV2GOSTSI64VLFUSSDPQXT3PU
X-Message-ID-Hash: AGNEKQYBV2GOSTSI64VLFUSSDPQXT3PU
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 May 2024 12:03:47 +0200,
Richard Fitzgerald wrote:
> 
> Move the initialization of the shared struct hda_component array into
> hda_component_manager_bind().
> 
> The purpose of the manager bind() callback is to allow it to perform
> initialization before binding in the component drivers. This is the
> correct place to initialize the shared data.
> 
> The original implementation initialized the shared data in
> hda_component_manager_init(). This is only done once during probe()
> of the manager driver. So if the component binding was unbound and
> then rebound, the shared data would not be re-initialized.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: fd895a74dc1d ("ALSA: hda: realtek: Move hda_component implementation to module")

Applied now.  Thanks.


Takashi
