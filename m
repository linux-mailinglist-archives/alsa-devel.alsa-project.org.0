Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E87D93A9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 11:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B4EDE5;
	Fri, 27 Oct 2023 11:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B4EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698398945;
	bh=s+FlFaEdqjFN/v85TuuY4R8F2WQjdP1B0jxdUQljhMg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rn/OIkIaahZMpx9PeDWYaKxkMELBeppDITRByK7DwD6ed+R9/jPJrKGyvWkmcZ5Bj
	 09iVXeuZts0UIpH0STsTOADgCug2c7zLyw4MSTKzzW17SIRgvUzL6oH3UkTGjLEnZI
	 41keXzySPYgNhqvo8b/PvGF1MwwuZ4FewkdD4CMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40BAFF80557; Fri, 27 Oct 2023 11:27:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1798F8014B;
	Fri, 27 Oct 2023 11:27:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C898F80165; Fri, 27 Oct 2023 11:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ABF8F8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 11:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ABF8F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=o1A8E+Hq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fOEri0M0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CAA1221ADB;
	Fri, 27 Oct 2023 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698398861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8l7XG7IF12qPA22idso0jBKs3a39vbEIsjf6aRpnkMY=;
	b=o1A8E+HqwlRvZgV+HwDfH2+HqOVy45ei2Y5WhszxYL7izbS03WJ8qX90AyFrKIocFRgCVi
	pTg0/cY//3opUEaOeN6RUZ6gA54qg0zP9pSPXluoXEL+KZ8eWyeVKYE91XClnu2MRp05z4
	df9MhQwCsOxlvxM1djZwKtmAsRA3i74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698398861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8l7XG7IF12qPA22idso0jBKs3a39vbEIsjf6aRpnkMY=;
	b=fOEri0M0V0LzxpQaqG9VFRUqqQTYpNL+AHoTxol/xf1ys3mGuhxe2OX+gDJ2f1CQgge5Nc
	OFyMpt92hcemcMAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D89C13524;
	Fri, 27 Oct 2023 09:27:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xL9/GI2CO2UhWwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 27 Oct 2023 09:27:41 +0000
Date: Fri, 27 Oct 2023 11:27:40 +0200
Message-ID: <87cyx0xvn7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	perex@perex.cz,
	tiwai@suse.com,
	virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org,
	mripard@redhat.com
Subject: Re: [PATCH v4] ALSA: virtio: use ack callback
In-Reply-To: <ZTjkn1YAFz67yfqx@fedora>
References: <ZTjkn1YAFz67yfqx@fedora>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-10.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: MMZOQ7LRZ25JQ7MPWX7JPOTLTTSAIAOR
X-Message-ID-Hash: MMZOQ7LRZ25JQ7MPWX7JPOTLTTSAIAOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMZOQ7LRZ25JQ7MPWX7JPOTLTTSAIAOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Oct 2023 11:49:19 +0200,
Matias Ezequiel Vara Larsen wrote:
> 
> This commit uses the ack() callback to determine when a buffer has been
> updated, then exposes it to guest.
> 
> The current mechanism splits a dma buffer into descriptors that are
> exposed to the device. This dma buffer is shared with the user
> application. When the device consumes a buffer, the driver moves the
> request from the used ring to available ring.
> 
> The driver exposes the buffer to the device without knowing if the
> content has been updated from the user. The section 2.8.21.1 of the
> virtio spec states that: "The device MAY access the descriptor chains
> the driver created and the memory they refer to immediately". If the
> device picks up buffers from the available ring just after it is
> notified, it happens that the content may be old.
> 
> When the ack() callback is invoked, the driver exposes only the buffers
> that have already been updated, i.e., enqueued in the available ring.
> Thus, the device always picks up a buffer that is updated.
> 
> For capturing, the driver starts by exposing all the available buffers
> to device. After device updates the content of a buffer, it enqueues it
> in the used ring. It is only after the ack() for capturing is issued
> that the driver re-enqueues the buffer in the available ring.
> 
> Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Applied now to for-next branch.


thanks,

Takashi
