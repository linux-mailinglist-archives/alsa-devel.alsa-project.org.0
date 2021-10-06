Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424F42463B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 20:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD6A844;
	Wed,  6 Oct 2021 20:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD6A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633545885;
	bh=jt1eRYGo/4gFu7bZzryd5xsiWjB3LjYkkzH526juWDk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRGEr7ABxDiShK7P4uq30wYxyA6b3VcKwLBEyk/LB2/8ly+zR/Oaj+fyppu68I4T3
	 sZ7sKiVr2mHNdqj+IQ4nkF1HyXEovxCH5q0w6xTZYaBUNFO71ljZuv5HvKDt9oON4Q
	 Id6ehTC/jSXnCqUXKTfCSMMrQ8mi+K7qK/jDUNwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89A57F8010B;
	Wed,  6 Oct 2021 20:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1D2F80240; Wed,  6 Oct 2021 20:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B67F6F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 20:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B67F6F8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312284088"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="312284088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 11:43:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439225258"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 11:43:10 -0700
Subject: Re: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
To: Curtis Malainey <cujomalainey@google.com>, Brent Lu <brent.lu@intel.com>
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
 <CAOReqxjGX6fwqNjX0i31JiQJ+vRCMNTTFBhn7L=iPzYvVMk9mQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0482534d-46c4-5cee-25bd-8739e80a00f0@linux.intel.com>
Date: Wed, 6 Oct 2021 13:43:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxjGX6fwqNjX0i31JiQJ+vRCMNTTFBhn7L=iPzYvVMk9mQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Rander Wang <rander.wang@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 Gongjun Song <gongjun.song@intel.com>, Bard Liao <bard.liao@intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>
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



On 10/6/21 1:34 PM, Curtis Malainey wrote:
>>  };
>>
>> +static struct snd_soc_acpi_codecs adl_rt5682s_hp = {
>> +       .num_codecs = 1,
>> +       .codecs = {"RTL5682"}
>> +};
>> +
>>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>>         {
>>                 .id = "10EC5682",
>> +               .id_alt = &adl_rt5682s_hp,
>>                 .drv_name = "adl_mx98373_rt5682",
>>                 .machine_quirk = snd_soc_acpi_codec_list,
>>                 .quirk_data = &adl_max98373_amp,
>> @@ -296,6 +302,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>>         },
>>         {
>>                 .id = "10EC5682",
>> +               .id_alt = &adl_rt5682s_hp,
>>                 .drv_name = "adl_mx98357_rt5682",
>>                 .machine_quirk = snd_soc_acpi_codec_list,
>>                 .quirk_data = &adl_max98357a_amp,
>> @@ -304,6 +311,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>>         },
>>         {
>>                 .id = "10EC5682",
>> +               .id_alt = &adl_rt5682s_hp,
>>                 .drv_name = "adl_mx98360_rt5682",
>>                 .machine_quirk = snd_soc_acpi_codec_list,
>>                 .quirk_data = &adl_max98360a_amp,
> 
> Is there any way we can collapse this and the primary id into a single
> list to avoid having 2 locations to track for the IDs?

I was thinking about that too, but in that case we would want to have a
list of strings, rather than the address of a structure which adds one
layer of indirection.

Something like

.id = { "10EC5682", "RTL5682" }

and the .num_codecs removed and some termination added.

