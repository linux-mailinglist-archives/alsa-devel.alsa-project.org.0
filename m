Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A5264579
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 13:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0794716A5;
	Thu, 10 Sep 2020 13:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0794716A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599738621;
	bh=ay7Oc5MXNkm+A3Xz2IioKeMPmZMuiNud9yJDzVxJlsM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4SCzVhcKy+3pUIi9Kcw781MXwx3mWKTgOYTrZmX0MyWelEsJ2gwrpffnOwxXn+u/
	 qM35g5Dis1NInmvlHIvRY8XOduhCClyM+zYK3TD4SzBrg6D8CRGaucz9N3OT/QwwHv
	 mVhK8X5a2WlRmhsGQvxxUFwWkypN961/Tt89UhwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E92F80264;
	Thu, 10 Sep 2020 13:48:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10249F80264; Thu, 10 Sep 2020 13:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,PRX_BODY_78,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90C5AF800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 13:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C5AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yKPwhijj"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08ABmO8J012283;
 Thu, 10 Sep 2020 06:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599738504;
 bh=6jXN41owsQkqsPUgUeLs6Kr1LT6oT1LgW/jEegF3hxQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yKPwhijjIn6wJN3KhiKxMSekWM8uy3d9rUtmhxEsx/yjebkHCHMjX+ghOW5MUa1Re
 E9S6X4Rq7L7l52tK9HqS2QjM2m4mKDuDfTym2/Qz/LgqPoe+/DNJLr9w+zFVH0yPJ7
 bmGXvRedm1d7r/kphjXMMMrdvZ37KpiihvqSe/ko=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ABmOLa063819;
 Thu, 10 Sep 2020 06:48:24 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 06:48:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 06:48:24 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ABmMEP121190;
 Thu, 10 Sep 2020 06:48:22 -0500
Subject: Re: [PATCH 2/2] ASoC: ti: j721e-evm: Add support for j7200-cpb audio
To: kernel test robot <lkp@intel.com>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <robh+dt@kernel.org>
References: <20200910075433.26718-3-peter.ujfalusi@ti.com>
 <202009101750.MT0BQY74%lkp@intel.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <e32444ee-542d-1daf-0fa3-be4d280aef35@ti.com>
Date: Thu, 10 Sep 2020 14:48:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <202009101750.MT0BQY74%lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
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

Hi,

On 10/09/2020 12.54, kernel test robot wrote:
> Hi Peter,
>=20
> I love your patch! Perhaps something to improve:
>=20
> [auto build test WARNING on asoc/for-next]
> [also build test WARNING on v5.9-rc4 next-20200909]
> [If your patch is applied to the wrong git tree, kindly drop us a note.=

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    https://github.com/0day-ci/linux/commits/Peter-Ujfalusi/ASoC-ti=
-j721e-evm-Support-for-j7200-variant/20200910-155534
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.g=
it for-next
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dm68k=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
>>> sound/soc/ti/j721e-evm.c:532:3: warning: this decimal constant is uns=
igned only in ISO C90
>      532 |   [J721E_CLK_PARENT_48000] =3D 2359296000, /* PLL4 */
>          |   ^
>=20
> # https://github.com/0day-ci/linux/commit/63afa4709f3914bb58dd727c1119c=
447a23ce150
> git remote add linux-review https://github.com/0day-ci/linux
> git fetch --no-tags linux-review Peter-Ujfalusi/ASoC-ti-j721e-evm-Suppo=
rt-for-j7200-variant/20200910-155534
> git checkout 63afa4709f3914bb58dd727c1119c447a23ce150
> vim +532 sound/soc/ti/j721e-evm.c
>=20
>    527=09
>    528	static const struct j721e_audio_match_data j7200_cpb_data =3D {
>    529		.board_type =3D J721E_BOARD_CPB,
>    530		.num_links =3D 2, /* CPB pcm3168a */
>    531		.pll_rates =3D {
>  > 532			[J721E_CLK_PARENT_48000] =3D 2359296000, /* PLL4 */

struct j721e_audio_match_data {
	enum j721e_board_type board_type;
	int num_links;
	unsigned int pll_rates[2];
};

pll_rates _is_ unsigned int.

>    533		},
>    534	};
>    535=09
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20

- P=E9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

