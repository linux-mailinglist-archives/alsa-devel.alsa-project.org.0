Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D16E2164
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 19:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD3B1660;
	Wed, 23 Oct 2019 19:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD3B1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571850392;
	bh=rdb7ISiWa2UKTiBvw+6kJGyrQKtdpDsh2JfUeJhpdvE=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtF+0Of+oSBNRs/JurezhB2N5HMGskVuDSP89kO5hzLiXvuuVGVA2BL+1oWaWl70l
	 GDR9Sp89ZeV6syowb7HhdMG7BD6J29w3J1RdA6Na8mFba1tnzvfuvOX3HF7r6IPcf4
	 qmXpPWLeaxY2foeAilir8QQMFrU44pEYhygFKAOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847F2F802DF;
	Wed, 23 Oct 2019 19:04:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6E8AF802DF; Wed, 23 Oct 2019 19:04:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1402F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 19:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1402F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 10:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="281680755"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga001.jf.intel.com with ESMTP; 23 Oct 2019 10:04:39 -0700
Date: Wed, 23 Oct 2019 20:04:38 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20191023160829.99B28F80368@alsa1.perex.cz>
Message-ID: <alpine.DEB.2.21.1910231952480.16459@zeliteleevi>
References: <1571846903163125992-webhooks-bot@alsa-project.org>
 <20191023160829.99B28F80368@alsa1.perex.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Subject: Re: [alsa-devel] [RFC] sof-skl_hda: change to use common HDMI codec
 driver
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

On Wed, 23 Oct 2019, GitHub pull_request - opened wrote:

> alsa-project/alsa-ucm-conf pull request #4 was opened from kv2019i:
[...]
> Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/4
> Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/4.patch
> Repository URL: https://github.com/alsa-project/alsa-ucm-conf

Jaroslav, here's an interesting case for the UCM file lookup problem 
(related
to your post in thread in May about the UCM selection:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-May/150043.html 
)

This is essentially a case where same codec hw can be driven by two
different drivers. Depending on how user has compiled the kernel (and/or 
set module parameters), a different set of UCM rules should be used.

Now in the RFC UCM patch, I simply replace the UCM rules to match common 
HDMI codec driver interface. I.e. once merged, the ALSA UCM files only 
support one codec driver.

In this specific case, this might be the best solution (as the two 
drivers exist purely to support the transition time), but I'm wondering 
whether we have other similar needs, and UCM lookup logic should cover 
also this type of cases. Any thoughts?

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
