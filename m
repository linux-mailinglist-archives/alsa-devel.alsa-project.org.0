Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADB77BBE5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA4E3E8;
	Mon, 14 Aug 2023 16:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA4E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692024173;
	bh=XIDsp4t3S2Mb2t5o94Pr+dp0PIQIGT7mQGRuOJ7wdFA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TA4EzlmYoUA04UaiZZxRlc1Lwt9G6xHIUoKvMcZG5GblNbkgk/0xBEiLjqIqtFw9f
	 OlOSFP717k+5YIQB9BTCGUa2ELWIQ3iCcAxPruYVcO0tLYAUG7kBsuPJzZnhcWe63e
	 xMTFVjAPHK0cG7viiFYukHl9PqBlceBVSzn/x/Ik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1BF1F80290; Mon, 14 Aug 2023 16:42:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 662D2F80254;
	Mon, 14 Aug 2023 16:42:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB0A3F8025F; Mon, 14 Aug 2023 16:41:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C50BF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C50BF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mq85xKZv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yldyFYOH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C77B92198F;
	Mon, 14 Aug 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692024116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4GZjFCBK/ElRajZGcuEQcuT36R1H1PS4TnyuLhY6uvk=;
	b=mq85xKZvjwwLxsIo4Ysr0gqfxZ/i1SmW5dmcpYPkAVbvgAvo+Zl2zrvSDLXdeETyjpc4DD
	AmeslEQN6KEKEf+ag6yMpFrspOL1sIewXMvb/aBi3mh5wMtJBJcuT6+nZnk+IbDWj9x0ZO
	AeYz7QsCIDPItcL33D/YyQ1MXQBD1dY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692024116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4GZjFCBK/ElRajZGcuEQcuT36R1H1PS4TnyuLhY6uvk=;
	b=yldyFYOH/rRdZyKgyHNupteNXNOg7bTeyT212KQqddfTAD+lj+TpSPZS3kR8orLM8AeNbq
	W2L4NdKZnAA1VVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E0FB138EE;
	Mon, 14 Aug 2023 14:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4GbnGzQ92mTAAQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 14:41:56 +0000
Date: Mon, 14 Aug 2023 16:41:55 +0200
Message-ID: <87edk51ya4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [RFC PATCH 05/17] ALSA: hda: Upgrade stream-format infrastructure
In-Reply-To: <20230811164853.1797547-6-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
	<20230811164853.1797547-6-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5N7YHKJLFNE4MOIKLUFSPQAV7YUFHPTZ
X-Message-ID-Hash: 5N7YHKJLFNE4MOIKLUFSPQAV7YUFHPTZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5N7YHKJLFNE4MOIKLUFSPQAV7YUFHPTZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Aug 2023 18:48:41 +0200,
Cezary Rojewski wrote:
> 
> Introduce a set of functions that facilite SDxFMT-related calculations
> in atomic manner:
> 
> snd_hdac_format_normalize() - format converter. S20_LE, S24_LE and their
> unsigned and BE friends are invalid from HDAudio perspective but still
> can be specified as function argument due to compatibility reasons.

Which compatibility reason?  Those formats should have been never used
for HD-audio codecs at the first place, so shouldn't it rather return
an error?


thanks,

Takashi
