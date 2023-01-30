Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E409D6816D0
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 17:48:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DB4DF3;
	Mon, 30 Jan 2023 17:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DB4DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675097297;
	bh=9zSXS+O/50vqmmTlNQH8/vfvi/eXbxp8sMusT3tI+u8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SsaxBQrtvZCi3cRGrnR9a/Bv7ZGAaDjZ+gf7Ayb06trjXA1RVYJyEGyytX0wQxMN1
	 pqNOuiIqWo0J7U+Hboc61Kizr65/oDxYcCZUHRwP6aZJGlDY2FoH6hBsR1qqCcqcCn
	 JCMLgIndfQIXT2TVJhRrv5oqrOEul0Ybpy0OR5S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E449F8045D;
	Mon, 30 Jan 2023 17:46:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79FE3F8055C; Mon, 30 Jan 2023 17:46:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FBE8F8045D
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 17:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBE8F8045D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SLFgnhNm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675097159; x=1706633159;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9zSXS+O/50vqmmTlNQH8/vfvi/eXbxp8sMusT3tI+u8=;
 b=SLFgnhNm12W2kkvB+es1U0Vdb2DXcwEzW/G6MYa+gX6dogGiTygNxv4K
 bWzR2YLajx24CwkBFhRohuybQC1KFru7Kh4dKa+5cfoPz8Q8EJAzNlSwa
 4G/ZfHXPTaFiOk1IyYBZSQXNmKl5hOoIwM/ruvLFW8sC9ebCT26RvYAch
 UuvyBa8RSuHMR9USiy0m8vkJxmRXcnn4LkCjnIr/8fOwOSQCNzVxAEnDI
 Yc1UlmMz9hb2OMk+t3U7w9m1/XjDX5JbsgNa5WLpaW5v/hyKiTHdTP2Sp
 LkuWnGDMkTVpN2YjP9NS/nshckwNAWB2jXM24aaSq2/vDz0voP0pLs90B w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307260877"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="307260877"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732763634"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="732763634"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:53 -0800
Message-ID: <1e5e1312-18f5-e70f-3237-c2ffc851eef7@linux.intel.com>
Date: Mon, 30 Jan 2023 10:45:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v3 8/8] ASoC: cs42l42: Wait for debounce interval after
 resume
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-9-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230127165111.3010960-9-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 10:51, Stefan Binding wrote:
> Since clock stop causes bus reset on Intel controllers, we need

nit-pick: It's more that the Intel controller has a power optimization
where the context is lost when stopping the clock, which requires a bus
reset and full re-enumeration/initialization when the clock resumes.

The rest of the patch is fine so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> to wait for the debounce interval on resume, to ensure all the
> interrupt status registers are set correctly.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
