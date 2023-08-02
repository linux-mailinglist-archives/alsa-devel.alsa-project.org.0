Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A857876D311
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2420983B;
	Wed,  2 Aug 2023 17:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2420983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690991792;
	bh=Hp0jHma7raL+/3z9FBQMIhwPEyG+30T2UvWMnZcji58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bmwiq8ab9ilnoJFX0Wxq3/OjvQy6zs08sNLqxSqzlshcE0AqzyWro9I1Ui28tC69p
	 vmzFhDaKinjJZNeg153lzkGtp/3ygeeRk42vPxBr8F/ikD93VStfG+gP5OGmEYN0l8
	 0E7sUDtf8jsjWynhRQtxuhLKVGCtgGDJITKPMusw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5E9F801D5; Wed,  2 Aug 2023 17:55:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F47F801D5;
	Wed,  2 Aug 2023 17:55:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A76F8025A; Wed,  2 Aug 2023 17:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39AEFF8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39AEFF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KxwFR1cO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p5VSzDUb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5753921A3A;
	Wed,  2 Aug 2023 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690991732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YgHBU51w4LXvHyXRHiGVSsQiW98HOPwBuKRYIXq+KV4=;
	b=KxwFR1cOjbUj29hiLao3h7B7cXrUBCllEi3ejEMXaE3KkrGvdyPBLqnhUrsZjP6xXdVlOR
	yXhLdeYp676tNjaW0sQSZnic6XxKFTZPrmjMFjTAiONNjEROVCycHCTd0/Ef1rYfYOSsUX
	JxkMSpwtbMpqUQpwrkDg7MJFURHe+b4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690991732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YgHBU51w4LXvHyXRHiGVSsQiW98HOPwBuKRYIXq+KV4=;
	b=p5VSzDUbP+iTld01djNzeHZsOjYFzzjJMUvwM8b/dDBSKaLF64MgdBRSybHHDintKyamsQ
	e5dixT5uvDJE4cCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33FCA13909;
	Wed,  2 Aug 2023 15:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Zc24C3R8ymTUOwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 02 Aug 2023 15:55:32 +0000
Date: Wed, 02 Aug 2023 17:55:31 +0200
Message-ID: <87h6phcubw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthew Anderson <ruinairas1992@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add headphone quirk for Aya Neo
 Geek
In-Reply-To: <20230802153730.39273-2-ruinairas1992@gmail.com>
References: <20230802153730.39273-1-ruinairas1992@gmail.com>
	<20230802153730.39273-2-ruinairas1992@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5V3XNBT566IMGSST5FZTHQ6NT6Q7ITX2
X-Message-ID-Hash: 5V3XNBT566IMGSST5FZTHQ6NT6Q7ITX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5V3XNBT566IMGSST5FZTHQ6NT6Q7ITX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 17:37:29 +0200,
Matthew Anderson wrote:
> 
> This fixes the headphones on the Aya Neo Geek handheld.

It'd be helpful if you describe a bit more about the problem itself.

> Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>

Please put a blank line before Signed-off-by line.


thanks,

Takashi
