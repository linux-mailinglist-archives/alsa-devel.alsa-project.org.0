Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B0906F68
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974E8DE5;
	Thu, 13 Jun 2024 14:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974E8DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718281166;
	bh=0vHhhY/zVA/M2y+Bpp6L+TVzNi4/llugcqCiUaie5S0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eD/AhaR72Z8hz9UOPE8j4a7DSP7Whz/zll4bHs0tB3nPeT9ALY1dfT5i+XSAu1Gvg
	 E19ZJOICx0W7z/qomQcZwY/xS21hcg9RFoUurNv6R36RQCqAwwTmIDJW6aCnk9MRZF
	 GSaFOkd44fhJCrbB9sG5X+0+KBeavk5rwxhCESDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7328DF805B1; Thu, 13 Jun 2024 14:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E90F805B4;
	Thu, 13 Jun 2024 14:18:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3A1AF8057A; Thu, 13 Jun 2024 14:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73FB4F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FB4F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wHnG6SEy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OoUYrf43;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=qFXKRSac;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AfBiJI5M
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F2A785D310;
	Thu, 13 Jun 2024 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718281122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0zyDaPAJGmhXRks7wpCQ+3jCzRqQBdOOqpYhFbCloeU=;
	b=wHnG6SEy9p+Tt/9iIvLJ9EPqWcsQQMGEFX+UPPtF4GBv7gstElLCDg0/6/8Emk8Xm8j/4L
	yDWgBzpEsT5hw1WJK1nltbjbNUhDdEST3nDUMs7YKOiL92uCV1kTJVPj5aOZSDhJrkhhMg
	/yfGSt69kUcFifHYeJGSJvZl1hhe0ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718281122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0zyDaPAJGmhXRks7wpCQ+3jCzRqQBdOOqpYhFbCloeU=;
	b=OoUYrf43yHy17TMAr0MbNB8TbECbz+LwdcsZwu/XVnUqowNWXw+rr0/UljNaU/fixnB3xF
	4a3BUMHH07ei8jCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718281121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0zyDaPAJGmhXRks7wpCQ+3jCzRqQBdOOqpYhFbCloeU=;
	b=qFXKRSacJJron3VuSdezq3edxMPAJaAwPV1gt4ITXR3xWZJwxcZZZnM77DV+TZ+avzG6UG
	Zb8JkbU//Vm4NgXZ5EIOlKnunbfgdCFA9ZCxBOPSwRIESzQu+k0xKizKc3jhVbyZG4iH1z
	XEBmPvS9toVUlUOtc+X9SLyYrOhDnso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718281121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0zyDaPAJGmhXRks7wpCQ+3jCzRqQBdOOqpYhFbCloeU=;
	b=AfBiJI5Mpy8UZBWd44/vYJzonl1vKkAiixQBHSQYnGkTBYlQ9WDkawxBA2QfgxEMhgFn3d
	8lAWmO+64p+VvPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C457D13A7F;
	Thu, 13 Jun 2024 12:18:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4sBULqHjamYlJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:18:41 +0000
Date: Thu, 13 Jun 2024 14:19:05 +0200
Message-ID: <878qz9nih2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA/PCI: add PantherLake audio support
In-Reply-To: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
References: <20240612064709.51141-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.97%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: LPHAHFHUWAC3NTA7O2ILFB6FQQHDLGNW
X-Message-ID-Hash: LPHAHFHUWAC3NTA7O2ILFB6FQQHDLGNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPHAHFHUWAC3NTA7O2ILFB6FQQHDLGNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 08:47:06 +0200,
Pierre-Louis Bossart wrote:
> 
> Add the PCI ID for PantherLake.
> 
> Since there's a follow-up patchset for ASoC, these 3 patches could be
> applied to the ASoC tree. Otherwise an immutable branch would be
> needed.
> 
> Pierre-Louis Bossart (3):
>   PCI: pci_ids: add INTEL_HDA_PTL
>   ALSA: hda: hda-intel: add PantherLake support
>   ALSA: hda: intel-dsp-config: Add PTL support

Applied now to for-next branch.

There were duplicated Reviewed-by tags by Peter as checkpatch
complained, so I removed the one. 


thanks,

Takashi
