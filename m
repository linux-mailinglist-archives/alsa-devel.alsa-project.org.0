Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05DE4372A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 16:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 060061824;
	Thu, 13 Jun 2019 16:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 060061824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560435573;
	bh=+BHpT0K0zY0T9gN7282SqPCp/3BrwBgEk1cN6wMFIJ4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNtfxQDXlKEWsqVugcj2mQEqcHOhoKVZErdd5lAjMsvnzSqy2d1PhUfUSoCeVTYDv
	 1kk0OsOT+xI5mpXXz/dH/aOpVQjhkIgJTGfvzJilaDwyQjQQKbGlQDTfKMyCteIbLh
	 giqT8wtFP8rqP3yNqax8/l9s3NzybvQFrsXTBr/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB346F896F1;
	Thu, 13 Jun 2019 16:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 328A5F89703; Thu, 13 Jun 2019 16:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 165A8F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 16:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 165A8F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 07:17:39 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 13 Jun 2019 07:17:38 -0700
Date: Thu, 13 Jun 2019 17:18:36 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi
To: broonie@kernel.org
In-Reply-To: <s5hef3yn8s2.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1906131706170.4409@eliteleevi>
References: <20190612094452.1060-1-kai.vehmanen@linux.intel.com>
 <ba5e42ab-7f1e-01b9-835d-52a1e42a0fe0@linux.intel.com>
 <s5hef3yn8s2.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 0/3] ASoC: SOF: fix suspend ordering with
 runtime idle
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

On Wed, 12 Jun 2019, Takashi Iwai wrote:

> On Wed, 12 Jun 2019 16:46:24 +0200,
> Pierre-Louis Bossart wrote:
> > Looks good to me
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> All look good.  I already replied to the first one, but feel free to
> take my ack for the rest, too:
> 
>   Reviewed-by: Takashi Iwai <tiwai@suse.de>

thanks for the reviews!

Mark, one patch in this series conflicts with a patch in Pierre's series 
sent yesterday:
  ASoC: SOF: Intel: hda: release link DMA for paused streams during suspend  
  -> in series "[PATCH 00/15] ASoC: SOF: Intel: HDaudio fixes and improvements"

We thought the runtime idle would take more time in review, so didn't send 
them in the same series, but now that the reviews seem positive, we have 
a potential conflict. You can drop the conflicting patch from my series, 
or I can rebase on top of Pierre's series and send V2 later.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
