Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F870B4A1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 07:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20EC1825;
	Mon, 22 May 2023 07:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20EC1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684734138;
	bh=HQ3uC6c0JFtECVjyj7zSyk4DLn1RyHyqc3t6uHThuaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yc2aqlLZq9YFCGyFo/le7VgWevAkWa0eG7nNIIq2+wKCYzJkylvoSIMFFZesP9zOZ
	 1MNq6JOgsatFUq0LjryvLlitica3nRvs2poU6vdjFg+M/d8Do2TzzHcyTpNeQfm68U
	 o+9jHrOHExXrTQIMSmrMPjkrGhy+o2SEZPcYZj8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18927F80542; Mon, 22 May 2023 07:41:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D52BF80249;
	Mon, 22 May 2023 07:41:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1AAAF8024E; Mon, 22 May 2023 07:40:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E561CF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 07:40:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CA8591E2D;
	Mon, 22 May 2023 07:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CA8591E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684734046; bh=LzPP/u2RVrPYCM/Si47cGM8hKI9Ic+/0nVvCB2P0lns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O7Mu4sgRMLoslbsK88p9qRhs8bSyq5HNlNbkSPFx4Wkur52uNt2liPv5fA19OBdap
	 W75qG+S5H6OTqaaT9Q+3BCUnW2/0D00Ti2kfpWTXw37fsaIjKR7i9p6lhBIOmh3Bcy
	 zdHE70IN2ASuRT/VONjAjd8AepVcSulJs26RQbZ0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 07:40:44 +0200 (CEST)
Message-ID: <e37f8a60-6901-39be-3797-4e2f355b6ccd@perex.cz>
Date: Mon, 22 May 2023 07:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/36] ALSA: rawmidi: Pass rawmidi directly to
 snd_rawmidi_kernel_open()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-2-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-2-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MPELQQMMY7CNSS47DII3PJ7JCMNS4QTL
X-Message-ID-Hash: MPELQQMMY7CNSS47DII3PJ7JCMNS4QTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPELQQMMY7CNSS47DII3PJ7JCMNS4QTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> snd_rawmidi_kernel_open() is used only internally from ALSA sequencer,
> so far, and parsing the card / device matching table at each open is
> redundant, as each sequencer client already gets the rawmidi object
> beforehand.
> 
> This patch optimizes the path by passing the rawmidi object directly
> at snd_rawmidi_kernel_open().  This is also a preparation for the
> upcoming UMP rawmidi I/O support.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

