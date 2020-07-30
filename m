Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DFD232F32
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 11:06:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B027A1771;
	Thu, 30 Jul 2020 11:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B027A1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596100010;
	bh=eswDum7W95krB2jQfk7EZ6Bq7bmsKQi1WDn22vyZYqk=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZXeUTGxz/sOHheiAf9/R5ZGnjy3WbSzGtj7rMYW5v/J63u+Tl+38MuhmE2rnmp61
	 zs6Hi+hvD9na3kIjCWo4i9syligG5iWrXwVLlMkVg1kLIXpjZaS0r+KbH+sY0zzt65
	 9rjC7PXbbdicKv9mmE9/FMrsDEpIWRzKlC3YvVNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDB3F8012F;
	Thu, 30 Jul 2020 11:05:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B22F8021E; Thu, 30 Jul 2020 11:05:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B150F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 11:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B150F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="0aanofb1"
Received: by mail-wr1-x441.google.com with SMTP id f1so23585179wro.2
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=dLkPvQCKJgLmtxhAhpgyq0oaVyl4KxaYKmt7VGxtZKM=;
 b=0aanofb1Pmi8Nb2xkH5hxKqD1W6jNUmzzGZWcOtUg5PG2nTWPO7GJu35uTo19IUOkB
 eNtBnJNr+YjS0Gx3HH16j25Xp0LH1Z1V5hMf0CBcpCh++w6Dgm4TFgHb1fPiMC2/RiQq
 Q2hK/VI6CZtzWOvjY/S9m3TXJkNKwDKCT0udZlAbN/jn/enZfPlJt4313AVsHCZvgMo8
 eybQZDlCsTzR589AMcbm1lOg57wPv3Fjj2iCWoQoL0meT7WwJoSDT20SpicBaEr3uUHq
 tNjqFVx1moKHIET4kxzC+bzMXtmILtHGvpLU5emNES0xqRBqpat1bAmOxjYZ3w8C1SFU
 LUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=dLkPvQCKJgLmtxhAhpgyq0oaVyl4KxaYKmt7VGxtZKM=;
 b=YjR1/okm4twlw7eq4B03ur0jaVo3a7f3gKYrxmCMsGWoyTtqg5OJN2mzDLuMR15vTB
 5ELi3Zyps+nRL9molRFomCfl8OfrvNpx2KmxSCWS4ssKu5NaxFvbbMUJnpXRbY+FFRq0
 9NFRdjtDQtXFGcLNqszX9uxeaQGrK3rlDo7oGhb+bOq7PjSz96KTIzlCjCtefX3vNaKN
 QJA6QiftU5ctLwBp2O0UItz30+EnFgb1ydfrMASSExEH+9ur3OcBdYfgGWk0WcyUadhW
 YFCm0N6oHsguR1jHOX4TIDr5f+MRfzh21zjIz3YylrxA2/mD34ecji7ZMbr3Peq3caMR
 ntgg==
X-Gm-Message-State: AOAM532c9iaQopYJHR06eu5uSUN6maCWNjsz1wnUSRFfE48/q1IeSngk
 +o+3MLI5H0ysUG06Mk1S/LDjqg==
X-Google-Smtp-Source: ABdhPJxmATJSo4KpPLqzaNfFVe6yY8EX64Ugci/foH9vN4kteOvN9e7bLXtuTCYoxKZ4BDhP9b8Njw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr32602052wrq.407.1596099894612; 
 Thu, 30 Jul 2020 02:04:54 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n5sm8555408wrx.22.2020.07.30.02.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 02:04:53 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
In-reply-to: <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
Date: Thu, 30 Jul 2020 11:04:53 +0200
Message-ID: <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
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


On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> On 7/29/20 10:46 AM, Jerome Brunet wrote:
>> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>> changed dpcm_playback and dpcm_capture semantic by throwing an error if
>> these flags are not aligned with DAIs capabilities on the link.
>>
>> The former semantic did not force the flags and DAI caps to be aligned.
>> The flag previously allowed card drivers to disable a stream direction on
>> a link (whether or not such feature is deemed useful).
>>
>> With change ('ASoC: core: use less strict tests for dailink capabilities')
>> an error is thrown if the flags and and the DAI caps are not aligned. Those
>> parameters were not meant to aligned initially. No technical reason was
>> given about why cards should now be considered "broken" in such condition
>> is not met, or why it should be considered to be an improvement to enforce
>> that.
>>
>> Forcing the flags to be aligned with DAI caps just make the information
>> the flag carry redundant with DAI caps, breaking a few cards along the way.
>>
>> This change drops the added error conditions and restore the initial flag
>> semantics.
>
> or rather lack thereof.

Again, why ? All there is so far is your personal preference. no facts.

 * What we had gave capabilities to the link, independent of the DAI
   components. ASoC just computes the intersection of all that to
   determine which direction needs to be enabled. Seems rather simple
   and straight forward.
 * It worked for every user of DPCM so a far.

Your changes:
 * Causes regression
 * Makes information redundant. The code used to build the flag in
   snd_soc_dai_link_set_capabilities() and check it soc_new_pcm() is
   more or less the same. It just adds complexity and waste cycles.

I don't see the upside to it.
 
>
> I am ok to move dev_err to dev_warn and remove the return -EINVAL, but I
> maintain that we have to reach a point where configurations make sense
> before we can clean them up. If we implicitly push issues under the rug by
> not even being aware of them we'll never make progress.

But why should we bother the user with that ? How is throwing this
error/warning an improvement ? What does not make sense in the
configuration ? What are we pushing under the rug exactly ?

I'm willing to go your way, even help you out, but you need to:
 * explain concretely why changing the semantics improve the overall
   situation, concretely ?
 * update all the users of DPCM. Causing regression is not OK.

Carrying redundant information makes things complex and error prone.
If you really want to update this, here is another proposition:
 * Removing snd_soc_dai_link_set_capabilities()
 * Removing both flags completely
 * Let ASoC figure out what is needed based on the components present.

>
>>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>
>>   Hi Mark,
>>
>>   Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>>   introduced more than one problem, the change
>>   "ASoC: core: use less strict tests for dailink capabilities" [0] is still
>>   necessary but the change of semantic remains a problem with it.
>>
>>   This patch applies on top of it.
>>
>>   sound/soc/soc-pcm.c | 14 --------------
>>   1 file changed, 14 deletions(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 00ac1cbf6f88..2e205b738eae 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>>   					break;
>>   				}
>>   			}
>> -
>> -			if (!playback) {
>> -				dev_err(rtd->card->dev,
>> -					"No CPU DAIs support playback for stream %s\n",
>> -					rtd->dai_link->stream_name);
>> -				return -EINVAL;
>> -			}
>>   		}
>>   		if (rtd->dai_link->dpcm_capture) {
>>   			stream = SNDRV_PCM_STREAM_CAPTURE;
>> @@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>>   					break;
>>   				}
>>   			}
>> -
>> -			if (!capture) {
>> -				dev_err(rtd->card->dev,
>> -					"No CPU DAIs support capture for stream %s\n",
>> -					rtd->dai_link->stream_name);
>> -				return -EINVAL;
>> -			}
>>   		}
>>   	} else {
>>   		/* Adapt stream for codec2codec links */
>>

