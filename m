Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A35FD97F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 14:47:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0A85AC8;
	Thu, 13 Oct 2022 14:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0A85AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665665278;
	bh=mgH7bqIU6Bj+F/PoYyFSiLKrokyQ/VHmhqjqPAujEZ4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnfWVVsNYoiJ/122Ak0DwTb7zjmujjhOP808NV3nRS+Jm+SexPa4ebZ6GAupAYULV
	 lk0WL1Z/kfSdZHLMjd30yUiu9nuHg3BsDX/AuOklyj+zmPz+rUSV5DiJVqQ60gsLqw
	 YjkcXXQacdIlDipUEMWWfLitc6eQQp+LIJe/hBtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 192E1F800C0;
	Thu, 13 Oct 2022 14:47:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D215F800C0; Thu, 13 Oct 2022 14:47:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C91CBF800C0
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 14:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C91CBF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dzz8RCTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665665213; x=1697201213;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mgH7bqIU6Bj+F/PoYyFSiLKrokyQ/VHmhqjqPAujEZ4=;
 b=Dzz8RCTjWQpoFS2qv6glpesY7tpnu91cT4GAHiN0qxGUuDzIUPqZ0O9e
 1O/07tV6TKvH04oR39jKLBa+SANKdAl9mrI9haYgCyUUhUigvHOmYZXY0
 6aRV3tlT3Hyz+j1mYjezow0aN8fiZyjhCI4BJcGK85bP2Yn/MemTyNQDS
 bJO/ZYti+ag/lkBwbPuRoN2i373kGWkppY26R9KnjfSXI8VCfFKc9UP0i
 HqN6oHBfxyj3TfOKIdJ3FykFpCRM5ibmMgCMB7iG97Qt94Shm6XSLkjla
 otUPDjflvwTFYI5VuZFYzTWjHqYxFsDNmQlQxxqNQ8dhSzkjHxn4ScTIy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="331572536"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="331572536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 05:46:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="872313807"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="872313807"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.252.189.128])
 ([10.252.189.128])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 05:46:45 -0700
Message-ID: <f84e2722-ca56-8440-a5af-550080bd1f8f@linux.intel.com>
Date: Thu, 13 Oct 2022 20:46:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ASoC: Add Richtek RT5512 Speaker Amp Driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Jeff Chang <richtek.jeff.chang@gmail.com>
References: <20221013080643.6509-1-richtek.jeff.chang@gmail.com>
 <Y0f98d0A04f8dzQV@sirena.org.uk>
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <Y0f98d0A04f8dzQV@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: jeff_chang@ricthek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Jeff <jeff_chang@richtek.com>
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


On 10/13/2022 8:00 PM, Mark Brown wrote:
> On Thu, Oct 13, 2022 at 04:06:43PM +0800, Jeff Chang wrote:
>
>> +config SND_SOC_RT5512
>> +	tristate "Mediatek RT5512 speaker amplifier"
> Looks like there's some Richtek/Mediatek branding confusion with this -
> it's a bit unclear.  It's all the same company in the end I guess so it
> doesn't matter.

Interesting, the naming of RT5512 looks like a Realtek codec. ^^


