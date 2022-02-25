Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F034C3BDE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:44:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CC91B42;
	Fri, 25 Feb 2022 03:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CC91B42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645757046;
	bh=wK1fAwWe+qbPvyrwx+ghPX/XbuXY/w4zzAgDaVjb4cY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lj+S2uyeoxc6Q3DFsrutPlmFCmvRiHohxEjQTCDNSVuGCnUy1EJQZaGXusrz4A6ao
	 xGDL/MiUheSNRISHGVrTj1ZnYpj8XGW76MwYmiaNhM4F9doJJmtIgSfh79tt4NWwRU
	 zmfQdtOBnOgEuT54cCJmI7mCUmX1HltAFDntitzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 182E7F8056F;
	Fri, 25 Feb 2022 03:39:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6937BF8053B; Fri, 25 Feb 2022 03:39:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C05F8052D
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C05F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="R7kDmjgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756787; x=1677292787;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wK1fAwWe+qbPvyrwx+ghPX/XbuXY/w4zzAgDaVjb4cY=;
 b=R7kDmjgo/Cyj/U3lmSpH0bjoKsITPRViHw+qDcTuWsjHbP34h72k8rBd
 902bqSaxQsBAriKcEz7x+YRGsDnSER1T3pwnuNR8+LhedBJzTysAj0zex
 e8Zhx2NJJSzufunmiJeI4O6z1r0KBSVxD3tRoDj4+f+2RY0+eaHZs2VCb
 MBuTAOrJA5ZBhM34LUdS4WkCQPY8MXsOqKcWAE7HnA8VlnrP142iIV4C+
 4mO/yGQG0370jmjCr5tenRsQDNxSayzEQQV2fo5d8xdEGLWY30H4OtmFI
 UhTVZWXu9B43ZJsScRG1i7AIU5dKzy1ToQV3IQtu+Yzh9oC38m1A1cPLJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252133447"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252133447"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832732"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:34 -0800
Message-ID: <702df428-e972-fcdc-c250-c0a73c4d2ba8@linux.intel.com>
Date: Thu, 24 Feb 2022 20:35:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


> Note: this series does not add fully functional driver as its size would
> get out of control. Here, focus is put on adding IPC protocol and code
> loading code.

This series is much simpler indeed, see comments in patches, but that
leaves the next steps completely open. It's not quite clear to me how
the previous feedback on trying to up-level the DSP management
functionality might be handled, and if/when you are planning to submit
follow-up patchsets that would implement the required functionality to
at least match what the Skylake driver can do today.

To repeat my previous points: the existing DPCM FE/BE split does not
even being to represent how a DSP might be handled. The BE typically
represents a physical DAI connected to a codec, and the FE pretty much
everything else between a host DMA and the DAI. All the internal format
conversions, mixers and processing are not really represented other than
with DAPM logical widgets, and that's a big miss. There's room for a lot
of improvements that would be of interest to all DSP users.


