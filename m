Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCE7D3F6C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 20:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39EB985D;
	Mon, 23 Oct 2023 20:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39EB985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698086499;
	bh=7I76GhrFH1ankannClmf806vy5yk8xmXcsOuatft2C8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O4yJ35noPoGtGkUuqlvE0u8q/N7UTxRB0cKOE6Oz83NnfT1jvOC6cCC364QgPz0vq
	 4e6dXYbCwPGQi4uw5J3L0mLpjsKIH62wUGMoLclZfvOFCTSKaYRaa8+H+us8nO2FqW
	 N4kwhqjqqC+msC9kAgkkkuYDxIB7fSPN01/rPdCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C5C6F80537; Mon, 23 Oct 2023 20:40:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA36BF8032D;
	Mon, 23 Oct 2023 20:40:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCB32F804F3; Mon, 23 Oct 2023 20:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18E57F8024E;
	Mon, 23 Oct 2023 20:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E57F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lMZGd3l9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698086419; x=1729622419;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7I76GhrFH1ankannClmf806vy5yk8xmXcsOuatft2C8=;
  b=lMZGd3l9sk4+OaCKKSULF0dCOm2k5AQmVq6Pfie2WqD3/nqisjZh6j6o
   4oD7MrtLxWXrS6nokXHtw4fDT5jdX1wFGSFrCW0vOydt/qh0xK5+HsZQ3
   2jGq6yHXZuHVpFff4B5Bi45gBBHNch3JKapJaghWFc7Juhs2t4/eEzUxU
   lJS9TMZTmGagDsF9d7ANvt6xDFjJcVTG9ZUqcVHAt0Ij9ovyRA0rKE+SO
   bIR6pkOV9tQuIk+I+JuUUuZjf8Gkoa7qlBJ7zR8P9OGViq8sm1p4lZrAS
   WisEyRHQqCGsxUFcVz8jYiVdCLDEYwFauGq8mDWqpTlUfLc7aUDKpwqAm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390788529"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200";
   d="scan'208";a="390788529"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 11:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="824048819"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200";
   d="scan'208";a="824048819"
Received: from weiyiwil-mobl.amr.corp.intel.com (HELO [10.212.122.211])
 ([10.212.122.211])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 11:40:02 -0700
Message-ID: <fb7cf366-b659-4321-b81b-ca76704a85ab@linux.intel.com>
Date: Fri, 20 Oct 2023 16:21:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: SOF: sof-pci-dev: Fix community key quirk
 detection
Content-Language: en-US
To: Curtis Malainey <cujomalainey@google.com>,
 Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>, stable@vger.kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
References: 
 <20231020145953.v1.1.Iaf5702dc3f8af0fd2f81a22ba2da1a5e15b3604c@changeid>
 <CAOReqxhrhzWh-aO5kt-7yqcfX9CbHW-WBgBAqQ9FqeUj-h1o=A@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAOReqxhrhzWh-aO5kt-7yqcfX9CbHW-WBgBAqQ9FqeUj-h1o=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BJYVAQHKACPXOSTTAHQXX3OZCGE7T5H3
X-Message-ID-Hash: BJYVAQHKACPXOSTTAHQXX3OZCGE7T5H3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJYVAQHKACPXOSTTAHQXX3OZCGE7T5H3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> On Fri, Oct 20, 2023 at 2:00 PM Mark Hasemeyer <markhas@chromium.org> wrote:
>>
>> Some Chromebooks do not populate the product family DMI value resulting
>> in firmware load failures.
>>
>> Add another quirk detection entry that looks for "Google" in the BIOS
>> version. Theoretically, PRODUCT_FAMILY could be replaced with
>> BIOS_VERSION, but it is left as a quirk to be conservative.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> 
> Acked-by: Curtis Malainey <cujomalainey@chromium.org>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Now let's see how the machine drivers need to be updated...
