Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B634352BA3
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 17:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9873216AD;
	Fri,  2 Apr 2021 16:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9873216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617375602;
	bh=Am0q1P8UNYbHjWYj9gFUrWeEiyq4mBrA98hmFT5A6Gs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CFPV8XQyWGdmbwp7OYbFbKJ9JuwbQDJexyDzjDAOlS2qUTFu1x4E5ZNlflbtOSPlq
	 tRfgQu3qR9GhGnEHTEgTrEyDlGf+63xwnkmM7nUjV2AlLP501J4+8LS9Av3z661lLb
	 GtcTOHqMqKE8tiAzEXDWeAG/9e73Q0t5HWXevZXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14232F80229;
	Fri,  2 Apr 2021 16:58:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8883BF801DB; Fri,  2 Apr 2021 16:58:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59894F800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 16:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59894F800F5
IronPort-SDR: NbjM0xKMtRKzZwdCZVehM+j2X1S/GBMMuxLtdQgSinJ/XpNtStgJ5gjI30NZIaqvNkSG9uhYHR
 tsS4E9/UzoOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="192584122"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; d="scan'208";a="192584122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 07:58:16 -0700
IronPort-SDR: gLEOV2nBC7+99WhhCeCR3IZ438Wo3H5CTGcLjgbdv7JamRG7yjqyC/NS/kd8MjE1RgFuCzQgZl
 cfVesLBf0kog==
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; d="scan'208";a="611325089"
Received: from nvizzusi-mobl.amr.corp.intel.com (HELO [10.213.177.76])
 ([10.213.177.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 07:58:15 -0700
Subject: Re: [PATCH 0/6] ASoC: rt5670/Intel: Add support for Bay Trail CR /
 Dell Venue 10 Pro 5055 tablet
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210402140747.174716-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <37abb47e-1408-9704-36da-899893f04133@linux.intel.com>
Date: Fri, 2 Apr 2021 09:47:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210402140747.174716-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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



On 4/2/21 9:07 AM, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series to enable sound on the Dell Venue 10 Pro 5055 tablet
> this series also includes 2 generic improvements to rt5672 support:
> 
> 1. Add support for boards using Bay Trail CR (SSP0) in combination with a rt5672 codec
> 2. Set the card's components string based on the DMI info, so that we don't need to
> duplicate the DMI quirks in userspace (in the UCM profile)
> 
> I've a patch to add support for the components string to the UCM profile for
> these boards available here:
> https://github.com/jwrdegoede/alsa-ucm-conf/commit/fedacc2bdc530b6febac665db27aab60e03ec840
> 
> I will submit this upstream once the kernel side has landed.

LGTM, thanks Hans

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

