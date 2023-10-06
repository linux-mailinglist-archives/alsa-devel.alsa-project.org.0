Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A17BB7AE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 14:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF35C1D9;
	Fri,  6 Oct 2023 14:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF35C1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696595565;
	bh=jjwts+zXoc+rCw8OTR9YXA8uEIGEJXXQGGpaQLmTuC0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KZyWFN3k+4Eehwi3GhuIS76UPZDFcMpAJ2PBovE5ZjybiNLNLPxcvWaXS8iwGMSh3
	 G4n6/ptp2LJuPvo6QGRA35Zn+trPxuOj26S2RCa3BugEU4beNZl3EVmtCbGvPMFE29
	 XeJN10ETMzmEiHK9hPds7DGmk664AEJKRaFd6Zq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37F1FF80549; Fri,  6 Oct 2023 14:31:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E16D3F80130;
	Fri,  6 Oct 2023 14:31:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9217F8047D; Fri,  6 Oct 2023 14:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA818F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 14:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA818F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=keaYHlJH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tf62uiYp
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5DB4D1F8A8;
	Fri,  6 Oct 2023 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696595507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsVZiulH4dl3vwahIL2j8v7ytwf6on/tMgZyPyUv5CA=;
	b=keaYHlJHwiFOrgqIqySHu8Lnf38IPHt0y5tx4Hf78qlGE0/UwKAvXI2RVeEximmX140RYW
	TaZHL60aGyrYMECJ4NNstVJ6J1133H0d3ri9PJtARMmDgva3iQW7D1OfvY+Zj9oB+ETGyk
	9/JifLZBeI5Ac74wRX1VZaFsvqLCxSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696595507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsVZiulH4dl3vwahIL2j8v7ytwf6on/tMgZyPyUv5CA=;
	b=tf62uiYpdGiAT5X9/kHBQHaPornbrUqPlHIFKiZPK4pLkUcxQlGZX1LTCp1HZncgfUFKIu
	YvHMjxxQShUlzfBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2983B13586;
	Fri,  6 Oct 2023 12:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7tlGCTP+H2U2HgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 12:31:47 +0000
Date: Fri, 06 Oct 2023 14:31:46 +0200
Message-ID: <874jj4ue31.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH 0/3] ALSA: hda: Stream setup fixes
In-Reply-To: <20231006102857.749143-1-cezary.rojewski@intel.com>
References: <20231006102857.749143-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: TQXKSGUPH4YEJKKN7D6E2B44GV7BUGVJ
X-Message-ID-Hash: TQXKSGUPH4YEJKKN7D6E2B44GV7BUGVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQXKSGUPH4YEJKKN7D6E2B44GV7BUGVJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 12:28:54 +0200,
Cezary Rojewski wrote:
> 
> Follow up to the recent hdac_stream-related series of mine [1].
> Addresses three topics:
> 
> - false-positive timeout (-110) messages that appear during firmware
>   loading procedure
> - null-ptr-deref when assigning stub substream of COUPLED type. 'Stub'
>   as precisely those kind of substreams are utilized for code-loading
>   procedure
> - hstream->fifo_size initialization, superfluous '+1'
> 
> The two fixes lead the way, there is no dependency of patch 3/3 on
> either of them.
> 
> 
> [1]: https://lore.kernel.org/alsa-devel/20230926080623.43927-1-cezary.rojewski@intel.com/
> 
> Cezary Rojewski (3):
>   ALSA: hda: Fix possible null-ptr-deref when assigning a stream
>   ALSA: hda: Fix stream fifo_size initialization
>   ALSA: hda: Add code_loading parameter to stream setup

Applied all three patches now.  Thanks.


Takashi
