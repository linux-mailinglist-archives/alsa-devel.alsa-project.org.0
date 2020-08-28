Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA90255D57
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:07:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28D301897;
	Fri, 28 Aug 2020 17:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28D301897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598627226;
	bh=aCTAs71kvF3j/erh2oDRBu9cBm05sOLNenrnr6HjJcc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaxtOXR/25l/bWj9GAh1gusOeJS7aqyIf3qSRk1KsmzBmeQs2MiZkJnSTWAJzY8+b
	 k1kzAJ9SjUhezeIzE5/juM1xhnnd6d1i0JCr7Pq0LLvQ5qjWZKxGDxOtNxXBjh7AAj
	 POkY2IzKmy6Xij/LlReRPVxWJbcRv1/tO9JXd40E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4508EF80143;
	Fri, 28 Aug 2020 17:05:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 603B6F8016F; Fri, 28 Aug 2020 17:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EBD8F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EBD8F80105
IronPort-SDR: 6S9iaWZ6q6RXnZ5mf374yxeD9h9ltYt4hhRWDWCOcs7fki94e0JxrG/TcckQHSDN6MeiGo70XN
 8snrdniOONcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="174727869"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="174727869"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:04:52 -0700
IronPort-SDR: kygGwtEvBhXWnEWXzPZLQVP4nA13+uTCemAcB7oXTd5zSLXNo66Y7zGTe9sURNp3KN747i2dfU
 NSSOm6eYp4vw==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="475712956"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:04:50 -0700
Date: Fri, 28 Aug 2020 18:03:38 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: HDA: Early Forbid of runtime PM
In-Reply-To: <s5h5z93ns23.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2008281800180.3186@eliteleevi.tm.intel.com>
References: <1598569536-9450-1-git-send-email-harshapriya.n@intel.com>
 <s5h5z93ns23.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>, alsa-devel@alsa-project.org
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

Hey,

On Fri, 28 Aug 2020, Takashi Iwai wrote:

> On Fri, 28 Aug 2020 01:05:36 +0200, Harsha Priya wrote:
> > This issue being common across all codecs, pm_runtime_forbid() is 
> > called when the codec object is created to fix this issue. 
> > A codec enables or disables runtime pm in its own probe function.
> 
> Thanks.  The only concern is about the influence on the relevant ASoC
> code, especially hdac_hda.c.
> 
> Kai, could you check whether this still works?

I believe Harsha is testing mostly with ASoC, so hdac_hda.c should be 
covered. 

I did queue a SOF CI job for this v2 patch and I'm seeing some failures
in module load/unload test that might be related and need checking before
we merge:

https://sof-ci.01.org/linuxpr/PR2403/build4400/devicetest/

The actual runtime-PM tests in our test set pass, but module load/unload 
has failures on some platforms. I'll follow-up when I have a better 
understanding what goes wrong.

Br, Kai
