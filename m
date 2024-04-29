Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0648B51EB
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 09:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E2A7F1;
	Mon, 29 Apr 2024 09:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E2A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714374147;
	bh=09FThBTM6Hwa/xsabgjmzwu4MaDIcTHSgg/+eqvr7L8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aBWToMVdDO09mAeILT01/gZ6dUcNGJ3Ue6J+WTZ+IqectQPxWU2AR1q0/VKVrWBI8
	 fydMP/zydZpUnV7M2QT6QaM5mSYpJyspUbAhQbethyjlnpbW1fT8Gs0DFNYQmXJBE0
	 gplNfcfXzPVLUAcQJ+Uy5IUE45WGEI7FY6A0agrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25DEBF805A1; Mon, 29 Apr 2024 09:01:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EABF80578;
	Mon, 29 Apr 2024 09:01:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14526F8028D; Mon, 29 Apr 2024 08:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ADF0F800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 08:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ADF0F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OJtApqpI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GNFMWpF+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OJtApqpI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GNFMWpF+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73D4D229E1;
	Mon, 29 Apr 2024 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714373821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foSFvja1xtZKhFfCb1ELz3yeDCDBi6VORfN0RMsU5pA=;
	b=OJtApqpIPGDK99iFXGxcMgAEKKSpnM04GzeAMgKa2KYTtHV2N5fgr5FwKZcqya773HSXu6
	51Yuz6es2QA/gM88Razf4OefFkQliUzDjRexy4Q5ImYaQlh0Z1SWxn5VN348qvzftAkX1H
	xMYJpgUYptBOswYZmmf2ysYF9QoScuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714373821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foSFvja1xtZKhFfCb1ELz3yeDCDBi6VORfN0RMsU5pA=;
	b=GNFMWpF+hD8jdZO3NGTur7+AX8P0TG8hhl97FjQtoFv8BAptI92Y6TI4srZUqvpGhG56FQ
	OaByZXcdFnunNzDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714373821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foSFvja1xtZKhFfCb1ELz3yeDCDBi6VORfN0RMsU5pA=;
	b=OJtApqpIPGDK99iFXGxcMgAEKKSpnM04GzeAMgKa2KYTtHV2N5fgr5FwKZcqya773HSXu6
	51Yuz6es2QA/gM88Razf4OefFkQliUzDjRexy4Q5ImYaQlh0Z1SWxn5VN348qvzftAkX1H
	xMYJpgUYptBOswYZmmf2ysYF9QoScuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714373821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foSFvja1xtZKhFfCb1ELz3yeDCDBi6VORfN0RMsU5pA=;
	b=GNFMWpF+hD8jdZO3NGTur7+AX8P0TG8hhl97FjQtoFv8BAptI92Y6TI4srZUqvpGhG56FQ
	OaByZXcdFnunNzDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1700138A7;
	Mon, 29 Apr 2024 06:57:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gBRzMbxEL2YQbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 06:57:00 +0000
Date: Mon, 29 Apr 2024 08:57:12 +0200
Message-ID: <87o79s1ws7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Rajashekar Kuruva (Temp)" <quic_kuruva@quicinc.com>
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
	<robh@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH] [RFC PATCH] ALSA: usb-audio: endpoint: Prevent NULL
 pointer deference in snd_usb_endpoint_close
In-Reply-To: <64ed9496-577c-4f31-b061-9f3dcaca4b26@quicinc.com>
References: <20240426122511.547755-1-quic_kuruva@quicinc.com>
	<877cgks399.wl-tiwai@suse.de>
	<64ed9496-577c-4f31-b061-9f3dcaca4b26@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 5ADZ3OYYLBM5WMUGYSPN6RP5OYVSARNW
