Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095F852BDE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 10:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D65B6A;
	Tue, 13 Feb 2024 10:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D65B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707814995;
	bh=Cp2/D//d9oJ6kVI/b4rFwXYX8Q2luVv1b0auxggxWgM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lLMtw/h20TYcDvORPLnGRCUml8ZfLyeLYDMaKIa25W06az3/QFoq7WI+ywNf1AF4i
	 9XBpdVZTGaERzIdOCIvzGra+LZRTtkDmAIzPB7vEj9e9Q427O1N1dsUyW8Rc/Hs81E
	 J6mIwzQ1OTdmbIJfvbEJ6Lz3Qw2GNyL5nieyGnUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9758AF805A8; Tue, 13 Feb 2024 10:02:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99176F80571;
	Tue, 13 Feb 2024 10:02:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8D58F80238; Tue, 13 Feb 2024 10:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08E1EF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 10:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E1EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DYXo12bp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WmdHBkAl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=DYXo12bp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WmdHBkAl
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C2291FC83;
	Tue, 13 Feb 2024 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707814945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYByJMWSJENI294WTzqFKlK1zuWI9z4p8HRZjVwVQwE=;
	b=DYXo12bpmrf6RewGH3mEm9iDK2kUEepxWUP9+7ie6zH3Ag1PyIU+JOqHNlmvA1hk3E4wvh
	+A76fmpepWL2M/nw1ffjIA63R7frbeExil5bt5D6Q3GgWL5NqVRhSt7YXhyiGnrM5dOxN3
	4sHBtO0QxT2LP9b0+1T31++DlV25064=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707814945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYByJMWSJENI294WTzqFKlK1zuWI9z4p8HRZjVwVQwE=;
	b=WmdHBkAlJegxhasKOc8cBCWBzTUCIj45So1dcBBx+wZ4j9VnyeG7Sh4uZUvFUTsIESECAk
	v/2L2DCDr4DN2cBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707814945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYByJMWSJENI294WTzqFKlK1zuWI9z4p8HRZjVwVQwE=;
	b=DYXo12bpmrf6RewGH3mEm9iDK2kUEepxWUP9+7ie6zH3Ag1PyIU+JOqHNlmvA1hk3E4wvh
	+A76fmpepWL2M/nw1ffjIA63R7frbeExil5bt5D6Q3GgWL5NqVRhSt7YXhyiGnrM5dOxN3
	4sHBtO0QxT2LP9b0+1T31++DlV25064=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707814945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYByJMWSJENI294WTzqFKlK1zuWI9z4p8HRZjVwVQwE=;
	b=WmdHBkAlJegxhasKOc8cBCWBzTUCIj45So1dcBBx+wZ4j9VnyeG7Sh4uZUvFUTsIESECAk
	v/2L2DCDr4DN2cBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7B4413404;
	Tue, 13 Feb 2024 09:02:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n2pJNyAwy2XtUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 09:02:24 +0000
Date: Tue, 13 Feb 2024 10:02:24 +0100
Message-ID: <875xyska8v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
Cc: mst@redhat.com,
	jasowang@redhat.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
In-Reply-To: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
References: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.53 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-2.93)[99.68%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[coverity-bot];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[opensynergy.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: 6RMGJRZUTI4HBY6HBKHBP4LETMWGLL2K
X-Message-ID-Hash: 6RMGJRZUTI4HBY6HBKHBP4LETMWGLL2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RMGJRZUTI4HBY6HBKHBP4LETMWGLL2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 09:51:30 +0100,
Aiswarya Cyriac wrote:
> 
> Fix the following warning when building virtio_snd driver.
> 
> "
> *** CID 1583619:  Uninitialized variables  (UNINIT)
> sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> 288
> 289         break;
> 290       }
> 291
> 292       kfree(tlv);
> 293
> vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "rc".
> 294       return rc;
> 295     }
> 296
> 297     /**
> 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> 299      * @snd: VirtIO sound device.
> "
> 
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")

Thanks, applied.


Takashi
