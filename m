Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBF79D24A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 15:32:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04135A4B;
	Tue, 12 Sep 2023 15:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04135A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694525552;
	bh=bPwOEdrHpsPaITN5TMkOR0NwC1YFNuCjN2PmbMssOcU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jn4/jVlBC0NSk7O5mbBtxWs/NRCOKIRRD+rHPCjeSiyI0kTjnp5JdgEDYsCtITOh1
	 O8evOSuCU6U9EPl/moxpixq7UN0utl61Fpv8dnInXwCveggYoEXfNQ+qcvvFbZnhfo
	 P5rpGRnmi6A/Nci/xGCE8Hf2THOpJbGPqF7KRvU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 542EBF80549; Tue, 12 Sep 2023 15:31:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CACECF80246;
	Tue, 12 Sep 2023 15:31:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09D70F80425; Tue, 12 Sep 2023 15:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCBCFF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 15:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBCFF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yQvOiNTp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dsZSMuAi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA7DC1F45A;
	Tue, 12 Sep 2023 13:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694525487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsgcKrpCBQmwIVUIkIa0mU20jeiAaYjLhhAbrQIvNAM=;
	b=yQvOiNTp0A3PZHjYu6gXqQ+UHmiwvE9aFTRQIflH0m3cwkmqOOFdauZEOQzfqVqn1Aa7b3
	qtVyHChQCBd048K+rqtcQzaO9IBw96zvun8s2720rR4jT73HM+jbdrCikqk1Ue5APby+61
	sh3xhcDK/OEDlO2df3spXOUznfPOvHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694525487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsgcKrpCBQmwIVUIkIa0mU20jeiAaYjLhhAbrQIvNAM=;
	b=dsZSMuAiQzaRzROLaJX4x1MDRmCBWp/xgSBwFWUGUa4+w9CDIf5YUVQS2squYzZZbJ5P4S
	jHG6DJUNowwYGFCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EB0F139DB;
	Tue, 12 Sep 2023 13:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WB/dIS9oAGVUOQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 12 Sep 2023 13:31:27 +0000
Date: Tue, 12 Sep 2023 15:31:26 +0200
Message-ID: <87zg1r5xht.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: core: Use dev_name of card_dev as debugfs directory
 name
In-Reply-To: <20230912110113.3166-1-peter.ujfalusi@linux.intel.com>
References: <20230912110113.3166-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SSOPEH5H22AFMGVMZ7JVQEQ4SE33MHPX
X-Message-ID-Hash: SSOPEH5H22AFMGVMZ7JVQEQ4SE33MHPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSOPEH5H22AFMGVMZ7JVQEQ4SE33MHPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Sep 2023 13:01:13 +0200,
Peter Ujfalusi wrote:
> 
> There is no need to use temporary string for the debugfs directory name as
> we can use the device name of the card.
> 
> This change will also fixes the following compiler warning/error (W=1):
> 
> sound/core/init.c: In function ¡snd_card_init¢:
> sound/core/init.c:367:28: error: ¡%d¢ directive writing between 1 and 10 bytes into a region of size 4 [-Werror=format-overflow=]
>   367 |         sprintf(name, "card%d", idx);
>       |                            ^~
> sound/core/init.c:367:23: note: directive argument in the range [0, 2147483646]
>   367 |         sprintf(name, "card%d", idx);
>       |                       ^~~~~~~~
> sound/core/init.c:367:9: note: ¡sprintf¢ output between 6 and 15 bytes into a destination of size 8
>   367 |         sprintf(name, "card%d", idx);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> The idx is guarantied to be less than SNDRV_CARDS (max 256 or 8) by the
> code in snd_card_init(), however the compiler does not see that.
> 
> The warnings got brought to light by a recent patch upstream:
> commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thanks, applied now.


Takashi
