Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FE70B55E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465563E7;
	Mon, 22 May 2023 08:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465563E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684738300;
	bh=KD3vSq3jiQBPHCrU+PlkjpBvbYvmTAHCWsfKkIqGq8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Offi+ulXji52sacXUtr5Ds3j+vXl2wfPvH3pe+gyP/IJ0MaMW/rWGluYky0Xkx+t5
	 iAhn8JhIjHKGuJr5IOmctrUIC0LqO7bwZYAIYqHrRwH1PbjwNfSP8d6AnZnRDbpREk
	 dM66ws0YpqG67o1+krbAo/tO0JcMbXUNk5IbMk5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A744F80548; Mon, 22 May 2023 08:50:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBBD6F80249;
	Mon, 22 May 2023 08:50:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC811F8024E; Mon, 22 May 2023 08:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D49E2F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 08:50:44 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 150061E2D;
	Mon, 22 May 2023 08:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 150061E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684738244; bh=qpuSYvzLduJLpcEIXWZ2e7ZgFz/whDNb870aSeneAUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YbDWOHnkh3sfImep146eutF2mxt5Ctd99nngr6LjWtCGAfo1nG81zuot3Y/pIIbUJ
	 GDSOpVnPixdlPietfdpot4bdZ9FUKFBPgxRM7QXRPYtu7pGGTAlHZN1ksiI9Fw2tsl
	 J28hfxb9/+ZJW4Bvajyj/+p/Qp+9DYPpAmaBte8w=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 08:50:42 +0200 (CEST)
Message-ID: <76b5b10a-887c-4c2e-fd4f-133e600ac3e7@perex.cz>
Date: Mon, 22 May 2023 08:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/36] ALSA: usb-audio: Create UMP blocks from USB MIDI
 GTBs
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-12-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-12-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TRGV6ULRJDOAUPHJUMRRHTV6JLF4G4UK
X-Message-ID-Hash: TRGV6ULRJDOAUPHJUMRRHTV6JLF4G4UK
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRGV6ULRJDOAUPHJUMRRHTV6JLF4G4UK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> USB MIDI spec defines the Group Terminal Blocks (GTB) that associate
> multiple UMP Groups.  Those correspond to snd_ump_block entities in
> ALSA UMP abstraction, and now we create those UMP Block objects for
> each UMP Endpoint from the parsed GTB information.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

