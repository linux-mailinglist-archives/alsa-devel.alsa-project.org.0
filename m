Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6872482A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 17:47:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A5C823;
	Tue,  6 Jun 2023 17:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A5C823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686066429;
	bh=MmBPz+5yzRJ2o1otSV/Q1cvgVyIfYEqeiXArd3iiFpc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nivOfRu0MX+fLC9vzjbk3+zHixgY/NNN+yPnwakyXkg+SmAgJ8AKZoQQpbltNgaJ4
	 aUzevoeqpswiY2rNwH2vkPiN2xPMFZHWHJgvGVtSrcbYAoQ1oG0dCtlgdbfntD6aFq
	 +a4deo//OomZG9OJH72foBDDDk8/p4L9rBf1/Mic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F765F80254; Tue,  6 Jun 2023 17:45:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53156F8016C;
	Tue,  6 Jun 2023 17:45:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E388F80199; Tue,  6 Jun 2023 17:45:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6BB8F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 17:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6BB8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MLYden4P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ULrI3S/c
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 470E0219EB;
	Tue,  6 Jun 2023 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686066348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIRZuOqdc1wbgXJlnttVCJmlBEYYHdfUu9cmmFB8VxI=;
	b=MLYden4PysPezLPwrVom0z5h5s95w2GwZow9JKezerxq2xCF7YQMZPeqFUAi+KVCizPfc2
	hZwhajDMwcbvl4NjtmuFaPmJCxOu73+5Vj1SA50ECcPISp3DHfkI3oSGOQE0zMK5VmUrTn
	RZ4MD2roba8ViLEiKxjUaLuSeoVhHLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686066348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIRZuOqdc1wbgXJlnttVCJmlBEYYHdfUu9cmmFB8VxI=;
	b=ULrI3S/cmX13oY3UQO9BrjqTNsERUYy1MVZRjyqCIv68tBuQqOtw+WTqDUu36RxKtqu8w3
	M4kWjrbq1vmbK/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FDA313776;
	Tue,  6 Jun 2023 15:45:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yprpBqxUf2TmJwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 15:45:48 +0000
Date: Tue, 06 Jun 2023 17:45:47 +0200
Message-ID: <877csgfvbo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable 4 amplifiers instead of 2 on a
 HP platform
In-Reply-To: <20230606145747.135966-1-chris.chiu@canonical.com>
References: <20230606145747.135966-1-chris.chiu@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6MADDPDWH5ZFAVAXTRUB6XYIW4UUHMSO
X-Message-ID-Hash: 6MADDPDWH5ZFAVAXTRUB6XYIW4UUHMSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MADDPDWH5ZFAVAXTRUB6XYIW4UUHMSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 16:57:47 +0200,
Chris Chiu wrote:
> 
> In the commit 7bb62340951a ("ALSA: hda/realtek: fix speaker, mute/micmute
> LEDs not work on a HP platform"), speakers and LEDs are fixed but only 2
> CS35L41 amplifiers on SPI bus connected to Realtek codec are enabled. Need
> the ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED to get all amplifiers working.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now with the manual addition of Fixes tag.
At the next time, please don't forget to put the proper Fixes tag if
you know the commit to fix.


thanks,

Takashi
