Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107907844ED
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 17:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430A782C;
	Tue, 22 Aug 2023 17:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430A782C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692716688;
	bh=r8DOp2zP2dg8hhV0RAU5rx+GCyUhEkolBaRpChsgAj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZ1NvepipE/ylQFXkNkHYl6m41Df5aUe8Bm3nDAVYghFMv6z5wkoGJG2SKvP82x44
	 3+6iF2niOuWcyN0EWPX/74f4dfgVW6QB+RcZI29mhNg2Qzc1N6/I3r/YfzewHTwdXZ
	 kEj3IO2txNWvbW4cjvPRNBoMXRvTBzViTe9IhU1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6C9F800F5; Tue, 22 Aug 2023 17:03:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB8F9F800F5;
	Tue, 22 Aug 2023 17:03:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B574F80158; Tue, 22 Aug 2023 17:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB048F800BF
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 17:03:11 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 19BFF11F1;
	Tue, 22 Aug 2023 17:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 19BFF11F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1692716590; bh=gcQdTWmQbCuwso98KFWCyqR2s+0746yuVsLWGIffJAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2iClrVceiP70gY6rGpLP6p/P5cyND7F3OqVDdTJLcqnuYrSeKJx/lkQUiZKoO4XQ8
	 VxwLFn2ILzlWlZfHqHt59YOp8tA+64rw9xxrXUc0E7DdU/qPL3qMhOgpnvXNgKAntP
	 UdzSfC6ePCint0nASwGr344jwuuG/W0u2IXSWhrc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 22 Aug 2023 17:03:03 +0200 (CEST)
Message-ID: <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz>
Date: Tue, 22 Aug 2023 17:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230811164853.1797547-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PHIJK7D7WBKLG4IXOGCQNOW2BZS7HHMI
X-Message-ID-Hash: PHIJK7D7WBKLG4IXOGCQNOW2BZS7HHMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHIJK7D7WBKLG4IXOGCQNOW2BZS7HHMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11. 08. 23 18:48, Cezary Rojewski wrote:

> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32	_SNDRV_PCM_SUBFMTBIT(MSBITS_32)

What was reason to add 32/32 format ? Subformat STD + msbits == 32 should 
already handle the maximal resolution. Until we do not have 64 bit formats, it 
seems like an useless extension.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

