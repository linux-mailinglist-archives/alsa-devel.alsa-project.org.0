Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7329E3A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 20:39:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB6A170C;
	Fri, 24 May 2019 20:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB6A170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558723182;
	bh=Zi4MvvjO+CKZbq/Y5HDIfZq3YrGLJ+XGLhXUUxUrQP0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhPhLPHq1nxRRCdhuiTeIyTfQOMW+eNTrqUlxTC9uYKrDPhfYHvqvcERM1XLwmZWy
	 fA/bMSkTyQCvA3CyMlDKw9mRvzSzI9plU94k7DT0pSyOQO4MHqljWox0oiSMbfyVBQ
	 0bEQpSb4GTbW9zPsNuLebcJOK4zZHYx3kMcpkMds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F925F89633;
	Fri, 24 May 2019 20:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C017F89633; Fri, 24 May 2019 20:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 573D3F8962F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 20:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 573D3F8962F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 11:38:05 -0700
X-ExtLoop1: 1
Received: from dravindr-mobl1.amr.corp.intel.com (HELO [10.254.105.104])
 ([10.254.105.104])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2019 11:38:04 -0700
To: Daniel Drake <drake@endlessm.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
 <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
 <CAD8Lp47Yc5CwkM-y=eqXdPDZ7+1=qa6m1sCELhBsidsYYSzfQQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d399bbcb-c094-d0b9-5ae3-8267ee613d6f@linux.intel.com>
Date: Fri, 24 May 2019 13:38:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAD8Lp47Yc5CwkM-y=eqXdPDZ7+1=qa6m1sCELhBsidsYYSzfQQ@mail.gmail.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
 are detected
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/24/19 12:34 PM, Daniel Drake wrote:
> Still not quite clear about the default behaviour here.
> 
> On Fri, May 24, 2019 at 10:12 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> b) the decision to abort the HDaudio legacy driver probe should not be
>> the default, since it depends on BIOS information that may be wrong and
>> on which I have *zero* control.
>> [...]
>> 1. DMICs attached to PCH and BIOS/NHLT reports DMICS -> abort HDaudio
>> legacy probe
> 
> In the case of DMICs attached to PCH and BIOS/NHLT reports DMIC, is
> the HDaudio legacy probe aborted by default or not?

no.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
