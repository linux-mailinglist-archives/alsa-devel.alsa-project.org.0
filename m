Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E94C3BD0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:42:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A441AC5;
	Fri, 25 Feb 2022 03:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A441AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756919;
	bh=NUsTFu3SsWU4R0K0rICaahqoItBlMWFrc9dBuIKc9UA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ou2ZK/7WJNrPIziSj7dOGH07mn7ZaLl8OGMYc2FnBzh/bEuJ/efU2g6d75MKyfE3L
	 jwyh3xEx4Mwj3M/TM/zSoW0m2bhIuYJKHPUefmbp5q6aXTd6yt6qat1TcNt4fNL92S
	 DwUvBa+yLsMXPbWeEm06ijmrCKXF1Fo0qFlAxtHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E75F1F80520;
	Fri, 25 Feb 2022 03:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC563F80430; Fri, 25 Feb 2022 03:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83BC4F800F3
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83BC4F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="blbz27Wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756764; x=1677292764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NUsTFu3SsWU4R0K0rICaahqoItBlMWFrc9dBuIKc9UA=;
 b=blbz27WrlW/r1gJ76+KnFkGXshG3WhqM9w1+GZGQkWx+CJhohTG8fNb4
 7YgzKWj3pMzDcRjaHT/wOo9m2oQ+quwZPnK4SyIgupwhuxsMU5DAK4jik
 xh5okWNeg5/CunDP3rFDQk0Vc6S+1venI9LndL3v3p1gji+gzQaVPi75I
 559nnQ/hFZICVpZthug1ORBRWtAdzdUmcnvvy25/NnvXpSS/9BXAeq9L3
 Rjfmb7OpA/febtmmcYUGuXisJaHd83l5+AMNoLv9qd+TBQ9AD9gJXfJQk
 m92QA9l9lidwq+G5O6d43tCas6y3ginIobRGoI1EHoz2vuZyuqX/LFWu7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036162"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036162"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:23 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832656"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:21 -0800
Message-ID: <377d6b88-33a9-ffab-9bfc-d1c836279b1d@linux.intel.com>
Date: Thu, 24 Feb 2022 19:42:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 09/17] ASoC: Intel: avs: Add ROM requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-10-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-10-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 2/7/22 06:21, Cezary Rojewski wrote:
> ROM requests are messages initiated by Host to alter firmware early boot
> process. They specify whether the next boot should be a fresh start or if
> IMR can be used to speed things up.

'can' is an imprecise term in technical documentation.

did you mean 'shall' (requirement), 'may' (permission) or 'should'
(recommendation)?

It's my understanding that it's legal to redo a complete reboot from a
clean-slate.

It's also unclear if the firmware can use this mechanism to prevent the
use of IMR, e.g. if in some firmware builds state save/restore was
disabled for some reason.

