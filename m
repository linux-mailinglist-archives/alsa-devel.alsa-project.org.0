Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CAE706BE4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E80741;
	Wed, 17 May 2023 16:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E80741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335536;
	bh=+xQoMeDn1qwUo3pyNI8PlYCAA26t/oLMq7M0NnzVdAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m+vut02hltTLx8G8TDuGUPkjz3zisD3Embtp2qODWFRy+kEd+HD4CHws6ygoCILLc
	 xQ+HDRjU06hJ0OaMjWZwap+igK4RY+9YRH7DtjxRopAdLweUIDnjA7JYBAuEd6VEtA
	 gFo1jM1C71kQg6aXNRukqTvjEWNny/rmHDxaRLOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC73F80544; Wed, 17 May 2023 16:58:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C798F80272;
	Wed, 17 May 2023 16:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43510F802E8; Wed, 17 May 2023 16:58:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C5586F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5586F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=h/jhhM7j;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1ECOy01n
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF31C1FD7C;
	Wed, 17 May 2023 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684335477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKlbsGK3C9WorfwpmDz6zDNrnegQktNFeFfzaHQSnik=;
	b=h/jhhM7jphOZsJWgSFnmO8HS5mI8GCuj15s+6Li48VCRXABNm+uTLoJeGbatzgGrbAeX36
	619fIyQ7slFqukLENv/I3vBIWmJmcIUdvWji8oMr+1cQkRVay4poChDtV+r54oW7q9mzI3
	ZS8ffgYWsYBzLkmN/WEE0SwEcc5vXSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684335477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tKlbsGK3C9WorfwpmDz6zDNrnegQktNFeFfzaHQSnik=;
	b=1ECOy01ngN/pdb3FacN/9+krSxO+YSGLMIasF6dWCrOb9a7/LW+UE5D6V6o4F4fSAWEOg2
	uADxT4v+HTzHe0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5CCA13358;
	Wed, 17 May 2023 14:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RQM7K3XrZGR5dQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 14:57:57 +0000
Date: Wed, 17 May 2023 16:57:57 +0200
Message-ID: <87fs7v0zuy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nikhil Mahale <nmahale@nvidia.com>
Cc: <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<perex@perex.cz>,
	<linux-kernel@vger.kernel.org>,
	<aplattner@nvidia.com>
Subject: Re: [PATCH] ALSA: hda: Add NVIDIA codec IDs a3 through a7 to patch
 table
In-Reply-To: <20230517090736.15088-1-nmahale@nvidia.com>
References: <20230517090736.15088-1-nmahale@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2ZULJXJMHEWYPWSII5FAALVUFJUFWP5B
X-Message-ID-Hash: 2ZULJXJMHEWYPWSII5FAALVUFJUFWP5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZULJXJMHEWYPWSII5FAALVUFJUFWP5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 11:07:36 +0200,
Nikhil Mahale wrote:
> 
> These IDs are for AD102, AD103, AD104, AD106, and AD107 gpus with
> audio functions that are largely similar to the existing ones.
> 
> Tested audio using gnome-settings, over HDMI, DP-SST and DP-MST
> connections on AD106 gpu.
> 
> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>

Thanks, applied now.


Takashi
