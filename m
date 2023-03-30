Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD46D06D1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 15:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769EF1F1;
	Thu, 30 Mar 2023 15:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769EF1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680183236;
	bh=2l/ZIlbqF7Oh6iBeqoelOe5EwLgXUaNBfKBIY9olapM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=j3BwPJPdMs3zTvEy5AIFBZaq7LcdnPncEA8C7/1Nx6F9CNMqNigQspRI6HTH0npOg
	 1Z5lTCbfntcBKnRV/tq52b1xqMFx0yINJY2eTH21K51LCPFRbrnlxKfTQCtHRmvuCf
	 hTKoRcDih1kiCgRy81c94ff/79cD4bNwZOyPFu3A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 363B8F8024E;
	Thu, 30 Mar 2023 15:33:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB76F80272; Thu, 30 Mar 2023 15:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88194F8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 15:32:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E06EE11D2;
	Thu, 30 Mar 2023 15:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E06EE11D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1680183154; bh=1PxY0KaUYTlWoJWhAAMQ4IQN623RvskrGLwGWqrcy58=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kZYMIYKNuFfGcR1sfxvRRSkXTqFMo698zbgbwelQGyva/YGQVHxf2GoGl3gD1CEOT
	 mk76O9wNFMhlei3c6/TOL3HG4THjtFAFga0yhUdyxyppeVW+a9cYY4HNQ/dg4h3SL6
	 qTJ7EglUugHSyrhx8WuEVCa1b0Yi1BTAVGFlPlNM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 30 Mar 2023 15:32:32 +0200 (CEST)
Message-ID: <24dd2ce8-6f10-914a-6aa0-e01ee0c09ea6@perex.cz>
Date: Thu, 30 Mar 2023 15:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ALSA: ac97: Define dummy functions for snd_ac97_suspend()
 and resume()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230330132847.12882-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230330132847.12882-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4YI7MZ77R5IYPBBPBNAZUVYGDERX4ULC
X-Message-ID-Hash: 4YI7MZ77R5IYPBBPBNAZUVYGDERX4ULC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YI7MZ77R5IYPBBPBNAZUVYGDERX4ULC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30. 03. 23 15:28, Takashi Iwai wrote:
> For allowing the build without CONFIG_PM, add definitions of dummy
> functions for snd_ac97_suspend() and snd_ac97_resume() without
> CONFIG_PM, too.
>  > Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

