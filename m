Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C810A780F13
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 17:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94EEE88;
	Fri, 18 Aug 2023 17:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94EEE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692372297;
	bh=mXt6BWhy8r4wQvx0oXusESOGTmpyVYzYM93gVmTulcU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q9opzbhfKuiGZJzSBqB64zCt9TKW/cQ03wdUP+i4BFvmE9OR7l8SNqq92eU+/bUa/
	 iTGCkhJlBstqqnlWhK2GSDOPWP76rytPIJehOX4hanCVPqgIpOBkyP0VrkmTbdIoVd
	 8JeAyIIAN8VtNkXVBV9oKLxSFg2Tv3wFqLlQ3a1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C329F80254; Fri, 18 Aug 2023 17:24:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91EABF8016D;
	Fri, 18 Aug 2023 17:24:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39FFCF801EB; Fri, 18 Aug 2023 17:24:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BC95AF8016D
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 17:23:59 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4B7001A72;
	Fri, 18 Aug 2023 17:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4B7001A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1692372238; bh=gCiXb4bfLugI7mCNN8ZWJwNnI6ueHU1IHqsalEDrA1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4LuXtk/sfy46qmxwZPIB4OYMY73ECilCfVvY7KZyrxQB7U4wpWhepXoeK2h1SQQCe
	 56zehcdXv0YVkYufv5Gq3Mf1d//0ElpF4RcM9wQA5FuYMpJXJORfRg8s2pzJEIQA1t
	 MHjnEWbIDDSQjVqbJLmxwuTDaQD+N1p4c4ruzYBY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 18 Aug 2023 17:23:47 +0200 (CEST)
Message-ID: <b9dfad10-ef32-ba06-99b5-32391b0aab33@perex.cz>
Date: Fri, 18 Aug 2023 17:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during
 stop
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, guennadi.liakhovetski@linux.intel.com,
 yung-chuan.liao@linux.intel.com, regressions@leemhuis.info
References: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
 <169151742693.78353.2991484643013989552.b4-ty@kernel.org>
 <b23c2ef1-7c9f-5eca-f61d-6f6994226ddc@perex.cz>
 <8428b13b-50c4-4db5-8de9-7a9b165f6254@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <8428b13b-50c4-4db5-8de9-7a9b165f6254@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FWRW7ILD273Q6GKHVTO2AE7RW3YD2BX5
X-Message-ID-Hash: FWRW7ILD273Q6GKHVTO2AE7RW3YD2BX5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWRW7ILD273Q6GKHVTO2AE7RW3YD2BX5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18. 08. 23 17:18, Mark Brown wrote:
> On Fri, Aug 18, 2023 at 05:08:35PM +0200, Jaroslav Kysela wrote:
>> On 08. 08. 23 19:57, Mark Brown wrote:
> 
>>> [1/1] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
>>>         commit: 90219f1bd273055f1dc1d7bdc0965755b992c045
> 
>> 	if it's not late, this patch should be also applied to the 6.5 tree. It
>> seems that many new laptops are affected (sound may be really weird when an
>> underrun occurs on those devices and users are not really happy).
> 
> It was applied for 6.5, the reports always say for-next due to
> difficulties with serieses which mix fixes and new development.

Great. Thanks.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

