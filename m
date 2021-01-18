Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461E2FAC39
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 22:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FECB1858;
	Mon, 18 Jan 2021 22:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FECB1858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611004253;
	bh=eVRPrruFA0zEhl5JABUs35xrJ8SpQhtj2JHPZikky2U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rbi4xUpHKRm3hiZcVfOviMF4TaA8AJaysD6W4LJTawvujqejUpYykycQ17VGGmp18
	 PT3CuE/P2H/2Xq5VkmrDMuG7+jskfiFReN8FWSvD3d6vv7NT2j8DC58cmnqoZktr3j
	 tS92EaqTlaW4aupwZXmtFFsFTyy1/3t2yRKDQfZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD4CF8019D;
	Mon, 18 Jan 2021 22:09:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 106CBF8016E; Mon, 18 Jan 2021 22:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E54EF80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 22:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E54EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="TMA06ytb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611004148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRu+4fjUNV4j7WF9rBOha65f9F3VebQfanWyObjLWHc=;
 b=TMA06ytbBQFTGofA/Zn3BFTy2Z/n+FykAVpsm5P+wHJWo6ntAx94prsgFZ0xC9BFbYUb2K
 EIrEqFr3khFBS+7x27uhnFVYgrk8XaSBHPPv4kK3+UICkhNLQn9f+0uS8GICbsb7vj9Lg/
 a/nM8A+kPw/f+da3t9aZ+uvcUxqssbU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-bHPHkPY7PBOnWdYDGFpPuQ-1; Mon, 18 Jan 2021 16:09:06 -0500
X-MC-Unique: bHPHkPY7PBOnWdYDGFpPuQ-1
Received: by mail-ed1-f70.google.com with SMTP id a24so3081456eda.14
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRu+4fjUNV4j7WF9rBOha65f9F3VebQfanWyObjLWHc=;
 b=Z2Qc5SQTfOvcrtJOusQtRgE+2lXZHp6QqlGaS97cBtL95YldBE8QyPEMykebjOxFvn
 Pa+6Lq2CdWv8htCgNqLTQDR0mKAZqxp6u1ShkDzpXfeEQMbQyMmOGn21cacpc1YlOc4W
 o27hTz8R0HyEnQTX5pkT44ZiEnSeGakkopNAhhFFErE0n7VIzAjm+0FTX5er8vCqxDm8
 K4Rqsnr2zzTQUiyliGxOPtV7ccpI18OJU2r+y46jVKvKOBxrcLzFen/GCNp+14ZPF0Lt
 RViGsroOdc77e5dFW+GrcQU5Ax5awkpdwFW7mb3Xs+y3XGuoEigg6Q+QzAoo2Ldk3IfG
 0swg==
X-Gm-Message-State: AOAM531+QbcmLlpOUpf08dJu7D+3Su62yfVvN4OLPOUmTDKDF9d4GXbY
 l3U2ORIWBomPUAMZrXhsQdS+nMebbYDoC3YQkvs6ml2Kb0ZBPSAtsawWs+H9UtXvVQivHkvvGQD
 dcxzOo6Kfv5n+GaN8SNW8/VuqSBRsRbLj+uDwWhEmQYtKnrYj3eMHwziJxyekbPMNSdVKxOHMsM
 c=
X-Received: by 2002:a17:906:48f:: with SMTP id
 f15mr997107eja.392.1611004144687; 
 Mon, 18 Jan 2021 13:09:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHW6WBucH1SRSE0CdG+9v/ERqwCCoxS+YMlDBKT4TwHLyE0uiCnKJ8orXYLts7p7VnQ1x+OQ==
X-Received: by 2002:a17:906:48f:: with SMTP id
 f15mr997084eja.392.1611004144467; 
 Mon, 18 Jan 2021 13:09:04 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id m26sm4865344ejr.54.2021.01.18.13.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 13:09:03 -0800 (PST)
Subject: Re: [PATCH] cfg80211: Fix "suspicious RCU usage in
 wiphy_apply_custom_regulatory" warning/backtrace
To: "Peer, Ilan" <ilan.peer@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210104170713.66956-1-hdegoede@redhat.com>
 <BN7PR11MB2610DDFBC90739A9D1FAED52E9D10@BN7PR11MB2610.namprd11.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <391ac436-9981-0f12-6e00-7a1bbe4d5c20@redhat.com>
Date: Mon, 18 Jan 2021 22:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <BN7PR11MB2610DDFBC90739A9D1FAED52E9D10@BN7PR11MB2610.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi,

