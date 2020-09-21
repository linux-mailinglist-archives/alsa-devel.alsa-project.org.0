Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58998271F6C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 11:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB37816F5;
	Mon, 21 Sep 2020 11:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB37816F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600682254;
	bh=AoI45OvIFC4qWOb2gXT96ZTz9cOMo+8SXrggdHzuyEU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICRcq3CCinlwqcO99JWxf5AhlN6hPrNN+UHBr3z0UlXYy4WBg746Ji3msB8avTm91
	 tUz1/MBdMcMwsN2WKtqdxHCbB/gZDUzzGup2KJfVzHGmJvYYAOLInusk8YGyYjz6g0
	 zGBPe55dVCt34WqKaMBkgVbychueF3bkZacHYXs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEC7BF80171;
	Mon, 21 Sep 2020 11:55:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68509F80162; Mon, 21 Sep 2020 11:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8F8F80161;
 Mon, 21 Sep 2020 11:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8F8F80161
IronPort-SDR: YF2hHiy3jj0xb4YCH9l6B3ebc1YSkMgyCNtmSNF6PZMCdBYPNgRhmbu5tzazB1Q41xmcsgJzYW
 7lYkVY8ixIag==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="139840594"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="139840594"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 02:55:40 -0700
IronPort-SDR: 5pS+3OTqcGwRoofohZAZRPWqf0r51mBwTY7ooc2B/qOr2gbok973eUgfRpKGnGy7MLVc2ZCvnF
 NKM/ND0yFwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485374493"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga005.jf.intel.com with ESMTP; 21 Sep 2020 02:55:38 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 10:55:37 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 10:55:37 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2 1/1] ALSA: hda: Refactor calculating SDnFMT according
 to specification
Thread-Topic: [PATCH v2 1/1] ALSA: hda: Refactor calculating SDnFMT according
 to specification
Thread-Index: AQHWj/t3up0E11kPTUWZdF9M2bApCqly2aZw
Date: Mon, 21 Sep 2020 09:55:37 +0000
Message-ID: <e485b06debb24806b7b921d53f7197ea@intel.com>
References: <20200921094200.10126-1-pawel.harlozinski@linux.intel.com>
In-Reply-To: <20200921094200.10126-1-pawel.harlozinski@linux.intel.com>
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
Cc: "patch@alsa-project.org" <patch@alsa-project.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "tiwai@suse.de" <tiwai@suse.de>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>
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

On 2020-09-21 11:42 AM, Pawel Harlozinski wrote:
> Fix setting SDnFMT based on High Definition Audio Specification Rev. 1.0a=
 page 48.
>=20
> Bits per Sample (BITS):
> 000 =3D 8 bits. The data will be packed in memory in 8-bit containers on =
16-bit boundaries.
> 001 =3D 16 bits. The data will be packed in memory in 16-bit containers o=
n 16-bit boundaries.
> 010 =3D 20 bits. The data will be packed in memory in 32-bit containers o=
n 32-bit boundaries.
> 011 =3D 24 bits. The data will be packed in memory in 32-bit containers o=
n 32-bit boundaries.
> 100 =3D 32 bits. The data will be packed in memory in 32-bit containers o=
n 32-bit boundaries.
> 101-111 =3D Reserved
>=20
> Set SDnFMT depending on which format was given.
> Henceforth split cases for formats 20, 24, 32 bits,
> but leave constraints to maxbps.
>=20
> Change-Id: I97771b16da14e85b7f35372f5dfc87bb13bb5ce0

Hello,

checkpatch script should have notified you about need for removing Change-I=
d.
Please remove for the next version.

Has there been any explanation for why v2 is sent and what changes have
been made between v1 and v2?

Czarek

> Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
> ---
>   sound/hda/hdac_device.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>=20
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index 3e9e9ac804f6..ccc47a10ba63 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -764,7 +764,14 @@ unsigned int snd_hdac_calc_stream_format(unsigned in=
t rate,
>   		val |=3D AC_FMT_BITS_16;
>   		break;
>   	case 20:
> +		val |=3D AC_FMT_BITS_20;
> +		break;
>   	case 24:
> +		if (maxbps >=3D 24)
> +			val |=3D AC_FMT_BITS_24;
> +		else
> +			val |=3D AC_FMT_BITS_20;
> +		break;
>   	case 32:
>   		if (maxbps >=3D 32 || format =3D=3D SNDRV_PCM_FORMAT_FLOAT_LE)
>   			val |=3D AC_FMT_BITS_32;
>
