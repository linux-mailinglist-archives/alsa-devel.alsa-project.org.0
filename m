Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CE271E65
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9877A178E;
	Mon, 21 Sep 2020 10:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9877A178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600678431;
	bh=76jrQW4yBF7jDR5TJDcbMjSZobncCWzGdmUTPqDdWlg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HN0QWUgGVI3xGYI4C8FKZUN5+MVagX8ZBMsEwMg1o4n14uhLst2qso5wwdq4H5n7k
	 Fpfb88k7B7+GgrmVSnC+KdJD/BguAYfkjtP7LowW1gCUWLjaPCAokwQzw91G2TSWzO
	 fv3xNjD1gh1ZxCfsjCQOI8x6aaXlpu7AZs7tAJn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B23A1F80161;
	Mon, 21 Sep 2020 10:52:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF2F1F80162; Mon, 21 Sep 2020 10:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F031F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 10:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F031F800B2
IronPort-SDR: NF9402xcUiJ/pKpNoykj0PwLimeEhtY3bi+4HhmdmsDHEnBZF90sYKucyr+KLXVJqT90wnqWB4
 MBsyY89I6K8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="139833978"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="139833978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 01:51:53 -0700
IronPort-SDR: XAdz7lMQ0OmOcO0NEgG57uWbE99CUA9s2EztxBf27uEqEtutgVq9Yug+7DRVIT5o1DBQpEgESM
 UddRYHxG0QWg==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="321676092"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 01:51:48 -0700
Date: Mon, 21 Sep 2020 11:50:11 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Subject: Re: PROBLEM: A page fault occurs when the sound driver is loaded
 (ThinkPad X13/T14)
In-Reply-To: <60074f02-de79-95e1-d03d-62e843f9c691@secunet.com>
Message-ID: <alpine.DEB.2.22.394.2009211148520.3186@eliteleevi.tm.intel.com>
References: <60074f02-de79-95e1-d03d-62e843f9c691@secunet.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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

On Thu, 17 Sep 2020, Philipp Leskovitz wrote:

> [1.] One line summary of the problem:
> 
> A page fault occurs when the sound driver is loaded.
> 
> [2.] Full description of the problem/report:
> 
> A page fault occurs when the sound driver for Intel Commet-Lake platform
> is loaded. This happens e.g. on Lenovo ThinkPad X13 and T14 at startup
> and version 1.4.3 of intel-sof-firmware binaries
> (https://github.com/thesofproject/sof-bin/tree/stable-v1.4.3). Same
> result with version 1.5.1.

I think this has same rootcause as:
https://github.com/thesofproject/linux/issues/2311

I have a patch already and will be posting it to alsa-devel later today.

Br, Kai
