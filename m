Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7D88DB30
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 11:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAA12C00;
	Wed, 27 Mar 2024 11:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAA12C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711535173;
	bh=0e2xfwb4U2fZ5mQQeSTGhasWsRxBW8LMen2Dviag7co=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YquFW4wcala/L9ckgKH6R+5TLYodGPIuhesXv5oBzHwpXw5XKCmaka7KDDFc9FInt
	 0JqXXP85dc5VVZEEleYNOunwVTTcxmMjpes8tzJaD9nTYh77ELse6n/SPfaRsGYg+q
	 724NTFW0Xl/74I1dibgaOdJwWWgmV1ejhOTdLYjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCC5F805A9; Wed, 27 Mar 2024 11:25:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B35CF80563;
	Wed, 27 Mar 2024 11:25:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F32D8F8025F; Wed, 27 Mar 2024 11:25:36 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C824BF80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 11:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C824BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FwWQbeBu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fqycNERe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=FwWQbeBu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fqycNERe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CEF59383BC;
	Wed, 27 Mar 2024 10:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711535131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AkKqHDoToHVeJHWi3Rlrg9RTE/Xa/qdhkLZfkTRhEs=;
	b=FwWQbeBu+jNh1KgAazBTY2eynypTX7882xhyrUyYy2h23a5I/AQsdGpN+lhrubcyKbeBSF
	Zv4x3bnYWFaH8b3wOO/OaYVRFjn5aAGj/jOJ2DiluOKYdc3RI10nL4QnjBZnhfdU+fBbK/
	lMveg3Mbc1HVuJArUmRXjkljhkx2Apc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711535131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AkKqHDoToHVeJHWi3Rlrg9RTE/Xa/qdhkLZfkTRhEs=;
	b=fqycNEReW9SYIVyZliwWgZ11xC8NN9G6smTEkaAZxpF30up457SWgKj1GzyI2Z+jlsNMOm
	VOGCYR3Xu/A7BPDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711535131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AkKqHDoToHVeJHWi3Rlrg9RTE/Xa/qdhkLZfkTRhEs=;
	b=FwWQbeBu+jNh1KgAazBTY2eynypTX7882xhyrUyYy2h23a5I/AQsdGpN+lhrubcyKbeBSF
	Zv4x3bnYWFaH8b3wOO/OaYVRFjn5aAGj/jOJ2DiluOKYdc3RI10nL4QnjBZnhfdU+fBbK/
	lMveg3Mbc1HVuJArUmRXjkljhkx2Apc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711535131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AkKqHDoToHVeJHWi3Rlrg9RTE/Xa/qdhkLZfkTRhEs=;
	b=fqycNEReW9SYIVyZliwWgZ11xC8NN9G6smTEkaAZxpF30up457SWgKj1GzyI2Z+jlsNMOm
	VOGCYR3Xu/A7BPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76B1A1369F;
	Wed, 27 Mar 2024 10:25:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J6ZxGxv0A2afJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Mar 2024 10:25:31 +0000
Date: Wed, 27 Mar 2024 11:25:33 +0100
Message-ID: <87edbw7yzm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ALSA: hda/tas2781: fixes for 6.9-rc1
In-Reply-To: <cover.1711469583.git.soyer@irl.hu>
References: <cover.1711469583.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.34 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.04)[57.58%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: ZPHHDBXJDAFQJ2F6BHWTNOAOBJ5KOZJN
X-Message-ID-Hash: ZPHHDBXJDAFQJ2F6BHWTNOAOBJ5KOZJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPHHDBXJDAFQJ2F6BHWTNOAOBJ5KOZJN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Mar 2024 17:18:44 +0100,
Gergo Koteles wrote:
> 
> Hi,
> 
> This series removes the no longer needed digital gain kcontrol, which 
> caused problems in tas2563, because the register does not exists there.
> 
> This series also adds locking and debug statements to the other 
> kcontrols. They sometimes ran in parallel with tasdev_fw_ready, and 
> caused weird sound problems.
> https://github.com/tomsom/yoga-linux/issues/58
> 
> Regards,
> Gergo
> 
> Changes in v2:
>  - Do not remove dvc_tlv scale from tas2781-tlv.h as it is also used by
>    sound/soc/codecs/tas2781-i2c.c
>  - Add kcontrol name to debug statements
>  - Add a new patch to remove a useless debug statement.
> 
> [1]: https://lore.kernel.org/all/cover.1711401621.git.soyer@irl.hu/
> 
> Gergo Koteles (4):
>   ALSA: hda/tas2781: remove digital gain kcontrol
>   ALSA: hda/tas2781: add locks to kcontrols
>   ALSA: hda/tas2781: add debug statements to kcontrols
>   ALSA: hda/tas2781: remove useless dev_dbg from playback_hook

Applied now.  Thanks.


Takashi
