Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C3974817B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 11:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F2A3E8;
	Wed,  5 Jul 2023 11:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F2A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688550832;
	bh=f/3cXHGE9uIm4/L25x3vP6nYXnSX730hWCYzpvq+V0w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BmQyOpy3Dmylf5fTZyqP2068PBQm28c9hBD7WAGP0nf6JONkR0NuuLksNZf29UfIO
	 hm7PMN5d+TMDhKdXnEKITt1ein8sW3xEfgy8SSmNcAynvw9bsp9V/Olbq6mHJiYYjK
	 ujL61peISA/O120q8LwFMRQEVr1dbQclm8OC3BSY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD2E9F80100; Wed,  5 Jul 2023 11:53:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A13BF80124;
	Wed,  5 Jul 2023 11:53:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3743CF80125; Wed,  5 Jul 2023 11:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 829E7F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 11:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829E7F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eHhXGe9O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wq7av6+C
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF29521F38;
	Wed,  5 Jul 2023 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688550771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhaLCccXd/kTWNxpmH7RFieQCAJF/Loz5q3pI9po6iQ=;
	b=eHhXGe9OLEF+vmVofAKmhYBnc2S8juB7RX5pLWOkDOyOJOeFKXSlCRxG557nqZbVd33hwr
	fpofvKCjMVJ48Vt8d9ZOtvZ9YxARX+K/+hF9HdJ/0beTyDBLDc2dw7qc/6PW9xJrPt2eNZ
	/JlTpsB3aNk6w0O/GJHvoa29J82lxZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688550771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XhaLCccXd/kTWNxpmH7RFieQCAJF/Loz5q3pI9po6iQ=;
	b=wq7av6+CpTDUOuiGwUGUrA09fbyBxSfCTcTC74c4FCx+/RiNNqUo4IMWUebvU2VnwSsmgW
	GFSxCY8qa1yqxPAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97C7B13460;
	Wed,  5 Jul 2023 09:52:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id z9KUJHM9pWTcegAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 05 Jul 2023 09:52:51 +0000
Date: Wed, 05 Jul 2023 11:52:47 +0200
Message-ID: <87wmze65xs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Minjie Du <duminjie@vivo.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	alsa-devel@alsa-project.org (moderated list:SOUND),
	linux-kernel@vger.kernel.org (open list),
	opensource.kernel@vivo.com
Subject: Re: [PATCH v2] sound: seq: fix typo in system_2p_ev_to_ump_midi1()
In-Reply-To: <20230705093545.14695-1-duminjie@vivo.com>
References: <20230705093545.14695-1-duminjie@vivo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 57UKP3ZZJX6OFL2PM4KDDEXYNYNEMN63
X-Message-ID-Hash: 57UKP3ZZJX6OFL2PM4KDDEXYNYNEMN63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57UKP3ZZJX6OFL2PM4KDDEXYNYNEMN63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 11:35:45 +0200,
Minjie Du wrote:
> 
> Fix data->system.parm2 typo.
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>

Thanks, applied now.

At the next time, though, it'd be appreciated if you give the
corresponding Fixes tag, too.  I added manually for now.


Takashi
