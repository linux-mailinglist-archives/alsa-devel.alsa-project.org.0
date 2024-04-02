Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41C894B9B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:41:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB13E23CD;
	Tue,  2 Apr 2024 08:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB13E23CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040106;
	bh=qH0D3AhRYnb6bjEzB+stgfVObi4cQW3F92hHyMZ/AG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b5ZtVhkN28lPJ7EdaEPG10+h8Wtu+o90c/WusFHLRUqhP1fM+IaQcEEgAvHHm+jS3
	 JRV7TOpMrbN1QVOKrocsmZpH7dmeieFj6Wlxu1EgH2GvmQAMJtPdOfCTg84CJNIUD8
	 L5Japz/w7WJ9STqOHMgWI1BDe+oo04XyBgUxEC4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE79F80587; Tue,  2 Apr 2024 08:41:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4AF9F805A0;
	Tue,  2 Apr 2024 08:41:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23512F8020D; Tue,  2 Apr 2024 08:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DC28F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC28F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BN9Pu55U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gODISPjK
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 755CD34376;
	Tue,  2 Apr 2024 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712040058;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mzXMyPJdq2oR/609Gwa9Fp+XSu7c9aHRHlkUdrdW1g=;
	b=BN9Pu55UEX5XoTzQN30DlZmr4seOr0zE2OtjRtTHpmQzfrbFv15Tnr/fQ6u4A8/1qKX3Jc
	LjNdLEGWkJwpUNGAMHmzMViwuIMDUAADWwLClyKAesPucHbTWW6caGQYT8/vQquoZ2JC2F
	rmNbP91e9mIBkUExOOBOYOgAuHFDnNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712040058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mzXMyPJdq2oR/609Gwa9Fp+XSu7c9aHRHlkUdrdW1g=;
	b=gODISPjKHgAy9B8B+QMXz7vM5eMe+dvO4XanrpoGesUxpcAnaAL2dXAk3NJGrNXxvt/9ug
	BLZIm42fFJyKRYCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A32913AA3;
	Tue,  2 Apr 2024 06:40:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id Ga26DHqoC2btPgAAn2gu4w
	(envelope-from <tiwai@suse.de>); Tue, 02 Apr 2024 06:40:58 +0000
Date: Tue, 02 Apr 2024 08:41:02 +0200
Message-ID: <87ttkks1vl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] ASoC: Use snd_ctl_find_id_mixer() instead of
 open-coding
In-Reply-To: <20240401100210.61277-1-rf@opensource.cirrus.com>
References: <20240401100210.61277-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.37 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.02)[52.73%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-0.999];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 755CD34376
Message-ID-Hash: 3KMD7BWQEHCIAFIJYRL6ITV6LQ3PDQST
X-Message-ID-Hash: 3KMD7BWQEHCIAFIJYRL6ITV6LQ3PDQST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KMD7BWQEHCIAFIJYRL6ITV6LQ3PDQST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 12:02:07 +0200,
Richard Fitzgerald wrote:
> 
> The first two patches change snd_soc_card_get_kcontrol() to use the
> core snd_ctl_find_id_mixer() functionality instead of open-coding its
> own list walk.
> 
> The last patch adds a KUnit test for this, which was tested on the
> original and modified code.
> 
> Changes in V2:
> Only change is in the KUnit test (patch #3) to make the const strings
> more consty.
> 
> Richard Fitzgerald (3):
>   ALSA: control: Introduce snd_ctl_find_id_mixer_locked()
>   ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of open-coding
>   ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol

I suppose this goes via Mark's tree.  Feel free to take my ack:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
