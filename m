Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC8722027
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5545839;
	Mon,  5 Jun 2023 09:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5545839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685951577;
	bh=NV3Cjopz/M0e4uXTGkjE9ZY0Zm77zlMgxWJgg+AFW/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GW/MAtkB6kI/GBp3HDajwgXKbpU6MvtCV92g6AXOdpRpfTO5oPGGdaZk8yvYc0E7U
	 WT1LZPVcmz0XOC4sVxpFDbsA+VEQHtVRnxWRiiyQQhqlDOt/8sTu0SQ3d7Gap20XDR
	 Xsp3J+dEN1EpEJNVj56OnhbG4J2Wi6puj9LNBQ6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0024EF80155; Mon,  5 Jun 2023 09:52:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2781F80155;
	Mon,  5 Jun 2023 09:52:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A70FDF8016C; Mon,  5 Jun 2023 09:52:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDA86F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA86F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BtBqoZSX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4rOEj5uG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86EA91F8AB;
	Mon,  5 Jun 2023 07:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685951515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=19TrpgyGEBV1ijfvqrVPGoQHicY+yL9+MZYZ2t68gik=;
	b=BtBqoZSXbEGaiUIWfyKwYBpG4cppCauRIthD3aR9b9eMSOoSC9DUvs38GtTZ4B0SJQtJhi
	ZV2vSmSUSNk4xJbRYqPBqFu7ahTFttitCy9jSJKWeDpbB0GBzLG9XOv6U7WKOHmSAJgY7b
	m5c98/bB17j/6YKVEGt+hIew+7iqQL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685951515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=19TrpgyGEBV1ijfvqrVPGoQHicY+yL9+MZYZ2t68gik=;
	b=4rOEj5uGuaNsU1wXLD1MIIA5pQL9YIpUVj79KqzW1fdh4P75cv4jzLdJrD/nM0NzUzrj5V
	THOfRDjMPZ4G9/AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 617A6139C7;
	Mon,  5 Jun 2023 07:51:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7nz2FhuUfWRHdwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:51:55 +0000
Date: Mon, 05 Jun 2023 09:51:54 +0200
Message-ID: <87ilc2ibxh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	"Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add "Intel Reference board" and "NUC
 13" SSID in the ALC256
In-Reply-To: <20230602193812.66768-1-pierre-louis.bossart@linux.intel.com>
References: <20230602193812.66768-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RGDPWK4T2YWGMBUMOKRLUYY7TB3PCXD3
X-Message-ID-Hash: RGDPWK4T2YWGMBUMOKRLUYY7TB3PCXD3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGDPWK4T2YWGMBUMOKRLUYY7TB3PCXD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Jun 2023 21:38:12 +0200,
Pierre-Louis Bossart wrote:
> 
> From: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>
> 
> Add "Intel Reference boad" and "Intel NUC 13" SSID in the alc256.
>   Enable jack headset volume buttons
> 
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Sayed, Karimuddin <karimuddin.sayed@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Applied now, thanks.

BTW, the Cc list had a wrong entry (only "Sayed" without the actual
address).  Likely an error at manual correction?


Takashi
