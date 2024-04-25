Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0A8B1DCF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 11:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BAE9B71;
	Thu, 25 Apr 2024 11:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BAE9B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714036971;
	bh=HDlJSLefKXe2JUBM3NFVTfxfmPrNGrt+DF2ru5JAiok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=umL+jPlACl4cjkHbt1FebtHaheTBNytXz0RHNDJgstuIiEtapa++T1jTaz3L8ACcx
	 ZCqnUxhdUfCdNGZnKdSZSQdcyKY1iNLvYWiz5NYcIhmAN21y8KXZOiM9+wf5tAC5Oz
	 B0rQzh6LqrhWz5FFxlQ7tixkubFHwCuXoFbHXHjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B030F80548; Thu, 25 Apr 2024 11:22:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C92EFF805A1;
	Thu, 25 Apr 2024 11:22:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96EFEF80423; Thu, 25 Apr 2024 11:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C83D8F802E8
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 11:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83D8F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HmGrcuXV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7kTHxT7Q;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HmGrcuXV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7kTHxT7Q
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D76B3205A4;
	Thu, 25 Apr 2024 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=HmGrcuXVQYNzTBFAmy47lsV8quKoGV6qW7lpgkclvW2uwrc2fX5g8hL9wT0oLUtovn7RY+
	Mll9EKQ4kZtyTazbBKIS99n/2TLOehf0NVudRZMOwL2yj8CRJ5BjNnJJInNu/0p0jcv+SG
	jJbeJPjX1rZn41t9X72mHH+B/nFTAkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714036930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=7kTHxT7QxM/BDERe81R/g0L3bOlaAJqrxTjpaEiXekqXEtaEuTXVQPjWAfkxlpsuYEEvA5
	Nu7EHgNKYxtlSnAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=HmGrcuXVQYNzTBFAmy47lsV8quKoGV6qW7lpgkclvW2uwrc2fX5g8hL9wT0oLUtovn7RY+
	Mll9EKQ4kZtyTazbBKIS99n/2TLOehf0NVudRZMOwL2yj8CRJ5BjNnJJInNu/0p0jcv+SG
	jJbeJPjX1rZn41t9X72mHH+B/nFTAkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714036930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=7kTHxT7QxM/BDERe81R/g0L3bOlaAJqrxTjpaEiXekqXEtaEuTXVQPjWAfkxlpsuYEEvA5
	Nu7EHgNKYxtlSnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D8021393C;
	Thu, 25 Apr 2024 09:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id atZbJcIgKmYhLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Apr 2024 09:22:10 +0000
Date: Thu, 25 Apr 2024 11:22:12 +0200
Message-ID: <871q6tbxvf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Felipe Balbi
 <balbi@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Julian Scheel <julian@jusst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Keeping <john@metanate.com>,
	AKASH KUMAR <quic_akakum@quicinc.com>,
	Jack Pham <jackp@codeaurora.org>,
	Chris Wulff <Chris.Wulff@biamp.com>
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
In-Reply-To: <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
	<72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alsa-project.org,gmail.com,kernel.org,baylibre.com,jusst.de,linuxfoundation.org,metanate.com,quicinc.com,codeaurora.org,biamp.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: EY4WFCALUTY6KLZDSF5FDAECX45LNNPS
X-Message-ID-Hash: EY4WFCALUTY6KLZDSF5FDAECX45LNNPS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EY4WFCALUTY6KLZDSF5FDAECX45LNNPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Apr 2024 09:40:52 +0200,
Pavel Hofman wrote:
> 
> 
> On 17. 04. 24 13:07, Pavel Hofman wrote:
> 
> > I am considering implementation of multiple altsettings to f_uac2, so
> > that multiple combinations of channels and samplesizes can be offered to
> > the host.
> > 
> > Configuration:
> > --------------
> > * each altsetting for each direction should define
> >    * channel mask
> >    * samplesize
> >    * hs_bint bInterval
> >    * c_sync type (for capture only)
> > 
> > 
> > Perhaps the easiest config would be allowing lists for the existing
> > parameters (like the multiple samplerates were implemented). All the
> > list params would have to have the same number of items - initial check.
> > First values in the list would apply to altsetting 1, second to
> > altsetting 2 etc.
> > 
> > Or the altsetting could be some structured configfs param - please is
> > there any recommended standard for structured configfs params?
> > 
> > 
> > Should the config also adjust the list of allowed samplerates for each
> > altsetting? Technically it makes sense as higher number of channels can
> > decrease the max samplerate, e.g. for via a TDM interface. If so, it
> > would need either the structured configuration or some "list of lists"
> > format.
> > 
> > 
> > Implementation:
> > ---------------
> > 
> > Parameters could be turned to arrays of fixed predefined sizes, like the
> > p/s_srates. E.g. 5 max. altsettings in each direction would consume only
> > 4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).
> > 
> > Currently all descriptor structs are statically pre-allocated as there
> > are only two hard-coded altsettings. IMO the descriptors specific for
> > each altsetting could be allocated dynamically in a loop over all
> > none-zero alsettings.
> > 
> > Please may I ask UAC2 gadget "stakeholders" for comments, suggestions,
> > recommendations, so that my eventual initial version was in some
> > generally acceptable direction?
> > 
> 
> This feature has coincidentally arisen in recent commits by Chris
> https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivitera.com/T/
> 
> Maybe Takashi's commits to the midi gadget could be a way
> https://patchwork.kernel.org/project/alsa-devel/list/?series=769151&state=%2A&archive=both
> The midi gadget allows multiple configurations now, where configs are
> placed into a separate block.X configfs directory. That way the configfs
> recommendation to keep one value per item is adhered to and the
> configuration is nice and clean.
> 
> This method would nicely allow various samplerate lists for each
> altsetting, without having to use some obscure list of lists.
> 
> The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
> altsetting ID. I am not sure the dot index not starting with 0 would be
> an issue.
> 
> Now the question would be what to do with the existing (and the new
> params added by Chris) flat-structure parameters which apply to (the
> only one) altsetting 1. Maybe they could be used as defaults for the
> other altsettings for unspecified parameters?
> 
> I very much appreciate any input, thank you all in advance.

IMO, a softer approach would be to use subdirs for alt1+ while flat
files are kept used for alt0.  Alternatively, we may allow creating
alt0, too, and the values there will win over the flat values.


thanks,

Takashi
