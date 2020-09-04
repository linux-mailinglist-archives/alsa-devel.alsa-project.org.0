Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C525DFBC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 18:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6E41EEA;
	Fri,  4 Sep 2020 18:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6E41EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599236615;
	bh=0THy736CRNcXcP/hI5h6LfjwNHV6URnrEH6g2aZiMM0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ier+D1tF/IBfdKhyJg2zgxrIfctphW8ERS30GVI2nHRqUXT9t9aL92mrGH7LfQ+uA
	 KA26QFJq/xvGmC6nJx1OFUeZIjJfll1FOPsuOahuqFcMy185zpeHlGvEAy+yhb89FO
	 W/9ZYOyVhxO4OzV0uQTdVIey0Y0d/TlsGPHawXhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3FAF80257;
	Fri,  4 Sep 2020 18:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D71A2F8024A; Fri,  4 Sep 2020 18:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAA26F80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 18:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA26F80113
IronPort-SDR: cB2fmeLudcj7FyTC8+RrERwIe7mUz++wIkius8vnmgkMFj3Sd7SDyezMhsalDDLnoHT6ZSKyBG
 R3SJCalv7PHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="157041502"
X-IronPort-AV: E=Sophos;i="5.76,390,1592895600"; d="scan'208";a="157041502"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 09:21:42 -0700
IronPort-SDR: k5LYQdNuxymrwotUEpV4FIE3IigFfRAc3UvskY5QWUGRQHzXYVyp71Cvc1snVWSEhOOG0diPkE
 xqXFew1MbrZQ==
X-IronPort-AV: E=Sophos;i="5.76,390,1592895600"; d="scan'208";a="447379220"
Received: from yilkanae-mobl2.ger.corp.intel.com ([10.251.179.197])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 09:21:37 -0700
Message-ID: <66655c271805846c3355db6328b0308a977a3b7a.camel@linux.intel.com>
Subject: Re: [PATCH] [RFC] ASoC: core: Do not cleanup uninitialized dais on
 soc_pcm_open failure
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Sep 2020 17:21:30 +0100
In-Reply-To: <20200904123854.26742-1-cezary.rojewski@intel.com>
References: <20200904123854.26742-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com
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

On Fri, 2020-09-04 at 14:38 +0200, Cezary Rojewski wrote:
> Introduce for_each_rtd_dais_rollback macro which behaves exactly like
> 
> for_each_codec_dais_rollback and its cpu_dais equivalent but for all
> 
> dais instead.
> 
> 
> 
> Use newly added macro to fix soc_pcm_open error path and prevent
> 
> uninitialized dais from being cleaned-up.
> 
> 
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>

