Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C267B4A28C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 08:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08911601F0;
	Tue,  9 Sep 2025 08:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08911601F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757400313;
	bh=RCW5GgCArVSwPic7glqYC7RlTKSqQK8WdmS+A/Xg6rk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n3rBLjKnfh0+aTFDYmqALY9u+ZvmnQaNY4La1m00993RCb/dstu10TY5YzMDhqx3z
	 Ye+1R5kMh53rst1rZ5/ij8pdjcoqjbJykgJViJbHfgc32bLu584l/QEwKYoOJ5OpU1
	 sah3lny03zwPgpdVCL7IVRyIif1CT8IRy0tjNky4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C066F805C4; Tue,  9 Sep 2025 08:44:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 994E3F805C6;
	Tue,  9 Sep 2025 08:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2A21F8027B; Tue,  9 Sep 2025 08:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AACB4F801F7
	for <alsa-devel@alsa-project.org>; Tue,  9 Sep 2025 08:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AACB4F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cfo+f3oe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fOu2OQhD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zKJkMxhV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=G9SrgBRr
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B636E20395;
	Tue,  9 Sep 2025 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1757400222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv9rmhdL0uNXK3cxzdO4tHRw+ROK7mOEB36x9Me9aq8=;
	b=cfo+f3oecUouQ0KpQpEYlBA+qvvM+4RXBYZWKAMcl5dVBnthBqad3LiltENna7TfHyAi9t
	23npTRN621x0COFSDVQYZ5d4Hvm2BFVgLtgXqHCJKBW8VNdcJn2SxpcNVAJXEiXlHRqr3I
	nglpNrhZqbQR8OPVCsZfs7fVQ4HjFTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757400222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv9rmhdL0uNXK3cxzdO4tHRw+ROK7mOEB36x9Me9aq8=;
	b=fOu2OQhDBImqqKc3sWvwXYtWxuDYmQfFKBmwY1QQV+fKw9AwXatlCLMmC8c5iBl8+UUpYC
	stnfGGTjixrm21Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1757400221;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv9rmhdL0uNXK3cxzdO4tHRw+ROK7mOEB36x9Me9aq8=;
	b=zKJkMxhVPb/f5q4ETbALAoFXWY39YJkcaulAOOAGinGnNHonPCiGtr4+GGSAxiNvVNEZ9d
	PcbraGBKU56lthg1FnAk8kqd8pAvpeF6nz5zVwTmZs2XPvGsOE/4R+UwQ/FEt1ghopn+8U
	Mfg8Ut98YtGpmIl+tf19Wr0hldnS1Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757400221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv9rmhdL0uNXK3cxzdO4tHRw+ROK7mOEB36x9Me9aq8=;
	b=G9SrgBRrpo48ggyq2wAOhnOLmwjJivBbHWSOnmmLOyEWMCfH/bDyeIWpvaoreRdSnHagZT
	wFk+g/rPpGUiqPBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 304431388C;
	Tue,  9 Sep 2025 06:43:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /nTWCZ3Mv2jjVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 06:43:41 +0000
Date: Tue, 09 Sep 2025 08:43:40 +0200
Message-ID: <87ecsgxh0j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: "Xu, Baojun" <baojun.xu@ti.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Yi, Ken" <k-yi@ti.com>,
	"Lo, Henry" <henry.lo@ti.com>,
	"Chen, Robin" <robinchen@ti.com>,
	"Ji, Jesse" <jesse-ji@ti.com>,
	"Wang, Will" <will-wang@ti.com>,
	"jim.shil@goertek.com" <jim.shil@goertek.com>,
	"toastcheng@google.com" <toastcheng@google.com>,
	"chinkaiting@google.com" <chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118,
 tas2x20, tas5825 support
In-Reply-To: <071e0e04-e2cb-480d-8207-f6ba87cb56b5@sirena.org.uk>
References: <20250830061459.24371-1-baojun.xu@ti.com>
	<993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
	<12aa63e694c94213aeb6b48959d02b45@ti.com>
	<b70314db-357f-4c39-a9b4-088d8ebed2b0@sirena.org.uk>
	<67fafc23d16d4790821321643a87385f@ti.com>
	<071e0e04-e2cb-480d-8207-f6ba87cb56b5@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,gmail.com,kernel.org,goertek.com,google.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: L7VAWV77H5ZSLWOAKA45Q5TFXHJQZITT
X-Message-ID-Hash: L7VAWV77H5ZSLWOAKA45Q5TFXHJQZITT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7VAWV77H5ZSLWOAKA45Q5TFXHJQZITT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Sep 2025 19:10:28 +0200,
Mark Brown wrote:
> 
> On Mon, Sep 08, 2025 at 06:22:51AM +0000, Xu, Baojun wrote:
> 
> > > > Or need to create patches on tree broonie/linux.git?
> 
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.18
> 
> > This patch is also relative (shares the same include/sound/tas5825-tlv.h)
> > with another commit on next/linux-next.git:
> > https://patch.msgid.link/20250810122358.1575-1-baojun.xu@ti.com (ALSA: hda: Add TAS5825 support)
> > However, it was not merged into broonie/sound.git yet, should I wait for it?
> 
> OK, it's probably easiest to just apply these directly to Takashi's
> tree:
> 
> Acked-by: Mark Brown <broonie@kernel.org>

OK, applied both patches now to for-next branch.


thanks,

Takashi
