Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214F6B54C5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 23:47:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A10D1899;
	Fri, 10 Mar 2023 23:46:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A10D1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678488439;
	bh=G7UL3U+qmAaf4xKpgEvzpeIeSPSrSibmFMiBDa1iJmY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=va1McbxzbrjRVYf9Xd6oDeYxivl9usKhYdJcg94Dt5AAUMQy5IHIQiAuCPuFeG2Ca
	 eAPGMlpsrRIhpnPFhXVdz+FxOh9mIOL4tFJRbhIotRxLBrpJW7YwHVsKoNB021io45
	 eWjkXpryqviZbPKjwu8g0NW0aVhxhLCQvxlYx/+U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87DE5F80093;
	Fri, 10 Mar 2023 23:46:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F093F8042F; Fri, 10 Mar 2023 23:46:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AB15F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 23:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB15F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a8K1psOU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678488380; x=1710024380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G7UL3U+qmAaf4xKpgEvzpeIeSPSrSibmFMiBDa1iJmY=;
  b=a8K1psOUrPZ+CUToHqgjwEB0YjA+ro3wwow5HkDXaYkjbBqtenCA0f0J
   fqYBJhnW/QAOZKwrUpKe48TQsfUTe/PoKOpW7GASHpruZ7d3i1R/qK78a
   Spv4Q634iHHIdT24xNhT/wxgKyKoBTDL4uv+sRAopQSVP8Yss1l5fbBI+
   0yQ6OzqhPWtpaoXNnH7RxuGoRUXW5cNKEJWCrxsdunCPS9geXK+VD5LR3
   Q7OeIo/tUgUuYf5faGamYCgnUfkwS+XgFDZ1Oyb6X71+Tj8UCzJ3mP4GN
   +VghTDhUg4CQDADFGxppRUDOUNpOIcnw5m/9Xqq+l+WAFFPFgnIexrtJN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401705837"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400";
   d="scan'208";a="401705837"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852086352"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400";
   d="scan'208";a="852086352"
Received: from dprende1-mobl.ger.corp.intel.com (HELO [10.255.33.142])
 ([10.255.33.142])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:46:14 -0800
Message-ID: <a5962d12-ccd2-79ea-27bc-674e0b3065f4@linux.intel.com>
Date: Fri, 10 Mar 2023 16:46:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
 <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
 <CALprXBamM-M-YdyfX9dQHp_AQAovcqzL5H4rMPsZPXS426+VgA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CALprXBamM-M-YdyfX9dQHp_AQAovcqzL5H4rMPsZPXS426+VgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NLKMFWC6PF4Z2KG2HKYB6ZSVQQO6PIEF
X-Message-ID-Hash: NLKMFWC6PF4Z2KG2HKYB6ZSVQQO6PIEF
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLKMFWC6PF4Z2KG2HKYB6ZSVQQO6PIEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/10/23 14:01, Ajye Huang wrote:
> On Sat, Mar 11, 2023 at 2:48 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> This sounds good, but if the intent is to have BT offload enabled across
>> all ADL skews there are still misses, e.g.
>>
>> .name = "adl_mx98357_rt5682",
>>
>> Can we please try to add this BT offload in a more consistent manner, or
>> add a comment when this is officially not planned/supported?
> 
> Hi Pierre,
> 
> The "sof-adl-rt1019-rt5682.tplg" for this "adl_rt1019_rt5682" sound
> card also need to enable bt_offload, this one I will submit to SOF
> later this weekend.
> ex, topology: sof-adl-rt1019-rt5682: add bluetooth offload uses SSP2
> link -- https://github.com/ajye-huang/sof/commit/09dcbc3cc1617df652944299c63082f1936dea6e
> 
> To be more clear, I think we can add a comment in the commit message
> for mention " The related "sof-adl-rt1019-rt5682.tplg" enabled the
> bt_offload feature", is it ok?

It's best if you provide a series that enables BT offload across the
board for ADL, if that's the intended goal.
