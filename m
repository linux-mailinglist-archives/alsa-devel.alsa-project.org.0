Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631779CF0B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7187AE86;
	Tue, 12 Sep 2023 12:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7187AE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694516370;
	bh=bgdwlrzvBFkSNynjDEfBcTNkpO4Ws0O02LTFY9u0GIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O8p9Xk6FhVbyYyTHTPIT3U64UdF7BZfDrP8QvjVO7LrorqBa3QzytFJKZ7z3lYfJ1
	 pbE8OI4VSs+zjhTiIvIHghjmQ++Jn5nYPg44QFAc29zYCm/oLQ31ZdYZj/4pn3Q33G
	 0+Fb1cZtwmXS8ig9X1hxH6Ik108eudlW++2AgyJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF26EF80549; Tue, 12 Sep 2023 12:58:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 358CAF80246;
	Tue, 12 Sep 2023 12:58:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334B8F80425; Tue, 12 Sep 2023 12:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8972F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 12:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8972F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PhKdDsRn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694516300; x=1726052300;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bgdwlrzvBFkSNynjDEfBcTNkpO4Ws0O02LTFY9u0GIc=;
  b=PhKdDsRn6nTJrC23gWwGqLHPFfZbgRU4tPjN/P8g9q3V6TCh8TY9FLkE
   08JIsApdKOppuXsBS18ZAeaHi19ipKF/K0RiHf/rvBHYO59jY2/FForjc
   buaAPPNYZ2Fw8DXzsNqkjnUrvAbhX48nH8mLIlF++21HN0F0KOHQXGJhW
   LqBV8x/R4AvzK1wQJAmp5oih2DbAf9vIJdVL9gHESVmehU4Lpqk2qPZpo
   JKDHg64pQtroiKHpSdwvxRdRFIDHyRB70JHm7dnPN4pg2UyHph1945iE6
   uQZRXO51LQ8nwRy40rpxf8MdvYDjgJ6vWw5pi1qDttud1OXNSl8FLffeV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378251250"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="378251250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 03:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917392364"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="917392364"
Received: from mkidd-mobl.ger.corp.intel.com (HELO [10.251.217.72])
 ([10.251.217.72])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 03:58:07 -0700
Message-ID: <597fcee0-a98f-4461-8f00-6033032c99e1@linux.intel.com>
Date: Tue, 12 Sep 2023 13:58:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: core: Increase the name array size for debugfs
 directory name
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Arnd Bergmann <arnd@arndb.de>
Cc: tiwai@suse.com, Jaroslav Kysela <perex@perex.cz>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230912083910.15994-1-peter.ujfalusi@linux.intel.com>
 <96c5309d-bb06-486e-a1f8-e3d71b275f13@app.fastmail.com>
 <87cyyn7jvs.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87cyyn7jvs.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QW37VOFT2RDJ7PW3LM7WT5N2VTLB5V35
X-Message-ID-Hash: QW37VOFT2RDJ7PW3LM7WT5N2VTLB5V35
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW37VOFT2RDJ7PW3LM7WT5N2VTLB5V35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/09/2023 13:42, Takashi Iwai wrote:
> On Tue, 12 Sep 2023 12:18:04 +0200,
> Arnd Bergmann wrote:
>>
>> On Tue, Sep 12, 2023, at 10:39, Peter Ujfalusi wrote:
>>
>>> While the code is correct, we need to silence the compiler somehow.
>>> It could be done by limiting the range in sprintf like
>>> sprintf(name, "card%d", idx % SNDRV_CARDS);
>>> sprintf(name, "card%hhd", idx);
>>> etc
>>>
>>> These are too workaroundish. Increase the name array to 15 instead which
>>> looks better and only adds 7 bytes on stack.
>>
>> It looks like we use the same string for kobject_set_name(), so
>> maybe this would work as well:
>>
>> --- a/sound/core/init.c
>> +++ b/sound/core/init.c
>> @@ -278,9 +278,6 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>>                          size_t extra_size)
>>  {
>>         int err;
>> -#ifdef CONFIG_SND_DEBUG
>> -       char name[8];
>> -#endif
>>  
>>         if (extra_size > 0)
>>                 card->private_data = (char *)card + sizeof(struct snd_card);
>> @@ -364,8 +361,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>>         }
>>  
>>  #ifdef CONFIG_SND_DEBUG
>> -       sprintf(name, "card%d", idx);
>> -       card->debugfs_root = debugfs_create_dir(name, sound_debugfs_root);
>> +       card->debugfs_root = debugfs_create_dir(kobject_name(&card->card_dev.kobj),
>> +                                               sound_debugfs_root);
> 
> The idea looks neat, but I suppose it's better with
> dev_name(&card->card_dev) instead?

Yes, this looks better, I will send a new patch in a minute.

> 
> thanks,
> 
> Takashi

-- 
Péter
