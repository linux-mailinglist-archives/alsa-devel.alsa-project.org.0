Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 774FF14C07E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 20:01:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2EE2166D;
	Tue, 28 Jan 2020 20:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2EE2166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580238110;
	bh=GN8gQd6Tmtfbc47Ox29bIvpYEqraZ2zHAuGw3V7keBc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IXMJ0hkDvglThE9e2tmMV8i0lHc4f7gjpyy4aSR3K77fFXSk1zrWDQSZozGQtdt1Z
	 EN9N3yo8LONoToTxVNi+S4pSagZEfAbUhIBpTfDZSJZW9sp34uEaEA422UcDhBJ+IX
	 vk70W84vRmYOou0RIMSC0gXT7oHs31LU5mGYi9B8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15057F801EB;
	Tue, 28 Jan 2020 20:00:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A017EF80150; Tue, 28 Jan 2020 20:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B82DF80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 19:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B82DF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="261537929"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.82.5])
 ([10.251.82.5])
 by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2020 10:59:45 -0800
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-11-cezary.rojewski@intel.com>
 <CAFQqKeWb4X1C0fn0HckOS-fsm6OTv2onUM0yYw4ETw0qFKsWbw@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <40e08ff7-921d-3554-d723-149a350a1084@intel.com>
Date: Tue, 28 Jan 2020 19:59:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAFQqKeWb4X1C0fn0HckOS-fsm6OTv2onUM0yYw4ETw0qFKsWbw@mail.gmail.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH v3 10/11] ASoC: SOF: Provide probe debugfs
 support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 2020-01-28 18:54, Sridharan, Ranjani wrote:
> On Tue, Jan 28, 2020 at 2:51 AM Cezary Rojewski <cezary.rojewski@intel.com>
> wrote:
> 
>> Define debugfs subdirectory delegated for IPC communication with DSP.
>> Input format: uint,uint,(...) which are later translated into DWORDS
>> sequence and further into instances of struct of interest given the IPC
>> type.
>>
>> For Extractor probes, following have been enabled:
>> - PROBE_POINT_ADD (echo <..> probe_points)
>> - PROBE_POINT_REMOVE (echo <..> probe_points_remove)
>> - PROBE_POINT_INFO (cat probe_points)
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>
>> Changes in v2:
>> - renamed debugfs probe functions as requested by Pierre
>>
>>

>> +
>> +static int snd_sof_debugfs_probe_item(struct snd_sof_dev *sdev,
>> +                                const char *name, mode_t mode,
>> +                                const struct file_operations *fops)
> 
> Hi Cezary,
> 
> Any particular reason to not use the existing snd_sof_debugfs_buf_item()
> and adding a new one that does pretty much the same thing?
> 
> Thanks,
> Ranjani

Thanks for the review Ranjani!

_buf_item() makes use of sof_dfs_fops - while probe items take different 
handlers - and adds a special case for _IPC_FLOOT_TEST which I have no 
knowledge of. In consequence, providing _probe_item() seems like a right 
choice to me.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
