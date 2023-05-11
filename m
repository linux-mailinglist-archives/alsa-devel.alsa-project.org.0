Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979D6FF7E4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 19:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BF82E77;
	Thu, 11 May 2023 19:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BF82E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683824470;
	bh=fI7v3eFUkMqHrM+c8eZy6A41Y32KGOZZhmaRS6Hoi4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O0wKHUoZ+dTAhEeLPQFk/r7Z51XTXZa9GN/Ht+79QOGdDu2BnNusRxZ8egCT3dOvE
	 lClfxKo7LqooM+oSSwPoMtGSI+/eQ6IAL6eIIHi2ao3H54hJGzEU5Klx3wbNzOkJBH
	 6y7aBatNz809MKvo5HfiqRqTivtbs5noG4R7xgIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79857F8052E; Thu, 11 May 2023 19:00:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF7FF8032D;
	Thu, 11 May 2023 19:00:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE595F8052E; Thu, 11 May 2023 19:00:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DF024F80310
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 19:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF024F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=B9KIjKsh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8yB3Ky4v
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 128C91FFC9;
	Thu, 11 May 2023 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683824408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7C6XDQjjWqH6zu1WJqqlSe2OekATe0lWJfsYVoVucw=;
	b=B9KIjKsh2ChxWTXeCAD2nQLhoyYE+12jUFuP5NC0ksyHx9HK9KsjH1+I4SU8TboPGEK3V1
	eiP+3BFmFCQujvz1B4X5qb6M/j7EBBbrXMlJrWtn+wvvPUsLPP6WPTldvr9mZ6aPb49DCm
	T1xb271FMiJefXqEEdqYnpF4MI/pH2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683824408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7C6XDQjjWqH6zu1WJqqlSe2OekATe0lWJfsYVoVucw=;
	b=8yB3Ky4v/YBlSkf08n2K/p8002VpZqUCvqfsZ21OL9w1m76NSJR5QYDAFe7zD9fWNecpuY
	QIufpXarSypuQcBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8E43134B2;
	Thu, 11 May 2023 17:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aQ9CLBcfXWQkHQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 11 May 2023 17:00:07 +0000
Date: Thu, 11 May 2023 19:00:07 +0200
Message-ID: <87jzxeby7c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexandru Sorodoc <ealex95@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Stefan
 Binding <sbinding@opensource.cirrus.com>,	Tim Crawford
 <tcrawford@system76.com>,	Andy Chi <andy.chi@canonical.com>,	Meng Tang
 <tangmeng@uniontech.com>,	"Luke D. Jones" <luke@ljones.dev>,	Philipp
 Jungkamp <p.jungkamp@gmx.net>,	Kacper =?ISO-8859-2?Q?Michaj=B3ow?=
 <kasper93@gmail.com>,	Yuchi Yang <yangyuchi66@gmail.com>,
	alsa-devel@alsa-project.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirks for ASUS GU604V and
 GU603V
In-Reply-To: <20230511161510.315170-1-ealex95@gmail.com>
References: <20230511161510.315170-1-ealex95@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VIMIVIWCGLCMWIPZOQMQ4LSKJE6A42UP
X-Message-ID-Hash: VIMIVIWCGLCMWIPZOQMQ4LSKJE6A42UP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIMIVIWCGLCMWIPZOQMQ4LSKJE6A42UP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 May 2023 18:15:10 +0200,
Alexandru Sorodoc wrote:
> 
> These models use 2 CS35L41 amplifiers using SPI for down-facing
> speakers.
> 
> alc285_fixup_speaker2_to_dac1 is needed to fix volume control of the
> down-facing speakers.
> 
> Pin configs are needed to enable headset mic detection.
> 
> Note that these models lack the ACPI _DSD properties needed to
> initialize the amplifiers. They can be added during boot to get working
> sound out of the speakers:
>   https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff
> 
> Signed-off-by: Alexandru Sorodoc <ealex95@gmail.com>
> ---
> v2:
>     Fixed position of quirk entries in table

Thanks, applied now.


Takashi
