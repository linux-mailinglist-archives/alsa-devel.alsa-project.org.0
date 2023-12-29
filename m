Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E02822215
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:35:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCDBFE7A;
	Tue,  2 Jan 2024 20:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCDBFE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704224127;
	bh=c3mj4U6B89OBOXSLfHqIOMhTlXh0yoqVpoHShG8nBIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AbEu2Ri0j7ZZO1sOJ0oR8gmyuwq2NKsUHuIFHSF886YMEa2djtHV+2GbhXGtJJmFn
	 LvdYOKe4PCZwGgiVMlQQc836QlMjK3CsGrX5i07vp0JP1ncFr0Cfu+K52SXhJ82t4c
	 WZvE83TXY/Oz68x1nbtywjx1AiYHhhaiK7+4MF3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D34F80568; Tue,  2 Jan 2024 20:35:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E0AF8055B;
	Tue,  2 Jan 2024 20:35:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CCC6F80551; Tue,  2 Jan 2024 20:34:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7892AF80051
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7892AF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=c0K6bqrK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Qec/+vnn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=c0K6bqrK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Qec/+vnn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9EF1F7A9;
	Fri, 29 Dec 2023 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703853980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrfgzpQFNY6S02Kc9q4U3G892up+XPMx6Jx7zcjS9aI=;
	b=c0K6bqrKFgbSd2sx5A0/v8DUDyIYdmzAhQuZrPIUxrs1EW2G5OHEz1WoNKx2P6ERfdxVsh
	Av7EzPAs/MHvxXtRtYHzfIQsil2E1Pnf4SGHlX5fKgnskBx0S0OyGvHOxE+++cz+yIw9+1
	HSy41BMzWubXLpeCVtX/tZSNNp0fAYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703853980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrfgzpQFNY6S02Kc9q4U3G892up+XPMx6Jx7zcjS9aI=;
	b=Qec/+vnnPIlHWbWk23hbqWGaLrxW3tHt5/1Fx4dWNmrr8eFLEOcLqYx3dVPzXwab9VO4F5
	dDujQtHu7BT3k/Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703853980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrfgzpQFNY6S02Kc9q4U3G892up+XPMx6Jx7zcjS9aI=;
	b=c0K6bqrKFgbSd2sx5A0/v8DUDyIYdmzAhQuZrPIUxrs1EW2G5OHEz1WoNKx2P6ERfdxVsh
	Av7EzPAs/MHvxXtRtYHzfIQsil2E1Pnf4SGHlX5fKgnskBx0S0OyGvHOxE+++cz+yIw9+1
	HSy41BMzWubXLpeCVtX/tZSNNp0fAYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703853980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DrfgzpQFNY6S02Kc9q4U3G892up+XPMx6Jx7zcjS9aI=;
	b=Qec/+vnnPIlHWbWk23hbqWGaLrxW3tHt5/1Fx4dWNmrr8eFLEOcLqYx3dVPzXwab9VO4F5
	dDujQtHu7BT3k/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5D5E133E5;
	Fri, 29 Dec 2023 12:46:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o1LhKpu/jmV2aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 12:46:19 +0000
Date: Fri, 29 Dec 2023 13:46:19 +0100
Message-ID: <87v88hxjl0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/tas2781: move set_drv_data outside
 tasdevice_init
In-Reply-To: 
 <1398bd8bf3e935b1595a99128320e4a1913e210a.1703204848.git.soyer@irl.hu>
References: 
 <1398bd8bf3e935b1595a99128320e4a1913e210a.1703204848.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ti.com,perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.98%]
Authentication-Results: smtp-out2.suse.de;
	none
Message-ID-Hash: DOEY5JVZRIZBIELV2DO5KZLXL5OOFTJL
X-Message-ID-Hash: DOEY5JVZRIZBIELV2DO5KZLXL5OOFTJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOEY5JVZRIZBIELV2DO5KZLXL5OOFTJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Dec 2023 01:34:47 +0100,
Gergo Koteles wrote:
> 
> allow driver specific driver data in tas2781-hda-i2c and tas2781-i2c
> 
> Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Both patches applied to for-linus branch now.  Thanks.


Takashi
