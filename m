Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515884F418
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 12:03:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABA6950;
	Fri,  9 Feb 2024 12:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABA6950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707476595;
	bh=DYL2Vo7wXZo44LWPSiZJxteFaz2Bsb/d2g1o9IIqOik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T71dTQ0ot9a/Bpbkd+KulWGJZ9Uq2ZJUUf52X7TAXNC5pOIxon9Q4Or+ZBNPOaJ63
	 wCNO4IA4o/SnIHqec/FoVXoMuhzkDcxkmAgoE+VLnjygiivoKm8ihuDbFTLr290F/p
	 zZrGHPBlLtCzZLrh8dWFemRWWozNkZJUKitqrmY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D72E9F8057C; Fri,  9 Feb 2024 12:02:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F69F805A0;
	Fri,  9 Feb 2024 12:02:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEF7BF801EB; Fri,  9 Feb 2024 12:02:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E7DEF8016E
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 12:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E7DEF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=V/9zbXJ9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=W/CSpT8S;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=V/9zbXJ9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=W/CSpT8S
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD71C1FD32;
	Fri,  9 Feb 2024 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707476551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5zQwm5kPigELiJNBBb9hvLn79vg8BzIewehmXpsozFI=;
	b=V/9zbXJ9ahmqdhj3d/guoVKUJNMAwhxR5fBRCqxWSwO+m9z1l5126BwbhI0x4jy3GjWggO
	4xCcSrHi8rOLslSG4tR3Af2xPqspGT/oyWLALcgTUcSC5XCi32CuYVM4cDgjaj/LgYuRd1
	Fo1U0kTOJD5d1gHtOkrwVliwrSLeet4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707476551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5zQwm5kPigELiJNBBb9hvLn79vg8BzIewehmXpsozFI=;
	b=W/CSpT8SMhOtfjNq/AoNqGM6+Is88NEcwU2+ottuiG4PdFTjaF8A234VY0NaFfEZZ2D/Fi
	EP1eGUP2PYwE50BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707476551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5zQwm5kPigELiJNBBb9hvLn79vg8BzIewehmXpsozFI=;
	b=V/9zbXJ9ahmqdhj3d/guoVKUJNMAwhxR5fBRCqxWSwO+m9z1l5126BwbhI0x4jy3GjWggO
	4xCcSrHi8rOLslSG4tR3Af2xPqspGT/oyWLALcgTUcSC5XCi32CuYVM4cDgjaj/LgYuRd1
	Fo1U0kTOJD5d1gHtOkrwVliwrSLeet4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707476551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5zQwm5kPigELiJNBBb9hvLn79vg8BzIewehmXpsozFI=;
	b=W/CSpT8SMhOtfjNq/AoNqGM6+Is88NEcwU2+ottuiG4PdFTjaF8A234VY0NaFfEZZ2D/Fi
	EP1eGUP2PYwE50BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F6361326D;
	Fri,  9 Feb 2024 11:02:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1iklCkcGxmVoLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Feb 2024 11:02:31 +0000
Date: Fri, 09 Feb 2024 12:02:30 +0100
Message-ID: <87plx5294p.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v14 45/53] ASoC: usb: Create SOC USB SND jack kcontrol
In-Reply-To: <20240208231406.27397-46-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
	<20240208231406.27397-46-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.16 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-1.36)[90.57%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLjs3ec4aura4kmsd6wxjjm4hg)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: IAYFIZJH7LQV7UYJO4PYDDNAVWJ4P3OL
X-Message-ID-Hash: IAYFIZJH7LQV7UYJO4PYDDNAVWJ4P3OL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAYFIZJH7LQV7UYJO4PYDDNAVWJ4P3OL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 00:13:58 +0100,
Wesley Cheng wrote:
> 
> Expose API for creation of a jack control for notifying of available
> devices that are plugged in/discovered, and that support offloading.  This
> allows for control names to be standardized across implementations of USB
> audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Again, use a more intuitive control element name.


thanks,

Takashi
