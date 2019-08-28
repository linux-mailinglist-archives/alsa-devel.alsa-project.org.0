Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C7A1DFF
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5C016CE;
	Thu, 29 Aug 2019 16:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5C016CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090472;
	bh=KXeZmyxl/OWkYFZX0kJqXXWhn9TrvmufFxOKu5XYhy0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTHSeKPtYWucB4lsUqwT22p0i0GJW9SsHeUuCDGUltKRiDP9M8E6aWHVe0oeS+v4T
	 6J949jziXhOJ6lf6RlYGwR6852qBnJAviXEBcIcFKXOXqpRYyLiXoY2oDVNbklKu7N
	 caJ50xe6EkTvWrNy8BT8OHC5BDn5iyBmJmi9S0bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2477F89710;
	Wed, 28 Aug 2019 10:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E112AF8971D; Wed, 28 Aug 2019 10:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77DA7F80377
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 10:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77DA7F80377
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 01:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="183049796"
Received: from nsowell-mobl.ger.corp.intel.com ([10.251.95.12])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2019 01:07:07 -0700
Message-ID: <299537ec845537071481ae1ee2b60acf99dd2602.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Date: Wed, 28 Aug 2019 09:07:03 +0100
In-Reply-To: <20190827202825.GP23391@sirena.co.uk>
References: <20190827202825.GP23391@sirena.co.uk>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

On Tue, 2019-08-27 at 21:28 +0100, Mark Brown wrote:
> If you're planning to attend please fill out the form here:
> 
>     
> https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link
> 
> This event will be covered by the same code of conduct as ELC-E.

I'd like to confirm that there is no conference fee for the audio
miniconference. Delegates do NOT need to register for ELC-E or any
other paid co-hosted conference in order to attend.

Thanks

Liam  

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
