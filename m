Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56227BD79
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6B91717;
	Wed, 31 Jul 2019 11:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6B91717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564566137;
	bh=6GekoFC8c7q7J5VHAwZ8lXW+HZb0A/iQhpzKkTtxF+U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPr8piRvvfDC3CAsygEGCBhqHYrdefblKdrXSVFsKD/TshL0bDUFaAWeJLu3tYmad
	 WNFV1ITU/4+nzH4+uUbASatBRaubPcUebFtaC4liiAPsCvKqJN7n/phNjbndhlhAKq
	 ZCwWTsgQnSSamGUxp5ERKhJvjcmSb6rL4gpGjUFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A69F80533;
	Wed, 31 Jul 2019 11:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 580ECF8048D; Wed, 31 Jul 2019 11:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2151FF800C0;
 Wed, 31 Jul 2019 11:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2151FF800C0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 02:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="177254567"
Received: from wmasilun-mobl.ger.corp.intel.com ([10.251.89.117])
 by orsmga006.jf.intel.com with ESMTP; 31 Jul 2019 02:32:00 -0700
Message-ID: <5c835d3ee9b2dcb4bfcbd0af5b68e09401ee8bf1.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org
Date: Wed, 31 Jul 2019 10:32:00 +0100
In-Reply-To: <CAEnQRZBPnmg6c762+CjXBmsW8=aVfL9iJJgV_7VRjgaNMf-Srw@mail.gmail.com>
References: <CAEnQRZBPnmg6c762+CjXBmsW8=aVfL9iJJgV_7VRjgaNMf-Srw@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Audio miniconf + sof meeting at ELCE, Lyon
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

On Tue, 2019-07-30 at 23:04 +0300, Daniel Baluta wrote:
> Hi Mark, Pierre, Liam, Ranjani,
> 
> Will you be in Lyon for ELCE this year? I'm very interested in
> participating
> to an (eventual) audio miniconf meeting. Maybe we can also do a
> separate
> SOF meeting if they are enough people interested.

Yes, Mark is planning the audio conf, we are looking at ELCE or
gstreamer.

I'm now getting costs and availability from the Linux Foundation so we
should hopefully have an update soon.

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