On 1/5/21 10:24 AM, Peer, Ilan wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, January 04, 2021 19:07
>> To: Johannes Berg <johannes@sipsolutions.net>; David S . Miller
>> <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; Rojewski,
>> Cezary <cezary.rojewski@intel.com>; Pierre-Louis Bossart <pierre-
>> louis.bossart@linux.intel.com>; Liam Girdwood
>> <liam.r.girdwood@linux.intel.com>; Jie Yang <yang.jie@linux.intel.com>;
>> Mark Brown <broonie@kernel.org>
>> Cc: Hans de Goede <hdegoede@redhat.com>; linux-
>> wireless@vger.kernel.org; netdev@vger.kernel.org; linux-
>> kernel@vger.kernel.org; alsa-devel@alsa-project.org; Peer, Ilan
>> <ilan.peer@intel.com>
>> Subject: [PATCH] cfg80211: Fix "suspicious RCU usage in
>> wiphy_apply_custom_regulatory" warning/backtrace
>>
>> Commit beee24695157 ("cfg80211: Save the regulatory domain when setting
>> custom regulatory") adds a get_wiphy_regdom call to
>> wiphy_apply_custom_regulatory. But as the comment above
>> wiphy_apply_custom_regulatory says:
>> "/* Used by drivers prior to wiphy registration */"
>> this function is used by driver's probe function before the wiphy is registered
>> and at this point wiphy->regd will typically by NULL and calling
>> rcu_dereference_rtnl on a NULL pointer causes the following
>> warning/backtrace:
>>
>> =============================
>> WARNING: suspicious RCU usage
>> 5.11.0-rc1+ #19 Tainted: G        W
>> -----------------------------
>> net/wireless/reg.c:144 suspicious rcu_dereference_check() usage!
>>
>> other info that might help us debug this:
>>
>> rcu_scheduler_active = 2, debug_locks = 1
>> 2 locks held by kworker/2:0/22:
>>  #0: ffff9a4bc104df38 ((wq_completion)events){+.+.}-{0:0}, at:
>> process_one_work+0x1ee/0x570
>>  #1: ffffb6e94010be78 ((work_completion)(&fw_work->work)){+.+.}-{0:0},
>> at: process_one_work+0x1ee/0x570
>>
>> stack backtrace:
>> CPU: 2 PID: 22 Comm: kworker/2:0 Tainted: G        W         5.11.0-rc1+ #19
>> Hardware name: LENOVO 60073/INVALID, BIOS 01WT17WW 08/01/2014
>> Workqueue: events request_firmware_work_func Call Trace:
>>  dump_stack+0x8b/0xb0
>>  get_wiphy_regdom+0x57/0x60 [cfg80211]
>>  wiphy_apply_custom_regulatory+0xa0/0xf0 [cfg80211]
>>  brcmf_cfg80211_attach+0xb02/0x1360 [brcmfmac]
>>  brcmf_attach+0x189/0x460 [brcmfmac]
>>  brcmf_sdio_firmware_callback+0x78a/0x8f0 [brcmfmac]
>>  brcmf_fw_request_done+0x67/0xf0 [brcmfmac]
>>  request_firmware_work_func+0x3d/0x70
>>  process_one_work+0x26e/0x570
>>  worker_thread+0x55/0x3c0
>>  ? process_one_work+0x570/0x570
>>  kthread+0x137/0x150
>>  ? __kthread_bind_mask+0x60/0x60
>>  ret_from_fork+0x22/0x30
>>
>> Add a check for wiphy->regd being NULL before calling get_wiphy_regdom
>> (as is already done in other places) to fix this.
>>
>> wiphy->regd will likely always be NULL when
>> wiphy->wiphy_apply_custom_regulatory
>> gets called, so arguably the tmp = get_wiphy_regdom() and
>> rcu_free_regdom(tmp) calls should simply be dropped, this patch keeps the
>> 2 calls, to allow drivers to call wiphy_apply_custom_regulatory more then
>> once if necessary.
>>
>> Cc: Ilan Peer <ilan.peer@intel.com>
>> Fixes: beee24695157 ("cfg80211: Save the regulatory domain when setting
>> custom regulator")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  net/wireless/reg.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/wireless/reg.c b/net/wireless/reg.c index
>> bb72447ad960..9254b9cbaa21 100644
>> --- a/net/wireless/reg.c
>> +++ b/net/wireless/reg.c
>> @@ -2547,7 +2547,7 @@ static void handle_band_custom(struct wiphy
>> *wiphy,  void wiphy_apply_custom_regulatory(struct wiphy *wiphy,
>>  				   const struct ieee80211_regdomain *regd)  {
>> -	const struct ieee80211_regdomain *new_regd, *tmp;
>> +	const struct ieee80211_regdomain *new_regd, *tmp = NULL;
>>  	enum nl80211_band band;
>>  	unsigned int bands_set = 0;
>>
>> @@ -2571,7 +2571,8 @@ void wiphy_apply_custom_regulatory(struct wiphy
>> *wiphy,
>>  	if (IS_ERR(new_regd))
>>  		return;
>>
>> -	tmp = get_wiphy_regdom(wiphy);
>> +	if (wiphy->regd)
>> +		tmp = get_wiphy_regdom(wiphy);
>>  	rcu_assign_pointer(wiphy->regd, new_regd);
>>  	rcu_free_regdom(tmp);
> 
> This only fixes the first case where the pointer in NULL and does not handle the wrong RCU usage in other cases.
> 
> I'll prepare a fix for this.

Any luck with this? This is a regression in 5.11, so this really should
be fixed in a future 5.11-rc and the clock is running out.

Regards,

Hans

