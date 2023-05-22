Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F570B6A7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C645020C;
	Mon, 22 May 2023 09:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C645020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684741105;
	bh=r+D0LoO3OBzZyDcIR0n6doPoTsumuZSiI5ReopPKfJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=suOf/R3+Cah72Z1cGbU4tr/qwXc2onmFJuhm8VK0gU2AnmSEZgLKEoqaGedP8rnLH
	 7n8/VZIp0iBmMU47rLJBBsZVQKJKARAsPcg7WZD6gbaDFezCTkWqdyeYIn581hwJpE
	 jjwzRZpuRQoylag+KHS+8HZTgKPLxp3bVjw687f0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A571F8016A; Mon, 22 May 2023 09:37:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B069F80249;
	Mon, 22 May 2023 09:37:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70D0DF8024E; Mon, 22 May 2023 09:37:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6327CF8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:37:28 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D57911E35;
	Mon, 22 May 2023 09:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D57911E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684741047; bh=WXUxN0Oty+KpPH71yuXUhk/+jOpLzc0EOlwQw5uqh2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bIiw70pGmBuWkgHtnM3WXrxzR4PaAv5hjv0gTtZIFlVltlS5mWL2J0Ugl5mcVPvML
	 8ZAQFhLw9bgt2lVnIi1M+NV9LctC7SZkEmdHJf5XTCNilex5gL++Kg97mwRqaDX8/g
	 A+i2DZUmRlAE8q6LUFHunj95WAsALdDWzK0QCeKM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:37:25 +0200 (CEST)
Message-ID: <a1d74b51-c699-62e4-1c24-8eee05598a4f@perex.cz>
Date: Mon, 22 May 2023 09:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 26/36] ALSA: seq: Support MIDI 2.0 UMP Endpoint port
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-27-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-27-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NYNM5KPHWKKCJ3AYV7N3V3A6B7C4OUZP
X-Message-ID-Hash: NYNM5KPHWKKCJ3AYV7N3V3A6B7C4OUZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYNM5KPHWKKCJ3AYV7N3V3A6B7C4OUZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> This is an extension to ALSA sequencer infrastructure to support the
> MIDI 2.0 UMP Endpoint port.  It's a "catch-all" port that is supposed
> to be present for each UMP Endpoint.  When this port is read via
> subscription, it sends any events from all ports (UMP Groups) found in
> the same client.
> 
> A UMP Endpoint port can be created with the new capability bit
> SNDRV_SEQ_PORT_CAP_UMP_ENDPOINT.  Although the port assignment isn't
> strictly defined, it should be the port number 0.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

