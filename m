Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF18B5C4B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 17:03:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5784782C;
	Mon, 29 Apr 2024 17:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5784782C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714403025;
	bh=miTWxwVdZbDlZpdmKVl7wyYlLIVCGSI4AfkWRG9XsGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LZ7YDvEOUZ+L2n81lG8ouHLK7yOeATxzKTq/l+7T5gotH094K5u4UZxz84dV0hRXA
	 7roNwegLtBkDuxP4kST1fNxOvJqdOmli6z+CaNB629Mug/5pYcIxqu6mit4HFn7qkh
	 Dz52kj7Hcfb4qOQmOw8JOOQ6vmRvY3SQrq0eMvdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A62F0F80571; Mon, 29 Apr 2024 17:03:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E6D8F8057A;
	Mon, 29 Apr 2024 17:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0818F804CC; Mon, 29 Apr 2024 17:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FA0FF8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 17:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA0FF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rCnAq+p9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Wh4NHGGF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=lpCbELZ3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PgYvQ55k
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A25511F449;
	Mon, 29 Apr 2024 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714402973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhynKhGQ4JRaS+p7qeBOoKEeBflNlibc5Py6TFNuPSY=;
	b=rCnAq+p9D5b+dI02+/FS+IpKWGEMQNpZOVGWiTdijhGy501pz3tIOxAUeOn3QYvrNhe84B
	4WYTmiGuPkq6CRjEMdge60HGc5TCbgi2zoGb0EU7lx51yp4lvozAfp0xqcXmzuHt24hmUA
	EWguxiL/ipGKV82fQFDV+xhkPMu6OC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714402973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhynKhGQ4JRaS+p7qeBOoKEeBflNlibc5Py6TFNuPSY=;
	b=Wh4NHGGF6ocVUqNMvsE6IbZvRwoQ1f1UXpSCAoqd8LQB5pzuPE/Meuq/KLSOC6hI30/+uz
	QUKYK3r9SNkRcmAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714402972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhynKhGQ4JRaS+p7qeBOoKEeBflNlibc5Py6TFNuPSY=;
	b=lpCbELZ3ONDfQjS5d+T26NqEf8z6WF0f5zzZw6pmQyY09qmwp8sVnNB6HkCKyaMMiwHd7L
	dhjq6YCOlfZScATikMf7ctuJRaDTGv2H884SICt7C7/pi145zwn7w+yhre1EYS7oRQrkNQ
	SW1lNkhaSQu9BXHpOKFkUiPQju371kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714402972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhynKhGQ4JRaS+p7qeBOoKEeBflNlibc5Py6TFNuPSY=;
	b=PgYvQ55kKm4HSARxg/u1W8jqh9cXFFfnZTb5LUzaUCVCcTQmuOwIjtwxRxroElqw9YvzOU
	6UgA9pOtinnv8mCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E9C2138A7;
	Mon, 29 Apr 2024 15:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2k2xGZy2L2YvFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 15:02:52 +0000
Date: Mon, 29 Apr 2024 17:03:04 +0200
Message-ID: <8734r4p5xz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,	alsa-devel@alsa-project.org,
	broonie@kernel.org,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi
 <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: harden I2C/I2S codec
 detection
In-Reply-To: <20240426152818.38443-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152818.38443-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.83 / 50.00];
	BAYES_HAM(-2.53)[97.89%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
Message-ID-Hash: IVEUPEG4BE5WIHECYYWIKQSU6V4BIL6P
X-Message-ID-Hash: IVEUPEG4BE5WIHECYYWIKQSU6V4BIL6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVEUPEG4BE5WIHECYYWIKQSU6V4BIL6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 17:28:18 +0200,
Pierre-Louis Bossart wrote:
> 
> The SOF driver is selected whenever specific I2C/I2S HIDs are reported
> as 'present' in the ACPI DSDT. In some cases, an HID is reported but
> the hardware does not actually rely on I2C/I2S.  This false positive
> leads to an invalid selection of the SOF driver and as a result an
> invalid topology is loaded.
> 
> This patch hardens the detection with a check that the NHLT table is
> consistent with the report of an I2S-based codec in DSDT. This table
> should expose at least one SSP endpoint configured for an I2S-codec
> connection.
> 
> Tested on Huawei Matebook D14 (NBLB-WAX9N) using an HDaudio codec with
> an invalid ES8336 ACPI HID reported:
> 
> [    7.858249] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
> [    7.858312] snd_hda_intel 0000:00:1f.3: snd_intel_dsp_find_config: no valid SSP found for HID ESSX8336, skipped
> 
> Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Closes: https://github.com/thesofproject/linux/issues/4934
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

Applied now.  Thanks.


Takashi
