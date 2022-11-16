Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C662C58F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 17:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6233B1683;
	Wed, 16 Nov 2022 17:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6233B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668617803;
	bh=gVWP195KB/4o1HYHRuQ55q8hg8l803VpcH9uitiDMkQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tlnDktiRokn0q1I0HosMwAXSzgVHqbHyEsYlOkrdqaCAdvgeICKG8MeRZGNlewrKP
	 r2aj2AHDGfIseOpyPWXb8lfoI4NbDpv9B4+JrFFn221Bc+i1AUZcb8acgd4wE/Q/sk
	 QdcAk1uff9VGak64sKSnN/Mhos1vP01enPTCF/0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45D67F804A9;
	Wed, 16 Nov 2022 17:55:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA2AFF80169; Wed, 16 Nov 2022 17:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0BDDF800B8;
 Wed, 16 Nov 2022 17:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0BDDF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MJiic3f4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668617742; x=1700153742;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gVWP195KB/4o1HYHRuQ55q8hg8l803VpcH9uitiDMkQ=;
 b=MJiic3f4isErBZN+tfWp9ILAkqTlvFlT0RVrddj7hzPj7REL0FSxOn3H
 jgsmrp0J/A8FdyDW/Fmb+oP5hVrFFAW7CDYGHaNkkLwvSZ9YSUBJdvt0B
 6KaFn9/r7jfMrZLGdepMXEb/27KQdr2/UX4+CvkjOOwCK9yAWf3UHCuaA
 8pPoYrlxXPLdWb+SvzvqEEngY0/HbV/jIMRZq9vKot3KUwpIVTJJjAJDT
 WDpuKW/lLpWjhLoQa3ZqNl5cbldf7or5i3eiSIar9CjVhlbQnY14AEEvw
 Ck1MiJHZ3DTwPh2cMyKjALyIwEFsUCMhyJaFand4Y7RtQ8VZ1hGJKjei5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="398884832"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="398884832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 08:55:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="814149438"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="814149438"
Received: from msureshb-mobl3.amr.corp.intel.com (HELO [10.212.45.114])
 ([10.212.45.114])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 08:55:33 -0800
Message-ID: <d7b32cb5-7fec-0c2a-d2c7-6934a1eb932b@linux.intel.com>
Date: Wed, 16 Nov 2022 10:55:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Sound-open-firmware] [PATCH 3/4] ASoC: SOF: Adding amd HS
 functionality to the sof core
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
 <20220913144319.1055302-4-Vsujithkumar.Reddy@amd.com>
 <36a45c7a-820a-7675-d740-c0e83ae2c417@collabora.com>
 <a8bc9284-c0c2-79aa-fee6-40101fc34f96@linux.intel.com>
 <02c2643f-bd32-c3db-51a1-d7773b60c655@collabora.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <02c2643f-bd32-c3db-51a1-d7773b60c655@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Vijendar.Mukunda@amd.com, ssabakar@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, venkataprasad.potturu@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Basavaraj.Hiregoudar@amd.com,
 YC Hung <yc.hung@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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



On 11/16/22 10:33, AngeloGioacchino Del Regno wrote:
> Il 16/11/22 16:04, Pierre-Louis Bossart ha scritto:
>>
>>>> diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
>>>> index 21d98f31a9ca..83fd81c82e4c 100644
>>>> --- a/include/sound/sof/dai.h
>>>> +++ b/include/sound/sof/dai.h
>>>> @@ -84,6 +84,7 @@ enum sof_ipc_dai_type {
>>>>        SOF_DAI_AMD_BT,            /**< AMD ACP BT*/
>>>>        SOF_DAI_AMD_SP,            /**< AMD ACP SP */
>>>>        SOF_DAI_AMD_DMIC,        /**< AMD ACP DMIC */
>>>> +    SOF_DAI_AMD_HS,            /**< Amd HS */
>>>>        SOF_DAI_MEDIATEK_AFE,        /**< Mediatek AFE */
>>>
>>> Adding SOF_DAI_AMD_HS before SOF_DAI_MEDIATEK_AFE desynced this
>>> enumeration
>>> so the DAI type is now 11 and not 10 anymore, leading to a failure in
>>> firmware
>>> at IPC3 helper function `dai_get()`, as when `dai_find_type()` is
>>> called, the
>>> DAI type that the firmware expects doesn't match with the one that gets
>>> sent
>>> in the request message from the kernel.
>>>
>>> As a local test, I tried moving SOF_DAI_AMD_HS after
>>> SOF_DAI_MEDIATEK_AFE and
>>> this has restored full functionality on my MT8195 platform (Tomato
>>> Chromebook).
>>>
>>> If SOF is supposed to guarantee backwards compatibility (and I believe
>>> it is),
>>> this commit breaks that.
>>>
>>> I would be tempted to send a commit that moves SOF_DAI_AMD_HS to the
>>> end, but
>>> that would break the already compiled firmware for AMD platforms, so I
>>> am not
>>> sure how to proceed.
>>
>> D'oh. Yes this breaks backwards-compatibility and this is a clear
>> mistake. I think your suggestion to add the AMD_HS at the end is the
>> only practical solution indeed - this would need to be done for both
>> kernel and SOF version of dai.h.
>>
> 
> Okay, I will send a commit tomorrow :-)

I sent those two GitHub pull requests already:

https://github.com/thesofproject/linux/pull/4017
https://github.com/thesofproject/sof/pull/6616

