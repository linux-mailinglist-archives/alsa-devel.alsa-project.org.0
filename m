Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D969E569
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5179E80;
	Tue, 21 Feb 2023 18:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5179E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998902;
	bh=iNxcRpw3Aa3BSYJT+x7q59TeKiNbc5wL89PaUfpKUrE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rIXBJkOticyTNlZ4MNkjuH80YuwgtOUsxPgNb8kle1sb8H+K9KSegQIKLXJG6TE80
	 3SNHsXK1S00yAyHV5nd75KgVZul5nC4w3toDC+wDBVuaT1e5GjZRybfDAydioPkCC2
	 Y1tIFIce+IFS533E3UL1oo5A3uR4xGDSajCmkhDQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9789DF80558;
	Tue, 21 Feb 2023 17:59:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6920BF80533; Tue, 21 Feb 2023 17:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9D4BF802DB
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9D4BF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UqsNoMqc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998734; x=1708534734;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iNxcRpw3Aa3BSYJT+x7q59TeKiNbc5wL89PaUfpKUrE=;
  b=UqsNoMqc/+DxomCk1lx+eU1hA4B00fbCKGIkZRp6owEnSk01+DWER4zw
   hbQr9+Al1ctN9OaKvhTC5cgnUoLHEsscuOp7SQ0kSGyOOzLnxzjo3W4Dc
   4/WTBMFU8shEN9Tm97hLPVYEzvYd0ZsOLlDM2eM5FQ+NKk8FUNKuTky5j
   GwPo/5Q3smBvEQ81U683NJcka0OZ1mm4LDy5Xtc+T87PXFa+Uqdcao1Cq
   T0H14OoQvaemRyfKRtF4WZ0JrfioVroZP9kkV+Pgcvv0G+jCDEXtsQRaS
   cqPVYA0FjmRm0kcrW/6P07CBfNK7SLbjkheeUknjDUrYtpz5UJ915oCbV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884676"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884676"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569107"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569107"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:37 -0800
Message-ID: <bc6aa297-0276-9e84-c775-7fe735ddaafa@linux.intel.com>
Date: Tue, 21 Feb 2023 11:05:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 5/8] soundwire: amd: add SoundWire manager interrupt
 handling
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-6-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JRYJ4KJKPJ7UEP7EWU3EM4WWBXLRQLTB
X-Message-ID-Hash: JRYJ4KJKPJ7UEP7EWU3EM4WWBXLRQLTB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 Mario.Limonciello@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRYJ4KJKPJ7UEP7EWU3EM4WWBXLRQLTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
> +{
> +	u64 response;
> +
> +	mutex_lock(&amd_manager->bus.msg_lock);
> +	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
> +	mutex_unlock(&amd_manager->bus.msg_lock);
> +	amd_sdw_process_ping_status(response, amd_manager);

do you have a case where a new command could be sent after the
mutex_unlock(), which could change the response fields?

In other words, should the last amd_sdw_process_ping_status() function
be protected as well?

> +}
