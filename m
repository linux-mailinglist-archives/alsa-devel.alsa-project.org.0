Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A464850379
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Feb 2024 09:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE996868;
	Sat, 10 Feb 2024 09:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE996868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707552702;
	bh=F8DGyIH//SMvI1ax+96o/ObM1ZtA0zzCYF6zYzURkuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OnGLJPCcONhjvBd2EHm5XsV7erykevlVjP+6x1adA6r7LQZcwDRqlzdulaIKYsMXk
	 DVLcSykvDsWYngpPJhyxElM4EW+2SaeCs7npdQK0BnnFY5HdhbUeUVL7qarHeVcwbm
	 x9ZIlkmD6ztJi8T2PmZODEFDbN/q8LIwyOBYM6z0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90EA2F804E7; Sat, 10 Feb 2024 09:11:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 516DFF80548;
	Sat, 10 Feb 2024 09:11:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DC36F801EB; Sat, 10 Feb 2024 09:09:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD48F80153
	for <alsa-devel@alsa-project.org>; Sat, 10 Feb 2024 09:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD48F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KJoW4J71;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DALLQMtL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ZTWz1/eC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xJIBcXYS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A6711F871;
	Sat, 10 Feb 2024 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707552517;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlZxIUNjuMw/gmtQRSWgnNoi6CtpoNOtj4J6OuXVIjg=;
	b=KJoW4J71U9ZLJ7gO2a8d/PIy4nhqzxY0s2zlnSK3EfY+kPyH4g9TEVPDrbfiXtcc/TIc19
	rBz1R3rMMqHBFpfdklsVYAvJUBGeIBd1yEeUbyG+S4pvPUI3SlQWCdSERiYlNcqQK8aMbi
	FLTcGWIGmoltnHEJ9DbUUfL3K59u3Cs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707552517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlZxIUNjuMw/gmtQRSWgnNoi6CtpoNOtj4J6OuXVIjg=;
	b=DALLQMtLxjWwWSgCINWrel5oJJeUceaqE4HtJb6m4CQza+kjwh0s/IV8ugvQhrrR/EzT5b
	Us/14GhwwZ1wBUAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707552515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlZxIUNjuMw/gmtQRSWgnNoi6CtpoNOtj4J6OuXVIjg=;
	b=ZTWz1/eCrW4xLIfHtnBLB6BnNE2Hyv+DpxtveF0h6zNq9n2cM02p5thixj/s3MPSNtnQ1z
	oWVlRIw4qVHxPrc9pXXKeC739EKUY3jDKS0izOgEk9N/+8AYvkDEcvuryy8bu1Wg0PaJqU
	w8ZfhTZZRJjf5urEpo/4ELDawf/K784=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707552515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlZxIUNjuMw/gmtQRSWgnNoi6CtpoNOtj4J6OuXVIjg=;
	b=xJIBcXYSPUlRFsJAH686aURuAcIgKNqRNMW8Sp8PsxJ1wmcHs6/sbp65Meumml9uDAWSPz
	lg4vL/0gbcQppkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A58C613867;
	Sat, 10 Feb 2024 08:08:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dyCTJgIvx2VMcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Feb 2024 08:08:34 +0000
Date: Sat, 10 Feb 2024 09:08:34 +0100
Message-ID: <875xywzqpp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<corbet@lwn.net>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v14 20/53] ASoC: Add SOC USB APIs for adding an USB
 backend
In-Reply-To: <b007a78c-b8fb-83bc-3be6-963708182cee@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
	<20240208231406.27397-21-quic_wcheng@quicinc.com>
	<87r0hl29ha.wl-tiwai@suse.de>
	<b007a78c-b8fb-83bc-3be6-963708182cee@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZTWz1/eC";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xJIBcXYS
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,quicinc.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 5A6711F871
Message-ID-Hash: R3WYLVKMYQCZASVB47SBPE7KXA7DF4JQ
X-Message-ID-Hash: R3WYLVKMYQCZASVB47SBPE7KXA7DF4JQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3WYLVKMYQCZASVB47SBPE7KXA7DF4JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 21:34:39 +0100,
Wesley Cheng wrote:
> 
> Hi Takashi,
> 
> On 2/9/2024 2:54 AM, Takashi Iwai wrote:
> > On Fri, 09 Feb 2024 00:13:33 +0100,
> > Wesley Cheng wrote:
> >> 
> >> Some platforms may have support for offloading USB audio devices to a
> >> dedicated audio DSP.  Introduce a set of APIs that allow for management of
> >> USB sound card and PCM devices enumerated by the USB SND class driver.
> >> This allows for the ASoC components to be aware of what USB devices are
> >> available for offloading.
> >> 
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > (snip)
> >> --- a/sound/soc/Makefile
> >> +++ b/sound/soc/Makefile
> >> @@ -1,5 +1,5 @@
> >>   # SPDX-License-Identifier: GPL-2.0
> >> -snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
> >> +snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-usb.o soc-utils.o soc-dai.o soc-component.o
> >>   snd-soc-core-objs += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
> >>   snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
> > 
> > Do we really want to build this into ASoC core unconditionally?
> > This is very specific to Qualcomm USB-offload stuff, so it's better to
> > factor out.
> > 
> 
> Ideally, the SOC USB part shouldn't be Qualcomm specific.  Since I
> don't have access or insight into how other vendors are achieving the
> same thing, I can only base the soc-usb layer to work with the
> information that is required to get the audio stream up and running on
> the QC platforms.  In its simplest form, its basically just a SW
> entity that notifies ASoC components about changes occurring from USB
> SND, and I think all vendors that have an ASoC based platform card
> handling the offload will need this notification.

Yes, but it's not necessarily built into the snd-soc-core module at
all, but can be split to another module, right?  Otherwise all
machines must load this code even if it doesn't use at all.
If this were common among various chips, it'd be worth to be merged
into the default common module.  But I don't think that's the case.


thanks,

Takashi
