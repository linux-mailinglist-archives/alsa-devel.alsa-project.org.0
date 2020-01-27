Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9614A77F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 16:50:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 018D983B;
	Mon, 27 Jan 2020 16:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 018D983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580140221;
	bh=TD2sOsv5Pe6BZdsU8bzZMnA7Z4u1Vl11fDiF85pwHdg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIGLOTHRj7qDtT/0xwYr5pW85KT2hjxBM0QEiP78vR3/zfDDqBP8q5npO3rSheJ7N
	 hvR9Igit3rkYUuDUCgCNUWa89OGmbDyhWIfpfCMdGowSp1HECz4rHKpCheLIF9Qo+r
	 Bqc0eRLXwUC89mhl2zyQYZk/M9Ab0DGdZSw0aZik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5FDF80085;
	Mon, 27 Jan 2020 16:48:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20F20F8021E; Mon, 27 Jan 2020 16:48:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D51BF80085
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 16:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D51BF80085
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 07:38:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,370,1574150400"; d="scan'208";a="223273245"
Received: from vvaddepa-mobl.amr.corp.intel.com (HELO [10.252.204.5])
 ([10.252.204.5])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 07:38:02 -0800
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20200120160117.29130-1-kai.vehmanen@linux.intel.com>
 <20200120160117.29130-4-kai.vehmanen@linux.intel.com>
 <s5hpnfe2hvb.wl-tiwai@suse.de> <20200120171718.GG6852@sirena.org.uk>
 <alpine.DEB.2.21.2001201936540.2957@eliteleevi.tm.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <35b2748b-661b-3e63-eb71-fc44fced0deb@linux.intel.com>
Date: Mon, 27 Jan 2020 09:38:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2001201936540.2957@eliteleevi.tm.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, cujomalainey@chromium.org,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 3/3] ALSA: hda/hdmi - add retry logic to
 parse_intel_hdmi()
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



On 1/20/20 11:43 AM, Kai Vehmanen wrote:
> Hi,
> 
> On Mon, 20 Jan 2020, Mark Brown wrote:
> 
>> On Mon, Jan 20, 2020 at 05:49:12PM +0100, Takashi Iwai wrote:
>>
>>> It seems that this felt out of Mark's hands, so I picked up now to my
>>> tree, as this doesn't seem depending on other changes.
>>
>> He only sent it on Thursday and Pierre hasn't reviewed any of this stuff
>> yet.
> 
> sorry for the confusion guys. I checked with Pierre and he preferred for
> this to be picked up by Mark directly. I noticed some rebase needed when
> applying on top of Mark's, so thus I resent the patches as v2.
> 
> We did have initial review at (although no approvals):
> https://github.com/thesofproject/linux/pull/1713
> 
> Maybe in future, better not to combine ASoC/SOF and generic HDA patches in
> same series, but rather send in pieces via the proper subtrees...?

Sorry about the confusion, I thought Takashi took all of the 3 patches, 
so didn't chime in, but only this one was applied while the 2 others are 
still in the review queue, so for the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
