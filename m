Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2C5F645
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 12:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F801696;
	Thu,  4 Jul 2019 12:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F801696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562234633;
	bh=IRXcc+E8EN71QL9LsokQAQcG4PoBqG6yyJ18jKiLPOc=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSrU4KBUjmsctVBdBOJGo+wmnIBw1AldfTdbYbYOncProujSO0mM1z1nUxW8NJfxQ
	 bs/dCMg0VIc/nXphyXQBIzMV6/OvpmlYNpN9L30DDlk+XQE/EhYAxO2eI3NmSclSjY
	 1IM7caAAsRIRgBQxK8HbYTRF/yY7X12cDCqaH1eI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D91BF80113;
	Thu,  4 Jul 2019 12:02:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 553D1F80111; Thu,  4 Jul 2019 12:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B4E7F800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 12:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B4E7F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 03:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,450,1557212400"; d="scan'208";a="175209719"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 04 Jul 2019 03:01:59 -0700
Date: Thu, 4 Jul 2019 13:03:06 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190703151023.30313-1-yang.jie@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1907041254100.4409@eliteleevi>
References: <20190703151023.30313-1-yang.jie@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for position
 update ipc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

patch looks good, but commit message could be improved.

On Wed, 3 Jul 2019, Keyon Jie wrote:

> In some cases, FW might need use the host_period_bytes even no position
> update ipc reqiured from driver, here add another flag for position update,
> and preserve host_period_bytes for FW to use.

Speculation on what FW might do is not really needed. The 
host_period_bytes field has been overloaded with multiple 
semantics and this patch clears that, right. How about:

""
Remove the special case semantics of 'host_period_bytes==0'.
Add a new field 'no_period_irq' to signal whether period elapsed
IPC should be sent and use 'host_period_bytes' only for
period size.
""

> This might require corresponding FW change and ABI alignment.

This is not helpful -- we know this _is_ a minor ABI change
and needs to be aligned with FW.

Br, Kai

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
