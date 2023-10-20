Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5E7D1308
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 17:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0061B850;
	Fri, 20 Oct 2023 17:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0061B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697816476;
	bh=t06U0Cmo2wz+zS8kUu1tTdVudYqe+njZVqcMl7nF81Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RHbYZw+Xv9IM18fIj26H3QdqXAFJChvEyvJYwLbsCv0C1LyQZ/R7eDuTplO06TLt+
	 4ePrFCk2zeyOJs4WcKMo7JK9VvOBCKccDEXYRsJREWJpq6GADiJQrB4E6F5U5CRTzR
	 4xJRB6qRX4XQ7T9MrITZeLuQUmR0jdcY/sC+E2Fk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C363F8019B; Fri, 20 Oct 2023 17:40:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBB5F8024E;
	Fri, 20 Oct 2023 17:40:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B3EDF8025F; Fri, 20 Oct 2023 17:40:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6640EF8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 17:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6640EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QZieUCxb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ErmNCx8X
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90983216DA;
	Fri, 20 Oct 2023 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697816415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBOiCf1ts6e1Mx9/ywpHr7mpB+FNQXLt0bueNNbjzqg=;
	b=QZieUCxbGdp99EA2gp+/V3ts9obB90hTTK1RJe1abYBzvSKp2LaHL0VyT3aNbMQIkUlsCU
	oazD0x4uORtp+MuP2FJqRE3qZFP56n/sb3efoy0+FdQp6It81fhq5ycGquKrNyfGcUGB4e
	4NpTTu8zaSj5tH5rCG2IEVM7+WVoN/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697816415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBOiCf1ts6e1Mx9/ywpHr7mpB+FNQXLt0bueNNbjzqg=;
	b=ErmNCx8XB4HdCxlvlA0zOej+yB/mAbkYrYHmw9NNBLT6QVmsOmmxrlu8ASsVhmrzt9Vf2U
	yYPgswV4uVhHaODQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 448D8138E2;
	Fri, 20 Oct 2023 15:40:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id f1vWD1+fMmWSawAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 20 Oct 2023 15:40:15 +0000
Date: Fri, 20 Oct 2023 17:40:14 +0200
Message-ID: <87r0lpi9pd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,	Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,	Guenter Roeck <linux@roeck-us.net>,
	stable@vger.kernel.org,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Brady Norander
 <bradynorander@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Mark Brown
 <broonie@kernel.org>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
In-Reply-To: <20231018235944.1860717-1-markhas@chromium.org>
References: <20231018235944.1860717-1-markhas@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-1.25)[89.59%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,roeck-us.net,linux.intel.com,perex.cz,kernel.org,suse.com,alsa-project.org]
Message-ID-Hash: P46PFM5QLX326D33TY4ADXJCTOUEZQWP
X-Message-ID-Hash: P46PFM5QLX326D33TY4ADXJCTOUEZQWP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P46PFM5QLX326D33TY4ADXJCTOUEZQWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 01:59:31 +0200,
Mark Hasemeyer wrote:
> 
> Some Jasperlake Chromebooks overwrite the system vendor DMI value to the
> name of the OEM that manufactured the device. This breaks Chromebook
> quirk detection as it expects the system vendor to be "Google".
> 
> Add another quirk detection entry that looks for "Google" in the BIOS
> version.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

Applied now.  Thanks.


Takashi
