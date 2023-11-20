Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B37F1236
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 12:38:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6B9AE9;
	Mon, 20 Nov 2023 12:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6B9AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700480312;
	bh=5x6kyzSTZiaGQWuAf87bWWJpnSe+cALoTU1F0WR76vA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D/WxDmsNIvWuMLgk4/fG77B0Vjyh30Udap2AxK0G0FBlfLawPEAc59PuL7WouTSiy
	 Q83uIrFgt19ynleBbEthQ/a3CxrrzRwPMCzzvYzuJaD6XnNGQ/U99LADRT2H26MAXD
	 RcViBbHPkp1RNR71hZ0l9IQ8fwL62jyWZ4sbuDOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D691AF802E8; Mon, 20 Nov 2023 12:37:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BCB9F802E8;
	Mon, 20 Nov 2023 12:37:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D4EBF80310; Mon, 20 Nov 2023 12:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FB42F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 12:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FB42F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=E7EQxner;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WqY1QIIK
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EADC721904;
	Mon, 20 Nov 2023 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700480253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XtkkkpmPUqOV5wGnu9VXko/EkG5FheGW/d/tOMb0r0=;
	b=E7EQxnerNqx/xhapJYSCpse58nlaIvZ2aWhEJxdr1YdQ8Bln+apuPte6Ba6U7RV6BR9rVJ
	fEMV62ErQiR9i0pDsMEUgs41jUmW+p7C+xYumHPPgpd8D/8rnb9ZNwGfdqtN1CWLg2CumG
	PyELPZUF2BFsUfwN4mle1mnQ1Bhh93I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700480253;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XtkkkpmPUqOV5wGnu9VXko/EkG5FheGW/d/tOMb0r0=;
	b=WqY1QIIKSNjauUCtaetBn8RuVnrBxvgBnBVQ2nKjGxScjrNFVTyqhyKNe/0ma/kfZfK+SU
	AHD5/iskRcZhKnCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B051F13499;
	Mon, 20 Nov 2023 11:37:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NwNEKv1EW2UEPQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 20 Nov 2023 11:37:33 +0000
Date: Mon, 20 Nov 2023 12:37:33 +0100
Message-ID: <87zfz8psea.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
In-Reply-To: <20231117163609.823627-1-sbinding@opensource.cirrus.com>
References: <20231117163609.823627-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.88 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.58)[81.44%]
Message-ID-Hash: B4LYWZROFCDBMUCLAMVWU5IOSQJHXJP3
X-Message-ID-Hash: B4LYWZROFCDBMUCLAMVWU5IOSQJHXJP3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4LYWZROFCDBMUCLAMVWU5IOSQJHXJP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Nov 2023 17:36:07 +0100,
Stefan Binding wrote:
> 
> Some systems use older firmware which does not support newer commands
> which are used to enable external boost. For those systems, we can
> workaround this by writing the registers directly.
> 
> We can use the firmware version, stored inside cs_dsp, to determine
> whether or not the command is supported.
> To achieve this, it requires a cleanup in the api, to pass the cs_dsp
> struct into the function.
> 
> We can also remove the redundant boolean firmware_running from the HDA
> driver, and use the equivalent state inside cs_dsp.
> 
> Changes since V1:
> - Added fixes tag to all patches
> - patches rebased after v6.7 release
> 
> Stefan Binding (2):
>   ALSA: hda: cs35l41: Remove unnecessary boolean state variable
>     firmware_running
>   ALSA: cs35l41: Fix for old systems which do not support command

Both patches applied now.  Thanks.


Takashi
