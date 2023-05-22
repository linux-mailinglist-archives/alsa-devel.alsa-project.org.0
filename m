Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A553270B71F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:56:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C109582C;
	Mon, 22 May 2023 09:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C109582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684742183;
	bh=v300DFqh/5MQQuE55av5BQDhlXbKAAY592scPC6pcCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sgHGl+FgeVN9WgjC787mO+BC8g6bjCBHLfdYTUN0VRgRVpAY3jhdO2YsCtnIZ/GyE
	 XPESY41wUACTOsYuLeXkuzxv9gJvQC/hvMo58B7TNa4vwGFZ6IrbHa1CN0IkHPXKpi
	 5UHuI0jLfKnzZuMGP+W/iaHwKUciZwcwe1qcjdfc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 980A2F8055C; Mon, 22 May 2023 09:55:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 237F1F80549;
	Mon, 22 May 2023 09:55:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6854CF80551; Mon, 22 May 2023 09:55:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 50D47F8026A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:55:17 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8A21B1E35;
	Mon, 22 May 2023 09:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8A21B1E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684742116; bh=2Ys6ql56iqWRSQjQcRA2i9gx3EJKmAiyF6A+p+zCf0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vaczI7IXNInQ0ieMREAX4Ix7kfWnqAvGXw1NM88yQxrGl0P3FtyVZUh4WUy/79AT3
	 ncYmZmGSfMaLs7wLXmHEqdImLSYcsca6+MncZxUk+mKCXHGUdCP4+vTHs8PSnn3V9t
	 zmBUV/EhZvUPGT35BDKD+2xVeknttlpFoFpsM88I=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:55:14 +0200 (CEST)
Message-ID: <810d9f0e-be2c-1e95-ee19-f0f2f1a667cb@perex.cz>
Date: Mon, 22 May 2023 09:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 34/36] ALSA: seq: Print UMP Endpoint and Block information
 in proc outputs
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-35-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-35-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RABNEVNSLIVEXFNEDNJQXPQ7CLJR2DAG
X-Message-ID-Hash: RABNEVNSLIVEXFNEDNJQXPQ7CLJR2DAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RABNEVNSLIVEXFNEDNJQXPQ7CLJR2DAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> This patch enhances the /proc/asound/seq/clients output to show a few
> more information about the assigned UMP Endpoint and Blocks.
> 
> The "Groups" are shown in 1-based group number to align with the
> sequencer client name and port number.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

