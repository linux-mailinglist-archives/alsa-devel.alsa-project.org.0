Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E65706EAB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBAB51FA;
	Wed, 17 May 2023 18:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBAB51FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684342283;
	bh=KS6uI5RGH1xHM6b9lrfHL7GS8cXP0VR3O3NP1UIgCzg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=c8QXFr/vaz9DsQ1fnZxd2x01aIqWHcUVAtM04w89/vpBfGEmcTogUDRDYSxqFDIJ7
	 z7GRLJnGcLQI0ZTrLA9RhOafkjvfNXQdiq0Hos49Cw7Nw0QBe4bA9LwDnFWZDIG6lw
	 biTn+3mCBWr+dqWcEPUgyTl8kn/GMqXQxhqyu6Os=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D084FF8016D; Wed, 17 May 2023 18:50:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C487F8016A;
	Wed, 17 May 2023 18:50:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D153FF802E8; Wed, 17 May 2023 18:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98223F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98223F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B/ksu3tT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684342198; x=1715878198;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=KS6uI5RGH1xHM6b9lrfHL7GS8cXP0VR3O3NP1UIgCzg=;
  b=B/ksu3tTMwohDTVaVdWVIatwC6jQebuM7YoMdnbpqRATvUDlgXXKS5xZ
   XzlF//2XF6mE1bN6F/8+wsT7bBdFZCKzB5nh9s21uKFYGc+pTkn8fNdZM
   z7Yq0Gz8rhceoqqU6fuyB5DGbK3eIduUG/G2AaE7HxMk+/N6SkQf9LZKU
   ZglV+a5YhmACXoo7P4AwC2FgVVz+te1p2VNtiTBXt4s5f1W+JllmBi+3n
   6xHpUaQmOyEnmwtV7+/lKWg4pDqG7OuVjHBHbA48MS24tyuxpjoCVFWMe
   sflpbMvp5CgnxSbeRDUL43iQ0KkM8rkiBwnaXW+ViwkRGF4V+2Q3voB0T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350649322"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="350649322"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734764313"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="734764313"
Received: from pgopdahl-mobl1.amr.corp.intel.com (HELO [10.209.16.196])
 ([10.209.16.196])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:48:47 -0700
Message-ID: <7638419f-7df1-a31a-e68e-1c315f57cabf@linux.intel.com>
Date: Wed, 17 May 2023 11:45:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] soundwire: qcom: add proper error paths in
 qcom_swrm_startup()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230517163736.997553-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230517163736.997553-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: K7EHFSL3UTOHNK6BHI6SIHCR3HDTJDTM
X-Message-ID-Hash: K7EHFSL3UTOHNK6BHI6SIHCR3HDTJDTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7EHFSL3UTOHNK6BHI6SIHCR3HDTJDTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/17/23 11:37, Krzysztof Kozlowski wrote:
> Reverse actions in qcom_swrm_startup() error paths to avoid leaking
> stream memory and keeping runtime PM unbalanced.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

