Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA916CDFF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 14:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644E9167C;
	Thu, 18 Jul 2019 14:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644E9167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563452600;
	bh=CBeDsBNdj+Kv+GO8EpZLvzGeGTzp51Cw4kYwALcJSsA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H2Vh6bKVtE/WesE79YRKSJ/PSAOHTUZkT8BFPR407fIbaW+eAl66jcDpNkXYQ7L+B
	 V7XcLO0iErbVJh2swtMYqkIJP7LmnIoIWa8JioeEAbKevU2o0YEjmPRyIE0rVxUzUn
	 Xto4nMGo2gsqDaK5M/P60FfNfCZEeYE35WJ13d0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5F6F80377;
	Thu, 18 Jul 2019 14:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4ABEF80362; Thu, 18 Jul 2019 14:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A56EDF800C4
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 14:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A56EDF800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 05:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="251803750"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga001.jf.intel.com with ESMTP; 18 Jul 2019 05:21:26 -0700
Date: Thu, 18 Jul 2019 15:21:25 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20190718094321.16442-2-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1907181517130.16459@zeliteleevi>
References: <20190718094321.16442-1-tiwai@suse.de>
 <20190718094321.16442-2-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/2] ALSA: hda/hdmi - Don't report spurious
 jack state changes
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

Hey,

On Thu, 18 Jul 2019, Takashi Iwai wrote:

> The HDMI jack handling reports the state change always via
> snd_jack_report() whenever hdmi_present_sense() is called, even if the
> state itself doesn't change from the previous time.  This is mostly
> harmless but still a big confusing to user-space.

typo: "a bit confusing to user-space"

The patch iself looks good. Gave a quick test with some HDMI 
hotplugging and works as expected.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
