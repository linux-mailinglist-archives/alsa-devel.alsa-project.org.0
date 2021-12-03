Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F74679BB
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 15:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725142332;
	Fri,  3 Dec 2021 15:49:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725142332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638543015;
	bh=P2PmUs5+cdPUO84ZqCNA214os2v82H9IKenclaeSMsQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvtfQ0vmpfNDZal5LJjUN5yRg+4u48dlOZQYk9bCuCsFQxSvVeSekkrU4WQuzbRa1
	 kd9ET9mJVSrpRxP7JwvotpMb7TtX2LBPPaehOUzg/KdepDRhjW5/r9469JwDVov6mI
	 Db0Inm65sh5V+GTCd7x09UoCXxneKVId9W8Hz8Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2B5F80249;
	Fri,  3 Dec 2021 15:48:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18EA9F800A7; Fri,  3 Dec 2021 15:48:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C18EEF800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 15:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18EEF800A7
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236922822"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="236922822"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:48:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="561737142"
Received: from hkagda-mobl2.amr.corp.intel.com (HELO [10.212.71.79])
 ([10.212.71.79])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:48:49 -0800
Subject: Re: [linux-next:master 3956/5128]
 sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier
 'CODEC_PROBE_RETRIES'
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <202112031943.Twg19fWT-lkp@intel.com>
 <a93302d2-d76f-95a2-2a7c-bcf34db7bfd6@linux.intel.com>
 <alpine.DEB.2.22.394.2112031605380.3554566@eliteleevi.tm.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7631ac5e-c1c4-9051-ee7a-985ed02183e5@linux.intel.com>
Date: Fri, 3 Dec 2021 08:48:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2112031605380.3554566@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 Hui Wang <hui.wang@canonical.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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



On 12/3/21 8:07 AM, Kai Vehmanen wrote:
> Hey,
> 
> 
> On Fri, 3 Dec 2021, Pierre-Louis Bossart wrote:
> 
>>>    127		do {
>>>    128			mutex_lock(&hbus->core.cmd_mutex);
>>>    129			snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
>>>    130			snd_hdac_bus_get_response(&hbus->core, address, &resp);
>>>    131			mutex_unlock(&hbus->core.cmd_mutex);
>>>  > 132		} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
>>
>> Indeed, something's not right here.
>>
>> CODEC_PROBE_RETRIES is defined conditionally
>>
>> #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>> #define IDISP_VID_INTEL	0x80860000
>> #define CODEC_PROBE_RETRIES 3
>>
>> but it's used unconditionally.
> 
> yup, the definition needs to be moved out.
> 
>> We could define this constant unconditionally as a quick fix, but this
>> compilation problem might expose a larger problem.
>>
>> Kai, I wonder if this is code from lines 120 to 139 that we didn't
>> update when we moved to support HDMI with the generic HDaudio parts? I
>> don't see why we could even try to send a command on the bus is there's
>> no audio codec support?
>>
>> hda_codec_use_common_hdmi should be the default assumption now, I don't
>> think we support the old solution, do we?
> 
> We do still support the hdac-hdmi as well, albeit only for select old
> hardware to maintain backwards compatibility.

Would it be a major risk to drop this compatibility, possibly in steps
that can be reverted quickly? Maintaining this old HDMI-specific path
isn't really sustainable.

> I'll send the quick fix.

Thanks!
