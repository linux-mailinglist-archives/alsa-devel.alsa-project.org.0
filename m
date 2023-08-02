Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D252076D69D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A823E7;
	Wed,  2 Aug 2023 20:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A823E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691000125;
	bh=UgdXSsyvw65ySj43we4vjITUumnhHwnMR2GnhOr4S6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NhH7DrjbjJD21zFi0zWWlMYI+Z1AHxH74NPa5acLpjBlJGwkFGcgYt3A7k7fZTXVp
	 FA/p3CD/IQ+6MYxB8/QpDFvjmT/M1wirUyrQTDjksxI7s4JjZ6jCFMBtKQNbDW0rL0
	 Lkz+3yirdMoTGofAeqez7keYD0XZPK0r7oqA3CoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB8FF801D5; Wed,  2 Aug 2023 20:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E917DF80087;
	Wed,  2 Aug 2023 20:14:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D7A6F801D5; Wed,  2 Aug 2023 20:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0906FF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 20:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0906FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WvKoYJGi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691000067; x=1722536067;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UgdXSsyvw65ySj43we4vjITUumnhHwnMR2GnhOr4S6A=;
  b=WvKoYJGiZKarSOQ+i4JWHH/HBWbnHDteqN4mN3TiXO1PrZM37db0GetY
   fnE/F/z9eMmxEkZqJoqwWNfPDHVTjAaoCciWHo3eQvzyMnvyTr0fNftBI
   N51qcfslsWrVjDXMbh77LblFgU3fKkBA3M0ASsmiv4banNNH+mOp+oxHD
   20ECzfgur4Vab8hdV4zKOSzthC27WwUjXma7uuH/X5ojF4VGfyqqCS/SZ
   NgGqUWm1QXeWwoshd4ENOYIrki2Sl9WJIOZ3kzAMzxLy3y91k7khi0lZ+
   FEjdlWHD4GcHayOtqQSTSLQjxQT/SGv3U10hCK4hRPA+rbXYNaeou2hk1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="373302202"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="373302202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 11:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764311955"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="764311955"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO [10.212.125.114])
 ([10.212.125.114])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 11:14:22 -0700
Message-ID: <74ea038e-5ec3-c24b-4e05-7b8116f13297@linux.intel.com>
Date: Wed, 2 Aug 2023 13:14:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] PCI: add ArrowLake-S PCI ID for Intel HDAudio
 subsystem.
To: Mark Brown <broonie@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <206f5a15-29f0-ec7c-1b85-50ace8ae7c2f@linux.intel.com>
 <20230802162541.GA60855@bhelgaas>
 <b1c21bfb-2d47-4c42-87b7-2846de02e017@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b1c21bfb-2d47-4c42-87b7-2846de02e017@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QMZBIHHWPAVFZ53VVN3L4WDZDTKS2RTF
X-Message-ID-Hash: QMZBIHHWPAVFZ53VVN3L4WDZDTKS2RTF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMZBIHHWPAVFZ53VVN3L4WDZDTKS2RTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/2/23 11:34, Mark Brown wrote:
> On Wed, Aug 02, 2023 at 11:25:41AM -0500, Bjorn Helgaas wrote:
>> On Wed, Aug 02, 2023 at 11:07:36AM -0500, Pierre-Louis Bossart wrote:
> 
>>> I am not following. we just agreed a couple of weeks ago to record ALL
>>> Intel/HDaudio PCI IDs in the same pci_ids.h include file.
> 
>> I'm not sure who "we" is here.  If it included me and I signed up to
>> it, I apologize for forgetting, and go ahead and add my:
> 
>>   Acked-by: Bjorn Helgaas <bhelgaas@google.com>

This was the original thread for the record

https://lore.kernel.org/alsa-devel/20230717114511.484999-3-amadeuszx.slawinski@linux.intel.com/

>> I'm just pointing out the usual practice for pci_ids.h, as mentioned
>> in the file itself.

You're actually right that we didn't talk about the minimum criterion to
add a PCI ID to this file. To me it was a central place similar to the
cpu ids, etc., if it wasn't clear to everyone than it's good to agree on
this second point.

> I think the thing with these drivers is that we know they will become
> shared in fairly short order so it just becomes overhead to add then
> move the identifier and update.

Indeed, the sharing part is not always predictable and is subject to
roadmap changes made above my pay grade.

The intended use of the devices can vary as well, some PCI IDs for
desktops are intended to be used only by snd-hda-intel, but if one OEM
starts adding digital microphones then the SOF driver becomes required.

So rather than force everyone to follow changes at Intel or Intel
customers it's simpler to just add PCI IDs in pci_ids.h. We typically
deal with 3-4 PCI IDS per year


