Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81F277654
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 18:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5671E1801;
	Thu, 24 Sep 2020 18:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5671E1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600964028;
	bh=Ne64zkUqtPyydpOyhG02tXUzs5ZvPVTSsr6RAa6j8jU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGhenUUvtQK/mnX9DREOVn2+Z4MqSN5kcowzaENNc/wjsECxcaKWqT6Li56ct+4UY
	 xEe/tTgGA5B/BXcxPuHjcYINfN/UjbjI5MIBJQSrB5NG71Js/U8U3QstZ30BUo8ED0
	 XnFh2wIkP3xa4LP7yDjAUc9GulGfDWLCGV4nJHHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA03F80232;
	Thu, 24 Sep 2020 18:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 230C0F80229; Thu, 24 Sep 2020 18:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9261FF800B4
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 18:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9261FF800B4
IronPort-SDR: y0jwzl27B0rdQ+OJq2NKmUb38BRZqr8Pcd2Nz4RulU4xOFb0nOPAUBwAJDU3AR7w+TRAZbgMCD
 eEXMuBkQ3nMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222849619"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="222849619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 09:11:53 -0700
IronPort-SDR: 03JZi27GCo0Yg4gb8CAQNnw1CYC3bEn0qD1P+Ykm/psgswLXi9Oqr5jLw8ocz3dmjcT7rvG+Hz
 3JVlfRJf5fMw==
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="336044838"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 09:11:52 -0700
Date: Thu, 24 Sep 2020 19:10:19 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda - add missing documentation to hdac_i915
In-Reply-To: <s5h1rirrx97.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2009241910100.3186@eliteleevi.tm.intel.com>
References: <20200924154043.3392898-1-kai.vehmanen@linux.intel.com>
 <s5h1rirrx97.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Thu, 24 Sep 2020, Takashi Iwai wrote:

> On Thu, 24 Sep 2020 17:40:43 +0200, Kai Vehmanen wrote:
> > Document missing function arguments and fix make W=1
> > warning:
> 
> Do we really need to put this internal function in the API documents?
> If not, the right fix would be to drop the kerneldoc marker instead.

I was puzzled at this as well. I took a look at some static internal
functions and there were both with (e.g. snd_hdac_make_cmd()) and without 
kerneldoc markers. But, but, granted, this is without any name prefix, so 
maybe better to drop the kerneldoc. Let me send a v2.

Br, Kai

