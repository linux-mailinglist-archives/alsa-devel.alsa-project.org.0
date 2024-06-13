Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EA0906F25
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:17:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2C0DEC;
	Thu, 13 Jun 2024 14:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2C0DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718281034;
	bh=chaH5PEQuEBXO945nkro375PKs5kAc/lgz+rLka12Rg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TnuzLnj4GBsidsnOzSioY+SAj0rYg7ovIYrxo5H5HyPKYg3KnpKQaZJ/gZJfAIBSn
	 UU+QYv1/JSRPma1JBlXVq7heXHKHiWqX/dCNq4fyLA0UqFD0KjzF23Vi7Uwv+VvkZE
	 8QzwH7CooRaN4OVk9zUpScQ0JHjFx09qGVjhGMfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42694F805AF; Thu, 13 Jun 2024 14:16:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CACD9F805B3;
	Thu, 13 Jun 2024 14:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C765F8057A; Thu, 13 Jun 2024 14:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBCC7F80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBCC7F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UZKaN0Dy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xNI6Zz7O;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UZKaN0Dy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xNI6Zz7O
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31366353CB;
	Thu, 13 Jun 2024 12:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718281001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTH7af/O3+tTOb2Qwr9Ce/F6lFIljG3Q0wfAwcsVTeQ=;
	b=UZKaN0Dy3ckg3jb4dqXD1gsEGqSHzqQGpIyWvLHExU6DM+XXdOIJc92Xy4zT2RzPOlRGzb
	HJ1u2xh6eRdexKLLUtQIK+FLdZhJFzdk3Gbz5zvc0SXUY+XXlRJkUaG4WDi6jlkUsZPaDG
	Vx5R5elkoqwSGHTCsLVhvg4BLlHZ7N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718281001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTH7af/O3+tTOb2Qwr9Ce/F6lFIljG3Q0wfAwcsVTeQ=;
	b=xNI6Zz7OE46nCYt+AakUrak8jL1+ZIqNGmIMUaPiBRdhE4L78mI/yJBGmXvsCr8kalUg37
	iFx2BU1+xe8XTdBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UZKaN0Dy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xNI6Zz7O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718281001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTH7af/O3+tTOb2Qwr9Ce/F6lFIljG3Q0wfAwcsVTeQ=;
	b=UZKaN0Dy3ckg3jb4dqXD1gsEGqSHzqQGpIyWvLHExU6DM+XXdOIJc92Xy4zT2RzPOlRGzb
	HJ1u2xh6eRdexKLLUtQIK+FLdZhJFzdk3Gbz5zvc0SXUY+XXlRJkUaG4WDi6jlkUsZPaDG
	Vx5R5elkoqwSGHTCsLVhvg4BLlHZ7N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718281001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTH7af/O3+tTOb2Qwr9Ce/F6lFIljG3Q0wfAwcsVTeQ=;
	b=xNI6Zz7OE46nCYt+AakUrak8jL1+ZIqNGmIMUaPiBRdhE4L78mI/yJBGmXvsCr8kalUg37
	iFx2BU1+xe8XTdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D83A813A7F;
	Thu, 13 Jun 2024 12:16:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +wmGMyjjamaBJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:16:40 +0000
Date: Thu, 13 Jun 2024 14:17:04 +0200
Message-ID: <87a5jpnikf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org,	broonie@kernel.org,	Bjorn Helgaas
 <bhelgaas@google.com>,	linux-pci@vger.kernel.org,	=?ISO-8859-1?Q?P=E9ter?=
 Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/3] PCI: pci_ids: add INTEL_HDA_PTL
In-Reply-To: <20240612194834.GA1034127@bhelgaas>
References: <20240612064709.51141-2-pierre-louis.bossart@linux.intel.com>
	<20240612194834.GA1034127@bhelgaas>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 31366353CB
Message-ID-Hash: BDFEH3SES2RQWTJPJGAI4XPKOWZFHFBS
X-Message-ID-Hash: BDFEH3SES2RQWTJPJGAI4XPKOWZFHFBS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDFEH3SES2RQWTJPJGAI4XPKOWZFHFBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 21:48:34 +0200,
Bjorn Helgaas wrote:
> 
> On Wed, Jun 12, 2024 at 08:47:07AM +0200, Pierre-Louis Bossart wrote:
> > More PCI ids for Intel audio.
> > 
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> Change subject to match history:
> 
>   PCI: Add INTEL_HDA_PTL to pci_ids.h
> 
> It's helpful mention the places where this will be used in the commit
> log because we only add things here when they're used in more than one
> place.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

OK, I corrected the subject at applying.


thanks,

Takashi
