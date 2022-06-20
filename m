Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30022552248
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 18:29:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A50190D;
	Mon, 20 Jun 2022 18:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A50190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655742595;
	bh=RuFIXNPVPAV/+6tU2B6b9AcqeBSg2Vj5f7Ynm2OYEIM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gCUsEcF/FGJoatnrMoyuSEF1T+DCq0Y0864XvXlPqu/xPvhLO3M9uOJFvEnZlWmag
	 0m7X6zRew5lsjnU9OCofzW1t4ILIwLbNuEOGGkWfZOHt/9dtEmTQ19rMJHD5Ewtgb0
	 SQH2auaPQ3Tz6r5US/1MpUtoJxl1w2HfTgv13vfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27AC9F800CB;
	Mon, 20 Jun 2022 18:28:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7526DF804D2; Mon, 20 Jun 2022 18:28:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B5F5F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 18:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5F5F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UbqJQtTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655742528; x=1687278528;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=RuFIXNPVPAV/+6tU2B6b9AcqeBSg2Vj5f7Ynm2OYEIM=;
 b=UbqJQtTg/oox6QVrxzeoMFN8KK0CpsmZrlW5yc+qJByMhObMcOexk/Cn
 tqJt5D+AtsJkW3I0m8XuTV5JDYhpnzuYh3GIhZr/8Ppj7Kn0RNIOz4cQt
 iuUW4Ba0tn4ko4aByDl0986vvjYq4ktC7tLlhbGxQfbZDM4sYteAYi61l
 TjfkTqNpS34Rm94EeYmDbXLDTtH8aky1I2E4LGH5EhhQJWtDOxWKSEBa5
 HjOgqAWT7ZSeIkw4qRRH+YuxqjQBjxzE+UGcqAUfReQQNFP8VK3z/VjdK
 ogX0riZdSDqPWSYSy1qpr+ZPKcjlEj50y4b/W626i5Bbbnfa+sHsHVH1a w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="268654610"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="268654610"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:28:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="676601934"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 09:28:36 -0700
Date: Mon, 20 Jun 2022 19:18:05 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HDMI probe regression on IVB (and older?)
In-Reply-To: <87h74fpc6f.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2206201916240.1532214@eliteleevi.tm.intel.com>
References: <87bkunztec.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2206201141320.1532214@eliteleevi.tm.intel.com>
 <87r13jpec5.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2206201821290.1532214@eliteleevi.tm.intel.com>
 <87h74fpc6f.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Mon, 20 Jun 2022, Takashi Iwai wrote:

> > But it's a marginal difference, so for your version:
> > 
> > Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> OK, could you throw the patch to CI for verification?
> I can merge it for the next pull request (probably in this week) once
> after confirmation. 

sure thing, I'll confirm later this week.

Br, Kai
