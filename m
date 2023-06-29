Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F57420A7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 08:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEE87F4;
	Thu, 29 Jun 2023 08:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEE87F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688021390;
	bh=dMMbnbLhbiNVCMm1Xq3WPINNCii5WhyG4gUB2rC/cfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i+JfP/9mgVOp+NKjf4pyBYrTuevMiZ4wr0yUqFqCGolihkNB3PaS7qwSeF9sZp9fM
	 mCpl56MobmxO/qE98yUlQqNiUsTBTe521rc7+CJMGdkFhN5WFCNxl37Lexk9esuWoy
	 Tc0zEaOTmG2XJwQQ+UCSiAMgJn9ZN2dKVetQq61c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5CF0F80534; Thu, 29 Jun 2023 08:48:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8263FF80093;
	Thu, 29 Jun 2023 08:48:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D37EF80246; Thu, 29 Jun 2023 08:48:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 676D1F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 08:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 676D1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=js8ZTxnP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xBmJxBG8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7FF522184D;
	Thu, 29 Jun 2023 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688021332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DD59Yv+0FwSWXhhYd4KNUGfeC/elEi4xKcKYN+3rlJE=;
	b=js8ZTxnPDTUSKb6T9nzrXSKUjoeL5f+9qNXeiJZabKl605i30+3NoPNZgzCan2m7O/uo/j
	zjchteC3mLAxqLekSaAKKy3j7ucYux247y8gE0ErPaDZEmb7UJoGHBcVYRJagnCkKtJDdw
	Z1IB0tEkc1zppRUPuiWirHeTfb6Smv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688021332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DD59Yv+0FwSWXhhYd4KNUGfeC/elEi4xKcKYN+3rlJE=;
	b=xBmJxBG8/11lkwIXE6aBUd49Nv9dVOvVSaq+RpW3+77bswGF9Fa236/jIX+UkbNf0etdWg
	S33V/Q5w6N3fqqAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C629139FF;
	Thu, 29 Jun 2023 06:48:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CMngEVQpnWQVLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 29 Jun 2023 06:48:52 +0000
Date: Thu, 29 Jun 2023 08:48:51 +0200
Message-ID: <87bkgyepbg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NPx0SNx
In-Reply-To: <20230628155434.584159-1-wse@tuxedocomputers.com>
References: <20230628155434.584159-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2733RYQWPEHIWE5R2K5HDNFMBW2HQWRT
X-Message-ID-Hash: 2733RYQWPEHIWE5R2K5HDNFMBW2HQWRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2733RYQWPEHIWE5R2K5HDNFMBW2HQWRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 28 Jun 2023 17:54:34 +0200,
Werner Sembach wrote:
> 
> This applies a SND_PCI_QUIRK(...) to the Clevo NPx0SNx barebones fixing the
> microphone not being detected on the headset combo port.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>

Thanks, applied.


Takashi
