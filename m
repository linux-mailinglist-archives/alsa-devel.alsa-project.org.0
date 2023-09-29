Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0741E7B3206
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 14:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1003AA4E;
	Fri, 29 Sep 2023 14:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1003AA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695989188;
	bh=VJMaG13OJcHThIk080sju328yDFylyW8tGrNgtZsgxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MsLRyypvB6cIIn0qooLZQaFaZVaDnOmJc4QKdF7U2fKMw0BNvI0+L+u4a+Zd2WeHB
	 vkTxt4e//rxTQLnlGWrTbCDlCSrID5GvnyKTLdprF6pD2iV7jvIXnZxu4p7WH5KCp2
	 +2SIYLQ8ePw0k92ZmEoxDxjZVR2h3lX5fK4MiFVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4492AF8016A; Fri, 29 Sep 2023 14:05:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3487F8016A;
	Fri, 29 Sep 2023 14:05:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD90F801D5; Fri, 29 Sep 2023 14:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86DDDF8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 14:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86DDDF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FQw+6MoB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695989119; x=1727525119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VJMaG13OJcHThIk080sju328yDFylyW8tGrNgtZsgxo=;
  b=FQw+6MoB5zuIJgF1QRio/0boN1SJ0D3neNhh0xpUnf0FNwRjDUJyUZ8Z
   Q0G21vQYdv+LuOnhoZx/bg9GjVp5liz4Mg5jISQZPMlRJosURO+xGQJpJ
   gyGjgvKeAjS73NMEGfQO4YHgfYEklmFsTjeUnY/BgTHtY0f5TO9hflLru
   llcTsf9kur3wMAWivmuVT7pBagoTS8BTcIykLw3kVypKrNRgMp8DMnRQW
   l5PSoIyCQH930q2ilwSuYvlE+Eqo2L1kdpSc4YPNbo8lSXEV2ntv1VFo9
   m2Ya3Dfe1JaTPqB66JEB7w8t0hPHEo9mrBsKbsEf04Z5zIF5zBatx6egP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="385099135"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="385099135"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 05:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="820192781"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="820192781"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Sep 2023 05:05:05 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmCEx-0002q2-0n;
	Fri, 29 Sep 2023 12:05:03 +0000
Date: Fri, 29 Sep 2023 20:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <202309291924.OBfdyhXb-lkp@intel.com>
References: <20230928070652.330429-26-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928070652.330429-26-herve.codina@bootlin.com>
Message-ID-Hash: 4BGIODUS72RL6HF4S7GUULNZ6P7VS6YT
X-Message-ID-Hash: 4BGIODUS72RL6HF4S7GUULNZ6P7VS6YT
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BGIODUS72RL6HF4S7GUULNZ6P7VS6YT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-tsa-Fix-__iomem-addresses-declaration/20230928-151746
base:   linus/master
patch link:    https://lore.kernel.org/r/20230928070652.330429-26-herve.codina%40bootlin.com
patch subject: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291924.OBfdyhXb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291924.OBfdyhXb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: 'oneOf' conditional failed, one must be fixed:
   	'type' is a required property
   		hint: A vendor boolean property can use "type: boolean"
   	Additional properties are not allowed ('default', 'enum' were unexpected)
   		hint: A vendor boolean property can use "type: boolean"
   	Additional properties are not allowed ('default' was unexpected)
   		hint: A vendor string property with exact values has an implicit type
>> 	Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: 'oneOf' conditional failed, one must be fixed:
   		'$ref' is a required property
   		'allOf' is a required property
   		hint: A vendor property needs a $ref to types.yaml
   		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
   	2048000 is not of type 'string'
   		hint: A vendor string property with exact values has an implicit type
   	4096000 is not of type 'string'
   		hint: A vendor string property with exact values has an implicit type
   	8192000 is not of type 'string'
   		hint: A vendor string property with exact values has an implicit type

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
