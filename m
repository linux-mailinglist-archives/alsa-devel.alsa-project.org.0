Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18682CB122
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 00:53:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C7C17D3;
	Wed,  2 Dec 2020 00:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C7C17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606866830;
	bh=R8MQ33Iea3GFaqJaLNRIrsW8ADbHMP9x2vWY1u39sgU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VNI6BQTo2fWTewI4NwZ/pZ3cZ+r3pT7EeuBD08tbiZcWOygoJ8Y50jGt0Ik9UALvn
	 xGnqXcoEucxhp4p3ODKLAL/cn75ZSUCGT4fSSHUb3WQW38mLHWfmaZVXTm6TGbxLC1
	 CVQpWROl5mCrOz+IPQg9EvDRLZFrPeLjH/8TSP4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 801CFF80168;
	Wed,  2 Dec 2020 00:52:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0D6F8016D; Wed,  2 Dec 2020 00:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40C9AF80139
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 00:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40C9AF80139
IronPort-SDR: RenveSie+WMN81KOcqafjFf18epK8HCKKu361GprSXI93FZg2zRFUnWXcQQQ2H4c6Qw0HI26k0
 WiWfSsIRx2yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="170361681"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="170361681"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 15:52:02 -0800
IronPort-SDR: sW0eQ/l3lGLwFM6tR341rnj+cPgpe8Nozj6T9CCckjZVJpNkGqgoiSF3YLq0K8yJVMhyzSZVPa
 y/XDYPjSz5Og==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="481305072"
Received: from ndchoksi-mobl3.amr.corp.intel.com ([10.212.117.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 15:52:01 -0800
Message-ID: <7581c05d22412dcd2bd7174960b7d9214d390d35.camel@linux.intel.com>
Subject: Re: Asoc: Intel: SST (CHT) regression in asoc/for-5.11
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 01 Dec 2020 15:52:00 -0800
In-Reply-To: <s5hpn3tbimq.wl-tiwai@suse.de>
References: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
 <2d9d0d43-8239-01e2-3787-98dfd305e369@linux.intel.com>
 <7b50862a-d7e3-6a72-833d-5c8283c8deab@linux.intel.com>
 <s5h5z5ld1ox.wl-tiwai@suse.de>
 <ef5dce32556b20e184dfd496e5f7b81a54b60a3c.camel@linux.intel.com>
 <s5hpn3tbimq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

> > Hi Pierre/Takashi,
> > 
> > The DAPM_STREAM_START event is still there in soc_pcm_prepare() and
> > this patch only removed the duplicate call in
> > dpcm_fe_dai_prepare().
> 
> Ah, thanks, I see now.
> 
> But note that the PCM prepare callback may be called multiple times
> in
> row; i.e. it's not always paired with hw_clean (that is via either
> hw_params error path or hw_free).  So if the balance really matters,
> we need another type of checks, not relying on the call pattern.

Hi Takashi,

It seems like it is indeed a problem with prepare not being paired with
hw_free. Adding the stream_stop() event back to dpcm_fe_dai_shutdown()
as it was before seems to resolve the issue. I am running further tests
to confirm it doesnt have adverse effects on SOF. Will post the patch
shortly.

Thanks,
Ranjani

