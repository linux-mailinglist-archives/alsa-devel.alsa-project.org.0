Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97B665110
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:21:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A986763;
	Wed, 11 Jan 2023 02:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A986763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673400086;
	bh=akataVV8/0DapSMoYhbnfdEzhpmfzhdfJCigD6PWqj0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U8P4z02t/inNqLRZfaAXDB7KSQJuHFNzJ6+gXHCZFN3gwv3yAZhQsTD3JW/FqPv4y
	 sxoHtKFRXNK5V0w6xzKf2s5jtCmUV/TVVZjCMD/PmWHh7N5IFXFZpjF8z7oNQ2u8tB
	 sBgICl2h1YXbUpPOaIdHkQilKYHuRj7vr3JJtfDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE60F804CA;
	Wed, 11 Jan 2023 02:20:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48F1CF804C1; Wed, 11 Jan 2023 02:20:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36120F800C7
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36120F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BUw9/qIv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673400025; x=1704936025;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=akataVV8/0DapSMoYhbnfdEzhpmfzhdfJCigD6PWqj0=;
 b=BUw9/qIvpevPoPp6qfQg6FzQZSGFkAybvximgJUjWuh7xY5PdDNXmQf8
 AkILzZd0zq/b2pJ9Hii3T51iiBXgDrXqVL1oTmZSj9esZMiEW3Ad3HA13
 JB3X+IpU5ycOtIigemrTckX27Y88Wm4oC0OEaffGFV7zFTCQaL/Z92WVb
 jNFC4C3DuCZs3Z65+U43J0wlK7gDTwooPOkyxh/Lm9v0AnTvblAuQt2KE
 kkXVJmRQqIS8JAZ7PlU7ljRsv3WyuKSni/nIcRea3giUeuB02nrrePNId
 RnNTWJybXPB8Ac7JQuqMosWUa7IOEKi0gq/T+ItnqvIBX8kAnrzQ/4YRr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409538750"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="409538750"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 17:20:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="689612544"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="689612544"
Received: from bphilli1-mobl1.amr.corp.intel.com (HELO [10.209.156.204])
 ([10.209.156.204])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 17:20:08 -0800
Message-ID: <edde76c0-a444-1c3a-3541-af79897701fa@linux.intel.com>
Date: Tue, 10 Jan 2023 19:20:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/6] ASoC: Intel: bytcht_es8316: Drop reference count
 of ACPI device after use
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230102203014.16041-1-andriy.shevchenko@linux.intel.com>
 <20230102203014.16041-2-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230102203014.16041-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/2/23 14:30, Andy Shevchenko wrote:
> Theoretically the device might gone if its reference count drops to 0.
> This might be the case when we try to find the first physical node of
> the ACPI device. We need to keep reference to it until we get a result
> of the above mentioned call. Refactor the code to drop the reference
> count at the correct place.
> 
> While at it, move to acpi_dev_put() as symmetrical call to the
> acpi_dev_get_first_match_dev().
> 
> Fixes: 3c22a73fb873 ("ASoC: Intel: bytcht_es8316: fix HID handling")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

How do we proceed for this patchset? I am happy to ack a v2 if Andy
splits the AMD and Intel patches w/ a cover letter, but this could also
be added directly if there is no objection.
