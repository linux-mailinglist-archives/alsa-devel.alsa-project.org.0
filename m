Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27028AEE2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 09:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FD11681;
	Mon, 12 Oct 2020 09:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FD11681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602487013;
	bh=KXlCnAjww9Cl53f+oyvTLefMLYnh5la+hDH4EtgJ3+4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KO0Y6/sPouI690/r9mkvJkP11PU/cv1hbSCcunQfC1ugJ2/6zA5dUTu53xadJzh8X
	 /ZLd7VC10oiTorWkaonLNCrL+/g6LGSzModcUptqWi/kMZODsyrePvIvaqIc9iJus9
	 D40YdZhns0TGUAABu4kd/mfZm/NqK+0SvZWKOEMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFDDF800F6;
	Mon, 12 Oct 2020 09:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 712BDF800F6; Mon, 12 Oct 2020 09:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A834F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 09:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A834F800F6
IronPort-SDR: XNJNJbOYgH1j7kXkOk3MtgwVyoE1jkbhCzlq2nnn9Khdh7NkpyLQpkCyiSEcqtBXX6/hWjbykd
 xDP6iKRjhs4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="164914451"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="164914451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 00:14:57 -0700
IronPort-SDR: 02b3OiT4NsNcwblaPkSL0d50e7vaPF+PjVTxTVYfkcvDdRyjtVQAtZ8N9tcRfZaUZAlUDMYW//
 QeP7Pler8jEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="344762801"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2020 00:14:55 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 08:14:54 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 12 Oct 2020 08:14:54 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: RE: [PATCH 3/8] ASoC: Intel: bytcr_rt5651: use semicolons rather than
 commas to separate statements
Thread-Topic: [PATCH 3/8] ASoC: Intel: bytcr_rt5651: use semicolons rather
 than commas to separate statements
Thread-Index: AQHWn7WtURzHk5OWlUiMvlX21d63/KmTjtkw
Date: Mon, 12 Oct 2020 07:14:54 +0000
Message-ID: <225ad3480553428bbf50e34322c8688a@intel.com>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
 <1602407979-29038-4-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-4-git-send-email-Julia.Lawall@inria.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="windows-1257"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 =?windows-1257?Q?Valdis_Kl=E7tnieks?= <valdis.kletnieks@vt.edu>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark
 Brown <broonie@kernel.org>, Joe
 Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 2020-10-11 11:19 AM, Julia Lawall wrote:
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
>=20
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks,
Czarek

> ---
>   sound/soc/intel/boards/bytcr_rt5651.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boar=
ds/bytcr_rt5651.c
> index 688b5e0a49e3..64d3fc4a3225 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -143,7 +143,7 @@ static int byt_rt5651_prepare_and_enable_pll1(struct =
snd_soc_dai *codec_dai,
>  =20
>   	/* Configure the PLL before selecting it */
>   	if (!(byt_rt5651_quirk & BYT_RT5651_MCLK_EN)) {
> -		clk_id =3D RT5651_PLL1_S_BCLK1,
> +		clk_id =3D RT5651_PLL1_S_BCLK1;
>   		clk_freq =3D rate * bclk_ratio;
>   	} else {
>   		clk_id =3D RT5651_PLL1_S_MCLK;
>
