Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C97A91D7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 08:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23C609F6;
	Thu, 21 Sep 2023 08:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23C609F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695279524;
	bh=Q+x5PNY2fQfbxUuSQ0i+ewkbcor1eYWv1VbIBFtXGic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qg8Pw7X3FvBC4vQfAl866iYbiyIDux7rAJ1WEv2Sfqvwf9U+oGXxUVTzfXNrk7Ny0
	 q37e9WW7YyX4KJKNAesK14+oS18u7xs/KolzMqtvtEyWcztTaWTHiMfk02z8FHWSkP
	 v0FBoDliE7CQS19XE4o1CNT7YgD6biwg1Y7L8I0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D78E9F800AA; Thu, 21 Sep 2023 08:57:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E296F801F5;
	Thu, 21 Sep 2023 08:57:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1868DF8025A; Thu, 21 Sep 2023 08:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF66EF800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:57:48 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 497351A5A;
	Thu, 21 Sep 2023 08:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 497351A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695279467; bh=aZpTRdRdy6NC2g1GyU8kvveaoE1DB3AcuZUSyCLYgc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=piINdcxnK0hQpNiz1ZXGs2Eq3BMwKllYHeZiJER1HFsSy/XAegOB8B0LPmvGLoTMq
	 gT+/MRMcUxZ4ZA14k8Yb4vGNNWs8H2WCmEY4E6GU6FcfeJWgLQ3HZRXzppa/EKrgnh
	 J7iQSsB0LZYZf552IYVwkWwG3NrutKn18/POJ+PY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 21 Sep 2023 08:57:40 +0200 (CEST)
Message-ID: <f84a4fe3-4430-dfeb-0401-7cbefedc3d3d@perex.cz>
Date: Thu, 21 Sep 2023 08:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/17] ASoC: pcm: Honor subformat when configuring
 runtime
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
 <20230918133940.3676091-5-cezary.rojewski@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230918133940.3676091-5-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SDIFSYXE7YMD5LENRRD4FMO6SAT7267K
X-Message-ID-Hash: SDIFSYXE7YMD5LENRRD4FMO6SAT7267K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDIFSYXE7YMD5LENRRD4FMO6SAT7267K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18. 09. 23 15:39, Cezary Rojewski wrote:
> Subformat options are ignored when setting up hardware parameters and
> assigning PCM stream capabilities. Account for them to allow for
> granular format selection.
> 
> With introduction of subformats, copying hardware parameters becomes
> a non-trivial operation. Implement a helper function to make things
> simple.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

>   struct snd_soc_pcm_stream {
>   	const char *stream_name;
>   	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
> +	const struct snd_pcm_subformat *subformats;

I don't think that this extension is mandatory. The whole patch can be skipped 
if the driver installs the subformat runtime constraint.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

