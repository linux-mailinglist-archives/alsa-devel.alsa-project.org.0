Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB7F2B6854
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 16:10:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6581B1789;
	Tue, 17 Nov 2020 16:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6581B1789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605625848;
	bh=JygdgZukTxECYYHDTqgW9sWRMjPieNIgHl60sXBRv+4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PwQ+Ko0cgx95t2cTPzfkK/WNGTN66jHxOW/78s4M/lgZ9ZbC6QSgg1RiGbeA5x28U
	 1y/Qm6PnCNHNhQeP1euC85OWhG59vrOfYup8kwUOvSNL6EvbWfFH6toxM4ud9fYvSW
	 yoR25XqTBxb2wR5csgsfffT+JQFlkZHxFbcExe48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F5DF801F9;
	Tue, 17 Nov 2020 16:09:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DA45F801F5; Tue, 17 Nov 2020 16:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7599CF800FE;
 Tue, 17 Nov 2020 16:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7599CF800FE
IronPort-SDR: LxXmK6B/hxfNFDbQJXAmsTgWTOC9MU5MBIZr4N3Wav31SEibdWYMiOlLY5IDCWtoMVvYa07Dbx
 +JgIUgxzjUgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170156027"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="170156027"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 07:08:44 -0800
IronPort-SDR: otD5Lqb1Gl0rh2+AYmow3TKjnNQJ45IZIgJGW3bGi5E9hgX7lJqR8PG0sMqjRLjcZBMHF276hV
 4nkBfez/Jzmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="310239693"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2020 07:08:43 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 15:08:42 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 17 Nov 2020 15:08:42 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: Intel: catpt: select WANT_DEV_COREDUMP
Thread-Topic: [PATCH v2] ASoC: Intel: catpt: select WANT_DEV_COREDUMP
Thread-Index: AQHWvPKtaHU9bHZ2V0aVxp0N96mzhanMbLqg
Date: Tue, 17 Nov 2020 15:08:42 +0000
Message-ID: <50823438bf95492d97fbf1d46471e2c4@intel.com>
References: <20201117145223.21222-1-gustaw.lewandowski@linux.intel.com>
In-Reply-To: <20201117145223.21222-1-gustaw.lewandowski@linux.intel.com>
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
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "patch@alsa-project.org" <patch@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
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


On 2020-11-17 3:52 PM, Gustaw Lewandowski wrote:
> From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
>=20
> Select WANT_DEV_COREDUMP for catpt driver.
>=20
> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
>=20

Thanks for this update, Gustaw.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> --
> Changes in v2:
>   - change should be added to catpt only
> ---
>   sound/soc/intel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index a5b446d5af19..52ae7c981f56 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -24,6 +24,7 @@ config SND_SOC_INTEL_CATPT
>   	depends on DMADEVICES && SND_DMA_SGBUF
>   	select DW_DMAC_CORE
>   	select SND_SOC_ACPI_INTEL_MATCH
> +	select WANT_DEV_COREDUMP
>   	help
>   	  Enable support for Intel(R) Haswell and Broadwell platforms
>   	  with I2S codec present. This is a recommended option.
>
