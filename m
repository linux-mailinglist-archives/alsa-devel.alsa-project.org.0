Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B03CDE11
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 11:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B90D91612;
	Mon,  7 Oct 2019 11:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B90D91612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570439701;
	bh=Tv1OfQKCpT7AqgmGVniL3+0b7Ije/qKQsvfcyYKbtAY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ANpK9V6R2DIRPH9BCywqQsSMbjYde1q1aIQPNfps0D7K2T1ohqyzqBFA8XH25P88a
	 g0f/+SjsrASHo6Wx/1ziVSb/OdK3aBb1a0js6HPRDsKlCYQ4vrux+w7O/SUrxv3Ha5
	 lLh9BfWr7mZx6/V5BhXkA+ZxlMrvS+MbdqMrtbts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 085DFF802BE;
	Mon,  7 Oct 2019 11:13:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31590F802BE; Mon,  7 Oct 2019 11:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F01F80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 11:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F01F80137
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 02:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,267,1566889200"; d="scan'208";a="217899598"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.41.73])
 by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2019 02:13:09 -0700
Date: Mon, 7 Oct 2019 11:13:07 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Message-ID: <20191007091307.GA7941@ubuntu>
References: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 0/2] [RFC] ASoC: topology: fix access
 beyond data
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

Sorry, I missed a couple of Cc, it was the first time I used
git send-email from this PC.

Thanks
Guennadi

On Mon, Oct 07, 2019 at 10:41:31AM +0200, Guennadi Liakhovetski wrote:
> This is likely incomplete, I haven't reviewed the whole of the
> topology parsing code, and I haven't tested this yet - neither for
> actually being a problem without these patches nor for fixing them.
> This is a preview to give everybody a chance to showt out if I
> misunderstood something and there isn't actually a problem to be
> fixed.
> 
> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (2):
>   ASoC: topology: protect against accessing beyond loaded topology data
>   ASoC: topology: don't access beyond topology data
> 
>  sound/soc/soc-topology.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> -- 
> 1.9.3
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
