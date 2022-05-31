Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E535393BC
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 17:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9FE2041;
	Tue, 31 May 2022 17:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9FE2041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654010156;
	bh=u7MvblOB1J7Mz7D4rfIE4cUZZWuCZviGhb01s3Fe2S4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7l7af6LH13m2sqY6QzL2ltzluzhpGsFDhykZC++8FEIUNjmkoO2OrGU1uKq4i+ti
	 H8D+x5VqsSWJLclK/2iGDo5womba7xUTocZo9C+8e31sUL9iOihgaYey6CbAu8Xm6H
	 VRVlkddLT1oO/JacU0w6SdzSi51z92tDR+SAP6pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0496AF80516;
	Tue, 31 May 2022 17:14:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E789F8051B; Tue, 31 May 2022 17:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8040F8051B
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 17:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8040F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jXvobjyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654010093; x=1685546093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u7MvblOB1J7Mz7D4rfIE4cUZZWuCZviGhb01s3Fe2S4=;
 b=jXvobjyY8Asbg2wg3MKf4Sqj7B1A6ODd6NRvQklVHwESZCYE/qqW35H6
 aQOS7ibZkHHfBuh/izspKmI32dqCLfqDm0ujcng222LDN5Rb4aSdgSr+v
 ZAYRGEt/4j+pMWb+1L5sK6yCDaYahrIOOmn1VhhsqgPVbF7tPkHhmXraM
 uQgimyfG7aHZhkRrENu6Fr1mXPOPgg6rMHMcMifHg5lRKFpcioRY2RYtw
 p7DHHWt41XnhKlmv8c/KnQPBIb+Z2VOtqyTJVLHNcRi2zEtjOEaaGo+iJ
 vSUZU88LkyzYHB8kdP5vpC2FOMF47V0VYRojP8IPjsZZrH7mr9Ioi/Xqx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275369485"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="275369485"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 08:11:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="720349461"
Received: from kmoorti-mobl.amr.corp.intel.com (HELO [10.212.153.18])
 ([10.212.153.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 08:11:09 -0700
Message-ID: <5f4750b7-19d9-78d2-68eb-c4a00f876291@linux.intel.com>
Date: Tue, 31 May 2022 09:37:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <ee8b6903-c436-0e4b-328c-feb08b58a234@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ee8b6903-c436-0e4b-328c-feb08b58a234@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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



On 5/27/22 03:38, Cezary Rojewski wrote:
> On 2022-05-26 4:45 PM, Pierre-Louis Bossart wrote:
>> On 5/26/22 09:17, Cezary Rojewski wrote:
> 
>>> Hmm.. I don't see why SDW is a problem here. Could you elaborate? I
>>> could boost avs-driver to support SDW configurations if we need a POC.
>>> Why would machine devices not be created by the platform (e.g. PCI)
>>> driver?
>>
>> Because there will be at some point an ACPI device for the machine
>> driver. I can't give more details on a public mailing list just yet, but
>> the approach based on the PCI driver creating a platform device is NOT
>> future-proof.
> 
> I still believe that upcoming descriptor changes only simplifies things
> - less machine descriptor tables, more reliance on actual ACPI
> description. Remember that granular card approach does not ban the usage
> of compound cards. You can still mix both together. If we encounter some
> descriptor that says given N devices are logically inseparable, then we
> create a single machine board for them. The fact that sound card has a
> device assigned to it does not change - something will create a device
> and sound card driver will attach onto it. From that point onward,
> assigned DAI LINK components can still take control of cards behavior
> just like we do it today.

Having multiple cards created is not the issue, it's that there's no
generic way for the platform driver to know how to expose the DAIs in
separate components.

Shamelessly borrowing Morimoto-san's ascii art, it would be ideal if
both of the models below could be supported. Currently the first one is
not supported due to the component:card 1:1 relationship, and when the
card is created it's too late to change how the components are exposed.



        +-- DeviceA --+       +- DeviceB --+
	|+-----------+|       |+----------+|
	||ComponentA ||       ||ComponentB||
	||        [DAI] <-> [DAI]         ||  Card-1
	||           ||       |+----------+|
	||           ||       +------------+
	||           ||
	||           ||       +- DeviceC --+
	||           ||       |+----------+|
	||           ||       ||ComponentC||
	||         [DAI] <-> [DAI]        ||  Card-2
	|+-----------+|       |+----------+|
	+-------------+       +------------+

	+-- DeviceA --+       +-- DeviceB -+
	|+-----------+|       |+----------+|
	||ComponentA1||       ||ComponentB||
	||         [DAI] <-> [DAI]        ||  Card-1
	|+-----------+|       |+----------+|
	|             |       +------------+
	|             |
	|             |       +-- DeviceC -+
	|+-----------+|       |+----------+|
	||ComponentA2||       ||ComponentC||
	||         [DAI] <-> [DAI]        ||  Card-2
	|+-----------+|       |+----------+|
	+-------------+       +------------+
