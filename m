Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393827BE84B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 19:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02465EC0;
	Mon,  9 Oct 2023 19:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02465EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696873004;
	bh=8tsOknoSZNrI5lLbriprtzrcWwXydj4Bi/9jI9hvshQ=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A4PDjpLBU333a2I1Z5gwQbWLnIVNGbEK4DN2iTkYpnVi5l30kp+42X06/ePqR8kOf
	 0MqySJg/4plOOl4+r55Ng84rwBak8vQgIjgLhjBeEmeqhUf42q3M7EFtGAE8w6NixD
	 ytg9CQB/28m4MHmsgUIW3chy4TfHIeD/PG4VuW9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B866F80552; Mon,  9 Oct 2023 19:35:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D60BFF80166;
	Mon,  9 Oct 2023 19:35:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B813DF802BE; Mon,  9 Oct 2023 19:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBD0BF80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 19:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD0BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Lhz74lyQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696872939; x=1728408939;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=8tsOknoSZNrI5lLbriprtzrcWwXydj4Bi/9jI9hvshQ=;
  b=Lhz74lyQZ8w8bNXfx8fW16jCKggze/P/TACaKC65wFQMILB/kSuk7mG6
   xxmwqQb7ERVjBCHRKVSI/KYHK0qXN+IQ8rOW1ETTgTMoxafd9PoFf7DXI
   SiZ2twzS74FLQMVjPoESkECiFKnk2/2GZKDzwJvDanD0uuIBRntmgvJX2
   qOsD208XvRT4qLiPi7aa8HC+CspOlZJAIhHQ8oePS3lBN9iFPzt8xalX/
   GN736PmJHRHVUPgQLs5X3DiIqT27tWSfcklFE9iknb/SvMAsZq3BHY0Va
   2SUkABCucykiyoeHb5PB9LPEgO7eNy1HHvjI/f4ePpFzn4Cok8UzTyCip
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="388072694"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200";
   d="scan'208";a="388072694"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 10:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843799715"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200";
   d="scan'208";a="843799715"
Received: from cyortiz-mobl.amr.corp.intel.com (HELO [10.213.176.51])
 ([10.213.176.51])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 10:35:34 -0700
Message-ID: <2cfbeaab-9bdc-499b-8525-2296c0481cf4@linux.intel.com>
Date: Mon, 9 Oct 2023 13:35:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hda/realtek: Add SND_PCI_QUIRK entry for the Dell XPS
 9530 laptop for dual speakers
Content-Language: en-US
To: brett@worth.au, alsa-devel@alsa-project.org
References: <9c7b08fc-7f00-4894-a5b2-f3fc5f99e022@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9c7b08fc-7f00-4894-a5b2-f3fc5f99e022@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NU2422MNWZG53P55Z7PIQISMHGRSNRBY
X-Message-ID-Hash: NU2422MNWZG53P55Z7PIQISMHGRSNRBY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NU2422MNWZG53P55Z7PIQISMHGRSNRBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/7/23 07:43, Brett Worth wrote:
> The Dell XPS 9530, like previous XPS laptops like the 9520 and 9510 have
> dual speakers in each channel.
> 
> If the ALC289_FIXUP_DUAL_SPK flag is not set in
> sound/pci/hda/patch_realtek.c only the tweeter will work and therefore
> make the sound quality terrible.
> 
> This patch has not been tested but is derived from a previous patch
> attempt from a different user called Pentracillin which was rejected.

This looks like the same issue posted here
https://github.com/thesofproject/linux/issues/4624. I added a link to
see if others can test.

> $ diff -r -up a b
> diff -r -up a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> --- a/sound/pci/hda/patch_realtek.c     2023-10-07 22:16:36.129618972 +1100
> +++ b/sound/pci/hda/patch_realtek.c     2023-10-07 22:16:52.645258218 +1100
> @@ -9412,6 +9412,7 @@ static const struct snd_pci_quirk alc269
>        SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570",
> ALC289_FIXUP_DUAL_SPK),
>        SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620
> 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
>        SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620",
> ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
> +       SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530",
> ALC289_FIXUP_DUAL_SPK),
>        SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340",
> ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
>        SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340",
> ALC236_FIXUP_DELL_DUAL_CODECS),
>        SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340",
> ALC236_FIXUP_DELL_DUAL_CODECS),



> I don't have much confidence that this patch request will meet the
> requirements.

Your Signed-off tag is needed, along with a commit title and message.
Also Cc: maintainers.


