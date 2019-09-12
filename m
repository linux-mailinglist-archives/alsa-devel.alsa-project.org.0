Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD7B0A5E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 10:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 408D2172B;
	Thu, 12 Sep 2019 10:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 408D2172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568277054;
	bh=4Ztk7dmZAr2uQSXmvs3ibQJjyd2au4/eGTZp4pIFMKk=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uy5ytQqat8jBSITW1ax02xPpajiKHImsRtTC20WxObJ+6mk3OpvHdcZYQpt1Go5Z9
	 6r7iS3/Al0UksSSeOxXRdlmoDwRoTlOb9dBpOTcmBPL9Kx7yFR3Dh0cjOEbU3Q3G16
	 vn2S6Nb4YdFjvcdMUXO7dIiF8g4qya7OJ51eYHn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0ED6F80393;
	Thu, 12 Sep 2019 10:29:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA34F80368; Thu, 12 Sep 2019 10:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7095AF80143
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 10:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7095AF80143
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 01:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="209948129"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2019 01:28:56 -0700
Date: Thu, 12 Sep 2019 11:28:55 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <326901ed-4cd2-af0e-0039-9cae55b787f7@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1909121117120.16459@zeliteleevi>
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
 <20190910182916.29693-2-kai.vehmanen@linux.intel.com>
 <326901ed-4cd2-af0e-0039-9cae55b787f7@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 01/10] ALSA: hda/hdmi - implement
 mst_no_extra_pcms flag
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

On Tue, 10 Sep 2019, Pierre-Louis Bossart wrote:

> 
> 
> On 9/10/19 1:29 PM, Kai Vehmanen wrote:
> > When mst_no_extra_pcms flag is set, the codec should not
> > use backup PCMs to handle DP-MST scenarios. Instead a simple
> > 1:1 mapping is assumed between PCMs and converters.
> 
> mst_no_extra_pcms is not set, which makes it hard to review and get the
> picture of what this does.

this flag is used in patch 3 of the series. I didn't want to combine the 
patches 1&3 as patch 3 is modifying sound/soc/codecs/hdac_hda.c.

Let me try to improve the commit message a bit to explain why this
is needed. In short, if patch_hdmi.c creates virtual PCMs for routing 
purposes (current behaviour with snd_hda_intel in non-DSP mode), it will 
be impossible to match them to PCMs in ASoC topology. Thus to enable users
like SOF (could be others), patch_hdmi.c needs to expose a mode where 
physical converters are mapped to a fixed set of PCMs (-> this is 
the mst_no_extra_pcms mode).

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
