Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33360EA73
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 22:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E4F385C;
	Wed, 26 Oct 2022 22:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E4F385C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666816991;
	bh=rBT0PII3za2aGVCQVmX15R78vHrk5mnZYW0vaDCMOXg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7KUtwH2eqy0hCUdi+LVe5O0A8rDI3N4uq3nxldoX3LMilPz0xX/ZZqaROdL9vJBC
	 Lrnt+OS/T8I70AC8VFlKJCwpzKxmMeT85KbhUj77zEtH2dBKsAlgwxhKp7TLxyuATN
	 MgeH2UIUVzoDWCuxlKqGseKgVTEA8wZukzvrCH0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3175FF80494;
	Wed, 26 Oct 2022 22:42:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 935E5F80240; Wed, 26 Oct 2022 22:42:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E585F8016C
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 22:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E585F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nR71tFZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666816933; x=1698352933;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rBT0PII3za2aGVCQVmX15R78vHrk5mnZYW0vaDCMOXg=;
 b=nR71tFZk1j3fA/BTP9a/1M2q5W0YFGHOU4K7w3HGX5MIVul9eMF4qasZ
 IGRuZ/VP546NP7pBAM1iWTg/SCQFeb7jnoo0xUoQeNqHYZkuFfPhmsBI+
 uy0XdjJH0YLUwPWYoEWbrFcOIXO0VdHjF1HhufvU7IBfoGfBCkDknn6Fr
 XqBifL+l52P90/rFS+ylft/3KGyNOoSpAq+gF7jQ3hhzkXzvcRm+JQV9O
 V6oF4uiTn8wr1S59zDYQk3HyYujVTnW8z13dp24L/JtaGNaqQCBLTgFiW
 tJkZG+UoB4S3n+a/qg27kkl15fAGs6E+nhbRNHd7/Bb1AuWpYzDxaBeZH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308048937"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="308048937"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:41:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610103296"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610103296"
Received: from bcoan-mobl2.amr.corp.intel.com (HELO [10.209.189.197])
 ([10.209.189.197])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:41:57 -0700
Message-ID: <e3ebba30-65ec-183a-eb91-c5147c28441d@linux.intel.com>
Date: Wed, 26 Oct 2022 15:14:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 6/6] soundwire: qcom: add support for v1.7 Soundwire
 Controller
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
 <20221026110210.6575-7-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221026110210.6575-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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


> @@ -1582,6 +1597,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
>  	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>  	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
>  	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
> +	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },

is this line intentional, it looks odd that 1.7 is compatible with 1.5,
but 1.6 isn't?


