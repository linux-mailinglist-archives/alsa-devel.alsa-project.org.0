Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38270B734
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33463E;
	Mon, 22 May 2023 09:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33463E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684742355;
	bh=9kNMcnG59WbyEE+Md1oGKmd3U1S9e5EitSOhHtmCHBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q4BHQuVn1e5WL6M20p6+Uuai5j23/Qfr3I57nEusKBAqzjzl2QXC3Uri5Jsddk1HD
	 Zsu95j4zLHZf700/uKn1blP8FP3nwPwqdA87t8YjODhG0qbVaZI6f3zevFQq3FdBlY
	 9kBltsdJpFUlirIOePbvjdLG+LXSpZCEN6Tg8e3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77062F80549; Mon, 22 May 2023 09:58:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B0DF80249;
	Mon, 22 May 2023 09:58:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46AC5F8024E; Mon, 22 May 2023 09:58:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66BDBF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:58:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 007B81E35;
	Mon, 22 May 2023 09:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 007B81E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684742299; bh=ilS3ZMKw6wNBLVbEu2nbX95t9T75MeKi6UCvQppXY6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zo/WCuByBUUQUfPlzgDPs6Ul84ZP8DM3YSzC19FOlS+qj/P/EfrFhVBpVKOuV6gXI
	 Tx63i5p/wHTQbbMWp5hy9cgNZqx3c4neAO9ttmfWsYKw1iFJVrkojso2P7G9BFibSF
	 gXQ2XY5wqq+3yAi8RXErijUbb9W86amtg93uLlCE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:58:16 +0200 (CEST)
Message-ID: <33b8039c-3a05-995e-4874-44ec976aae94@perex.cz>
Date: Mon, 22 May 2023 09:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 36/36] ALSA: docs: Add MIDI 2.0 documentation
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-37-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-37-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EFUDUOXEAKOHHOE43OJEFY2YOKDF3YJE
X-Message-ID-Hash: EFUDUOXEAKOHHOE43OJEFY2YOKDF3YJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFUDUOXEAKOHHOE43OJEFY2YOKDF3YJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Add the brief document for describing the MIDI 2.0 implementation on
> Linux kernel.  Both rawmidi and sequencer API extensions are
> described.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

