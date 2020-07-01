Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98F2113DE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 21:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4DB1684;
	Wed,  1 Jul 2020 21:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4DB1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593632910;
	bh=gu6E/P4pw1FlroVHH+Y2/b1qr5Hh2j3CZbuR7tDONJI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHW16Wr0Kulen1vSND55DXeIbneW63IyH2BlTrBS8+UaP7+Hk+1MN9no3DuzxnDNo
	 goIul6gjq39iOTjm73Iy1hZX5Ohb8F0JoZ3OmBaODBlSXPg4h5vMKJbGOEPqA+HUQn
	 GIFMDmhDsowq4JnGt317he0VT+A9AA8OE3Dwf2IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9E75F800C1;
	Wed,  1 Jul 2020 21:46:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56AE8F80217; Wed,  1 Jul 2020 21:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC66F800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 21:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC66F800C1
IronPort-SDR: RAyaQ5aQ48ypO+sICKiiS2Qy891v7i+9hAj64YOlgtLiwHqdUkDLUQCD7njEfU0a8VKjQOMz/l
 xyj7SenZ0DHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145777832"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145777832"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 12:46:40 -0700
IronPort-SDR: qvtnx4bm3+4pxd36Ik9wvC7W1BPk5Cmx9bMDuTWRDCyrb2afNfWbRXGtGr+nuTmVFTt6rONibS
 SAxQpcWzktww==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="266844800"
Received: from sawhitac-mobl.amr.corp.intel.com (HELO [10.254.111.76])
 ([10.254.111.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 12:46:40 -0700
Subject: Re: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S
 2 channel
To: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200628155231.71089-2-hdegoede@redhat.com>
 <20200701193320.C948B20870@mail.kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <869046c6-030c-9243-784d-ecabdb774fa7@linux.intel.com>
Date: Wed, 1 Jul 2020 14:46:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701193320.C948B20870@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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



On 7/1/20 2:33 PM, Sasha Levin wrote:
> Hi
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.7.6, v5.4.49, v4.19.130, v4.14.186, v4.9.228, v4.4.228.
> 
> v5.7.6: Build OK!
> v5.4.49: Failed to apply! Possible dependencies:
>      0d1571c197a92 ("ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer")

This patch is probably the missing dependency, but it's quite large and 
invasive.

if we wanted to apply this patch to stable versions < 5.7, we should 
replace all occurrences of

asoc_rtd_to_cpu(rtd, 0) by rtd->cpu_dai

and

asoc_rtd_to_codec(rtd, 0) by rtd->codec_dai


