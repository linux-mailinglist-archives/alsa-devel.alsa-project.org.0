Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D144D2AE8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 09:50:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079021733;
	Wed,  9 Mar 2022 09:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079021733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646815810;
	bh=tWR4Vhzuy+kjXJjKGMZmuOU/Bug5xBtY1CujXwmqosE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoNyxtSRb2BDl/DUJfoYyTZS6S1REx9SEgRgfEmp4Qt+uK+eq9dkM1mzO0sIHn+Dt
	 8etrRi9cYKICnyaF4Zm/5u2LXil7tRF4ZmCFTp2ya7po//DBSb9JR+ryA2EblmQcT3
	 9I7u1uRCmhyuNgFFH18ToDSkGJrmq2WfaAH/uyww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB7EF80236;
	Wed,  9 Mar 2022 09:49:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BDACF8016C; Wed,  9 Mar 2022 09:49:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 065E1F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 09:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 065E1F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XzgbON57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646815736; x=1678351736;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=tWR4Vhzuy+kjXJjKGMZmuOU/Bug5xBtY1CujXwmqosE=;
 b=XzgbON57qyh8xmZGeSL739q7NFl9avqwbIxEBtkP2gjiJfDXajiAC8AJ
 4D+CCzMrGguW6WFfJRdI+1y4On6Vb8DS4w7f8uldVJA94DRCPYTqSX4bI
 18jxF3M7if1iDsLcc7eRsSVI1JaxFEekq9dTsT5A2cMd4FgLw+oIce4EL
 aKpfaa1WsLw+NHTjSRRTCKGCtfyncDvvRsNByNFa5X/qCfReBD+GA4ei1
 Xg1mj1Rp1pK/wUqJ4AGkYM4B/euCP0xuRZeVOe270/HBEKkcCiXHBnN2Z
 g+ky6YmwNBLi/BeaY3RYkKgUC7iUHRz+9SHTcrcfp4MC3d1dicaOoP1+1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="318151445"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="318151445"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:48:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="642076533"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:48:46 -0800
Date: Wed, 9 Mar 2022 10:39:40 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] ALSA: hda/i915 - avoid hung task timeout
 in i915 wait
In-Reply-To: <f9f6f831-a05d-2d20-8ade-ab717f342ba5@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2203091035350.3088432@eliteleevi.tm.intel.com>
References: <20220308172759.920551-1-kai.vehmanen@linux.intel.com>
 <f9f6f831-a05d-2d20-8ade-ab717f342ba5@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Paul Menzel <pmenzel+alsa-devel@molgen.mpg.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 amadeuszx.slawinski@linux.intel.com
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

Hi,

On Wed, 9 Mar 2022, Tvrtko Ursulin wrote:

> > -			/* 60s timeout */
> 
> Where does this 60s come from and why is the fix to work around
> DEFAULT_HUNG_TASK_TIMEOUT in a hacky way deemed okay? For instance would
> limiting the wait here to whatever the kconfig is set to be an option?

this was discussed in
https://lists.freedesktop.org/archives/intel-gfx/2022-February/290821.html
... and that thread concluded it's cleaner to split the wait than try
to figure out hung-task configuration from middle of audio driver.

The 60sec timeout comes from 2019 patch "ALSA: hda: Extend i915 component 
bind timeout" to fix an issue reported by Paul Menzel (cc'ed).

This patch keeps the timeout intact.
Br, Kai
