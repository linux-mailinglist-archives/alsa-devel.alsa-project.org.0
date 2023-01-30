Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1216816CB
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 17:47:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893BEDEE;
	Mon, 30 Jan 2023 17:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893BEDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675097248;
	bh=ZNo5beOaUadZ2tazWeCBl6DwhKG8ILjEke78TBRLIZY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OPRF4ieAXw0WgGe02rYJ6NxJeCaAfNdp978Yait79z1Wk8LXBKZVV56PPS3DjilJm
	 wjHTus5HlIzbU0HaOyjAWLdvotdSTN6R55wqK3SmugOHAkwm4WfNV74dCLOz7GehS7
	 8fKaA6hn/KNnFtzf1P6e0eZW243Lb8/nNMSSSH3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB05FF80496;
	Mon, 30 Jan 2023 17:46:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4398F80494; Mon, 30 Jan 2023 17:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0033F80236
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 17:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0033F80236
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NXv0jns0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675097157; x=1706633157;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZNo5beOaUadZ2tazWeCBl6DwhKG8ILjEke78TBRLIZY=;
 b=NXv0jns02E6sczC64gqVYCLy3CqMVfC87qVWMlRajFpDQ+SgrF7eTxs7
 tty7mAv8YcvtveojNj1iF/X9/NQL3UROKE3fQ3fioBsM1UVv80DNyC0Ht
 hPECzoPam2sS8b5Il90KYP7Wvbc8YiFKB1FzfVcQvKUIliCKu4LvftlKO
 gm98ds33pwiRljhEvzM9ORHPxZTIA35mw/Xn3o3Nr1qvFPEOzQnMo1KVL
 3xn8+I4+7DCquviMg9/g1AR5t1UeDgyBZQJKjrrZc495arhK55IM0OiR7
 xhFjSUr50evWDk6v6VOCioKwqbJL5bv2sAyU8+R9b6o/a5QcD3GWinccZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307260843"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="307260843"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732763623"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="732763623"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 08:45:50 -0800
Message-ID: <8768fdaa-9c86-389c-aa49-e5aee221f570@linux.intel.com>
Date: Mon, 30 Jan 2023 10:33:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] ASoC: cs42l42: Export some functions for SoundWire
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-6-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230127165111.3010960-6-sbinding@opensource.cirrus.com>
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 10:51, Stefan Binding wrote:
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> Export functions that will be needed by a SoundWire module.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

