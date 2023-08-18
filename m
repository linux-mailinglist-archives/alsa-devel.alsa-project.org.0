Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1F780EB8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 17:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FEE6E7B;
	Fri, 18 Aug 2023 17:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FEE6E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692371544;
	bh=yHhhW5FtMql57N+ApWe/gEyoOJb9Tr3NYbQV103gEF0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XzJVqAAY3tQ3hW8D9e//6305Qv80P5xC2Ix2NHiu3R4Mon9co2LzbE3QM9rf0ghSc
	 N00+EyaL5ReSaQZlWkQF9m2pmInl9NLyk+XqhgHetVtH7zGibWjCO0YQ66XNSaHgMM
	 BvG/bTHMR77si8cMLl2QgpycNAOn+24vidppr1EQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B5B2F800EE; Fri, 18 Aug 2023 17:11:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E1C3F8016D;
	Fri, 18 Aug 2023 17:11:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BECCF800D1; Fri, 18 Aug 2023 17:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B671F800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 17:08:48 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5C42F1A70;
	Fri, 18 Aug 2023 17:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5C42F1A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1692371327; bh=nzVlE4QWqATao/UWngAEHK7Edi86bui8+4UGbFG3X4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hp1NBrs26icK6crJOClXKNKfkYPwfufLZUlrNxcv7MHYc2HpxKvK8rSS+MQdxGgGf
	 90l7sFhGHT99gsGx2GsF/uThtPXDgg7ph0mnfmIjuHlzppKDNIoqUNQhKrlAxY8BOZ
	 4+f2gAwnDpu6vRoZnQiKTiRXjLvQSOjm2d6LGzvY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 18 Aug 2023 17:08:36 +0200 (CEST)
Message-ID: <b23c2ef1-7c9f-5eca-f61d-6f6994226ddc@perex.cz>
Date: Fri, 18 Aug 2023 17:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during
 stop
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, guennadi.liakhovetski@linux.intel.com,
 yung-chuan.liao@linux.intel.com, regressions@leemhuis.info
References: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
 <169151742693.78353.2991484643013989552.b4-ty@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <169151742693.78353.2991484643013989552.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4636MBSH3NZOUVTXVRLHIPLNOTIJJBZG
X-Message-ID-Hash: 4636MBSH3NZOUVTXVRLHIPLNOTIJJBZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4636MBSH3NZOUVTXVRLHIPLNOTIJJBZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08. 08. 23 19:57, Mark Brown wrote:
> On Tue, 08 Aug 2023 14:06:27 +0300, Peter Ujfalusi wrote:
>> With IPC3, we reset hw_params during the stop trigger, so we should also
>> clean up the link DMA during the stop trigger.
>>
>>
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
>        commit: 90219f1bd273055f1dc1d7bdc0965755b992c045

Hi Mark,

	if it's not late, this patch should be also applied to the 6.5 tree. It seems 
that many new laptops are affected (sound may be really weird when an underrun 
occurs on those devices and users are not really happy).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

