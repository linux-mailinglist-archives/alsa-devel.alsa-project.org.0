Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893297FB9CA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 12:58:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989D383A;
	Tue, 28 Nov 2023 12:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989D383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701172737;
	bh=yfxPBjK99C/x7K8jQBPJkHoUui07X/Xl86chAZ47rkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oo8x3VWRfon8Fdzp1g3dZ6PAo+efjdG8TE6zCuyNnMJGIkCpQcikuWEoApRb/uW4I
	 /pjMqvNEN2VSLiNzGmqblMi/pVEyKs+yBjpSATHEZEYP07n4BURG9sbEKOTC+B8fC0
	 PYlGQ+ec+LzVKU3ZZZijMlcVWBrBnaVPOBKZxTxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B948F8059F; Tue, 28 Nov 2023 12:58:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4ECF80254;
	Tue, 28 Nov 2023 12:58:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76AC7F8016E; Tue, 28 Nov 2023 12:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF5CEF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 12:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF5CEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PGEXDcdB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701172704; x=1732708704;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yfxPBjK99C/x7K8jQBPJkHoUui07X/Xl86chAZ47rkc=;
  b=PGEXDcdB2Bg79MfCs+BJ9cFofrAC49en+67dKWWRNBx5pTEdAldUpfrr
   DXpo5K5yUXIrnSehPH0/znASfQvhWOAE6uU6Oe33g0yYp0CWHWuc8VJae
   2gC/rQtX2w8rC+rtjS8bnrxgbFLTgihl0osNb9WJb66AGGxzf6jg+SbuP
   uJcsCyFDBL90jneGku7d9ScHDj195pt0cAz1mTbxmkrEe5HS+1roGnzUo
   i54YtCRtu/vFDxL9Ep96/Pl8XwKhHs1pADaCb0PVhWtYg1dBu97de7CSU
   Z8iqwu3xgW0VhwvzWDa2osPj5RwCnal9qWRt08nSGZANyQXnh01UNZ+pM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383292374"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="383292374"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 03:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="802941654"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="802941654"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103])
 ([10.251.221.103])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 03:58:16 -0800
Message-ID: <6710fd66-2a70-4948-aafb-2fcf3d6d2b25@linux.intel.com>
Date: Tue, 28 Nov 2023 13:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
 <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
 <87jzq3pc6r.wl-tiwai@suse.de>
 <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
 <87cyvvp8t6.wl-tiwai@suse.de>
 <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
 <878r6jp6jd.wl-tiwai@suse.de>
 <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
 <875y1np5g2.wl-tiwai@suse.de>
 <be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
 <87y1eimd23.wl-tiwai@suse.de>
 <e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
 <87ttp6mc04.wl-tiwai@suse.de>
 <96d334c1-9c6b-415b-bfb8-1fab29b1d223@linux.intel.com>
 <87plzum9w4.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87plzum9w4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2JFWSYUUBQWNFAPABFUL4VTDG5NYV7OD
X-Message-ID-Hash: 2JFWSYUUBQWNFAPABFUL4VTDG5NYV7OD
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JFWSYUUBQWNFAPABFUL4VTDG5NYV7OD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 28/11/2023 12:48, Takashi Iwai wrote:
>> Well, it is a bit more 'interesting' from that angle.
>> for patch two we needed:
>> https://lore.kernel.org/linux-sound/20231124124015.15878-1-peter.ujfalusi@linux.intel.com/
> 
> Ouch, this kind of information has to be mentioned in the patch
> description.  Otherwise one would take only this series and face a
> problem easily.  I can imagine such a problem on the stable tree.

OK, I will update the commit message

>> I would rather not risk to move the hdac_hda as Intel only using address
>> 2 as HDMI indication - which I'm still not sure if it is Intel only or
>> generic HDA convention.
> 
> Sure, it doesn't sound right, either.
> 
> Can we then add DAPM widgets and routes later conditionally instead of
> having it in component driver definition?

The issue is with the DAIs. If I remove the dai registering from
hdac_hda_dev_probe() to be done in hdac_hda_codec_probe() then the probe
will not happen since we do not have the needed components/DAIs to probe
the card.

If we don't have HDMI then the machine driver will substitute it with
dummy-dai, but if we have HDMI then we are not going to probe at all.

It is a sort of chicken and egg situation, right?

-- 
Péter
