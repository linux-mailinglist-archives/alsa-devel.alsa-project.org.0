Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4775C3D4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 11:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209BDBC0;
	Fri, 21 Jul 2023 11:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209BDBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689933506;
	bh=bhA2Wac8b35OMVZeZH3cwBC9dodh2jsNgsqPsAZy4eI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xwjv8X4Hdn+ixucUQeQYpKAbY3M8WVzjuPyoS6wYGQQNPXVfo4tnQMFRjj8oYCoSI
	 LY+1Tp66qzC83ztH8KuPP0q9QCe7/NQHJicTkk0lkVnmYeuldnwVaSGRITnRBduHt1
	 ejJ3URA0xEc0ZQehjlt+Eu+T1aohdKqQuT2uZLh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC3D9F80535; Fri, 21 Jul 2023 11:57:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13221F8032D;
	Fri, 21 Jul 2023 11:57:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FB93F8047D; Fri, 21 Jul 2023 11:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59262F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 11:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59262F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J5ckcyaE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689933434; x=1721469434;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bhA2Wac8b35OMVZeZH3cwBC9dodh2jsNgsqPsAZy4eI=;
  b=J5ckcyaEvEaPW8nYeoqanFv6yL1wdGtat5wE11+2mZkGS6qDtE/BmVBN
   oysO0MWgFCH9rc4AFSCGvbdqaY6eBOU96W2p+XLeni4mWBVJ6F16roBhx
   FuvVd+5uypmFQ33wHfg0YpR4fKPP+KswgxPzewpARDM3JH3iXfFsHGc7i
   CdFSOkeFBIHT+2nmML8BcskorRV1qBDjYJ1wVEYRPtrFvQR1/9UrBJKJN
   tzNIuBSVFskeX+E9l+86Gduhy2X4N930ozDmh+P6PcObZ8YYWVJffaBNK
   ZFcRtXS8q43QyGPKhTluDxU7J3Mlqt7JUHz6E2iuHoaNp9gs6Tt2dX66S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="367023680"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="367023680"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 02:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718762469"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="718762469"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 02:57:04 -0700
Date: Fri, 21 Jul 2023 12:53:43 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Brent Lu <brent.lu@intel.com>
cc: Alsa-devel <alsa-devel@alsa-project.org>,
    Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
    Yong Zhi <yong.zhi@intel.com>,
    Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
    Uday M Bhat <uday.m.bhat@intel.com>, Terry Cheong <htcheong@chromium.org>,
    Mac Chiang <mac.chiang@intel.com>,
    "Dharageswari . R" <dharageswari.r@intel.com>,
    Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] Intel: sof_rt5682: remove quirk flag
In-Reply-To: <20230720092628.758834-1-brent.lu@intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2307211249190.3532114@eliteleevi.tm.intel.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4UIVPDIA54MPKP2DWPYQ3AYAI2EV5XKL
X-Message-ID-Hash: 4UIVPDIA54MPKP2DWPYQ3AYAI2EV5XKL
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UIVPDIA54MPKP2DWPYQ3AYAI2EV5XKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Thu, 20 Jul 2023, Brent Lu wrote:

> We add a helper funcion to detect amplifier number according to device instance
> in ACPI table so the SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag and a dmi quirk
> for 4-amplifier configuration could be safely removed.
> 
> Also refactory the max_98390_hw_params() function to use an array to handle the
> TDM parameter.
> 
> Amplifier number detection and TDM parameter are tested on two Chromebooks. One
> with 2 MAX98390 and one with 4 MAX98390 amplifier.
> 
> 
> *** BLURB HERE ***

this looks like a nice cleanup, thanks Brent. For the series:

Acked-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Minor nit: some spelling erros in cover letter (funcion->function, 
refactory->refactor, BLURB HERE left), but I think the intent 
comes across.

Br, Kai
