Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773361F71A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 16:05:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95E1843;
	Mon,  7 Nov 2022 16:04:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95E1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667833542;
	bh=cm8ffb5GHq5ear3HHr7w7HEJfMOXAl8tcZ1AMebuD6s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHeOM3ZWq8KpRM54X5uzsRVBBFRPJeaCTpOirgpM3RU4HfON2SOvEi1nfAY3XVTuo
	 WYoNBLoS4Ic2wox0qAe7PdjGI+Vk/eY5WyCynBIbxzq87kiiWT+lJVQ6bCZ94yLNWu
	 FO2Acd53tdQ3t4cFwW8tdLqRQWbQPObUvf38U9+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77AD8F804D0;
	Mon,  7 Nov 2022 16:04:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33B9F800AE; Mon,  7 Nov 2022 16:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DD4DF800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 16:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DD4DF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VIUUSDyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667833487; x=1699369487;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cm8ffb5GHq5ear3HHr7w7HEJfMOXAl8tcZ1AMebuD6s=;
 b=VIUUSDyDvVPEBJOJv0n1YzRd8VFHxlxvK5YOIUKtAY7Wls3dHFQJGt6D
 MqxvvZ+SnhsS/ElJhy5jQkElNDplmK+ZFkpkiY0hWUi1C9DwSRB/rTmzm
 OFhJgSq+NhkJqKYyMRuLJKzh1GZKoLvuV+gajA+D46p+CL7VKnm/CTunk
 3V3157R2QrbvFGuMEYPJ7dDBEAmhzts1Cr1C08oR168J4D7UW98ym/849
 9VkOAxMQEF0kcf72QOcREYwZ2YMuSI7a9S8+0znnIdhweL1S2tSfFcAtO
 KZRxnI9O7ifrh81MKB0Chv9G7PqLTl6MgAE0hiU4ujSV/f4QUFOBU6iy4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290819541"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="290819541"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 07:04:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="635940451"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="635940451"
Received: from seanabue-mobl.amr.corp.intel.com (HELO [10.212.82.80])
 ([10.212.82.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 07:04:31 -0800
Message-ID: <2ac3f9c9-5fa0-1b2f-de57-0774eb0acc5e@linux.intel.com>
Date: Mon, 7 Nov 2022 09:04:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Content-Language: en-US
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
 <Y2EttkwUvMReQcqg@sirena.org.uk>
 <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
 <Y2JVWmJsprt0xnKH@sirena.org.uk>
 <7b97682d-5cf1-8be1-9c62-41c9fbd89018@amd.com>
 <dff6e7af-6a07-587e-79d0-706fe7ec6504@linux.intel.com>
 <02a0dfa6-fb6a-25cf-4111-fb609b9b6b68@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <02a0dfa6-fb6a-25cf-4111-fb609b9b6b68@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 11/7/22 09:02, Venkata Prasad Potturu wrote:
> 
> On 11/7/22 19:44, Pierre-Louis Bossart wrote:
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On 11/7/22 04:34, Venkata Prasad Potturu wrote:
>>> On 11/2/22 17:02, Mark Brown wrote:
>>>>> On 11/1/22 20:01, Mark Brown wrote:
>>>>>> On Tue, Nov 01, 2022 at 03:15:08PM +0530, Venkata Prasad Potturu
>>>>>> wrote:
>>>>>> Right, that's what the code does but why is this something that
>>>>>> should
>>>>>> be controlled in this fashion?
>>>>> This machine driver is common for TDM mode and I2S mode, user can
>>>>> select TDM
>>>>> mode or I2S mode.
>>>> Why would the user choose one value or the other, and why would this
>>>> choice be something that only changes at module load time?  If this is
>>>> user controllable I'd really expect it to be runtime controllable.
>>>> You're not explaining why this is a module parameter.
>>> Different vendors/OEM's use the same hardware as one need I2S mode and
>>> other need TDM mode, using common driver  to support  I2S and TDM mode
>>> with this parameter.
>>>
>>>
>>> static int tdm_mode = 0;
>>> module_param_named(tdm_mode, tdm_mode, int, 0444);
>>>
>>> And this can be runtime controllable by setting permissions as 0644, we
>>> will change and send next version patch.
>> kernel parameters are difficult to manage for distributions using a
>> single-build. Either all platforms use the kernel parameter or none of
>> them do. That would not allow a per-platform choice of parameters.
>> Using DMI quirks or ACPI identifiers would be a lot less problematic, no?
> 
> All platforms use the kernel parameter to select the I2S/TDM mode.
> Runtime parameters are not required here, by default it is in I2S mode and
> when the platform needs to enable TDM mode then pass tdm_mode module
> parameter as 1.

How would a distribution decide to set this kernel parameter, what
criteria would be used to determine that the TDM mode is required?
You've got to think of who uses that parameter.
This may work for a Chrome solution given that there are per-product
overlays but won't work in the general case IMHO.

