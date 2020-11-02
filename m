Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C22A2D90
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 16:04:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86E316BC;
	Mon,  2 Nov 2020 16:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86E316BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604329458;
	bh=PADaqB1h+cBBE1cIxpnpAnxB8m1TNo6aAjZG4yB/oCc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rI8fjTfn78WGx2p3VDPTUhLPi1WuVEPo1shKAaMAhWz+AqkI3WVfgYEQH/1ZkMrti
	 pp8towsnLJjhZUpLAjYg9dFhdtZlCkXsba3KhY9DdNmG38EUvOJSiB/Mje647K5lU0
	 WlB6hvc07R3IrgAqC5Bb5JKXG9jLcj4uoH3C0SxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E6E6F80232;
	Mon,  2 Nov 2020 16:02:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD3E7F8023E; Mon,  2 Nov 2020 16:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C533F80229
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C533F80229
IronPort-SDR: EGjIRr6L+Gkt8dDIvxKbQEKCpPC2GtJHD3tUywgc071u9HSwoqxWJWM90GIQzidyFc8Jmo0a+M
 pOvoDH8qzQ+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="155883717"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="155883717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 07:02:38 -0800
IronPort-SDR: aRWBhwdHjiq7V/MH7F/Zaj5eF5eTEpVe/qBr8rTKd4kVW+2Yhnf6QBL/WlERi/H5lyR781nRn2
 WOVCKJmsRVyA==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="528043528"
Received: from pvrott-mobl1.amr.corp.intel.com (HELO [10.212.253.243])
 ([10.212.253.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 07:02:37 -0800
Subject: Re: [PATCH] ASoC: rt1015: add delay to fix pop noise from speaker
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20201102052840.21590-1-jack.yu@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d9e0f0af-ddce-788e-8f4d-ad1f828d48e8@linux.intel.com>
Date: Mon, 2 Nov 2020 08:45:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102052840.21590-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, tzungbi@google.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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



> +struct rt1015_platform_data {
> +	unsigned int power_up_delay;

power_up_delay_ms ?

[...]


> +static void rt1015_parse_dt(struct rt1015_priv *rt1015, struct device *dev)
> +{
> +	device_property_read_u32(dev, "realtek,power-up-delay",
> +		&rt1015->pdata.power_up_delay);
> +}

Don't you need a DT binding description? And use delay-ms maybe?
