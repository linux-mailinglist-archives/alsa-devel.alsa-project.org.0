Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2FD2FF20A
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:35:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BC25190D;
	Thu, 21 Jan 2021 18:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BC25190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611250551;
	bh=p2Wl8GpqE6d4Y6JHMeeRrWpSjYTGbIPRYjQqPty2+eo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3cQ7WWotVq3l6wVFnO4wS4BTOo2YBTc0KR4XBeE98f82jKmtOsFjQZe7iQOgUgPE
	 r4nTNHwKzFMoJsKmkSViZk1gXWS+KGgADV+m4j3Pq9bJpYG/I1XpB07oLyDnuM660v
	 ga1PX4Z4ZE0eBij8XOwH1mmLif/jWLH3N4fcd6+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B31C7F80273;
	Thu, 21 Jan 2021 18:35:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BBE1F80272; Thu, 21 Jan 2021 18:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PDS_BAD_THREAD_QP_64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09313F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09313F80125
IronPort-SDR: fPmRmfX/NK0C4ZvWgOKB3Yft/EZbyAU8+LmaAM1emrkox8Azrl9FXGjEfBeetshHAn0n9mtIgi
 AYk1d+ck7LhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166406977"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="166406977"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 09:34:48 -0800
IronPort-SDR: okOxonF+6uWkGLGISoNEO/KJa5uvFvaO8hFDVZbP8SoV/mpAUjR54m8JXzrsUXf5nxy8bt7fG4
 hlWy+Ri29AOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="467527245"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2021 09:34:46 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Jan 2021 17:34:45 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 21 Jan 2021 17:34:45 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: RE: [PATCH v2 2/2] ASoC: Intel: Skylake: Zero snd_ctl_elem_value
Thread-Topic: [PATCH v2 2/2] ASoC: Intel: Skylake: Zero snd_ctl_elem_value
Thread-Index: AQHW8Bk4ltU3amcxfkyZEse4eO7dYaoyVvrQ
Date: Thu, 21 Jan 2021 17:34:45 +0000
Message-ID: <b0097763cee24ba897dee59908730ddc@intel.com>
References: <20210121171644.131059-1-ribalda@chromium.org>
 <20210121171644.131059-2-ribalda@chromium.org>
In-Reply-To: <20210121171644.131059-2-ribalda@chromium.org>
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
> Clear struct snd_ctl_elem_value before calling ->put() to avoid any data
> leak.
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks,
Czarek