X-Message-ID-Hash: 5ADZ3OYYLBM5WMUGYSPN6RP5OYVSARNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ADZ3OYYLBM5WMUGYSPN6RP5OYVSARNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Apr 2024 08:23:27 +0200,
Rajashekar Kuruva (Temp) wrote:
> 
> 
> On 4/26/2024 6:13 PM, Takashi Iwai wrote:
> > On Fri, 26 Apr 2024 14:25:11 +0200,
> > Rajashekar kuruva wrote:
> >> When multiple plug-in and plug-out events occur,
> >> there is a risk of encountering a NULL pointer dereference
> >> leading to a kernel panic during a headset use-case.
> >> this issue arises in the snd_usb_endpoint_close function
> > Such a scenario can't happen: ep->iface_ref is changed only in
> > chip->mutex lock, hence it can't be NULL there.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> Hi Takashi,
> 
> Actually we are facing NULL pointer deference while running headset
> case when i checked call trace the last running function is
> snd_usb_endpoint_close where iface_ref and clock_ref both are 0x0
> 
> [75703.933104][T10585] Unable to handle kernel NULL pointer
> dereference at virtual address 0000000000000004
> [75703.933113][T10585] [RB/E]rb_sreason_str_set: sreason_str set NULL
> pointer dereference
> [75703.933116][T10585] Mem abort info:
> [75703.933117][T10585]   ESR = 0x0000000096000005
> [75703.933119][T10585]   EC = 0x25: DABT (current EL), IL = 32 bits
> [75703.933120][T10585]   SET = 0, FnV = 0
> [75703.933121][T10585]   EA = 0, S1PTW = 0
> [75703.933123][T10585]   FSC = 0x05: level 1 translation fault
> [75703.933124][T10585] Data abort info:
> [75703.933124][T10585]   ISV = 0, ISS = 0x00000005
> [75703.933125][T10585]   CM = 0, WnR = 0
> …
> [75703.933676][T10585] CPU: 3 PID: 10585 Comm: kworker/u17:0 Tainted:
> G S      W  OE 6.1.43-android14-11-ga2fa77d36d26-ab11204829 #1
> [75703.933697][T10585] pstate: 62400005 (nZCv daif +PAN -UAO +TCO -DIT
> -SSBS BTYPE=--)
> [75703.933700][T10585] pc : snd_usb_endpoint_close+0x30/0x104
> [75703.933721][T10585] lr : snd_usb_endpoint_close+0x28/0x104
> [75703.933724][T10585] sp : ffffffc04b2bb740
> [75703.933725][T10585] x29: ffffffc04b2bb740 x28: ffffff8024e3ba78
> x27: ffffffd266e91da0
> [75703.933728][T10585] x26: ffffffc04b2bb7a8 x25: ffffff89bec5be00
> x24: 00000000ffffffea
> [75703.933730][T10585] x23: 0000000000000002 x22: ffffff885d568008
> x21: ffffff8024e3ba78
> [75703.933732][T10585] x20: ffffff885d568000 x19: ffffff8024e3bb18
> x18: ffffffd26db2d140
> [75703.933734][T10585] x17: 00000000f01b0818 x16: 00000000f01b0818
> x15: 0000000000000008
> [75703.933736][T10585] x14: ffffff8a3e2b5780 x13: ffffff8a3e2b5780
> x12: ffffffd26cbd2770
> [75703.933738][T10585] x11: 0000000000000001 x10: ffffff8984320000 x9
> : 4f43b86e946b4e00
> [75703.933740][T10585] x8 : 0000000000000000 x7 : 0000000000000001 x6
> : fffffffdef8e8b70
> [75703.933742][T10585] x5 : 0000000000000001 x4 : 0000000000000000 x3
> : ffffff8024e3bb28
> [75703.933743][T10585] x2 : 00000001011fa7c9 x1 : ffffffc04b2bb680 x0
> : 0000000000000000
> [75703.933746][T10585] Call trace:
> [75703.933747][T10585]  snd_usb_endpoint_close+0x30/0x104

Who is actually calling snd_usb_endpoint_close()?
I guess that's rather a bug in the call pattern, not the code in
USB-audio driver itself.

snd_usb_endpoint_close() is supposed to be called only for a really
opened endpoint.  So, if any, it's rather a race (or a bug) in the
caller side, and it should be addressed there instead.


thanks,

Takashi
