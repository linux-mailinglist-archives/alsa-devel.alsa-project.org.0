Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D8738250
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B90F86C1;
	Wed, 21 Jun 2023 13:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B90F86C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687347066;
	bh=23TD0+CbVvcoZOlAaMY1cfwdodLuTd6fRSuZyiIaz5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hqzHf64AKgqqIG+ODwBrGdNB5Ph4IEGOEZV/Tx6FROfSp4x1TogzvM2mo+ZpNUGVE
	 +YZRJ4VP24qqU/Fm5Rjf4esI2h03/lcFqU1nQlykQujhc2GbWxAHh/fP0ZCsd7mydc
	 0aL1s/ztyzdCxdXnkElUqRhMLkjHSis87qIRmhpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22599F801D5; Wed, 21 Jun 2023 13:30:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA1FF80132;
	Wed, 21 Jun 2023 13:30:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EDA1F80141; Wed, 21 Jun 2023 13:30:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4501CF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4501CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RwGjh6XH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yR1nUhot
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 41E251FDD9;
	Wed, 21 Jun 2023 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687346999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rd1XA/DMAp6AcG8TgHnPbCfk/t/rHdBEBaFpsw7cAg=;
	b=RwGjh6XH6cvqwzB8V+wCpOx7Y2uqJexUazUi60BZj3gJ8kvBAs6PxtzSxxYPwTASd2/gSJ
	OowG3XAl1NnyQ/w8iQwCy6S1y2bfCxAVMiMSOj66Bot4IFiQP6gi3TI7YoYWBorENWcHaw
	pRv4Cn+U+S9QlyQPG/i9GO1EO2+7hgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687346999;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2rd1XA/DMAp6AcG8TgHnPbCfk/t/rHdBEBaFpsw7cAg=;
	b=yR1nUhothHLWxos/73fp1sN7GqUiY0KNjJizWaxUo7otXcFtZEuvQEpiI870YK5h854HpR
	8BBWKTVx5uFAYbAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C5FE134B1;
	Wed, 21 Jun 2023 11:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IXVqBjffkmQuLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 11:29:59 +0000
Date: Wed, 21 Jun 2023 13:29:58 +0200
Message-ID: <87legd59zd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: tiwai@suse.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	tangmeng@uniontech.com,
	andy.chi@canonical.com,
	p.jungkamp@gmx.net,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG GV601V
In-Reply-To: <20230621085715.5382-1-luke@ljones.dev>
References: <20230621085715.5382-1-luke@ljones.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: COZ2DBY32MPEVOK7XW2VHJMJGPGIBQPC
X-Message-ID-Hash: COZ2DBY32MPEVOK7XW2VHJMJGPGIBQPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COZ2DBY32MPEVOK7XW2VHJMJGPGIBQPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 10:57:15 +0200,
Luke D. Jones wrote:
> 
> Adds the required quirk to enable the Cirrus amp and correct pins
> on the ASUS ROG GV601V series.
> 
> While this works if the related _DSD properties are made available, these
> aren't included in the ACPI of these laptops (yet).
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Applied now.  Thanks.


Takashi
