Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094D9543C1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 10:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197032BD8;
	Fri, 16 Aug 2024 10:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197032BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723796015;
	bh=ZpFMS7thnYW7nq1ZFGu7rwX0ZSFhcIRrmkWpVYMM+y4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l+RHlYgVqff5OFYIwNYtt2YiyVCf2Zne7sEwCiKGy5hqAjD3TIUNmPvenh5G/eySv
	 tsp0cWYSSMtFiqumnJqstr68qyRVCiy7X5xixEAj4szd0lU4v5PlPbrZZ9qmoxIcs8
	 Tjel2mNGmPjSuOgtZu1yUANkmUVoFBfMVXb7/yIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB0AF805C2; Fri, 16 Aug 2024 10:13:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E797EF805AE;
	Fri, 16 Aug 2024 10:12:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC7BBF80107; Fri, 16 Aug 2024 09:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CF97F80107
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 09:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF97F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SphrG+8t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7GDnSn3H;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=SphrG+8t;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7GDnSn3H
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B4F41F8CC;
	Fri, 16 Aug 2024 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723794732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQamkX07kqQelnMcTZSjCxpcLokD2Bq1t3tNTsWFwl8=;
	b=SphrG+8td5OK1CnESxThrJ+R9FYEnH5qOWclteB7bYCEx2Sg7t2RmIgzluse9xVyZezmt7
	4DRy4GeMM5h0vlTUddulmtmKo6TLoqfVSVpMRkucK72DACHD3Iev6QbS368amm2nxjjpvM
	PhZ8Jucp1djggj3dGDnSn7d2N8z/pHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723794732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQamkX07kqQelnMcTZSjCxpcLokD2Bq1t3tNTsWFwl8=;
	b=7GDnSn3H8vfmmWI/SEfOGNHssH1t8Qhr6jd9riEJwOENF1C1cvLt96uzFtfNmiybv/qvFc
	5lZDQIcQ7rDtqzDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723794732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQamkX07kqQelnMcTZSjCxpcLokD2Bq1t3tNTsWFwl8=;
	b=SphrG+8td5OK1CnESxThrJ+R9FYEnH5qOWclteB7bYCEx2Sg7t2RmIgzluse9xVyZezmt7
	4DRy4GeMM5h0vlTUddulmtmKo6TLoqfVSVpMRkucK72DACHD3Iev6QbS368amm2nxjjpvM
	PhZ8Jucp1djggj3dGDnSn7d2N8z/pHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723794732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQamkX07kqQelnMcTZSjCxpcLokD2Bq1t3tNTsWFwl8=;
	b=7GDnSn3H8vfmmWI/SEfOGNHssH1t8Qhr6jd9riEJwOENF1C1cvLt96uzFtfNmiybv/qvFc
	5lZDQIcQ7rDtqzDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F02D1397F;
	Fri, 16 Aug 2024 07:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id obnaFSwFv2YaEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Aug 2024 07:52:12 +0000
Date: Fri, 16 Aug 2024 09:52:53 +0200
Message-ID: <8734n452ga.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: <johannes@sipsolutions.net>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ALSA: aoa: Use helper function for_each_child_of_node()
In-Reply-To: <20240816021826.65190-1-zhangzekun11@huawei.com>
References: <20240816021826.65190-1-zhangzekun11@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,huawei.com:email,suse.de:mid]
Message-ID-Hash: MAJ2ZMPS25MYB5E7XC66JAWXQY2BJIRE
X-Message-ID-Hash: MAJ2ZMPS25MYB5E7XC66JAWXQY2BJIRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAJ2ZMPS25MYB5E7XC66JAWXQY2BJIRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Aug 2024 04:18:26 +0200,
Zhang Zekun wrote:
> 
> for_each_child_of_node can help to iterate through the device_node,
> and we don't need to use while loop. No functional change with this
> conversion.
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Thanks, applied.


Takashi
