Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACBF780C17
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 14:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3BCDFA;
	Fri, 18 Aug 2023 14:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3BCDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692362847;
	bh=Tj094qLarysjs0UtDxCclLSUbNOq91bbxMOMqDkRPxw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XWKX060R4onH23EW6d2WhsBp1T6Qd81281nCSiCXpWEpmFegkaxj4MbL9PhCVAvef
	 RKFdUF7OxjQ2vh0qgClDcodNzUmTylkmnXYehDECW/Pg1EYcKVrmYS5QMRJeGxeIII
	 wnaa8C7VZz5MRAfBjnrKWsziIzKbHeeH0/QKOMOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03449F80510; Fri, 18 Aug 2023 14:46:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A80AF8016D;
	Fri, 18 Aug 2023 14:46:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F019F801EB; Fri, 18 Aug 2023 14:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C86E0F800EE;
	Fri, 18 Aug 2023 14:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C86E0F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pwvQSO4C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oCr7vIJf
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 502901F893;
	Fri, 18 Aug 2023 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692362787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXKnC7PgS3pfYLWoJGbz5hBnBfPUvu8CHeHNfOXqw3Y=;
	b=pwvQSO4C6xwxU5+rC5dhJcW/OCJ4CopXPvGsv32TGpUYnMGUlts/FP6vwpjpyB1ZoLk5W9
	BABfNv16Pu3XmCKzOGqoDRxxl7Y4NzGjoaZkE13rgQmdXqYfgpJgZl24vuC8o+enr3E4kg
	cUsRw/BnW2UtUslrA/JJnVxvnRAnuCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692362787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXKnC7PgS3pfYLWoJGbz5hBnBfPUvu8CHeHNfOXqw3Y=;
	b=oCr7vIJfm+tGq0QCcZ2n8+dsbMWt8kyt5P9Wxr814tuTecdVUS3S2u7jWR+1PCJCpto8BA
	UtZduY73TpLXrnCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE49C138F0;
	Fri, 18 Aug 2023 12:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sLUEOSJo32RkDgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 18 Aug 2023 12:46:26 +0000
Date: Fri, 18 Aug 2023 14:46:26 +0200
Message-ID: <87350gjz6l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alsa-devel <alsa-devel@alsa-project.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 8/9] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
In-Reply-To: 
 <alpine.DEB.2.22.394.2308181522050.3532114@eliteleevi.tm.intel.com>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
	<20230807090045.198993-9-maarten.lankhorst@linux.intel.com>
	<4acc7318-69b3-3eb5-1fe8-f7deea8adfad@linux.intel.com>
	<87a5uwr7ya.wl-tiwai@suse.de>
	<e88d139f-e62b-1654-0d35-a46c698298c6@lankhorst.se>
	<87il9ck52l.wl-tiwai@suse.de>
	<alpine.DEB.2.22.394.2308181522050.3532114@eliteleevi.tm.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7G4FTU5PKUXG7GLFXX5QDJZNTOGZSDGU
X-Message-ID-Hash: 7G4FTU5PKUXG7GLFXX5QDJZNTOGZSDGU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7G4FTU5PKUXG7GLFXX5QDJZNTOGZSDGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 14:24:14 +0200,
Kai Vehmanen wrote:
> 
> Hi,
> 
> On Fri, 18 Aug 2023, Takashi Iwai wrote:
> 
> > On Mon, 14 Aug 2023 16:26:01 +0200,
> > Maarten Lankhorst wrote:
> > > 
> > > Ping on this?
> > 
> > Pierre?  Does one of your recent patch sets achieves the suggested
> > thing?  Or do we need another rewrite/respin of this series?
> > Currently it's blocking the merge for 6.6.
> 
> this is likely to require another spin. Pierre did a draft of
> the new ops at https://github.com/thesofproject/linux/pull/4527
> and Maarten is looking to adapt the series to this.

OK, then it can be too late for 6.6, unfortunately.


Takashi
