Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8A80589B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 16:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F275DECD;
	Tue,  5 Dec 2023 16:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F275DECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701790033;
	bh=/hGchlnVO9M49Ub8L9agrY7aK/JcFgWSpoz50eS3HFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P9IMcd0ohZCJRraAOBAqpF1LxOZ427gfCqNDj09969gE0OMrbpLJNX0892DrNkKnz
	 84WxYlTMhgrd+PPfIVAAInvOVDsZ1JdKH97o4jUlHhyCpb0DIjbz/mItefmeFknwwb
	 TR1+YSPlr7GWeKpFVEKRVNQU/CumEjt7RMlMh6mc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB7BF8056F; Tue,  5 Dec 2023 16:25:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB786F80589;
	Tue,  5 Dec 2023 16:25:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FC7F80568; Tue,  5 Dec 2023 16:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFC9CF800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 16:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC9CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fflifId7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701789945; x=1733325945;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/hGchlnVO9M49Ub8L9agrY7aK/JcFgWSpoz50eS3HFw=;
  b=fflifId7jbP09eJvO8fKi93pq7u6bAPVd02QeusyaGII3tBvH7fde71N
   gqBUwO2R+JX+CXYuCDqaifWGQeAT1zaPcVWBXiuwVrGHsS/y382sd96+8
   mUNIAEMERxBk5oSAoCmearPot4oZDjZ0RRrOaIJSU5WWBkDyCoqa9qBaq
   FK/RHCLuxM02Aieh+7mZVIyTL1hkfHxX2L7up/vzoxkP8qwIXwErZ7VZ/
   Spx/fYdOkMW5nEJFWn/oYAxi7tbAnPSmQ/UYvkzKM3rhQ17P/1Rr5be+c
   c7LGeJQE4C2lTKtTJEySGwS0DKuc+/PTrC+71abeQzSVyn8RvKaARFpvF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12626117"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="12626117"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="888975319"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="888975319"
Received: from mbapna-mobl1.amr.corp.intel.com (HELO [10.212.151.198])
 ([10.212.151.198])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:25:39 -0800
Message-ID: <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
Date: Tue, 5 Dec 2023 09:25:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, perex@perex.cz
Cc: bard.liao@intel.com, mengdong.lin@intel.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
 <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VSR2TUKNAGJJGBC7HF4DHTF7RYMT2RKF
X-Message-ID-Hash: VSR2TUKNAGJJGBC7HF4DHTF7RYMT2RKF
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSR2TUKNAGJJGBC7HF4DHTF7RYMT2RKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/5/23 08:24, Charles Keepax wrote:
> cs35l56 is a boosted speaker amp add UCM support for a 4 amp
> configuration.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  ucm2/sof-soundwire/cs35l56-4.conf | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 ucm2/sof-soundwire/cs35l56-4.conf
> 
> diff --git a/ucm2/sof-soundwire/cs35l56-4.conf b/ucm2/sof-soundwire/cs35l56-4.conf
> new file mode 100644
> index 0000000..f5af1e4
> --- /dev/null
> +++ b/ucm2/sof-soundwire/cs35l56-4.conf
> @@ -0,0 +1,24 @@
> +# Use case Configuration for sof-soundwire card
> +
> +SectionDevice."Speaker" {
> +	Comment "Speaker"
> +
> +	EnableSequence [
> +		cset "name='AMP1 Speaker Switch' 1"
> +		cset "name='AMP2 Speaker Switch' 1"
> +		cset "name='AMP3 Speaker Switch' 1"
> +		cset "name='AMP4 Speaker Switch' 1"
> +	]
> +
> +	DisableSequence [
> +		cset "name='AMP4 Speaker Switch' 0"
> +		cset "name='AMP3 Speaker Switch' 0"
> +		cset "name='AMP2 Speaker Switch' 0"
> +		cset "name='AMP1 Speaker Switch' 0"
> +	]

If we only need an on/off switch, I wonder if this can be made
conditional, i.e. enable/disable a control if it exists. That would
scale to various numbers of amplifiers without a need to add a 2-amp, 6
or 8-amp configuration.

> +
> +	Value {
> +		PlaybackPriority 100
> +		PlaybackPCM "hw:${CardId},2"
> +	}
> +}
