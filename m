Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE12D7999
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 16:44:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775D8176A;
	Fri, 11 Dec 2020 16:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775D8176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607701442;
	bh=2dYwGCjETUQTTmKyWcFB+ki1hU2IR5mtULF40l1dGqs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5545I2IBTobAQ91XDkz4fNxB2bj9BdAoDY1heyx+gyWZ9sc2QTGjcGwsROM4BWrZ
	 zHak4cOxY2z79bovBFGy84n9R2nePlW03tMrFciqQgreVESiiiOxfHTvdafVhNjnc1
	 VG19pW132Sn0AorRfYoTsQmHE/QqUKs66irdKuhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 506F4F80217;
	Fri, 11 Dec 2020 16:42:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A37F8020D; Fri, 11 Dec 2020 16:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D2C8F80105
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 16:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D2C8F80105
IronPort-SDR: 9fyfHsOgAuGe71H1u4Cmk2wWXJ8NXWRP1g8ElqpOhg84uzqGrObkWxB14s8LLrFCERPBVbo+88
 h6ZmG2dGBRJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="174595888"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174595888"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 07:42:10 -0800
IronPort-SDR: 8GcczHJRgPBSbn8VAs1UX0mK6shOPulvVbZXGtRkUx2zpw+u2LOGZr/EjJIldtVope8EorfnUR
 SifaBcA/1b3Q==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="349521183"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.144.44])
 ([10.249.144.44])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 07:42:07 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Check the kcontrol against NULL
To: Lukasz Majczak <lma@semihalf.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
References: <20201210121438.7718-1-lma@semihalf.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <669da93a-2ef2-fa08-6c7f-be2e6b5ac363@linux.intel.com>
Date: Fri, 11 Dec 2020 16:42:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210121438.7718-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Guenter Roeck <groeck@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@google.com>
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

On 12/10/2020 1:14 PM, Lukasz Majczak wrote:
> +		kcontrol = dobj->control.kcontrol;
> +		if(!kcontrol)
> +			continue;

Small nitpick, there should be space between if and opening parenthesis 
as recommended by coding style.

Thanks,
Amadeusz
