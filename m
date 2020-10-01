Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728827F942
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 08:00:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F16F31889;
	Thu,  1 Oct 2020 07:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F16F31889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601532015;
	bh=Sv0c3pAcY4Vt4EtFo1ZXj24LoHL1Z/6yh3dc/Ba75v8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJtO9SUwDxSHMW9tsRsxIT2glABwUstMbK6ZQVleCBttC7BFgRscHy8pRa4izndjq
	 Pf+6RSRsz+BAvRctFzvMedmTE4rkhLQl1TAq9kPuiAu4RMF3p6ZHJs4c/piQvl9VKl
	 I07mpsd2OGtUqy+1psG9gkOSHCVVmZvpQghWJtCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02807F8020C;
	Thu,  1 Oct 2020 07:58:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BDB4F801F5; Thu,  1 Oct 2020 07:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3B4DF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 07:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B4DF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KeOHILdy"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE0E7221E7;
 Thu,  1 Oct 2020 05:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601531898;
 bh=Sv0c3pAcY4Vt4EtFo1ZXj24LoHL1Z/6yh3dc/Ba75v8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeOHILdy4a6B8Dd/f47RwByzV+jE9Ch/ojh4bGcGjwTHdkoY/w0u87LlkZRLlw2+7
 j6KXjJmt6ASiKGfrNWM3YEty4IQsWydTtzojUnooctpF5LhxIO0TlHnuIvWSa6pWbg
 beonhxoianEbVW6L7nEtuSjysNwaCBj4tfHn74k4=
Date: Thu, 1 Oct 2020 07:58:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001055815.GA25976@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-1-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com
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

On Wed, Sep 30, 2020 at 03:50:45PM -0700, Dave Ertman wrote:
> Brief history of Ancillary Bus 
> ==============================

<snip>

Did you send 2 copies of this?  Which one is the "correct" one to
review?

confused,

greg k-h
