Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45313B685
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 01:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B10917C0;
	Wed, 15 Jan 2020 01:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B10917C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579047741;
	bh=gwnLnlZIe7Ntt8KmsDJ6tmmlF4z91cQNcVq8fX+NkLc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K0gK/8Rt42SWUZNMD9WkBzZ1mgfEAAP655FRetYZ2NlchFLQ4XgBdPLggyMDoyuu6
	 uXk3NJ0niJT1SaPpNW68wDxBaCnhVcy7vyFpuIoAuu0MZyYLz//x9IMBd7c7A75f4h
	 LVyxbP5jKmhpWL+KU5n7LuPzYGPIUB7WNc9dLRmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 548BBF80171;
	Wed, 15 Jan 2020 01:20:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76EFDF8014E; Wed, 15 Jan 2020 01:20:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B31A4F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 01:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B31A4F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 16:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="305317949"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 14 Jan 2020 16:20:29 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 14 Jan 2020 16:20:29 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Jan 2020 08:20:27 +0800
Received: from shsmsx606.ccr.corp.intel.com ([10.109.6.216]) by
 SHSMSX606.ccr.corp.intel.com ([10.109.6.216]) with mapi id 15.01.1713.004;
 Wed, 15 Jan 2020 08:20:27 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard liao
 <yung-chuan.liao@linux.intel.com>
Thread-Topic: [PATCH RFC 0/3] ASoC: Add Multi CPU DAI support
Thread-Index: AQHVu7vGs7YEIgCFr0a5409sqSPTh6fp5lKAgAEVLWA=
Date: Wed, 15 Jan 2020 00:20:27 +0000
Message-ID: <01a9bf523c4b4ab788b7eaada0972459@intel.com>
References: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
 <20200114154739.GA3897@sirena.org.uk>
In-Reply-To: <20200114154739.GA3897@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH RFC 0/3] ASoC: Add Multi CPU DAI support
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
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Tuesday, January 14, 2020 11:48 PM
> To: Bard liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de;
> liam.r.girdwood@linux.intel.com; pierre-louis.bossart@linux.intel.com; Liao,
> Bard <bard.liao@intel.com>; kuninori.morimoto.gx@renesas.com
> Subject: Re: [PATCH RFC 0/3] ASoC: Add Multi CPU DAI support
> 
> On Thu, Dec 26, 2019 at 03:14:58AM +0800, Bard liao wrote:
> > From: Bard Liao <yung-chuan.liao@linux.intel.com>
> >
> > As discussed in [1], ASoC core supports multi codec DAIs on a DAI
> > link. However it does not do so for CPU DAIs.
> 
> This approach seems broadly fine - I see you'd already agreed some updates
> with Morimoto-san which look sensible.

Thanks. I will send 2nd version soon.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
