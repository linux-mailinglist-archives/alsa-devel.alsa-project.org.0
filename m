Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 262536DB775
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Apr 2023 01:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B373E8;
	Sat,  8 Apr 2023 01:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B373E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680911968;
	bh=rHLRZI6mGhYIHEh2KQOmDmlN6kxc7Ev18JasfC+zQsc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Q0bA+fRHBhcMMgFCPALoSJMSF4J0V0B2mSg6QJG6mkLhfNK96fRP/EKFu+yL2fSam
	 qYF2iGSaD+Qx/cEFvQr7mzeRYc6l0z8zlcVH6T3Y2Iv4s7djb/JnSiiWe95TtiL1l+
	 PPwtyaIShysUcwCtvrICfxhzJhlpfR1YIzEhwinY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A5F0F80249;
	Sat,  8 Apr 2023 01:58:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69991F8026A; Sat,  8 Apr 2023 01:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93CC8F80246
	for <alsa-devel@alsa-project.org>; Sat,  8 Apr 2023 01:58:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0773111D5;
	Sat,  8 Apr 2023 01:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0773111D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1680911905; bh=LiPZZbEFaKeQHAt7JtoDij/pSG5f1gkcpqTlGjrKJZE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gOfH6BznOqa/ThSVIAeYMfkE/Oz1/hnWZCA6zJo8gzxFYDcdQfiFrqjNqfrZ0FXFK
	 jSZbuxE/Eikv+qsnzvCTDZWcGroMSD99TdDzZpL3p0Nrp9jUcO7bEkbD49TS6IrcBu
	 lxuvPALVSSROV/6z8yWP4YthH3O0+2pxg8B6YkSU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Sat,  8 Apr 2023 01:58:21 +0200 (CEST)
Message-ID: <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
Date: Sat, 8 Apr 2023 01:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KIE42XFOZDGQMZZ3NY5M7X4MEAOVSZQ6
X-Message-ID-Hash: KIE42XFOZDGQMZZ3NY5M7X4MEAOVSZQ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIE42XFOZDGQMZZ3NY5M7X4MEAOVSZQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
> Draining will always playback somewhat beyond the end of the filled
> buffer. This would produce artifacts if the user did not set up the
> auto-silencing machinery. This patch makes it work out of the box.
> 
> Rather than figuring out the right threshold (which is one period plus
> the card-specific FIFO size plus some IRQ jitter), we use "top-up" mode.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

I think that it was really bad decision to apply this patch without a broader 
discussion. When we designed the API, we knew about described problems and we 
decided to keep this up to applications. The silencing may not help in all 
cases where the PCM samples ends with a high volume. A volume ramping should 
be used and it's an application job. Also, silencing touches the DMA buffer 
which may not be desired. And lastly drivers can handle draining correctly 
(stop at the exact position - see substream->ops->trigger with 
SNDRV_PCM_TRIGGER_DRAIN argument).

I would create a new API extension for this (new ioctl or sw_params flag), but 
the default behaviour should be retained.

I will try to review the first patch too, but my time is limited over Easter.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

