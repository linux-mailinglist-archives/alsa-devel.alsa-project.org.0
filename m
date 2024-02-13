Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5715852EA1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 12:00:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2382783E;
	Tue, 13 Feb 2024 12:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2382783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707822035;
	bh=z5rLb6MsNMrDpWRnjctFpUrE7AGtrnX2KDuGHeXO7Ek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N18RLJ2oQiUjeuWKsiNUWfKrV82xiNX1oLn+Sp2zr87vO/la0UbhHlSOWtTDZuwgi
	 9CvSJib8bTaRP4nRI5Bfvqr80Q07HA5FWSIa9S2itKks2ZlXtUyJoxrd3cAMuHVG90
	 Fca5Ql9x7OYtedoBVUh17p6F6aV6JOCc4ZAqDbBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8913F805A9; Tue, 13 Feb 2024 12:00:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F58F80588;
	Tue, 13 Feb 2024 12:00:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA976F80238; Tue, 13 Feb 2024 11:59:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C1BAF80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C1BAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nQPWZMsL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U704wtln;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nQPWZMsL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U704wtln
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C0CB1FCA1;
	Tue, 13 Feb 2024 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707821993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nssWF1i/oSbiQpzptSWDyl0IEP8C/Hz0bw8YG0ty/hY=;
	b=nQPWZMsLWCEqCIgUH0rwcQ3Luz26DlMH6dNGQuzYmrntsG9tIvn4uhY0EgiwdEkAqE5zUg
	r8zvr/ohbG9MMe/N8Ffo1Oczy5PlS9YatpC964fkkjiI6Euq7z9SBYeRsxwvL5eMn2D+Ar
	Hvz9vUqRbleHSMHv5kW0PpoSWV9GI3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707821993;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nssWF1i/oSbiQpzptSWDyl0IEP8C/Hz0bw8YG0ty/hY=;
	b=U704wtln6aIUurJC7nEA0jrBRJ7dYOjWgJvYaW9Ay6lVzJEJXmSN25ik06tXw6WiEvVotX
	gy23pC7EoCMp2gAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707821993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nssWF1i/oSbiQpzptSWDyl0IEP8C/Hz0bw8YG0ty/hY=;
	b=nQPWZMsLWCEqCIgUH0rwcQ3Luz26DlMH6dNGQuzYmrntsG9tIvn4uhY0EgiwdEkAqE5zUg
	r8zvr/ohbG9MMe/N8Ffo1Oczy5PlS9YatpC964fkkjiI6Euq7z9SBYeRsxwvL5eMn2D+Ar
	Hvz9vUqRbleHSMHv5kW0PpoSWV9GI3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707821993;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nssWF1i/oSbiQpzptSWDyl0IEP8C/Hz0bw8YG0ty/hY=;
	b=U704wtln6aIUurJC7nEA0jrBRJ7dYOjWgJvYaW9Ay6lVzJEJXmSN25ik06tXw6WiEvVotX
	gy23pC7EoCMp2gAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DF1913404;
	Tue, 13 Feb 2024 10:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h5x7EqlLy2UVcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 10:59:53 +0000
Date: Tue, 13 Feb 2024 11:59:53 +0100
Message-ID: <87wmr8y6hi.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v15 29/50] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
In-Reply-To: <20240213005422.3121-30-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
	<20240213005422.3121-30-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nQPWZMsL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=U704wtln
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.76 / 50.00];
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
	 BAYES_HAM(-1.75)[93.51%];
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 8C0CB1FCA1
Message-ID-Hash: AQA23NLJOHK7R3BJCJDPLUHCRB7DWCAH
X-Message-ID-Hash: AQA23NLJOHK7R3BJCJDPLUHCRB7DWCAH
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 01:54:01 +0100,
Wesley Cheng wrote:
> +static int __init qc_usb_audio_offload_init(void)
> +{
> +	struct uaudio_qmi_svc *svc;
> +	int ret;
> +
> +	svc = kzalloc(sizeof(struct uaudio_qmi_svc), GFP_KERNEL);
> +	if (!svc)
> +		return -ENOMEM;
> +
> +	svc->uaudio_wq = create_singlethread_workqueue("uaudio_svc");
> +	if (!svc->uaudio_wq) {
> +		ret = -ENOMEM;
> +		goto free_svc;
> +	}

Do we need a dedicated workqueue?  I don't mind much, but an own
workqueue isn't usually needed unless specifically required such as
the request quantity control or isolation.


thanks,

Takashi
