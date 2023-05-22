Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEF70CB28
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 22:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C68206;
	Mon, 22 May 2023 22:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C68206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684787682;
	bh=Nx56cbf63OXaAUSBYAnLL+ze08ugHBspK4d6BmMPYso=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lU4E1aUHgyR/Gzv0UOJmTW1rVtxm9QHLv0dpI+oHKdPkR/WYtI91GhjkpBU9OsCJb
	 PqTBD8lypR0xPtSbCSvI92C++lsnIwCHPhn/reNMYnc+jhzeZ8SfWpqbBoOkFp0JOs
	 XsXtAyE7zvjHIJi3WQQG0mO0lrwOj5JW5TmUovq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA2AF8016A; Mon, 22 May 2023 22:33:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E01F80249;
	Mon, 22 May 2023 22:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB07F8024E; Mon, 22 May 2023 22:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAA5EF80086;
	Mon, 22 May 2023 22:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA5EF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gclKp644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684787602; x=1716323602;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nx56cbf63OXaAUSBYAnLL+ze08ugHBspK4d6BmMPYso=;
  b=gclKp644M68PYC4+1NDuYCSMnvrWyE8MkqlnBRZuYmBs+TE3i/s0Xc+P
   JNr+AZvuYd49qIfknpsXk1M1mmq/pODGjgm4ZkSSzdTFr9np+8cZFrqiu
   HTZFfZbB2D9DBDxSqyCHGO4MSttERLnKH2R24NP79pN88yOwWW8EKvTnt
   WURO4aR3L64Q+Ggin6GZWkqnEcIUF/U8LeLAIAu0HmiHb44MQQCBMGAGG
   jG2bLpxnd0UjqADSyT/waLvdIDOIno4ygfROQvExkzDWh6/iTjbfQYyGZ
   oaD/nBb7goRKbQe8AeRK0V1m/XtYeeYdPkcIh4Wm9l+cLTomKV3hYobbx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="439389512"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="439389512"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="1033750097"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="1033750097"
Received: from avelapox-mobl.amr.corp.intel.com ([10.212.71.122])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:33:16 -0700
Message-ID: <ffc0ebdded5e8ec3a00c07347f17f1b78640324f.camel@linux.intel.com>
Subject: Re: [PATCH -next] ASoC: SOF: ipc4-topology: Fix an unsigned
 comparison which can never be negative
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, perex@perex.cz
Cc: tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com,  peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com,  daniel.baluta@nxp.com,
 kai.vehmanen@linux.intel.com, broonie@kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Date: Mon, 22 May 2023 13:33:16 -0700
In-Reply-To: <20230516081116.71370-1-yang.lee@linux.alibaba.com>
References: <20230516081116.71370-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UNHLPTG6JO67SSGGHO3VUJERQGXJ3634
X-Message-ID-Hash: UNHLPTG6JO67SSGGHO3VUJERQGXJ3634
X-MailFrom: ranjani.sridharan@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNHLPTG6JO67SSGGHO3VUJERQGXJ3634/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 2023-05-16 at 16:11 +0800, Yang Li wrote:
> The return value from the call to sof_ipc4_get_valid_bits() is int.
> However, the return value is being assigned to an unsigned
> int variable 'out_ref_valid_bits', so making it an int.
> 
> Eliminate the following warning:
> ./sound/soc/sof/ipc4-topology.c:1537:6-24: WARNING: Unsigned
> expression compared with zero: out_ref_valid_bits < 0
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4985
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

LGTM, thanks!
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

