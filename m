Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1AE84F585
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 14:02:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B67184C;
	Fri,  9 Feb 2024 14:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B67184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707483767;
	bh=uk+kzoCASqZmZnqekuxPV+sUaNOX7ZH8i3a3pm1Ynl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FPltO1M0x2n3EBJm25/gN2pNvNN7QgmaXs5tyy73+XyXzKVI5h7E/SIg0k3nLl2Fw
	 TCaU/9F76iNgh69X5fE3ta3PU6knLpQ37AwxWNn54EQfZfqNnoMqZjcc+lIZJB0Tjr
	 +lW40I1ivZa1ZGRUXa9t3hPHNfCjtXigmG8Qomus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44839F805B0; Fri,  9 Feb 2024 14:02:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF56F8057F;
	Fri,  9 Feb 2024 14:02:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CB23F801EB; Fri,  9 Feb 2024 14:02:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F6BEF800EE
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 14:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F6BEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EHaT4ps2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=k6O7++Wk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=EHaT4ps2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=k6O7++Wk
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F02C1FD40;
	Fri,  9 Feb 2024 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707483717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4y8iC/kwLc3EVquXaBjRInwt4CwoNth/+iK0Wr9bVro=;
	b=EHaT4ps2bfpx1hA7NW0CjjJNjkF5/gt2qgNiYwAUWM4u1GN6nu4WYvzx48rn+PnC5Cods8
	wscVgB3U2Wcx+2RwDEEHNnJm2DxMNPFP9sL144Oo1zfk95nFFObfdvCr3diyVvKrlfdW1X
	pirv5kpUXBHz4OeK2r1vgB2dg+V8xt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707483717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4y8iC/kwLc3EVquXaBjRInwt4CwoNth/+iK0Wr9bVro=;
	b=k6O7++WksDAnfAqyU4ldkaMrHp4IV186RM0LQhBHcndxZnsOLi48imfcD667AXtBhh1f3S
	ZwgOYUcYKhTBsBAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707483717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4y8iC/kwLc3EVquXaBjRInwt4CwoNth/+iK0Wr9bVro=;
	b=EHaT4ps2bfpx1hA7NW0CjjJNjkF5/gt2qgNiYwAUWM4u1GN6nu4WYvzx48rn+PnC5Cods8
	wscVgB3U2Wcx+2RwDEEHNnJm2DxMNPFP9sL144Oo1zfk95nFFObfdvCr3diyVvKrlfdW1X
	pirv5kpUXBHz4OeK2r1vgB2dg+V8xt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707483717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4y8iC/kwLc3EVquXaBjRInwt4CwoNth/+iK0Wr9bVro=;
	b=k6O7++WksDAnfAqyU4ldkaMrHp4IV186RM0LQhBHcndxZnsOLi48imfcD667AXtBhh1f3S
	ZwgOYUcYKhTBsBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 491D71326D;
	Fri,  9 Feb 2024 13:01:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZkR2EEUixmVgVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Feb 2024 13:01:57 +0000
Date: Fri, 09 Feb 2024 14:01:56 +0100
Message-ID: <877cjd23ln.wl-tiwai@suse.de>
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
	Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [v2 PATCH 0/1] ALSA: virtio: add support for audio controls
In-Reply-To: <20240115133654.576068-1-aiswarya.cyriac@opensynergy.com>
References: <20240115133654.576068-1-aiswarya.cyriac@opensynergy.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[44.43%]
Message-ID-Hash: B5FVJIN7IV3KCTMZ6DNV5SBXYUNXO2QM
X-Message-ID-Hash: B5FVJIN7IV3KCTMZ6DNV5SBXYUNXO2QM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5FVJIN7IV3KCTMZ6DNV5SBXYUNXO2QM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Jan 2024 14:36:53 +0100,
Aiswarya Cyriac wrote:
> 
> From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> 
> Changes in v2
> - Fix reporting of incorrect number of items for ENUMERATED controls
> 
> Implementation of support for audio controls in accordance with the
> extension of the virtio sound device specification[1] planned for
> virtio-v1.3-cs01.
> 
> Design　of virtual audio controls is based on and derived from ALSA
> audio controls. It allows the driver to perform all standard operations,
> such as reading and writing audio control value, as well as working with
> metadata (represented in the TLV form).
> 
> The driver part was tested on top of the Linux 5.10 kernel.
> 
> As a device part was used OpenSynergy proprietary implementation.
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202104/msg00013.html
> 
> Anton Yakovlev (1):
>   ALSA: virtio: add support for audio controls

Applied now.  Thanks.


Takashi
