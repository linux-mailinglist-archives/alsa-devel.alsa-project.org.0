Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651482FF8BE
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 00:25:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91AE1947;
	Fri, 22 Jan 2021 00:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91AE1947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611271540;
	bh=fE29ZU9xUc65IaHyZAbNQpBhZlbrpyG9SmcIMsqCej4=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OyQaHM+3DDnPqzpRcYZFdrYef4mbPeK8v7K9KQafSXd49rzbXVLP0K+Y1Hp/IBfBL
	 4TLHER6YGmorZcI17ON+ROGli4JzfjBu4svSjfHaQStFjsMj8u+YwTxoG1fkW+pCos
	 GZ7n89VSd4OjQZUky0cabR34fmUSjR9Cr7jFDvLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EBADF8026A;
	Fri, 22 Jan 2021 00:24:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA69AF80257; Fri, 22 Jan 2021 00:24:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3226DF80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 00:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3226DF80125
IronPort-SDR: iPwo9VbAfWjvOejGYH9JIxxDsVSafbhk9Jasos0fhxFoy5BiC1HtToREVlsRqRDXNWPoPIBSub
 Ek3YXjRHH0uA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166460602"
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; d="scan'208";a="166460602"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 15:23:54 -0800
IronPort-SDR: gGvhPc9aMCM+exdjEbkBn4wiFDdIgMF1LgW3Uuqjkara82qm60lRuHf9EhMGJQhZXqigJwWxAZ
 EjmKkvzojBAw==
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; d="scan'208";a="570895813"
Received: from skameswa-mobl2.amr.corp.intel.com ([10.212.215.135])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 15:23:54 -0800
Message-ID: <aca60b522335f3f916f9f8f204693365bfc32231.camel@linux.intel.com>
Subject: Question about hdac_ext_link ref_count management
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de
Date: Thu, 21 Jan 2021 15:23:53 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@linux.intel.com
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

Hi Takashi,

While exploring some power optimizations on Intel platforms, I noticed
that the hdac_ext_link ref_count is incremented during codec probe
in hdac_hda_codec_probe() and the ref_count is held until the codec
device is removed. 

I was wondering if it would be possible to call the get/put for the
hdac_ext_link in the codec runtime suspend/resume callbacks so that the
link is powered up only when the link is in use. Are there any
downsides to doing this? 

Thanks,
Ranjani

