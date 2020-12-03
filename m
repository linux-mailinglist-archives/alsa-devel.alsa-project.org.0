Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391FB2CF156
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 16:56:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07C7187D;
	Fri,  4 Dec 2020 16:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07C7187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607097373;
	bh=PqlvPap3aB5JvMBDlrvzhm9lWHsSCEhgf8R8I1B5hh4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWZ4eOgHd67lESv+Xid3xjmAp2ZaPvQfPXPYxTGQA4K0dCDa8dTJexX33A/e9zuHf
	 xWObQhr1QuB5GUhllD469+AvSQncyn9Rywt1q81I1Mh0i/T5rUrm/GdoNV/dwQvxzk
	 JI8OEigYAJVdccOZvK99wotuYYEkFUnqXc5rpvAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB797F8049C;
	Fri,  4 Dec 2020 16:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9475F80278; Fri,  4 Dec 2020 16:54:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D97F8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 16:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D97F8012A
IronPort-SDR: T3UlXMUEmF7R1JYCRKgMlWfbu8/ew1+UDV9okgnFzmHp+DUq+Ty2CdiRqyQ5be52NEefNyrWFC
 24o7XNYHGVYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="237510824"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="237510824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 07:54:24 -0800
IronPort-SDR: Vhp5Jswx9eGcKQL0ubW9XPAUESZ+FxyWye9LDRS0HSZNv0scOiPCBnG86xBRFFAihH/b2E8VKk
 RmWHc19aubeA==
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="373958798"
Received: from emogena-mobl1.amr.corp.intel.com (HELO [10.212.90.42])
 ([10.212.90.42])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 07:54:22 -0800
Subject: Re: [PATCH v2] ASoC: intel: sof_rt5682: Add support for
 tgl_rt1011_rt5682
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20201203154010.29464-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <64da393b-f591-7af0-a131-b40f49dcf804@linux.intel.com>
Date: Thu, 3 Dec 2020 10:02:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203154010.29464-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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



On 12/3/20 9:40 AM, Brent Lu wrote:
> This patch adds the driver data for two rt1011 speaker amplifiers on
> SSP1 and rt5682 on SSP0 for TGL platform. DAI format for rt1011 is
> leveraged from cml_rt1011_rt5682 which is 4-slot tdm with 100fs bclk.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Thanks Brent.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
