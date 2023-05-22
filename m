Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5881B70B728
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08764209;
	Mon, 22 May 2023 09:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08764209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684742235;
	bh=K9Ef9vWZ2uiGhnC6yIs4m3Ug6eCKQwS7+0+M2U4BPBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GRt6m1HPYZ/yQwUMHAWd+L0fOKPnf4qU12Ykw9xpDH3nPu8VCUXahah98tk+OCY3k
	 N0GRM0jzmuz7zZKOTJcNJM6iop2/2PXtB395BxNeH4WqfGfQ1InZDNKb5OJWc3fymp
	 FisYz9JFI9v4p9okoNuda9R/nTXVb2PJEqb0TORU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE4FF80249; Mon, 22 May 2023 09:56:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CCBBF8024E;
	Mon, 22 May 2023 09:56:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C80F8024E; Mon, 22 May 2023 09:56:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B5D27F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:56:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 00F771E35;
	Mon, 22 May 2023 09:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 00F771E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684742179; bh=JGcnT345YMDF0uEJ+uBnNXYzHUlNErNa4C1mSx/0CBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n/43iNFVY4mPlT7AZP0yA1cUTaQKhOI0BJcbxuFcTUPJFH+zKVocNIjId1BCdsa+s
	 ROZ8cXc9kCzfcfXFHUDglpVMFL/LyZwEiIG3DQcA3i4v9WmDlf2/xwvR/y2rUCM0fU
	 pvDa0U7MLZfeD/UHm+nTykyWe1Oq+iDSJPU/gz2I=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:56:16 +0200 (CEST)
Message-ID: <216fd7d9-7e83-92c6-555f-1a1e4f039087@perex.cz>
Date: Mon, 22 May 2023 09:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 35/36] ALSA: seq: Add UMP group filter
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-36-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-36-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MZ2PNRAWOA67UHFWJEQOKT4C4SV2F2SJ
X-Message-ID-Hash: MZ2PNRAWOA67UHFWJEQOKT4C4SV2F2SJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZ2PNRAWOA67UHFWJEQOKT4C4SV2F2SJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Add a new filter bitmap for UMP groups for reducing the unnecessary
> read/write when the client is connected to UMP EP seq port.
> 
> The new group_filter field contains the bitmap for the groups, i.e.
> when the bit is set, the corresponding group is filtered out and
> the messages to that group won't be delivered.
> 
> The filter bitmap consists of each bit of 1-based UMP Group number.
> The bit 0 is reserved for the future use.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

