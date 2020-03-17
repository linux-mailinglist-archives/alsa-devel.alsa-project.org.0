Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910A18828A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 12:50:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5DFD183A;
	Tue, 17 Mar 2020 12:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5DFD183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584445806;
	bh=9wgPCt/KTGu5VvnVXgNErIdNQetOFPD5A2oo/Ge99yw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jgXMJ1M09iWStSpC7Ax5EQZdOyG1kw8AFyLotJQJdmEKODAYKPSXtJrSv6R0lySGk
	 97jryd2e2SUB8dVxvBHnD8msVAzsCocbDOYHiZOIojoDDs1ekNjZFfBcijtCvcFZnj
	 K2xBQQHn6Ju3kc2gZ7oAcfW2BsMlRZgumaVpBYxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3660EF80269;
	Tue, 17 Mar 2020 12:47:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20671F8022B; Tue, 17 Mar 2020 12:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97AE8F800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 12:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97AE8F800CD
IronPort-SDR: iG4C5kH2FuD5EWqtTBZ5f1gOdget6cgm23CQTL3GlPn+mZ6CFAD3VIbhxyJnHmxbTftB1+HgNu
 +slk1I65nZnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 04:46:05 -0700
IronPort-SDR: 85DD+Lo+DeY13g4opoIKZWuO/Db+kcrLR/J3xeyBSozpNwkVvxwGr8X38Eh8+QI38gCaC8K6dS
 3PP/Zlpx+7iw==
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="417517021"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.251.3.203])
 ([10.251.3.203])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 04:46:04 -0700
Subject: Re: [PATCH v2] ucm2: hdadsp: add basic ucm config
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20200313110018.5145-1-mateusz.gorski@linux.intel.com>
 <ac6a75e3-8621-fd43-8260-2c8674166c6c@perex.cz>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <01939d67-a263-e317-ac77-f4e8cc65f8de@linux.intel.com>
Date: Tue, 17 Mar 2020 12:46:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ac6a75e3-8621-fd43-8260-2c8674166c6c@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


>> Basic UCM configuration for Intel Skylake SST HDA DSP generic machine
>> driver enabling codec playback and capture on both HDA codec and DMIC
>> ports.
>>
>> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
>> ---
>
> ...
>
>> +SectionDevice."Headphones" {
>> +    Comment "Headphones"
>> +
>> +    ConflictingDevice [
>> +        "Speaker"
>> +    ]
>> +
>> +    EnableSequence [
>> +        cset "name='Headphone Playback Switch' 1,1"
>> +        cset "name='Speaker Playback Switch' 0,0"
>> +    ]
>> +
>> +    Value [
>> +        PlaybackPriority 200
>> +        PlaybackPCM "hw:${CardId},7"
>> +        JackControl "Front Headphone Jack"
>> +        JackHWMute "Speaker"
>> +    ]
>> +}
>
> If there is a volume control, it should be defined via 
> PlaybackMixerElem (like PlaybackMixerElem "Headphone").


Thanks, added in v3.


>
>> +ValueDefaults {
>> +        PlaybackChannels "2"
>> +        CaptureChannels "2"
>> +}
>
> This ValueDefaults {} section with this contents should be removed. 
> The stereo is the default settings.
>
>                         Jaroslav
>

Thanks, removed in v3.


