Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485B1B1719
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 22:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBFA6168C;
	Mon, 20 Apr 2020 22:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBFA6168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587414603;
	bh=/+SlNBL1JVhabXd68Pphmrx2B4wpwL7h5GlbwCW1DSQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFx0VlYba/BwDm3Lq+D+p5bDXfZnLhcoFVMGsqUkjyDWZqvk1WbN4Xxw7AWG3fb8N
	 awJhrceT6mtl48ELCathh4ArcagNNCZia9/DfIDcs04C9q1UGdKkrjCfXDEoSkcRbt
	 kyinDvLmr3RQR1vmfI8fVOI2B24nne0+ry2oxcXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF8DEF8012F;
	Mon, 20 Apr 2020 22:28:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA3B3F8013E; Mon, 20 Apr 2020 22:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B716BF801D9
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 22:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B716BF801D9
IronPort-SDR: bNw1wu5Z/bKF5rAY3NylsCz81wWyRL4K5N9OHgonX5oskt8zlwStAcG38mlB0tZasM0ByQB2Ea
 Rjfy892mDT0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 13:28:03 -0700
IronPort-SDR: qBUA2mdgDhMKmPxegedGy/PFJIwL308KhL1+zLKJfPMOQ/fpMq1V0QK0wzNQZ8m0BW9/Z8nx/R
 QEbVhpCeYbuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,407,1580803200"; d="scan'208";a="401954620"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 20 Apr 2020 13:28:01 -0700
Date: Mon, 20 Apr 2020 23:28:00 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
In-Reply-To: <84764e4c-8077-15b6-ff4c-9d002d42734a@linux.intel.com>
Message-ID: <alpine.DEB.2.21.2004202320370.2957@eliteleevi.tm.intel.com>
References: <20200402184948.3014-1-hdegoede@redhat.com>
 <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
 <a0d5d95e-113b-3543-cfc5-43dfa3f9142c@redhat.com>
 <be66d657-f4c5-46d8-d0b5-4879d7aa7463@linux.intel.com>
 <20200420124815.GB10045@sirena.org.uk>
 <84764e4c-8077-15b6-ff4c-9d002d42734a@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 20 Apr 2020, Pierre-Louis Bossart wrote:

>>> On 4/3/20 3:01 AM, Hans de Goede wrote:
>>>> Unfortunately even with that patch cherry picked the errors my
>>>> patch silences still happen.
> 
> Sorry about the delay, on my side I don't see this anymore in my ApolloLake or
> CML tests. Kai, can you confirm for HDaudio platforms?

I tested on a set of HDA platforms and I could not trigger the "no reply 
expected" errors. Tested with sof-dev (Mark's latest tree but staged SOF 
patches) that has the "ASoC: SOF: Intel: hda-loader: clear the IPC ack bit 
after FW_PURGE" patch.

If I revert this patch, the error trace comes back immediately, so this 
definitely helps to the trace spam at least in these cases.

There could of course be some relation to FW version. So if someone can 
still get the error trace, the FW version and platform used would be 
interesting information.

Br, Kai
