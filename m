Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879677E6D4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:46:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C79204;
	Wed, 16 Aug 2023 18:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C79204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692204391;
	bh=B6HicahTsCkX3D4o9fHsAplykHWZ4uTIMoKJqdYNcZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BV2gLxY8ya5IYPlnWgTHxvhpG3Wh8Fhh1VbIT7PaM54An2BeyrlNMno8/lwXmpJ+y
	 xpJ9lXI+SM1Sya8CpEnguT7IMnAxFb4dY2eUPh4E7yAwM8Anb7pMpNGK41HbmbEqIA
	 f9RUamqAm2c4Dh7NUqnV0eQsnhXqb53J3qwdOHvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C397CF800D1; Wed, 16 Aug 2023 18:45:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41332F8016A;
	Wed, 16 Aug 2023 18:45:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6DEF8016D; Wed, 16 Aug 2023 18:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FAE8F800D1
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:45:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9F63A1A69;
	Wed, 16 Aug 2023 18:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9F63A1A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1692204322; bh=PB3GLw3JHGBbrGNpL1DF98h9X1oH9QGUbpXBe0cnnLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFKrpIL0O5T7sjcLWZzc2MdniXvKEm/qNc8FLnHLUCDjPaua7B23N+Lzw6k8EsodN
	 ml6+bu/2YQApf3yZ+WEXIaoPCCmKEWYkdHCkGGxdA5vNozjyvYZ/UO/FBc0f9NTcaz
	 Jlm2OrGMt912A9xDaBNrvO4Ttuo0j07taRxnJVKM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 16 Aug 2023 18:45:19 +0200 (CEST)
Message-ID: <ec4b2bf5-1357-916d-c7e7-644ead01433d@perex.cz>
Date: Wed, 16 Aug 2023 18:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC 0/9] ALSA: Don't embed struct devices
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
References: <20230816160252.23396-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SIANNE5M2ITRNEDIBKIOTVGUOW7S2STI
X-Message-ID-Hash: SIANNE5M2ITRNEDIBKIOTVGUOW7S2STI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIANNE5M2ITRNEDIBKIOTVGUOW7S2STI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16. 08. 23 18:02, Takashi Iwai wrote:
> Hi,
> 
> this is another set of patches to attempt papering over the UAF
> problems that are seen when the delayed kobject release is enabled, as
> initially reported by Curtis:
>    https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey@chromium.org
> 
> There was a previous patch set with a different approach (using the
> device refcount dependencies), but this is a sort of step-back to the
> old way.
>    https://lore.kernel.org/r/20230807135207.17708-1-tiwai@suse.de
> 
> After discussions and evaluations, we agreed that decoupling the
> struct device from each sound component object is the safest (and
> easiest) way as of now.  For applying the changes more consistently, I
> introduced a new helper for the struct device allocation and
> initialization, and applied all components.
> 
> A couple of more changes for card_dev refcount managed aren't included
> in this patch set, though.  They might be good to have, but this patch
> set should suffice for the currently seen UAF problems.
> 
> For a long-term solution, we may restructure the device management,
> then the struct devices may be embedded again in each object.  But,
> it'll need lots of other changes and cleanups, a big TODO.
> 
> The latest patches are found in topic/dev-split branch of sound.git
> tree.
> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (9):
>    ALSA: core: Introduce snd_device_alloc()
>    ALSA: control: Don't embed ctl_dev
>    ALSA: pcm: Don't embed device
>    ALSA: hwdep: Don't embed device
>    ALSA: rawmidi: Don't embed device
>    ALSA: compress: Don't embed device
>    ALSA: timer: Create device with snd_device_alloc()
>    ALSA: seq: Create device with snd_device_alloc()
>    ALSA: core: Drop snd_device_initialize()

For all commits:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

