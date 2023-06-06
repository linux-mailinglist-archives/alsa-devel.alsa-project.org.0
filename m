Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED472424C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 14:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0DD882B;
	Tue,  6 Jun 2023 14:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0DD882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686055054;
	bh=yN/acHJ8CSgge4jWpBYONB6V3g0XssyC8dwgV8QWFI4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e02mcL0kF6u2ZKTpGR69IKtYct0/TdEolVNHoskP2NN3/+lskA+biObyKffDdH233
	 hOkV1lEmQMeAyBUBVlZJp4rXtyUruX6ru20w+G6FFosQJxhySvTitvI8NflbSq4H+Q
	 n31yzS50Dw1uR9lnYkh9gWkOaZ6QDgwzWrmRuHp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E51A5F80544; Tue,  6 Jun 2023 14:36:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5879DF80544;
	Tue,  6 Jun 2023 14:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF578F80549; Tue,  6 Jun 2023 14:36:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 40D3AF80527
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 14:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D3AF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jDFXhdO2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bSW4gHei
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED9C01FD75;
	Tue,  6 Jun 2023 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686054954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mR9/CTd6tttBe0ptLYrI0C2dV/m8Krzdy8AdgwB6jA=;
	b=jDFXhdO2H1/h46DgEM7M4l3oLEyvqgxqU4IC5aIucyatOTRewIA5XnBOyH6TKe9gpjt9l7
	CjvdS+DpTo3sUgdMCaXkeZBLzyPIKz8ty6Yj5XgSD1mKWOei75nMq5uHPdP4SinfJfpuPk
	hD4bLG6Z7md6xUUWpugnULB0YEmv7nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686054954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2mR9/CTd6tttBe0ptLYrI0C2dV/m8Krzdy8AdgwB6jA=;
	b=bSW4gHeibmrOaootlREIOq6idWHgqigftK9m6i78cJ1Q7M8J0kbsxsMfY2hmrWgAi/hGOV
	TZjUj1CImms87lBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFA4B13519;
	Tue,  6 Jun 2023 12:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id H43cLSoof2T2PgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 12:35:54 +0000
Date: Tue, 06 Jun 2023 14:35:54 +0200
Message-ID: <877csgsr85.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/3] Fixes and cleanup for CS35L41 HDA
In-Reply-To: <20230606103436.455348-1-sbinding@opensource.cirrus.com>
References: <20230606103436.455348-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: K73J7HVUL4I6NDUYPXXSLUKDBBV7VDD6
X-Message-ID-Hash: K73J7HVUL4I6NDUYPXXSLUKDBBV7VDD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K73J7HVUL4I6NDUYPXXSLUKDBBV7VDD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 12:34:33 +0200,
Stefan Binding wrote:
> 
> Several minor issues were found during additional testing and
> static analysis. These patches fix these minor issues.
> 
> CHANGES SINCE V2:
> Patch 3:
> - Add missing break
> 
> CHANGES SINCE V1:
> Patch 2:
> - Removed unnecessary cast
> 
> Stefan Binding (3):
>   ALSA: hda: cs35l41: Clean up Firmware Load Controls
>   ALSA: hda: cs35l41: Fix endian conversions
>   ALSA: hda/realtek: Delete cs35l41 component master during free

Now applied all three patches.  Thanks.


Takashi
