Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706F9B2F3F4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 11:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDDB56021B;
	Thu, 21 Aug 2025 11:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDDB56021B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755768690;
	bh=SJ4YW3Ea2q45XCUNkHVpMntDMPBiHzmCLeelC1nqS54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbGzvQs1rxZuV0vNlj9sJI+a10z5XO3sZlyB9qMQejyHijloVmnnAn92xoc1GxV61
	 m22oIZJpFmHWbLCFQgJwpadVQQ+gfbN5fEe2o+Z4OMKmI9ScIr46346Sphm+InhHHC
	 UxNFKe3Dav6fasXoe8Kl5LXmZmR8kpdcUe7dE1UE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B5BF805C0; Thu, 21 Aug 2025 11:30:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC32F805CA;
	Thu, 21 Aug 2025 11:30:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A151F80518; Thu, 21 Aug 2025 11:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04F56F80152
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 11:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F56F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0d9yE5Cq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=li2XxLbt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0d9yE5Cq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=li2XxLbt
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E3A21F38C;
	Thu, 21 Aug 2025 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755768639;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbyz8wtHEYy0Ae85OaDqxH7p8zTasJ948wOCcSpwgi8=;
	b=0d9yE5Cqv1hav8mNmuUknQe0tHr8L4hkHo06Zdkq7hdzLb+HZBZqQ67G+ibruiMuX00VxR
	hG0PYPjP9W5mgXMh+BUeL8gY5YW6Q2Aty1gLS9JK2ID9oHtKv/R0pM3g2shxY6jczibrLy
	M8kV3PRYq+MtH4heutHyK7AQuDU0YVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755768639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbyz8wtHEYy0Ae85OaDqxH7p8zTasJ948wOCcSpwgi8=;
	b=li2XxLbtrxxODjBBd3auPfGlTAy0YpKkueYXtur2KaDQYq2Dn35iCmZKXjLua0oq27tdFG
	8lCkwSBB7V0Zw/AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755768639;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbyz8wtHEYy0Ae85OaDqxH7p8zTasJ948wOCcSpwgi8=;
	b=0d9yE5Cqv1hav8mNmuUknQe0tHr8L4hkHo06Zdkq7hdzLb+HZBZqQ67G+ibruiMuX00VxR
	hG0PYPjP9W5mgXMh+BUeL8gY5YW6Q2Aty1gLS9JK2ID9oHtKv/R0pM3g2shxY6jczibrLy
	M8kV3PRYq+MtH4heutHyK7AQuDU0YVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755768639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbyz8wtHEYy0Ae85OaDqxH7p8zTasJ948wOCcSpwgi8=;
	b=li2XxLbtrxxODjBBd3auPfGlTAy0YpKkueYXtur2KaDQYq2Dn35iCmZKXjLua0oq27tdFG
	8lCkwSBB7V0Zw/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35AF9139A8;
	Thu, 21 Aug 2025 09:30:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sLTHCz/npmgyJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 09:30:39 +0000
Date: Thu, 21 Aug 2025 11:30:38 +0200
Message-ID: <87349l6myp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"13564923607@139.com" <13564923607@139.com>,
	"13916275206@139.com"
	<13916275206@139.com>,
	"alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"Xu, Baojun" <baojun.xu@ti.com>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"Ji, Jesse" <jesse-ji@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Enable
 init_profile_id for device initialization
In-Reply-To: <203d0937f1974417ac64b4ed6a6f2e69@ti.com>
References: <20250820082123.1125-1-shenghao-ding@ti.com>
	<87cy8p6t4t.wl-tiwai@suse.de>
	<203d0937f1974417ac64b4ed6a6f2e69@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	REDIRECTOR_URL(0.00)[proofpoint.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,intel.com:email]
Message-ID-Hash: A3XYWPNRLJ3F4R232JOFPJDENY4DS6BT
X-Message-ID-Hash: A3XYWPNRLJ3F4R232JOFPJDENY4DS6BT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3XYWPNRLJ3F4R232JOFPJDENY4DS6BT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Aug 2025 11:01:45 +0200,
Ding, Shenghao wrote:
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Thursday, August 21, 2025 3:17 PM
> > To: Ding, Shenghao <shenghao-ding@ti.com>
> > Cc: broonie@kernel.org; andriy.shevchenko@linux.intel.com;
> > 13564923607@139.com; 13916275206@139.com; alsa-devel@alsa-
> > project.org; linux-kernel@vger.kernel.org; Xu, Baojun <baojun.xu@ti.com>;
> > Baojun.Xu@fpt.com; Ji, Jesse <jesse-ji@ti.com>
> > Subject: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Enable
> > init_profile_id for device initialization
> > 
> > On Wed, 20 Aug 2025 10: 21: 23 +0200, Shenghao Ding wrote: > > Optimize
> > the time consumption of profile switching, init_profile saves > the common
> > settings of different profiles, such as the dsp coefficients, > etc, which can
> > greatly ZjQcmQRYFpfptBannerStart This message was sent from outside of
> > Texas Instruments.
> > Do not click links or open attachments unless you recognize the source of
> > this email and know the content is safe.
> > <https://us-phishalarm-
> > ewt.proofpoint.com/EWT/v1/G3vK!vxdrHf3mV2Ub4obsvxtoX4FTV-yYd_C-
> > 6ngQtFeUFpCRaEESj8_B-sZXmuX5JN2I2u4Qx-lD$>
> > Report Suspicious
> > 
> > ZjQcmQRYFpfptBannerEnd
> > On Wed, 20 Aug 2025 10:21:23 +0200,
> > Shenghao Ding wrote:
> > >
> > > Optimize the time consumption of profile switching, init_profile saves
> > > the common settings of different profiles, such as the dsp
> > > coefficients, etc, which can greatly reduce the profile switching time
> > > comsumption and remove the repetitive settings.
> > >
> ..............................
> > The patch causes build errors:
> > 
> > sound/hda/codecs/side-codecs/tas2781_hda_i2c.c: In function
> > ʽtasdevice_dspfw_initʼ:
> > sound/hda/codecs/side-codecs/tas2781_hda_i2c.c:468:29: error: ʽstruct
> > tasdevice_rcaʼ has no member named ʽinit_profile_idʼ
> >   468 |         if (tas_priv->rcabin.init_profile_id >= 0)
> >       |                             ^
> > ....
> > 
> > Something still not landed in my tree yet.
> I will resubmit it after your tree is ready.

So it's currently only in ASoC tree?
Then maybe it's easier to put Mark's tree instead.

In that case, feel free to take my ack:
Acked-by: Takashi Iwai <tiwai@suse.de>

But, the current situation of TAS driver support is messy, a part of
changes are found in my tree while another part in Mark's tree
individually...


thanks,

Takashi
