Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D4BF9A9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 20:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3DD176F;
	Thu, 26 Sep 2019 20:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3DD176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569524069;
	bh=eKehrA/JqxXsv3G87oYmOLfC3lXwxYOSm2POTEhHiGo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TYP+emxUdc5VTZvxGT9FOdQnj7iYoDg7PxKEtScOnmDpLBigZGtgCPiLn5oEoBzIX
	 +OE0NBm6OIOIqCXOlYExEijyh6rRqoCoQVZCBFbJS0Ih+6e2sam97KdYC9cA7YwvWX
	 D/V3P4L6QUTFZqOPyXX9x2DsfOXkda1iecNR42hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E07F803F4;
	Thu, 26 Sep 2019 20:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A7FBF803F4; Thu, 26 Sep 2019 20:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20E50F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 20:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E50F80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 11:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; d="scan'208";a="364893207"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga005.jf.intel.com with ESMTP; 26 Sep 2019 11:52:35 -0700
Received: from orsmsx122.amr.corp.intel.com (10.22.225.227) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Sep 2019 11:52:34 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.5.5]) by
 ORSMSX122.amr.corp.intel.com ([169.254.11.236]) with mapi id 14.03.0439.000;
 Thu, 26 Sep 2019 11:52:34 -0700
From: "Nujella, Sathyanarayana" <sathyanarayana.nujella@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH] ALSA: hda - Force polling mode on CML for fixing codec
 communication
Thread-Index: AQHVcpy8gLXsGh1qSkCAzu2uoJZBM6c60zOAgANv1oA=
Date: Thu, 26 Sep 2019 18:52:34 +0000
Message-ID: <B59C050F2745CE469A58C94E1F1EFE277E791670@ORSMSX103.amr.corp.intel.com>
References: <1569303443-6838-1-git-send-email-sathyanarayana.nujella@intel.com>
 <s5hpnjqjjeq.wl-tiwai@suse.de>
In-Reply-To: <s5hpnjqjjeq.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>, "Toh,
 Joyce" <joyce.toh@intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - Force polling mode on CML for
 fixing codec communication
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

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Monday, September 23, 2019 11:30 PM
> To: Nujella, Sathyanarayana <sathyanarayana.nujella@intel.com>
> Cc: broonie@kernel.org; alsa-devel@alsa-project.org;
> liam.r.girdwood@linux.intel.com; pierre-louis.bossart@linux.intel.com; yung-
> chuan.liao@linux.intel.com; N, Harshapriya <harshapriya.n@intel.com>; Toh,
> Joyce <joyce.toh@intel.com>
> Subject: Re: [PATCH] ALSA: hda - Force polling mode on CML for fixing codec
> communication
> 
> 
> Could you confirm that this workaround is still necessary for the latest code?
> We switched to the write-sync on the recent Intel chips, and this may already
> cover such errors.
> 
> 
> thanks,
> 
> Takashi

Thank you.  We cross checked with latest code and specifically applied the below commit: 
ALSA: hda - Fix intermittent CORB/RIRB stall on Intel chips

Now, we see suspend & resume time significantly reduced. 
So, current WA patch is not needed.

BR
Sathya

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
