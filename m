Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79B424411
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BEBD844;
	Wed,  6 Oct 2021 19:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BEBD844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633541173;
	bh=FQX+U0uEJAQaKNmrXugpCjDrTeLOs9u5EEeqq4Uep4U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LsfdpJcrmK/Hojr9Xp4BMojnLnq+BpLWCxP5jPQU+9JHD5BWZ3J++5RJXLns7LA/p
	 7ppmWcunGcSP1W0cUHi8Hyw2jBToTM19Ds4qsl33v/BWLhzLvFwAaoQQsIOgyatrtt
	 wafSZzy9pPLhH0FL+/nAwoTnKdMpUTopDBgD7Vek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBE9AF80229;
	Wed,  6 Oct 2021 19:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE64BF80240; Wed,  6 Oct 2021 19:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7633BF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7633BF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206174623"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="206174623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 10:24:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439198434"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 10:24:37 -0700
Subject: Re: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
To: Hans de Goede <hdegoede@redhat.com>, Brent Lu <brent.lu@intel.com>,
 alsa-devel@alsa-project.org, Bard liao <yung-chuan.liao@linux.intel.com>
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
 <fdcdf447-352f-3dbc-f55d-b3bb3588dca3@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ecde4150-2782-9529-3288-b1eb9e247883@linux.intel.com>
Date: Wed, 6 Oct 2021 12:24:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fdcdf447-352f-3dbc-f55d-b3bb3588dca3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>,
 Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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


>> @@ -196,6 +201,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
>>  	},
>>  	{
>>  		.id = "10EC5682",
>> +		.id_alt = &rt5682s_hp,
>>  		.drv_name = "sof_rt5682",
>>  		.sof_fw_filename = "sof-byt.ri",
>>  		.sof_tplg_filename = "sof-byt-rt5682.tplg",
> 
> So this is only useful if there actually are any BYT devices using the "RTL5682"
> ACPI HID, the 100+ BYT/CHT DSDTs which I've gather over time say there aren't any.
> 
> Actually there also aren't any using the non alt "10EC5682" ACPI HID either...
> 
> Bard Liao, you added this in commit f70abd75b7c6 ("ASoC: Intel: add sof-rt5682 machine driver")
> but I wonder how useful this is. I guess it may be available as (and tested on?) some dev-kit.
> 
> But I don't think there us any hardware out there in the wild using this ?

In the past we used this configuration for SOF CI tests with the
MinnowBoard + an RT5682 eval board. We gradually fried most boards and
no longer check this capability for each SOF PR.

So I would agree we can avoid changing anything for BYT/CHT and possibly
APL, it'd be an untested configuration.

in other words, let's add this compatible/alt_id for platforms where we
know it'll be used.
