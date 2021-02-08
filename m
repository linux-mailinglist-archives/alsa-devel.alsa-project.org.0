Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7A312D66
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 10:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48AE91671;
	Mon,  8 Feb 2021 10:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48AE91671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612777063;
	bh=vwxXBve31JPAe8+xft1BtxTpk402y0gUkvbMJpDnZ0Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fj5Pxb8IXdUu+hqzkSWJLoe58Sn0kkPgEq5IQ+7W4pqy8/feaD7fahan7vCY0QC4W
	 K/fripfzow7A9Dk7V4szpNoul68CbaiQoplYEVr2xRCkxOsMgzIzP/3Lwmd/LnD/nh
	 lCseXFGengbZs/fLYmVSjrM8SZKL1NWuG5U7iS/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F525F8022D;
	Mon,  8 Feb 2021 10:36:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69627F80165; Mon,  8 Feb 2021 10:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB9EEF80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 10:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB9EEF80165
IronPort-SDR: i6omY5T6OdZNm7Msa7y5ZLhazyH72IK4F2FhA956fPkQhOD2/D5l7eU0Fb5DypKc3aWrlvOM98
 gUSViYpWYArw==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="266517715"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="266517715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 01:36:01 -0800
IronPort-SDR: XDVjrp4P5QAqfQOPEJQH/YcXt/rh1mvgfPBB9XfuQoEhv+JsLpp0a5TEGQ62gENvfYvX7fTsOy
 BPwgsOqE2o6Q==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="395315994"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 01:35:59 -0800
Date: Mon, 8 Feb 2021 11:32:34 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH] ASoC: SOF: debug: Fix a potential issue on string buffer
 termination
In-Reply-To: <20210208072257.73900-1-hui.wang@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2102081129280.864696@eliteleevi.tm.intel.com>
References: <20210208072257.73900-1-hui.wang@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
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

On Mon, 8 Feb 2021, Hui Wang wrote:

> The function simple_write_to_buffer() doesn't add string termination
> at the end of buf, we need to add it on our own if calling that
> function to write the size of count chars to buf. This change refers
> to the function tokenize_input() in debug.c and the function
> sof_dfsentry_trace_filter_write() in trace.c.
[...]
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -352,9 +352,10 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
>  	char *string;
>  	int ret;
>  
> -	string = kzalloc(count, GFP_KERNEL);
> +	string = kzalloc(count+1, GFP_KERNEL);

ouch, good catch, thanks! We have this correct in soc/sof/trace.c, but not 
here. To keep up with kernel style, maybe:

+	string = kzalloc(count + 1, GFP_KERNEL);

>  	if (!string)
>  		return -ENOMEM;
> +	string[count] = '\0';

kzalloc() returns zeros, so no need for this.

Br, Kai
