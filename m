Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B375234FD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 16:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62E3C1A74;
	Wed, 11 May 2022 16:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62E3C1A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652277884;
	bh=T8ct8MaxuAq9oRdiITvm+NoWseyVHyvo8hOAG6x7BvU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+ueGYwhGU0IO7cZfzKhwLfHbQVaS6iXB139sLD+HIQIiLlFPl/16FNUc4OB8Jhhw
	 gvCrBqkCTD6qjHU+xLLxc5f0+WkfXeW8/xi4F8NojwOEVSfymu09nstV03wfH4eeea
	 EPq6XLD3C7XLnVe/2rWC7eq3REI+3bxr2ViENesg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B5B3F8015B;
	Wed, 11 May 2022 16:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C307F804B2; Wed, 11 May 2022 16:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODYSUB_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 468C6F80137
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 16:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 468C6F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ODkAOJgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652277820; x=1683813820;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T8ct8MaxuAq9oRdiITvm+NoWseyVHyvo8hOAG6x7BvU=;
 b=ODkAOJgrYFgQjf/XDYbNya0HbfDRqvRdgacnMw5NlCmo2dqsRT4MoJn8
 pKvzLRAMb8U86E3PJ2+hywHFsrxF7geCZ8iab1Z644R7ysNGzLNs5cbKb
 OZaI/aNqIyGbc56PZY9Manu7l7CU/x34gYpLnhObQidqmEe9Fo6n6NA3n
 riWk5f6FAzWdBkkdHX+xcKQTbTtrQGf85tanMyEsOzLOq5vO8++TBThZc
 JXsFfoG2u8Ow/HpGkpQvxRgsFEtVSPZm7a4GQpCPX6SqT+P8F3O7ilxHc
 xf3nBWF1IHFtVTB8/T4qs1B3xXzSM1vGs+kMUt306Q7VgL+IhO4Lw0CL8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="268542761"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="268542761"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 07:03:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="658171262"
Received: from naydenov-mobl.amr.corp.intel.com (HELO [10.209.48.198])
 ([10.209.48.198])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 07:02:59 -0700
Message-ID: <a71c4a2c-06f9-faa7-07ee-783ee7f136ec@linux.intel.com>
Date: Wed, 11 May 2022 09:02:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] [v2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Content-Language: en-US
To: Terry Chen <terry_chen@wistron.corp-partner.google.com>
References: <20220510104829.1466968-1-terry_chen@wistron.corp-partner.google.com>
 <190c9add-7fa4-8e76-bfcb-43d30f22f8d9@linux.intel.com>
 <CAMmR3bFad5ODKYUCg8Tp8GVk__AdaQHcpLnRmFyAGXu8Wpycog@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAMmR3bFad5ODKYUCg8Tp8GVk__AdaQHcpLnRmFyAGXu8Wpycog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, casey.g.bowman@intel.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 liam.r.girdwood@linux.intel.com, Mac Chiang <mac.chiang@intel.com>,
 broonie@kernel.org, Sean Paul <seanpaul@chromium.org>,
 cujomalainey@chromium.org, brent.lu@intel.com, vamshi.krishna.gopal@intel.com
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



On 5/11/22 01:33, Terry Chen wrote:
> Hi Pierre-Louis
> 
>> @@ -522,6 +578,14 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>>                               goto devm_err;
>>                       }
>>                       break;
>> +             case LINK_BT:
>> +                     ret = create_bt_offload_dai_links(dev, links, cpus, &id, ssp_bt);
>> +                     if (ret < 0) {
>> +                             dev_err(dev, "fail to create bt offload dai links, ret %d\n",
>> +                                     ret);
> 
> For this point, we just follow Intel member to write for this coding
> style. The other component also was the same style.

the magic of copy-paste, eh? Please update this, thanks.

>     > @@ -384,6 +384,14 @@ struct snd_soc_acpi_mach
>     snd_soc_acpi_intel_adl_machines[] = {
>     >               .sof_fw_filename = "sof-adl.ri",
>     >               .sof_tplg_filename = "sof-adl-cs35l41.tplg",
>     >       },
>     > +     {
>     > +             .id = "10134242",
>     > +             .drv_name = "adl_mx98360a_cs4242",
>     > +             .machine_quirk = snd_soc_acpi_codec_list,
>     > +             .quirk_data = &adl_max98360a_amp,
>     > +             .sof_fw_filename = "sof-adl.ri",
> 
>     This  also was the same style with others.

No, it's not a matter of style but rather that this field was *REMOVED*,
this cannot possibly compile.

see commit a6264056b39ee ("ASoC: soc-acpi: remove sof_fw_filename
")

If you had submitted this patch through the SOF tree, you would have
seen a compilation error.

> 
>     > +             .sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
> 
>     Why would you refer to a topology that uses a different codec?
> 
> 
>  Because Intel college use the same naming style for the same audio codec.

It's bad practice to use the same topology name for different platforms
based on different codecs. One evolution of the topology would impact an
unrelated platform. Please use a symlink or duplicate the topology with
a different name, this is not future-proof and will be problematic for
releases.
