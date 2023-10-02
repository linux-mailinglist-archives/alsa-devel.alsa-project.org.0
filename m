Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235407B51D6
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 13:56:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3855FDF0;
	Mon,  2 Oct 2023 13:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3855FDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696247770;
	bh=HwO5Na84aoxMs8pSLr9VExYDxk8Jtv1Gq8/kkq7Tvd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XInGILJyC0crOJ1DKHE+RYxiSaHE3Z7lQ42CP6DH0UAhXtLM99N7QD3lu6thWOrj2
	 U5emo1ARtgEDjpyLbLfr43oogwDqaR0hsnmpc8xxv+4xGV9Y8QKeclrZxoEu0Uxua5
	 9OMgAqL18OP4wAQ3Zt+RU980yFMuzj2jP3xJcz00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9C3AF802E8; Mon,  2 Oct 2023 13:55:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 719C6F802E8;
	Mon,  2 Oct 2023 13:55:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4DAAF80310; Mon,  2 Oct 2023 13:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56797F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 13:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56797F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y+TMpJzr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D7EAC0007;
	Mon,  2 Oct 2023 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696247707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZauemzlB2GLs7I7VeZeMr7YTRfLhZitHrMbmBgYpBFo=;
	b=Y+TMpJzrSEayNtrQ1/UBUfMpH1c7s5l736WL9S3/lFbOXcx0BTUCPb/erG9k+osScJSt0y
	2tbeBT7/SGnbvouwlGDLERC25y4ZcvayWFzdg/+PfokEDbKflSRhLVWeR40woW8xPlw8Ox
	8YG1Fvh6sY+27HWsp2z15RKmQUl5kLV9dzDDPUB0zbgmVCPFeznmRQGhJQOZ2xTSYzAjGe
	NoJzak3j4Py4dzMatBXdC8yNKY3MdQrC208MwQiapP6gCOc8Tx0NARPrBEWIeXgMu71pdE
	KxUkEfL+NLoKzt+j+Ski75iX7InerKkxpp5uKvWbQdzBuBTRaaRAlf+3yYfmTA==
Date: Mon, 2 Oct 2023 13:54:58 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Simon
 Horman <horms@kernel.org>
Subject: Re: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20231002135458.420f6ae4@bootlin.com>
In-Reply-To: <202309291924.OBfdyhXb-lkp@intel.com>
References: <20230928070652.330429-26-herve.codina@bootlin.com>
	<202309291924.OBfdyhXb-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: NM6EFTAKJEOW3DV37T3XA74XLXOPGEVF
X-Message-ID-Hash: NM6EFTAKJEOW3DV37T3XA74XLXOPGEVF
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NM6EFTAKJEOW3DV37T3XA74XLXOPGEVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob, all,

On Fri, 29 Sep 2023 20:04:44 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Herve,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.6-rc3 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-tsa-Fix-__iomem-addresses-declaration/20230928-151746
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20230928070652.330429-26-herve.codina%40bootlin.com
> patch subject: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291924.OBfdyhXb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309291924.OBfdyhXb-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: 'oneOf' conditional failed, one must be fixed:  
>    	'type' is a required property
>    		hint: A vendor boolean property can use "type: boolean"
>    	Additional properties are not allowed ('default', 'enum' were unexpected)
>    		hint: A vendor boolean property can use "type: boolean"
>    	Additional properties are not allowed ('default' was unexpected)
>    		hint: A vendor string property with exact values has an implicit type
> >> 	Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: 'oneOf' conditional failed, one must be fixed:  
>    		'$ref' is a required property
>    		'allOf' is a required property
>    		hint: A vendor property needs a $ref to types.yaml
>    		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>    	2048000 is not of type 'string'
>    		hint: A vendor string property with exact values has an implicit type
>    	4096000 is not of type 'string'
>    		hint: A vendor string property with exact values has an implicit type
>    	8192000 is not of type 'string'
>    		hint: A vendor string property with exact values has an implicit type
> 

This issue is related to '-bps' standard suffix not yet available in the
dt-schema release.
The commit adding '-pbs' suffix is
  commit 033d0b1 ("Add '-bps' as a standard unit suffix for bits per second")
present in https://github.com/devicetree-org/dt-schema/

This point was previously discussed with Rob [1] and mentioned in the cover
letter of the series.

[1]: https://lore.kernel.org/linux-kernel/CAL_JsqJTruTExc=uHCPCp3q-fo+fB-wAJ-ggPpHpWcHSoGALdw@mail.gmail.com/

Best regards,
Hervé

