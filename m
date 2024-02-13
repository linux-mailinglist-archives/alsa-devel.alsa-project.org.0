Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7615852E55
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 11:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 374C0B76;
	Tue, 13 Feb 2024 11:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 374C0B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707821332;
	bh=3U05UCAq1LKPx4ylCJPyDo9lukWD3K8+5PwEuPQdu/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bxOWUEJloBTQOTwpmI3XliEn38wQxuYYbbWNnT2iYMrFyCYJD6X51gbpyOJARajZ0
	 x/hMOX3hVSdmuatBvcJKXXc968SzBa5llB7Dyztk0Q+EqgBn9htHrqtBzVjMFkiX8k
	 HhlwHjW3N7ACCSoTCpfzw23Gqd6vyQi+OoeIlg/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F211F80589; Tue, 13 Feb 2024 11:48:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AFAEF8059F;
	Tue, 13 Feb 2024 11:48:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D89ACF80238; Tue, 13 Feb 2024 11:48:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 89AFEF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89AFEF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1rKgP++3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=apC07bjj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1rKgP++3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=apC07bjj
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ABE8C1FC81;
	Tue, 13 Feb 2024 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707821284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fmGgJEKlpIBOZTyUzn23meJGrW/K86RdyX8/Qka9Pc=;
	b=1rKgP++34WbapWVIwZ/rbpaWLAathMQ69A9jkI+8TeMSM1V655GQzx/fNAGI3rmPnSiHQG
	wDtb2rQw0jW0ygX8ONm/gMH0LwMvAFgO451zB1aZzeYx52SrU8wspbS7aowj7Nh2qydvH8
	dmoVyZoaC+6yB7yybtUo9TlLyRIB07c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707821284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fmGgJEKlpIBOZTyUzn23meJGrW/K86RdyX8/Qka9Pc=;
	b=apC07bjjmW4Lg467s45A6nN999r+fIhfE3gNN8cBieQvW8QpZZNf5UBjN9PlnWr1TLnRih
	DLmg6gKN5pQ2a6AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707821284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fmGgJEKlpIBOZTyUzn23meJGrW/K86RdyX8/Qka9Pc=;
	b=1rKgP++34WbapWVIwZ/rbpaWLAathMQ69A9jkI+8TeMSM1V655GQzx/fNAGI3rmPnSiHQG
	wDtb2rQw0jW0ygX8ONm/gMH0LwMvAFgO451zB1aZzeYx52SrU8wspbS7aowj7Nh2qydvH8
	dmoVyZoaC+6yB7yybtUo9TlLyRIB07c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707821284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+fmGgJEKlpIBOZTyUzn23meJGrW/K86RdyX8/Qka9Pc=;
	b=apC07bjjmW4Lg467s45A6nN999r+fIhfE3gNN8cBieQvW8QpZZNf5UBjN9PlnWr1TLnRih
	DLmg6gKN5pQ2a6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B66413404;
	Tue, 13 Feb 2024 10:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gvaAGeRIy2XcbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 10:48:04 +0000
Date: Tue, 13 Feb 2024 11:48:04 +0100
Message-ID: <87zfw4y717.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v15 18/50] ASoC: Add SOC USB APIs for adding an USB
 backend
In-Reply-To: <20240213005422.3121-19-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
	<20240213005422.3121-19-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1rKgP++3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=apC07bjj
X-Spamd-Result: default: False [1.10 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.09)[64.62%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ABE8C1FC81
X-Spamd-Bar: +
Message-ID-Hash: PF4IG4IA64UL2CHBWGE4BHYQDHD3QTEH
X-Message-ID-Hash: PF4IG4IA64UL2CHBWGE4BHYQDHD3QTEH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PF4IG4IA64UL2CHBWGE4BHYQDHD3QTEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 01:53:50 +0100,
Wesley Cheng wrote:
> 
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -76,6 +76,15 @@ config SND_SOC_UTILS_KUNIT_TEST
>  config SND_SOC_ACPI
>  	tristate
>  
> +config SND_SOC_USB
> +	bool "SoC based USB audio offloading"
> +	help
> +	  Enable this option if an ASoC platform card has support to handle
> +	  USB audio offloading.  This enables the SoC USB layer, which will
> +	  notifies the ASoC USB DPCM backend DAI link about available USB audio
> +	  devices.  Based on the notifications, sequences to enable the audio
> +	  stream can be taken based on the design.

This should be tristate, and...

> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -31,6 +31,10 @@ endif
>  
>  obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
>  
> +ifneq ($(CONFIG_SND_SOC_USB),)
> +snd-soc-core-objs += soc-usb.o
> +endif

... split it to an individual module, i.e.:

snd-soc-usb-objs := soc-usb.o
obj-$(CONFIG_SND_SOC_USB) += snd-soc-usb.o

Otherwise it'll lead to a hard-dependency to snd-soc-core on
snd-usb-audio, which is utterly unnecessary for most of other
devices.


thanks,

Takashi
