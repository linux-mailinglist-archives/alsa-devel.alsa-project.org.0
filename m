Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD760632B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 16:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B7059140;
	Thu, 20 Oct 2022 16:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B7059140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666276447;
	bh=WHKytKKIVxQr3JUOiZQBwWI1p9mJWwi0nyT4GuUels0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOxNL51WZo9NsmP8LJTh4ER53OYVCsQorB8oFfhhIOTmkz681/SBG/DI0SvgHLKQl
	 Lpj/HCUgcwcuHlHac/WJOwFXVA8w4eR6IY8rsXBzjiXujpGRujxPAAN19JVr0cYPNB
	 WkaSHBMb8ouSu2Mx9C85VZdNm3jGW6w4ecORj8jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E93DFF804E5;
	Thu, 20 Oct 2022 16:33:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03758F804D8; Thu, 20 Oct 2022 16:33:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75CCEF800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 16:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CCEF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IzefzHXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666276386; x=1697812386;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=WHKytKKIVxQr3JUOiZQBwWI1p9mJWwi0nyT4GuUels0=;
 b=IzefzHXvndZixaiZIZubOthTwNt5WNSYj1gzJwNuXRNY3bDNzEeEhHzi
 Z4ts5W+dGALUw63vUdkQP8/yFQFE9Kd9QgTR6YsI8Sjzh5MC8GofZtj1K
 k2LMmIbYSAwXRqxkyc1Inea2C4AsxEKMIWNCNzs+cdR37UVZGXgst/lZn
 D6ttPKvQg9RDORew+bmzNBT1sLOwKe2IAqIjbdzJsutEHnsHsjGFsdY3p
 1J82c2qOsAXPWmN2Yoy3nQWIAXHYKbjYpAELp0SPs5NkGCZJT9EsHa8zf
 OqO3gp/7tIVatF4nwcJl4N3qMcb2XY9OsJsYjUb4zwtD4/nqMTDccF/fh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="294116803"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="294116803"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:33:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="632283237"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="632283237"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:32:58 -0700
Date: Thu, 20 Oct 2022 17:33:15 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH v2] ASOC: SOF: Intel: hda-codec: fix possible memory leak
 in hda_codec_device_init()
In-Reply-To: <20221020110157.1450191-1-yangyingliang@huawei.com>
Message-ID: <alpine.DEB.2.22.394.2210201723560.3532114@eliteleevi.tm.intel.com>
References: <20221020110157.1450191-1-yangyingliang@huawei.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.de,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org
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

Hi,

On Thu, 20 Oct 2022, Yang Yingliang wrote:

> If snd_hdac_device_register() fails, 'codec' and name allocated in
> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
> by calling put_device(), so they can be freed in snd_hda_codec_dev_release()
> and kobject_cleanup().

seems good to me:
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
