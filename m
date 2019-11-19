Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C11025A5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 14:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF94F1696;
	Tue, 19 Nov 2019 14:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF94F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574170953;
	bh=EaCCdFvp54JI0MYNPV6oNNvaUs0wN+2KzuK+yGMRqv0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYNsAnEdqNMq1lUhmJtVnilPle8iWq2TOlrh+RNN/eqXMOVAepAvmd0UyHU2pxBWf
	 BJsQHWeV9BUna/8eXrNtLilqK2y6QstJ2zzgokP0xed3PqhzbL7rtXuTox9OtGAlGk
	 glXJiYJLApSOg0vsbcvPQoOaCIDFIkDSZFrH24fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6AAF80138;
	Tue, 19 Nov 2019 14:40:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDB06F80138; Tue, 19 Nov 2019 14:40:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C383AF80135
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 14:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C383AF80135
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 05:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; d="scan'208";a="258728313"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2019 05:40:35 -0800
Date: Tue, 19 Nov 2019 15:40:34 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hftikcewy.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1911191539040.16459@zeliteleevi>
References: <20191119084710.29267-1-nmahale@nvidia.com>
 <s5hftikcewy.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nikhil Mahale <nmahale@nvidia.com>, tiwai@suse.com,
 alsa-devel@alsa-project.org, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v3 0/4] ALSA: hda - Add DP-MST support for
 NVIDIA codecs
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

Hi Takashi and Nikhil,

On Tue, 19 Nov 2019, Takashi Iwai wrote:

> OK, you've done in time for 5.5 :)
> Now applied all four patches.
> 
> Kai, please let me know if the intel CI catches any issue with these
> changes.

tests just completed and no issues found so seem good to go.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
