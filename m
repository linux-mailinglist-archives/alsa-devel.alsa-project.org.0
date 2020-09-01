Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD371259E1A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 20:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3936C17D5;
	Tue,  1 Sep 2020 20:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3936C17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598985119;
	bh=GU5jknsCTZZ3XDEk1cxYpjyVvzXo6mG9ZAzUEKy4jBw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxZUtum5INK4vTtPK11JQ7wwMG7Ee490mjA4HhG4Qmne5swLabHwAVP94UnFx8tRi
	 P1Gru50FaBIcH8RfePU8J9rRGQsUmorKhzlPTM2eWB/dWCOxS0fgyZiyHhd8TNzC6T
	 tUJU4hhUejDLuv7WeuAW83saEmhesLaZuGI0PJ3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F113EF801DA;
	Tue,  1 Sep 2020 20:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 069EEF80217; Tue,  1 Sep 2020 20:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83D07F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 20:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D07F801DA
IronPort-SDR: UeDOzPB1Hfsu5hgwQRtNEMnlwhQNhn1V3NFhJ+FBEXeI1TudUvH9z53thwWyqkjFkp0g0mKDrX
 wsrw4PzmSZDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="137294963"
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; d="scan'208";a="137294963"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 11:29:59 -0700
IronPort-SDR: T7OSlaVoI3u6ZC/6uEQh6dIdSjZ5pwOu1Ouod8OqaaFKyA+UiyQ42SaziHyySa/xpTPPi6EJk+
 se+DveOGYStg==
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; d="scan'208";a="502346237"
Received: from yzhan76-mobl.amr.corp.intel.com (HELO [10.212.111.228])
 ([10.212.111.228])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 11:29:50 -0700
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN Converter9
 2-in-1
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20200901080623.4987-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7bfe9f46-63bf-8495-0ef1-aa0dff42d734@linux.intel.com>
Date: Tue, 1 Sep 2020 08:16:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901080623.4987-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 9/1/20 3:06 AM, Hans de Goede wrote:
> The MPMAN Converter9 2-in-1 almost fully works with out default settings.
> The only problem is that it has only 1 speaker so any sounds only playing
> on the right channel get lost.
> 
> Add a quirk for this model using the default settings + MONO_SPEAKER.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

