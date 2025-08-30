Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C371B3C8E0
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Aug 2025 09:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A03602CE;
	Sat, 30 Aug 2025 09:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A03602CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756539839;
	bh=h3XcFgrNF8Sgup5YIQEI/aLE9bPnfguKvj4TjQMUQac=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jtmbyRMrxK79370s3Td3mcIsaQXsU++4VwDXmEhT9DGF7cnyLxUXZKNEX9yxHk002
	 233SB3WXSZhmKp4sGOfIZLMJsatkPBmz9i57DSzASbs3P4fq8yEjysxUOS2QysvwlG
	 lxE3IptVt1GH7k/h64KUtThGCYN8z6PCVrwo9eIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69599F805D2; Sat, 30 Aug 2025 09:43:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A72F805C5;
	Sat, 30 Aug 2025 09:43:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F98AF8027B; Sat, 30 Aug 2025 09:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11629F80134
	for <alsa-devel@alsa-project.org>; Sat, 30 Aug 2025 09:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11629F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Zt61LiXM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=V/OZoirX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Zt61LiXM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=V/OZoirX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8CA18336BE;
	Sat, 30 Aug 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756539725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oPJMcdjKXkKG89xb2emN+RVyypynR6wa9yGi5gvh1Fc=;
	b=Zt61LiXMPjqbd743gCjs8wn2xudd2/dl+D+MzlNAY+bsHIRYaGOhb/cEF6diQudpLooZ4N
	iRkZZLk5SJGRFtcuYIxanahqR9Zdqv2PNMhLU+yYXthfud3yGxtR0+bsA8EdLxwbK4MmrQ
	5Stbm4h4K9oQU86vkpxnYiGocyByIlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756539725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oPJMcdjKXkKG89xb2emN+RVyypynR6wa9yGi5gvh1Fc=;
	b=V/OZoirXzHPCISSwrbIwlQGloB3A4w0JPWOnKzX4JI7oYcE0b5hu7Jp+8wX3swlejyEFqZ
	VaAjCbI66jE1Q0Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1756539725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oPJMcdjKXkKG89xb2emN+RVyypynR6wa9yGi5gvh1Fc=;
	b=Zt61LiXMPjqbd743gCjs8wn2xudd2/dl+D+MzlNAY+bsHIRYaGOhb/cEF6diQudpLooZ4N
	iRkZZLk5SJGRFtcuYIxanahqR9Zdqv2PNMhLU+yYXthfud3yGxtR0+bsA8EdLxwbK4MmrQ
	5Stbm4h4K9oQU86vkpxnYiGocyByIlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756539725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oPJMcdjKXkKG89xb2emN+RVyypynR6wa9yGi5gvh1Fc=;
	b=V/OZoirXzHPCISSwrbIwlQGloB3A4w0JPWOnKzX4JI7oYcE0b5hu7Jp+8wX3swlejyEFqZ
	VaAjCbI66jE1Q0Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 444A4139B1;
	Sat, 30 Aug 2025 07:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wQgTD02rsmg4HQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Aug 2025 07:42:05 +0000
Date: Sat, 30 Aug 2025 09:42:04 +0200
Message-ID: <87tt1pfe7n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda: tas2781: fix tas2563 EFI data endianness
In-Reply-To: <20250829160450.66623-1-soyer@irl.hu>
References: <20250829160450.66623-1-soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: EFK43HBHROLAEOD26CNYZUAO6E4DIJJE
X-Message-ID-Hash: EFK43HBHROLAEOD26CNYZUAO6E4DIJJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFK43HBHROLAEOD26CNYZUAO6E4DIJJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Aug 2025 18:04:49 +0200,
Gergo Koteles wrote:
> 
> Before conversion to unify the calibration data management, the
> tas2563_apply_calib() function performed the big endian conversion and
> wrote the calibration data to the device. The writing is now done by the
> common tasdev_load_calibrated_data() function, but without conversion.
> 
> Put the values into the calibration data buffer with the expected
> endianness.
> 
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Applied both patches now.


thanks,

Takashi
