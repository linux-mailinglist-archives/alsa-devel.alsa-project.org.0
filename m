Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3B7E274E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 15:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98497A4C;
	Mon,  6 Nov 2023 15:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98497A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699281818;
	bh=nX/Ie0anw1ndgN0YJjqHJnFFjUKSdxLFOe79el+klzo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uJk4K/yCShmcWDeiVPaRG1MotLCcqpF4jOsy3FDL0YhMK1wdhVLFY8TWSB1GsLUUP
	 fchJ989tfGIUQeKuZjficXVjN4k21DBeXSwPEg5aGIBOuqkI7HwhVOnBWlfsYVZ0ov
	 nK4SNHtK21Q1gdj02EPyEXChLLe2zhBJrsk7eVZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95626F8057D; Mon,  6 Nov 2023 15:42:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E5C0F8055C;
	Mon,  6 Nov 2023 15:42:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2909BF8057A; Mon,  6 Nov 2023 15:42:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7901BF8055C
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 15:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7901BF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EenvUySz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699281725; x=1730817725;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=nX/Ie0anw1ndgN0YJjqHJnFFjUKSdxLFOe79el+klzo=;
  b=EenvUySzZMY8a1P9P9PU1hAoZaEsE3C5zZtEQlQ75j8Su4If2pMCztYb
   RoU3K+vI2ZYIHLHT9VfmaaqSL6Wpev3xTgM2tO/SMg4rfkWbF8nSD26Jh
   HyHsgWZn4AjMbxiIm0JMBOZE3+yxZJN1DK3Fb712m1+u1itqWBocLje0p
   VkMngCKapbuhOpND3v6Kr2dfPLJb6qRB9hBPKF8ehD8NdVtWXLfOk2e93
   T+FQiW71g2PbR3M9b5FkVLRU5JI61I8HfbcvDaPEgtAlVORo6t9g/y7W/
   eJ7YoRTAJvXr0DIE4AZySrW03hiPdmhC8V0rk6j33HdzzoXM5R1A5aQJ6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379677772"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200";
   d="scan'208";a="379677772"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 06:41:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1093799396"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200";
   d="scan'208";a="1093799396"
Received: from dpidwerb-mobl.amr.corp.intel.com (HELO [10.209.77.27])
 ([10.209.77.27])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 06:41:58 -0800
Message-ID: <30f0f5ef-a148-444f-924f-594f4cbd48a4@linux.intel.com>
Date: Fri, 3 Nov 2023 10:39:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wsa884x: check if set_stream is called
 for proper bus
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
 <20231025144601.268645-3-krzysztof.kozlowski@linaro.org>
 <8b9db87b-0f61-4824-acf1-6b5ebdf45e63@linux.intel.com>
 <160752cb-7772-4b1d-9096-8be25e76213c@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <160752cb-7772-4b1d-9096-8be25e76213c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 44VGGTOQ2NF3Q7SDT6KTIPKSZBHN6UIP
X-Message-ID-Hash: 44VGGTOQ2NF3Q7SDT6KTIPKSZBHN6UIP
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44VGGTOQ2NF3Q7SDT6KTIPKSZBHN6UIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> We have two Soundwire controllers swr0 and swr3, each with two WSA884x
> speakers (codecs):
> 
> -------------
> &swr0 {
> 	status = "okay";
> 
> 	left_woofer: speaker@0,0 {
> 		compatible = "sdw20217020400";
> 		reg = <0 0>;
> 		// ...
> 	};
> 
> 	/* WSA8845, Left Tweeter */
> 	left_tweeter: speaker@0,1 {
> 		compatible = "sdw20217020400";
> 		reg = <0 1>;
> 		// ...
> 	};
> };
> 
> &swr3 {
> 	status = "okay";
> 
> 	/* WSA8845, Right Woofer */
> 	right_woofer: speaker@0,0 {
> 		compatible = "sdw20217020400";
> 		reg = <0 0>;
> 		// ...
> 	};
> 
> 	/* WSA8845, Right Tweeter */
> 	right_tweeter: speaker@0,1 {
> 		compatible = "sdw20217020400";
> 		reg = <0 1>;
> 		// ...
> 	};
> };
> -------------
> 
> Now, for four-speaker playback, we have sound card with links like:
> 
> -------------
> wsa-dai-link {
> 	link-name = "WSA Playback";
> 
> 	cpu {
> 		sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> 	};
> 
> 	codec {
> 		sound-dai = <&left_woofer>, <&left_tweeter>,
> 			    <&swr0 0>, <&lpass_wsamacro 0>,
> 			    <&right_woofer>, <&right_tweeter>,
> 			    <&swr3 0>, <&lpass_wsa2macro 0>;
> 	};
> 
> 	platform {
> 		sound-dai = <&q6apm>;
> 	};
> };
> -------------
> 
> We need to prepare the stream for all four speakers and two soundwire
> controllers (so two different soundwire buses), however without the
> patches here, the stream (sdw_stream_runtime *sruntime) right
> woofer/twitter is set to swr0 (the other bus!). But it should stay as
> swr3 (their bus).
> 
> Does it help a bit? I hope I am able to properly explain it.

The configuration seems fine, but the problem is the
"sdw_stream_runtime" definition.

You need *ONE* sdw_stream_runtime, and multiple m_rt contexts added in
the linked lists of this sdw_stream_runtime. In other words, you need to
call sdw_stream_add_master() twice, for swr0 and swr3 respectively.

Put differently, a sdw_stream_runtime does not point to a specific bus,
it provides a top-level structure which can use multiple buses.

The best way to allocate the sdw_stream_runtime is to rely on the
dailink .startup callback. From the description above that's where you
have all the needed information, and then each DAI .startup (or
hw_params) can call sdw_stream_add_master() to update the linked lists.



