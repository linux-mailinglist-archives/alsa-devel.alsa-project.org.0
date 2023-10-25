Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAB7D61C4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 08:43:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372387F1;
	Wed, 25 Oct 2023 08:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372387F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698216228;
	bh=5xzzwPnfdP6xxndt9++f+5fUau5n7fvbhktXqlnYZuU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byqbZXlt5XpjUM1qTZrrbjLRVH261LLjYms9iDOoTTiXI0yMrZ4IDTh2RzNQ5PTLY
	 kVkF+T/RTRfUlFg0RsJ/0pgoZwRY30WXVrEGZ0HHt+J37YfGy1MHBJa7D4P60n+JZI
	 yjBN8M2y42J5i7qvUyp7tksL+xquJY8C5/SGnpvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 869A5F80224; Wed, 25 Oct 2023 08:42:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBA9F80157;
	Wed, 25 Oct 2023 08:42:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB031F80165; Wed, 25 Oct 2023 08:42:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B1A2F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 08:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B1A2F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=f2ObgC9Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TPl76oLj
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 150B621B21;
	Wed, 25 Oct 2023 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698216158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhEtlS39VxXyNHIy6OxK9j39S197wyB2XNBfgTuLGmQ=;
	b=f2ObgC9QUeEYeMvl7X5SKdebF1mxybgmpxJ2VqDE0SxbvQvgK5g+V7h4J7UMCLjeIkYWzN
	bIkSIANOjVFXiYcWbKBTD7jNfltkep1IvgL04715J+6BisxY702bSTtYkChWrvV7vAmRsT
	tG4D7r4AnviAryr3XMQnBG72esMhpzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698216158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhEtlS39VxXyNHIy6OxK9j39S197wyB2XNBfgTuLGmQ=;
	b=TPl76oLj9Y5MjW5n/jdzuPk7Om9JOMW3WPGik1MBjz5QQ69ppqn5YMSktvXBmDZvd3j4Rn
	NUa1UPydSze2AsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E601613524;
	Wed, 25 Oct 2023 06:42:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Hj40Nt24OGVySQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 06:42:37 +0000
Date: Wed, 25 Oct 2023 08:42:37 +0200
Message-ID: <87a5s7urs2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "McCarthy, Max" <mmccarthy@mcintoshlabs.com>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] sound: add quirk flag to enable native DSD for McIntosh
 devices
In-Reply-To: 
 <BL0PR13MB4433226005162D186A8DFF4AD6DFA@BL0PR13MB4433.namprd13.prod.outlook.com>
References: 
 <BL0PR13MB4433226005162D186A8DFF4AD6DFA@BL0PR13MB4433.namprd13.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-9.94 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.84)[99.33%]
Message-ID-Hash: AVEUO2PC5YDRCQGJTRDI6XMHKP4VRSEZ
X-Message-ID-Hash: AVEUO2PC5YDRCQGJTRDI6XMHKP4VRSEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVEUO2PC5YDRCQGJTRDI6XMHKP4VRSEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 24 Oct 2023 14:30:19 +0200,
McCarthy, Max wrote:
> 
> From: Max McCarthy <mmccarthy@mcintoshlabs.com>
> 
> McIntosh devices supporting native DSD require the feature to be explicitly exposed. Add a flag that fixes an issue where DSD audio was defaulting to DSD over PCM instead of delivering raw DSD data.
> 
> Signed-off-by: Max McCarthy <mmccarthy@mcintoshlabs.com>

Applied with minor modification of subject and commit log, as well as
the addition of Cc-to-stable.


thanks,

Takashi
