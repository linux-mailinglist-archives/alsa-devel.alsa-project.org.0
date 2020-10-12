Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382D28AF06
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 09:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D86A11681;
	Mon, 12 Oct 2020 09:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D86A11681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602487564;
	bh=HPYpxgkhwOC+x02K4W2kgXRfQvCJvl6rLyXvrMerH3A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jh2l8cSpgBAh04z+zCqHExPSyajLgjbi9fbY/bJ9uC4DT6pHql3k3VWC3kKAzBmWx
	 H2vq5oU0LYLt8q44hlVoWVuw7C8zi80CjvGP+Bz2d6NJLAbPmK/7jXGoPbN2Gd8t1+
	 7z5ufn8ePzNyxrHW03lm9qUIGftF5KwWWSG01Izo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B80F8020D;
	Mon, 12 Oct 2020 09:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F423FF80217; Mon, 12 Oct 2020 09:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 960D0F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 09:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 960D0F800F6
IronPort-SDR: TqxS2kOLfmeDYABugeTV0skbkfEqboiCWq6yYYn3iLX3kKAyI4NGTobQ5aQ5UVOzfFC9Xg9kfQ
 0cznKRLEtejw==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="165813901"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="165813901"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 00:24:14 -0700
IronPort-SDR: sSB1rynMRBPonlGLnBWs4y6I6l1fsmi0ueT4LCY49qN20fg/VrgjbOUgBC0SxXGNKVp8zTic63
 Z8ZcISmrcuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="344766927"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2020 00:24:12 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 08:24:12 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 12 Oct 2020 08:24:12 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: RE: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
Thread-Topic: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
Thread-Index: AQHWn7Rwuj7kFXmqX0ujyMeVn0Z2aKmTkUZA
Date: Mon, 12 Oct 2020 07:24:11 +0000
Message-ID: <b92b6b6d382048829a37ae803d4f9451@intel.com>
References: <20201011095346.49589-1-hdegoede@redhat.com>
In-Reply-To: <20201011095346.49589-1-hdegoede@redhat.com>
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
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2020-10-11 11:53 AM, Hans de Goede wrote:
> The legacy 80860F28 / sst_acpi_baytrail_desc match in sst_acpi_match
> is already conditional on the the newer SND_SST_IPC_ACPI driver not
> being enabled.
>=20
> But now that we have an even newer driver in the form of SOF support
> for BYT devices, we also need to take this into account, so we also
> must not include the sst_acpi_baytrail_desc match when
> SND_SOC_SOF_BAYTRAIL is enabled.
>=20
> This fixes snd-soc-sst-acpi binding to the 80860F28 platform device,
> blocking snd-sof-acpi from binding, which breaks audio support.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Hello,

Series:
[PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and components
https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@i=
ntel.com/

removes sst-acpi component along with many others so further changes to
said component will only cause conflicts -or- require commit reordering.
I'd advice against that.

Thanks,
Czarek

