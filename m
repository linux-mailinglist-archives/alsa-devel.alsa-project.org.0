Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289E184589
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 12:05:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210A517DA;
	Fri, 13 Mar 2020 12:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210A517DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584097525;
	bh=+PT/Q/T8JKu1QcF7iIayF4O0sOvyGt/CZXoyQiR2wSA=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cv4g44jVCA4IpfQGLw33P3EZ23E7pK8x93hXvU2EWp/hKx58/OzPaQ4EcGZB5KUYt
	 Z1w5abIIuZyPvt4k13eFZvG1JWjULvfy/bOALQTlUvmKIeneWqX+AyDOVQ2/1/Rdzv
	 WqC9S5E/tPq8R4TpiCuCM6wQlfS7RVgZ3r7I606A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0A9F801A3;
	Fri, 13 Mar 2020 12:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 186CAF801F8; Fri, 13 Mar 2020 12:02:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF48F80090
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 11:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF48F80090
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 03:59:52 -0700
X-IronPort-AV: E=Sophos;i="5.70,548,1574150400"; d="scan'208";a="232385981"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.251.242.215])
 ([10.251.242.215])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 13 Mar 2020 03:59:50 -0700
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
Message-ID: <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
Date: Fri, 13 Mar 2020 11:59:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
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


>> Basic UCM configuration for HDA DSP generic enabling codec playback and
>> capture on both HDA codec and DMIC ports.
>
> Could you describe for what Linux driver (source code) is this 
> configuration?


This file is for Intel Skylake SST driver. Information added in v2.


>> +ValueDefaults {
>> +    PlaybackChannels "2"
>> +    PlaybackPriority "1"
>> +    CaptureChannels "2"
>> +    CapturePriority "2"
>> +}
>
> Remove PlaybackChannel and Priority defaults. The priorities should be 
> defined in the device section.


Thanks, moved to device section in v2.


>> +
>> +SectionDefaults [
>> +    cdev "hw:hdadsp"
>
> It should be "hw:${CardId}" for ucm2.


Thanks, applied in v2.


>> +    cset "name='codec0_out mo media0_in mi Switch' 1"
>> +    cset "name='media0_out mo codec0_in mi Switch' 1"
>> +    cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
>> +]
>
> This file does not define any devices. Does pulseaudio work with this 
> configuration?


Devices added in v2. Regarding pulseaudio - are there any guidelines on 
how to test UCM files with it? These UCM files were writted mainly based 
on existing ones for other cards. Of course basic tests were made.


Thanks,
Mateusz

