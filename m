Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A680C289
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 09:01:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A825E844;
	Mon, 11 Dec 2023 09:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A825E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702281673;
	bh=+baNFw6A3GebDC/R+mY2yb0WCaQkMxjY1MBYGq+ZtAw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nJQAoQAQxs0JEpH8OVhCFU1gsLeWPBTuiYcmL6J3ESSWv5lSTKPonR7B2li/i6l/O
	 +sq+IglRUxNvIAC9WO7WZbzFvb+cw6GRrePWlOWnGBXGwZ1XW0bVBjMFreYAK7Qs1d
	 jVNdRTWqWGM+d0glhTQIKMhbHTI0VyD5aVZb6l5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BA79F80494; Mon, 11 Dec 2023 09:00:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76D2EF8057A;
	Mon, 11 Dec 2023 09:00:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59194F80166; Mon, 11 Dec 2023 08:59:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 06BCDF80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 08:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06BCDF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=F2EXEQKF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZVxx0YFR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=F2EXEQKF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZVxx0YFR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B90D1FB6C;
	Mon, 11 Dec 2023 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702281549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uu6n7mEvnmXbniOla3rPuD+at6mp806bEoBZqpe8Srs=;
	b=F2EXEQKFjaL8rqwVqqdQBU9hMTkZcxVRfsFW6uSowHHxfUb6IKM5rUc5vyH1u+nz5Gu0Qy
	c40XaN2A62IIVciP3J+v37MzCtnwTQTQaolpzUO8jfCwFudytNhcgJgDPymwqHGUXV0Gum
	IS1xPDJ7lZgF1CpgSe05vGUPx5oATRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702281549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uu6n7mEvnmXbniOla3rPuD+at6mp806bEoBZqpe8Srs=;
	b=ZVxx0YFRxMokq+KnjclNVrUIaH9LdO+mntagvBMf6y1V//puLAuAZW+AxTunPqt8UsfUr6
	BsAvAzr9si24LnAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702281549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uu6n7mEvnmXbniOla3rPuD+at6mp806bEoBZqpe8Srs=;
	b=F2EXEQKFjaL8rqwVqqdQBU9hMTkZcxVRfsFW6uSowHHxfUb6IKM5rUc5vyH1u+nz5Gu0Qy
	c40XaN2A62IIVciP3J+v37MzCtnwTQTQaolpzUO8jfCwFudytNhcgJgDPymwqHGUXV0Gum
	IS1xPDJ7lZgF1CpgSe05vGUPx5oATRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702281549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uu6n7mEvnmXbniOla3rPuD+at6mp806bEoBZqpe8Srs=;
	b=ZVxx0YFRxMokq+KnjclNVrUIaH9LdO+mntagvBMf6y1V//puLAuAZW+AxTunPqt8UsfUr6
	BsAvAzr9si24LnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE16D132DA;
	Mon, 11 Dec 2023 07:59:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UcQTMUzBdmXlHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Dec 2023 07:59:08 +0000
Date: Mon, 11 Dec 2023 08:59:08 +0100
Message-ID: <874jgp5fw3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: handle missing EFI calibration data
In-Reply-To: 
 <f1f6583bda918f78556f67d522ca7b3b91cebbd5.1702251102.git.soyer@irl.hu>
References: 
 <f1f6583bda918f78556f67d522ca7b3b91cebbd5.1702251102.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.17)[-0.867];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.81)[99.19%]
Message-ID-Hash: R5JFXSGYWNHVPV443PXD7NSMB5C6NSVQ
X-Message-ID-Hash: R5JFXSGYWNHVPV443PXD7NSMB5C6NSVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5JFXSGYWNHVPV443PXD7NSMB5C6NSVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Dec 2023 00:37:33 +0100,
Gergo Koteles wrote:
> 
> The code does not properly check whether the calibration variable is
> available in the EFI. If it is not available, it causes a NULL pointer
> dereference.
> 
> Check the return value of the first get_variable call also.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> Call Trace:
>  <TASK>
>  ? __die+0x23/0x70
>  ? page_fault_oops+0x171/0x4e0
>  ? srso_alias_return_thunk+0x5/0x7f
>  ? schedule+0x5e/0xd0
>  ? exc_page_fault+0x7f/0x180
>  ? asm_exc_page_fault+0x26/0x30
>  ? crc32_body+0x2c/0x120
>  ? tas2781_save_calibration+0xe4/0x220 [snd_hda_scodec_tas2781_i2c]
>  tasdev_fw_ready+0x1af/0x280 [snd_hda_scodec_tas2781_i2c]
>  request_firmware_work_func+0x59/0xa0
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied now.


Takashi
