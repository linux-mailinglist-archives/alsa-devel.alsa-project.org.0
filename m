Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D0740D63
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 11:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46F8843;
	Wed, 28 Jun 2023 11:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46F8843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687945550;
	bh=c8qYYruq4/Z5laM2g1+g34GIBJ3D1Ny6om6d+4uW7os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kjD9VmQgAo+KqpWoXJtPE1TTNZeE6kLQmyvpNYAb2QjAogX7TRQmz7pk/EH9i/FuA
	 fiTFUaTSwe1wNHDiPxINjf0gE1FUzIiq8HtRC1ybd2WFy7vIrf9RG6F/bfmaHXm4cm
	 NEHFErhyiR7TyX+QflcAOM3PeYSgggBm7dBpyPlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A85CF80246; Wed, 28 Jun 2023 11:45:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B232DF80212;
	Wed, 28 Jun 2023 11:44:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 698EEF80212; Wed, 28 Jun 2023 11:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C39DEF80246
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 11:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39DEF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fUp+2j+x;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9mWONnFB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A91F51F8B6;
	Wed, 28 Jun 2023 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687945361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R5BpJubHpBlkq7A2dm81fT6qaZ1MVpLy5vDM8K0Jzsw=;
	b=fUp+2j+xN5ROSNKs0geGd8tqsVuFiLlPVQNZ7yLEjJ8I9Ni6ZbRkNR+ctOSTJG5QRI6P1G
	zCuqQyAOxDqSBUqI4IEzZQ6cnlXP3+6rBdQ18hFcAocTyH2h8JnHeEQu8wReWa6pXlV7tm
	uscwIp+X7OPa2H7GOAVY840OUhzL3LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687945361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R5BpJubHpBlkq7A2dm81fT6qaZ1MVpLy5vDM8K0Jzsw=;
	b=9mWONnFBdDOKorEpZ4qfeBrDz/e1nNohVbxMh+gSgV2MADEDIxARIr1lmkGk9OsBxNyk8a
	Zoeb0OnUKUmqkNDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79921138EF;
	Wed, 28 Jun 2023 09:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dgK3HJEAnGQVAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 28 Jun 2023 09:42:41 +0000
Date: Wed, 28 Jun 2023 11:42:41 +0200
Message-ID: <87zg4jexda.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: oxfw: make read-only const array models
 static
In-Reply-To: <20230627113253.700065-1-colin.i.king@gmail.com>
References: <20230627113253.700065-1-colin.i.king@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VI56MC656MES47TG76LOJC2I6EYNM7ZT
X-Message-ID-Hash: VI56MC656MES47TG76LOJC2I6EYNM7ZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VI56MC656MES47TG76LOJC2I6EYNM7ZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 27 Jun 2023 13:32:53 +0200,
Colin Ian King wrote:
> 
> Don't populate the const array on the stack, instead make it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, applied.


Takashi
