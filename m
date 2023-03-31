Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 390776D15F2
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 05:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5A81FE;
	Fri, 31 Mar 2023 05:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5A81FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680232932;
	bh=ZADYbqfNW8xuM7gMaCx6gIrssaqHTZAewavO5POSwPk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qwlwiFqcvscH0UZ0Xt6FlgLVcTOqsc3Vs0yIM0QLSSg9Eu2aI63akMhVFoDtRhm5H
	 zAY5AJ8lUCzB31sofuEf5IYug6Sz3VaohcKJygCoAiYk+0/ZCQl2/JWmAA1AYnODxv
	 rNPaedfrx69DdqcTJ0Ih+IAcmnBDaZt6H2DtyGl0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE23F80290;
	Fri, 31 Mar 2023 05:20:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB3FF80272; Fri, 31 Mar 2023 05:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7247CF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 05:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7247CF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cPscqPK7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680232819; x=1711768819;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ZADYbqfNW8xuM7gMaCx6gIrssaqHTZAewavO5POSwPk=;
  b=cPscqPK7d76kDgTDs+NJonKDQcAKbL8PkSPs0tsEljgDx6PCIos9xmLv
   CaJQvcOTD18kKRyAPbHihEOkQVfGBkoIPkZGhheFwWSiZwTJ6hQkmyzoO
   uY6vHbx0SwSkESVuFRBmVWI3Uq4tw3LCS89OToPifL+xy9cD6AX82boY3
   HxSvQjEusvislvRMPz82ZsC1iFaSnjRiPGF3U4uieMrsAKF0Mav60t8LS
   jWZikgAZpp5a8Y3qVan4Q6bJWaj8yU1LXq749xvJnErinz13ngPLXdDJF
   kaOWNmu+xRdOuMeAhUwPQPkWWRoqv+hbhRrgH0cHTTju9JahyHIGa+57F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342992680"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400";
   d="scan'208";a="342992680"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="684938166"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400";
   d="scan'208";a="684938166"
Received: from chuaweiz-mobl.amr.corp.intel.com (HELO [10.209.109.216])
 ([10.209.109.216])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:20:07 -0700
Message-ID: <3af2945e-9a0e-c23a-ff06-d070692f5202@linux.intel.com>
Date: Thu, 30 Mar 2023 22:12:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH V4 1/2] ASoC: max98363: add soundwire amplifier driver
Content-Language: en-US
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
References: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6IC3RG2NVKJAP2IIZKWCBNK6HX7JPF36
X-Message-ID-Hash: 6IC3RG2NVKJAP2IIZKWCBNK6HX7JPF36
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IC3RG2NVKJAP2IIZKWCBNK6HX7JPF36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/30/23 18:43, “Ryan wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> Added Analog Devices MAX98363 SoundWire Amplifier Driver.
> The MAX98363 is a SoundWire peripheral device that supports
> MIPI SoundWire v1.2-compatible digital interface for audio and
> control data.
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
