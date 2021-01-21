Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E32FF209
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:35:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127AB18F5;
	Thu, 21 Jan 2021 18:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127AB18F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611250504;
	bh=L5DkhkxJM6IGUlV5gdyZTzIxelOI6K4ktE4IzljMzAg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XsfjLN6P51sQjFI7VfOeMTfeYouwGqygCP4nHPVww19LF9by723KjWs7BSq/5iJaT
	 jYkaYxFvR0gluX/7KPZ0keuxu33/CA87QSu/hiul+S1oeLJ0Uw51237u9UFwKCaIEl
	 shKuQq6fXLXlZBymoiLHiLQmUMytBMUtFJXcyX9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B76DF8026A;
	Thu, 21 Jan 2021 18:33:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2413DF80257; Thu, 21 Jan 2021 18:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05F63F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F63F80125
IronPort-SDR: FbrcQL0aT3Hun9l3M67bAQLpbAdrKfkGhJ434u6Pdgn25uRzlXbDel6/4AOGIRKdqiYRszs70B
 /AwIg37T4m8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166979833"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="166979833"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 09:33:15 -0800
IronPort-SDR: GShjbow07A9DaZj6VOIn/ssj+PdgcHN9oL4rgXfIHJGW7JTfLAUqiLbxFc1cuDUH3JokcsCYZV
 ypdUVDnZgNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="354846464"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2021 09:33:12 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Jan 2021 17:33:11 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 21 Jan 2021 17:33:11 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: RE: [PATCH v2 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Thread-Topic: [PATCH v2 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Thread-Index: AQHW8Bk4t64Bz53R0UWGbQi6OPDjnqoyVk5Q
Date: Thu, 21 Jan 2021 17:33:11 +0000
Message-ID: <bb5edb634f69421a87143d3962e67d30@intel.com>
References: <20210121171644.131059-1-ribalda@chromium.org>
In-Reply-To: <20210121171644.131059-1-ribalda@chromium.org>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark
 Brown <broonie@kernel.org>, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Lukasz Majczak <lma@semihalf.com>
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

On 2021-01-21 6:16 PM, Ricardo Ribalda wrote:
> If dobj->control is not initialized we end up in an OOPs during
> skl_tplg_complete:
>=20
> [   26.553358] BUG: kernel NULL pointer dereference, address:
> 0000000000000078
> [   26.561151] #PF: supervisor read access in kernel mode
> [   26.566897] #PF: error_code(0x0000) - not-present page
> [   26.572642] PGD 0 P4D 0
> [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> 5.4.81 #4
> [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> Google_Soraka.10431.106.0 12/03/2019
> [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]
>=20
> Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configu=
ration according to information from NHL")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks for the fix, Ricardo.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

