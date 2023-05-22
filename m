Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714E70B4A2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 07:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABB0839;
	Mon, 22 May 2023 07:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABB0839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684734165;
	bh=NyUV1JtQnEgItawHMsPMFvAFwB5BYd17OY+JCClTISA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dubUy911KqCD/SvZkH8uAfpDnofW3lti+TYXqbg2/o80YvUCG3N5jqopDwOV+UvFP
	 nINAf5oBIEz6iFKRxrHFJMFkv2TuqAk3IPsoLQaEDxyHN8l85Sma8xC/sZu4orXpLt
	 H0c1SsL51lhT7lX+kwdLCdPZ3WwVXqQF8a5x/chw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C677CF80549; Mon, 22 May 2023 07:41:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF74F80249;
	Mon, 22 May 2023 07:41:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2995F80549; Mon, 22 May 2023 07:41:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BEEDF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 07:41:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4C75E1E35;
	Mon, 22 May 2023 07:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4C75E1E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684734086; bh=dA2w3S4NxqWI7M4wG6EeospOcXvmHRCkai5Boy76qlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wH+GKkpWr1xVUN5321KD00E90Nt6cMNH2lwyYy0wrnv/1kzQADNPVQfdUKnPoxqhf
	 5L8DPuGSdNsX5G2HOi+l43p4HXVKKGrx7tTG6N3EGblw9lKzCfWZ0dI+Y3nb5qgV1M
	 FtMSEUkhQz1rud0dZ3GVOyepxaEzC8G8wAwh4MK0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 07:41:24 +0200 (CEST)
Message-ID: <0ae4a3df-7dd0-921f-6dde-8e04bebfc2b4@perex.cz>
Date: Mon, 22 May 2023 07:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 02/36] ALSA: rawmidi: Add ioctl callback to
 snd_rawmidi_global_ops
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-3-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-3-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3BGFLYO2DHRO3NY7N5JCOD5RZEKOONOI
X-Message-ID-Hash: 3BGFLYO2DHRO3NY7N5JCOD5RZEKOONOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BGFLYO2DHRO3NY7N5JCOD5RZEKOONOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> A new callback, ioctl, is added to snd_rawmidi_global_ops for allowing
> the driver to deal with the own ioctls.  This is another preparation
> patch for the upcoming UMP support.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

