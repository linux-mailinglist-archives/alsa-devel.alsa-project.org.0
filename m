Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523C76A92A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 08:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C07B6C0;
	Tue,  1 Aug 2023 08:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C07B6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690871525;
	bh=3exEeyd93azbUISajMmkWkXMJzPwaX7gQL3G/vPrQAA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tn871MGQQD9S2R4umFjy4kM0ts5LbWN11g1YKI+3+NZUmCAg9zskaX+t0J8CzhOvY
	 D/2f/7axGEZ/0k4W8iLOaL2K47TdNefaMIFpmpbKxBLRS2vFfzTY7SHkaptp25tEaq
	 a/g7VXZRlZF5ZK81gkJzelBBlu+eSwqjCmQLCnuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0793F80520; Tue,  1 Aug 2023 08:31:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF54FF8016D;
	Tue,  1 Aug 2023 08:31:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19978F801D5; Tue,  1 Aug 2023 08:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4ED8F8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 08:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4ED8F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=K+ezj5+9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YJUdPVnH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 206021F897;
	Tue,  1 Aug 2023 06:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690871458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sNGTgfhiT4C/dk6TQHs9YMjTeGJFJ5Jl92pAF+Mw7Xw=;
	b=K+ezj5+93omryn7tP7JbbhJgQDKY4ijpQxY3/kaNZDrvEuSqgsRbP52jeR2nP4B8tjOU0i
	+34PHwcBgf/AACGGqVd0aEIzbHuW7jR+maD01rT8V4yNQbo8BdpNGu+c66Up5P8wza93aG
	XP5Aeu/n8OEsj/DEgxGd4JyRYF2mk8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690871458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sNGTgfhiT4C/dk6TQHs9YMjTeGJFJ5Jl92pAF+Mw7Xw=;
	b=YJUdPVnHh7O8AniagA62Xv5cFkkVOQeujkigTT5gRybNMSn9oV0HnyuJHOnr04ln7cCDOP
	Fy+klCcOi1ZYMCBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E350F139BD;
	Tue,  1 Aug 2023 06:30:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dL5wNqGmyGTWZAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 01 Aug 2023 06:30:57 +0000
Date: Tue, 01 Aug 2023 08:30:57 +0200
Message-ID: <875y5zi89q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<perex@perex.cz>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/9] ALSA: hda/cs35l56: Various bugfixes
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: CZTFNTE3WEHSW4FO6DH3BXQPZE2PG4V7
X-Message-ID-Hash: CZTFNTE3WEHSW4FO6DH3BXQPZE2PG4V7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZTFNTE3WEHSW4FO6DH3BXQPZE2PG4V7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 18:57:17 +0200,
Richard Fitzgerald wrote:
> 
> A collection of various bugfixes to the cs35l56 driver.
> 
> Richard Fitzgerald (9):
>   ALSA: hda/cs35l56: Complete firmware reboot before calling
>     cs_dsp_run()
>   ALSA: hda/cs35l56: Do not mark cache dirty after REINIT
>   ALSA: hda/cs35l56: Call cs_dsp_power_down() before reloading firmware
>   ALSA: hda/cs35l56: Always power-up and start cs_dsp
>   ALSA: hda/cs35l56: Call cs_dsp_power_down() before calling
>     cs_dsp_remove()
>   ALSA: hda/cs35l56: cs_dsp_power_down() on cs35l56_hda_fw_load() error
>     path
>   ALSA: hda/cs35l56: Do not download firmware over existing RAM firmware
>   ALSA: hda/cs35l56: Fail if .bin not found and firmware not patched
>   ALSA: hda/cs35l56: Reject I2C alias addresses

Applied all patches now.  Thanks.


Takashi
