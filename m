Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C2970B6A0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49748828;
	Mon, 22 May 2023 09:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49748828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684741002;
	bh=wblUpYc8U2rejWP4Nzor6FeBl6phEn3FQPXR6ejlo0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a7xDNWCwBLx755NvC915ToNip5gVYaXAWm7Zx/P8Y5FbeQ97UNu/wiR2NtJfPgjcF
	 utJ82a6hT6NzdyP3Fyc1exPFVMr+q1VTSO8p3Kr4X7TWLQdIu4P7leRjSITwpJoQUE
	 4mKEch3bckdx99PwJFU4PT7mbVLpmk97fUY24XdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0795BF8024E; Mon, 22 May 2023 09:35:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8F77F8024E;
	Mon, 22 May 2023 09:35:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE32F8026A; Mon, 22 May 2023 09:35:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 60CD3F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:35:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 59F7C1E35;
	Mon, 22 May 2023 09:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 59F7C1E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684740945; bh=l+gvJFC3MRFwIcOgQuuGzs1SY1t6l0YYs273LuOkXJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iJcomAg8Zmq5go8waq0pku+kazN5im4PH56mwu5gm+ilxQRYwloRkskpMFr2ijMIx
	 DPiz39kSU3xLFRUciKG7tfD7AJv1x5vtcV9/cnwwEGQ9G5CBOacokcSLtFgiCEUfN5
	 WGuIfSqvRAP5V8GtHUNnigomLJ7OMiWN9vTJIEic=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:35:43 +0200 (CEST)
Message-ID: <b155ddb4-953b-0395-ab0f-c4363e8284d7@perex.cz>
Date: Mon, 22 May 2023 09:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 25/36] ALSA: seq: Add port inactive flag
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-26-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-26-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VA5WSMPOOVIMUHXS7WF6GYKN4PUQZUPZ
X-Message-ID-Hash: VA5WSMPOOVIMUHXS7WF6GYKN4PUQZUPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VA5WSMPOOVIMUHXS7WF6GYKN4PUQZUPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> This extends the ALSA sequencer port capability bit to indicate the
> "inactive" flag.  When this flag is set, the port is essentially
> invisible, and doesn't appear in the port query ioctls, while the
> direct access and the connection to this port are still allowed.  The
> active/inactive state can be flipped dynamically, so that it can be
> visible at any time later.
> 
> This feature is introduced basically for UMP; some UMP Groups in a UMP
> Block may be unassigned, hence those are practically invisible.  On
> ALSA sequencer, the corresponding sequencer ports will get this new
> "inactive" flag to indicate the invisible state.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

