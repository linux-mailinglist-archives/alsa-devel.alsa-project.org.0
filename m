Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A32340C8
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 10:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926BD169E;
	Fri, 31 Jul 2020 10:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926BD169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596182877;
	bh=kBLe0xblqWScGhHafl5UgbNY1Xghx4jtu18hn4+XDyc=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gbMhSAWyJ0c7Oz03sQ3iDQPGFY5KRZAnNyA/2e3WrGt80VSbmkYSQXmoA7ELYRssR
	 b2mbKvWIVjOn827V4MACpVwC0cMsBpo+K3XoeNveyINbcx+Z6Jgv6OfNF+gekFzq9H
	 ZRdqUG3TjRrmW+tUKS8RgOSfB5Ghkr5hb49FJe0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA80FF8015C;
	Fri, 31 Jul 2020 10:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C16CF80171; Fri, 31 Jul 2020 10:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA16F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 10:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA16F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="paELUECn"
Received: by mail-wr1-x444.google.com with SMTP id f18so27152986wrs.0
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=fucMGEr5CXFfOMcRe7EoTEOJr1Kr4QCI6uUDYVzs0gU=;
 b=paELUECntKBbuSCyCcBVLOaExS6IKoAliKkoF5FO2Vx4ae1xzSit3j2MPx+WVR+MVK
 zaZ97aVOzr+rKYKirG+gD6cR0v04FzDc6B5ygXWb1JXdKTzDsq1s8YL+kMqlPzHx+uYq
 bDPB70KKa6GlMjDvyz/4JdTWKHxlYVXB9+w7f4k3yTX722eL5WLL+5uMHaCXA9zx6Ujk
 E543xx2Kq/QfbljQhO9bln/Proogp8rAe1XWwfjZ3x9S3wHfY0u+gXUN8JSoUfrC1ORK
 wdXqXbDwIpZ6MS3sThUTAa6zbDEMedNXGowA0RrhSgs4Sd1aQcEIGXCkT3k7ztrH1PH8
 7B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=fucMGEr5CXFfOMcRe7EoTEOJr1Kr4QCI6uUDYVzs0gU=;
 b=BPRPQNLMzHLantqK0Cx/mJ4hys1UcImcRwhz73bJwUi09LdENglimrm19PXrF8w4Al
 e6L1bwjT+goj2PirpIKtlu6j/yXM0gNC8CJ1VDZPPFN+ER/vxlVLcCmIawAHODi10tps
 UunfuvAie+UwjiWrhf0jZ9H9BE4h8Uqq+UF3XshYf7jjxTTuWXAusmtyMUhC5BFYQ5B+
 ZMuVKHOJzkXX2BV9e/+VA7jK79eRV/f9xzssPoE4vPxoieikQt4k+b4wPLtTw9Nzxe14
 46NDSysji4J9gqHXRcfSnMqgkQWusre6C2UeCT6exW5SptnPd0lOY8EqlGRjweDaPewY
 cDMA==
X-Gm-Message-State: AOAM532ZJkymRlN/YKqx5BW5fCZbiH8bxTnihWz5JxVVamlfg6iTtrGV
 3NVX10PXiiyTAwA5LIW21bImzw==
X-Google-Smtp-Source: ABdhPJzz8HoujDESE97UeMx7i6gLDYDp1lPxuV8yNkRjvFTZsrr0L0KA7Q2WsV9AlEgH/0FFtZL4Pw==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr2541831wrf.40.1596182764941; 
 Fri, 31 Jul 2020 01:06:04 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z63sm13311387wmb.2.2020.07.31.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:06:04 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
In-reply-to: <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
Date: Fri, 31 Jul 2020 10:06:03 +0200
Message-ID: <1ja6zg85xw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
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


On Thu 30 Jul 2020 at 18:06, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> On 7/30/20 4:04 AM, Jerome Brunet wrote:
>>
>> On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>> On 7/29/20 10:46 AM, Jerome Brunet wrote:
>>>> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>>>> changed dpcm_playback and dpcm_capture semantic by throwing an error if
>>>> these flags are not aligned with DAIs capabilities on the link.
>>>>
>>>> The former semantic did not force the flags and DAI caps to be aligned.
>>>> The flag previously allowed card drivers to disable a stream direction on
>>>> a link (whether or not such feature is deemed useful).
>>>>
>>>> With change ('ASoC: core: use less strict tests for dailink capabilities')
>>>> an error is thrown if the flags and and the DAI caps are not aligned. Those
>>>> parameters were not meant to aligned initially. No technical reason was
>>>> given about why cards should now be considered "broken" in such condition
>>>> is not met, or why it should be considered to be an improvement to enforce
>>>> that.
>>>>
>>>> Forcing the flags to be aligned with DAI caps just make the information
>>>> the flag carry redundant with DAI caps, breaking a few cards along the way.
>>>>
>>>> This change drops the added error conditions and restore the initial flag
>>>> semantics.
>>>
>>> or rather lack thereof.
>>
>> Again, why ? All there is so far is your personal preference. no facts.
>
> What would be the meaning/purpose of a dailink with .dpcm_capture set, with
> only dais that support playback only?
>
> What would be the meaning/purpose of a dailink with .capture_only set, but
> with a dai that supports playback?

You get to throw an error in those case

>
> What happens if none of these flags are set?

I think I already suggested to throw an error in the initial review of
your patch

>
> What happens when all these flags are set?

I don't see the problem here

>
> No one seems to know, so my suggestion is to align first on consistent
> configurations, then see what can be removed.
>
>>   * What we had gave capabilities to the link, independent of the DAI
>>     components. ASoC just computes the intersection of all that to
>>     determine which direction needs to be enabled. Seems rather simple
>>     and straight forward.
>
> that's what my last patch did, and when there is no intersection it
> complains. Please clarify what you expect when there is no overlap between
> dai and dailink capabilities. Keep in mind that we have a mix of hard-codec
> configuration and DT-created ones, your case is not the general one.
>
>>   * It worked for every user of DPCM so a far.
>
> Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() it
> exposed tons of cases where the information on direction was not provided
> in a reliable at the DAI level. I will assert that we are still finding out
> cases with broken DAI configurations, and as a result we will also find
> broken dailink configurations. Your picture of DPCM as a perfectly
> functional system that I broke is a distortion of reality.

If it was not working, it was certainly not clear in the changelog.
What's clear is the regression it caused

>
> The reality is that we have to work in steps, first make sure all DAIs are
> properly described, then work on the dailinks and optimize at a later
> point. we will need warnings to find out what the problem cases are, and
> move slowly.

Sure, have it your way
