Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8BA68642
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Mar 2025 08:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8D560259;
	Wed, 19 Mar 2025 08:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8D560259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742371080;
	bh=Emgpc503X8juHTCcl2S0SaOYRXHfff0AiD7181TP/Vk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GcmZNp3AQr5YbzJifZyTfDClHZ4nqdn9QaiyTPWUbEXNW2Cijulcan98yBvAX90yg
	 RreTaV5cWJoVdWUZKHqDa50aQe4Ry/9QwLtDiKuLp5TQhyXU2PxzqDmdbHF7ptEvUW
	 07B8kESI+UPUDU/fthzjuHrI4plXQaz78etVN3q4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26F13F805C5; Wed, 19 Mar 2025 08:57:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01858F805BE;
	Wed, 19 Mar 2025 08:57:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 046D1F805A0; Wed, 19 Mar 2025 08:57:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EABFFF8001D
	for <alsa-devel@alsa-project.org>; Wed, 19 Mar 2025 08:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EABFFF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=brcUDHHX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2ZR21b5w;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=brcUDHHX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2ZR21b5w
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 00DE421CB3;
	Wed, 19 Mar 2025 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742371039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqCIO3Z7+Q+d1dklptKNa+nCFtHsf40xhoFT+swJOS0=;
	b=brcUDHHXEaBcDx+tNdWrkYCGHZY5Nkq81qKtr6dNaxzhxTu2U9G8QekFwJ56ef2vU7qRtJ
	fknlvHzxtE8neLymT5fw3SucUUO54AjD4sz/v7yW3SUoEICxMiCHBAYuvCEUw4gfPdytYN
	yWb41/HtQ0tAzd5tpbQCBBId+vYWgCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742371039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqCIO3Z7+Q+d1dklptKNa+nCFtHsf40xhoFT+swJOS0=;
	b=2ZR21b5w3NOiEGRWlwPK0nQ85ijkTFTA6fzAn+mf296QhCkY4AY54rRBeWy6hGCsHZRThX
	9skB8S/kjaUroaBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=brcUDHHX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2ZR21b5w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742371039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqCIO3Z7+Q+d1dklptKNa+nCFtHsf40xhoFT+swJOS0=;
	b=brcUDHHXEaBcDx+tNdWrkYCGHZY5Nkq81qKtr6dNaxzhxTu2U9G8QekFwJ56ef2vU7qRtJ
	fknlvHzxtE8neLymT5fw3SucUUO54AjD4sz/v7yW3SUoEICxMiCHBAYuvCEUw4gfPdytYN
	yWb41/HtQ0tAzd5tpbQCBBId+vYWgCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742371039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqCIO3Z7+Q+d1dklptKNa+nCFtHsf40xhoFT+swJOS0=;
	b=2ZR21b5w3NOiEGRWlwPK0nQ85ijkTFTA6fzAn+mf296QhCkY4AY54rRBeWy6hGCsHZRThX
	9skB8S/kjaUroaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A535913726;
	Wed, 19 Mar 2025 07:57:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YG9pJt542mcJLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Mar 2025 07:57:18 +0000
Date: Wed, 19 Mar 2025 08:57:18 +0100
Message-ID: <874izp1mht.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	andriy.shevchenko@linux.intel.com,
	13916275206@139.com,
	13564923607@139.com,
	alsa-devel@alsa-project.org,
	baojun.xu@ti.com
Subject: Re: [RESEND PATCH v5] ASoC: tas2781: Support dsp firmware Alpha and
 Beta seaies
In-Reply-To: <f0bc9d68-5383-43b8-afea-0a065bcbe93c@sirena.org.uk>
References: <20250313093238.1184-1-shenghao-ding@ti.com>
	<f0bc9d68-5383-43b8-afea-0a065bcbe93c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 00DE421CB3
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,linux.intel.com,139.com,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: LBL3O7LYOLEMYLM5RNG7NDOF3CVUASMU
X-Message-ID-Hash: LBL3O7LYOLEMYLM5RNG7NDOF3CVUASMU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBL3O7LYOLEMYLM5RNG7NDOF3CVUASMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Mar 2025 23:26:45 +0100,
Mark Brown wrote:
> 
> On Thu, Mar 13, 2025 at 05:32:38PM +0800, Shenghao Ding wrote:
> > For calibration, basic version does not contain any calibration addresses,
> > it depends on calibration tool to convey the addresses to the driver.
> > Since Alpha and Beta firmware, all the calibration addresses are saved
> > into the firmware.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> Takashi, this depends on changes in your tree due to the HDA bit - can
> you apply it please?

Sorry I overlooked it.  Now applied.


thanks,

Takashi
