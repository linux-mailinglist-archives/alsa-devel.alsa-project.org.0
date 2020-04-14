Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4211A846B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 18:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC7116A8;
	Tue, 14 Apr 2020 18:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC7116A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586880971;
	bh=9vFHwdygG/1mZ20+N+A/5fVDKfjUCafUsG3NfidVudI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qf81Q0kqxcyu+qMxpvwkoIj6dUCR2slmojnRrw8kxLTqkXCFyA3JQo6T/7aGdXkDh
	 tOaODaLvC51oKl4QdMddtPZDvkUsHcRq/Ck5lahpAeESWYnI6zFz5C05+JtpIufvvu
	 HRU3jY/G/T3HnqHC8k60zaxmzJ88v0bUETC1AVaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D036F8016F;
	Tue, 14 Apr 2020 18:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A824BF8013D; Tue, 14 Apr 2020 18:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72809F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 18:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72809F800B9
IronPort-SDR: 4AyJp23Tes+zMs9S+XvmoLoX1ZL7zDQP7SsbX1h/JsAuM3uXfUCOOmoN/+c5He7if1v9Xt32G4
 e8p2YqDrl5Mw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 09:10:01 -0700
IronPort-SDR: qo4/zH/QEgV/Qv1yO53AxEWKimIlX29FBoVItNGEubEb/Kr3rO2f+/v82BhBuM/lz0HcaBLHdb
 eFCxXhwk/smw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427109808"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 14 Apr 2020 09:09:59 -0700
Date: Tue, 14 Apr 2020 19:09:58 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 03/13] ALSA: hda: Add ElkhartLake HDMI codec vid
In-Reply-To: <s5hd08emi2k.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2004141838300.2957@eliteleevi.tm.intel.com>
References: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
 <20200409185827.16255-4-pierre-louis.bossart@linux.intel.com>
 <s5hd08emi2k.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Sat, 11 Apr 2020, Takashi Iwai wrote:

> On Thu, 09 Apr 2020 20:58:17 +0200, Pierre-Louis Bossart wrote:
>> Add HDMI codec vid for the Intel ElkhartLake platform
> 
> I suppose this can go through ASoC tree unless HDA legacy driver
> supports the device.

hmm, good point. In short, both DSP and non-DSP usage continue to be 
possible, so HDA legacy driver can be used as well. This is a (positive) 
new problem of SOF now using common codec driver for HDMI. The patch got 
merged already (and I think this is ok as we specifically enable and test 
HDMI with the ASoC stack), but maybe in the future we can send these codec 
driver patches directly, and not via ASoC.

Br, Kai
