Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1DD720A87
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A270847;
	Fri,  2 Jun 2023 22:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A270847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685738841;
	bh=ue+ESZp616yu2n5D7DC6oECmULAzI1LX+X9KayeVLhI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nsybdYbIB8i4slzqu5slUAmmCaU46T3tuBESs4eMRtSNRcMLJv5oYPN52lyujhZQv
	 GzUs+xOmXWDocTTvbOZIjJUzmf9cg1NRQWQJV3npz1jUN6/UAZZ6NMXzzxtmwIv2x3
	 g5hqYYskZON6wBEuF8FcQkFD4+SmM+4e44FAH+jA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E1FF80544; Fri,  2 Jun 2023 22:46:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 898AFF800ED;
	Fri,  2 Jun 2023 22:46:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D4DCF80132; Fri,  2 Jun 2023 22:46:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75ED6F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75ED6F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q172gxfC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685738785; x=1717274785;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ue+ESZp616yu2n5D7DC6oECmULAzI1LX+X9KayeVLhI=;
  b=Q172gxfCjgaXowyN1u+wcduysy+LhaWGsswLxfaWQLG8e7F43AqWsjaG
   RFUfbeOdnJMfDG5nnEg8JWsnLX7W5vLuYW6mo+5MrRQEUHU4Tmf0ImDvl
   ECxldqQSepKBgefN3+NPC/ro1Lex9rhjpH1qhZqTmClD0ldWmZa5XaYds
   kH5wnCoNrWfl2bdUA552ckSLkozR/jfMHAauc9vPW2nx4dDoFO3JhpgTM
   49z5aHEF3nzb5+2wSROztT+h3NsJXTQopX3psBPiMQf33b/KeIldLQCvi
   4Ppuycj130zSUHlGaYlMlu6+JdK3Y1h6+5fOvj16Tm5znVxKZKko7qfHv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353458243"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="353458243"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737659314"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="737659314"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO [10.212.190.110])
 ([10.212.190.110])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:46:17 -0700
Message-ID: <8f4a024d-a218-c4ed-925c-b74663b7e280@linux.intel.com>
Date: Fri, 2 Jun 2023 15:46:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/26] ASoC/soundwire: add support for ACE2.x
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
 <ZHHdSjXwyHvBezkG@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZHHdSjXwyHvBezkG@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6NPNA4GKBJSASP76DNQFKPWJJLQWDJN5
X-Message-ID-Hash: 6NPNA4GKBJSASP76DNQFKPWJJLQWDJN5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NPNA4GKBJSASP76DNQFKPWJJLQWDJN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/27/23 05:36, Vinod Koul wrote:
> On 15-05-23, 15:10, Bard Liao wrote:
>> This series uses the abstraction added in past kernel cycles to provide
>> support for the ACE2.x integration. The existing SHIM and Cadence
>> registers are now split in 3 (SHIM, IP, SHIM vendor-specific), with some
>> parts also moved to the HDaudio Extended Multi link structures. Nothing
>> fundamentally different except for the register map.
>>
>> This series only provides the basic mechanisms to expose SoundWire-based
>> DAIs. The PCI parts and DSP management will be contributed later, and the
>> DAI ops are now empty as well.
>>
>> The change is mainly on SoundWire. It would be better to go through
>> SoundWire tree.
> 
> Applied, thanks

Hi Vinod, is there a way you could provide an immutable tag for Mark
Brown, the patch1 in this set is required for my next set of ASoC
LunarLake patches?

"ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake" adds
the SOF_INTEL_ACE_2_0 definition to select different ops for LunarLake.

Thank you
-Pierre
