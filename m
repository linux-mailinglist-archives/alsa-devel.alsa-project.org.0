Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBED27549A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 11:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CEA1173A;
	Wed, 23 Sep 2020 11:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CEA1173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600853624;
	bh=Bc8Sqy0mUNVdaql2uyNJz5vXhAkGjwlj/j9NGhdNjpo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZomxM6kFPQd4YZV7o1eBNCfEl35c9T7kCvd8Lo9dKr1qZQqTYQGrB/AeANBeA37ew
	 clKLioPM6goX+usLrSzMqYEV23kOPTcL3u8KkXaYDUZjUfE9wm0Cj3skXGFyM6aoF+
	 nU/bJrrrNKGNZLxKOihPKpAI/8lDwwr1jKoGGz0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5716F801EB;
	Wed, 23 Sep 2020 11:32:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92173F80171; Wed, 23 Sep 2020 11:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44885F800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 11:31:54 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8186AA0040;
 Wed, 23 Sep 2020 11:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8186AA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1600853513; bh=4W2UryXH+5QO71NpwwN82j575rNbO1Z8vJdvMBYwenk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o01/YF2L9CMlaIMxdLP41eerGKzW3Owj6NDVB4qut/wZ9Slzjn7Zsp0OWXYxLMupZ
 U1CuMk9+N7lbWNazAVu021R70Tmdp3gu3LxKxQI4HiayMoNHwHzJ5aBcSdhbeu7Sqs
 ewNbp9DRp/qvRTJNM8BdL8c0UaNN/klpCHP6MJ54=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 23 Sep 2020 11:31:44 +0200 (CEST)
Subject: Re: [PATCH 5/6] ASoC: Intel: sof_sdw_rt700: add codec prefix
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
 <20200923080514.3242858-6-kai.vehmanen@linux.intel.com>
 <b9481c23-5a09-0518-b05b-c01b2d04e102@perex.cz>
 <alpine.DEB.2.22.394.2009231213470.3186@eliteleevi.tm.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fa50133a-f021-bb87-a128-d5aba2a6adf7@perex.cz>
Date: Wed, 23 Sep 2020 11:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2009231213470.3186@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 23. 09. 20 v 11:25 Kai Vehmanen napsal(a):
> Hi,
> 
> On Wed, 23 Sep 2020, Jaroslav Kysela wrote:
> 
>> Dne 23. 09. 20 v 10:05 Kai Vehmanen napsal(a):
>>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> --- a/sound/soc/intel/boards/sof_sdw_rt700.c
>>> +++ b/sound/soc/intel/boards/sof_sdw_rt700.c
>>> @@ -23,9 +23,9 @@ static const struct snd_soc_dapm_widget rt700_widgets[] = {
>>>  
>>>  static const struct snd_soc_dapm_route rt700_map[] = {
>>>  	/* Headphones */
>>> -	{ "Headphones", NULL, "HP" },
>>> -	{ "Speaker", NULL, "SPK" },
>>> -	{ "MIC2", NULL, "AMIC" },
>>> +	{ "Headphones", NULL, "rt700 HP" },
>>> +	{ "Speaker", NULL, "rt700 SPK" },
>>
>>> +	{ "rt700 MIC2", NULL, "AMIC" },
>>
>> This line looks suspicious. Perhaps, the prefix should be added before AMIC ?
> 
> I believe this is still correct. We prefix the codec-side entry of the 
> dapm routes with codec string and here MIC2 is the codec. This is aligned 
> with existing code for 711 in sof_sdw_rt711.c:
> 
> static const struct snd_soc_dapm_route rt711_map[] = {
> »       /* Headphones */
> »       { "Headphone", NULL, "rt711 HP" },
> »       { "rt711 MIC2", NULL, "Headset Mic" },
> };
> 
> Br, Kai
> 

Ok, thanks for the clarification.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
