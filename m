Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3882A2669
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 09:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D1616E9;
	Mon,  2 Nov 2020 09:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D1616E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604307224;
	bh=e7lMxcRPy5hxc7KPFQW8PvwjYTPhIv4mmBa2lo1n65A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLPLwBxIX4tG/jJgqbkdSF/3XQarUCbmot12U6R4n/V3Zkzs3hwBbkvnfIsqsDbDY
	 fmLjSzwWsV0gN6LHxFiNWlb2VFsfwwBcbHIutB97+GIYdf7EmfUmRv4OJm4h1XyxT2
	 3qNrW9Es/RMlt+mPDksuwTbDY78/d+G6ljFB551A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69204F80229;
	Mon,  2 Nov 2020 09:52:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39546F80232; Mon,  2 Nov 2020 09:52:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80B25F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 09:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B25F80083
IronPort-SDR: 1aeN7gkFdc4GbTpD4HEoFBT6dHGQfi/fVXhlr2i5OIwqDaztKNnq36QKVcVqX3NxBAJQzN25eI
 564kPG+4y1fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="230485799"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="230485799"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 00:51:58 -0800
IronPort-SDR: Ez6aIQ88DZfasGjDz8/CO+SfAG1BU447CU6ekVYNghUvD70LlB1zKi74SM8gPJyaZPt1qVVP+Y
 OcwmdeenYW4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; d="scan'208";a="425930387"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2020 00:51:56 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 08:51:55 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 2 Nov 2020 08:51:55 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: "trix@redhat.com" <trix@redhat.com>
Subject: RE: [PATCH] ASoC: Intel: remove unneeded semicolon
Thread-Topic: [PATCH] ASoC: Intel: remove unneeded semicolon
Thread-Index: AQHWsHM3jEYvSMjE+0qRlXlim9MAEKm0iYAg
Date: Mon, 2 Nov 2020 08:51:55 +0000
Message-ID: <020eb49a79794823954f4a5885374ab3@intel.com>
References: <20201101171943.2305030-1-trix@redhat.com>
In-Reply-To: <20201101171943.2305030-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

On 2020-11-01 6:19 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> A semicolon is not needed after a switch statement.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Thanks for this update, Tom.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Regards,
Czarek

