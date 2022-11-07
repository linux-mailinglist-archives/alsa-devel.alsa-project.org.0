Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D395F61F546
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 15:17:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D35183A;
	Mon,  7 Nov 2022 15:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D35183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667830653;
	bh=Zp9d5lmlEwYQNB/2LUwcFa0f7+iSm6v+/s/K1TzfYyg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZxyzqEEa8TS7lpgEyeS5+okWUdDYGZNuuAhmF0xez2k1dOkpXXggDWXdMpIT5Bg70
	 k2i1duc5k0a3O08hdwLX5IKkN36EKBhUxAW98W8Vz3/6kNix28lbzDWOz0+eQf9WnY
	 oQA2Z4K3v28mbvbkfcVs1XS7+IABrxqLa+51LQZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40997F800AE;
	Mon,  7 Nov 2022 15:16:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE8CBF8024C; Mon,  7 Nov 2022 15:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26328F8024C
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 15:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26328F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k78C+Tug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667830570; x=1699366570;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zp9d5lmlEwYQNB/2LUwcFa0f7+iSm6v+/s/K1TzfYyg=;
 b=k78C+TugyrQS6aFMmBp/TxtfIyqvt8Rq9nqrEOGHSNX3EPHyHgyQFaR+
 hTnvrtaaxdS/kxsmKwu7JyMhMNTm1INSwW5/QCaoj2P8Q85aCwVDhzJxU
 6Nxk+OQ+VDU8jNl6Vy0/SdMNgxQ8LjpIMdL5sBG9Af1F7TjBcE58bESVL
 nNDljZtEZ67V96vmwY8AcJzZCTSTPdZGoV+fwnNnlINskGK4vvoMk6jGO
 +yVhtylwar5jSQxRizcMVs6P0L23NizSv3va0nehwFQEwe/2czC4MIqoi
 m5KgIjnJ7ioIoL/RS1y3eFMucAig7RWgxQRpW9L2jMLjrG1+w/S9iHyzY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374669612"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="374669612"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:15:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965162794"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="965162794"
Received: from seanabue-mobl.amr.corp.intel.com (HELO [10.212.82.80])
 ([10.212.82.80])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:15:46 -0800
Message-ID: <dff6e7af-6a07-587e-79d0-706fe7ec6504@linux.intel.com>
Date: Mon, 7 Nov 2022 08:14:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Content-Language: en-US
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
 <Y2EttkwUvMReQcqg@sirena.org.uk>
 <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
 <Y2JVWmJsprt0xnKH@sirena.org.uk>
 <7b97682d-5cf1-8be1-9c62-41c9fbd89018@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <7b97682d-5cf1-8be1-9c62-41c9fbd89018@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 11/7/22 04:34, Venkata Prasad Potturu wrote:
> 
> On 11/2/22 17:02, Mark Brown wrote:
>>> On 11/1/22 20:01, Mark Brown wrote:
>>>> On Tue, Nov 01, 2022 at 03:15:08PM +0530, Venkata Prasad Potturu wrote:
>>>> Right, that's what the code does but why is this something that should
>>>> be controlled in this fashion?
>>> This machine driver is common for TDM mode and I2S mode, user can
>>> select TDM
>>> mode or I2S mode.
>> Why would the user choose one value or the other, and why would this
>> choice be something that only changes at module load time?  If this is
>> user controllable I'd really expect it to be runtime controllable.
>> You're not explaining why this is a module parameter.
> 
> Different vendors/OEM's use the same hardware as one need I2S mode and
> other need TDM mode, using common driver  to support  I2S and TDM mode
> with this parameter.
> 
> 
> static int tdm_mode = 0;
> module_param_named(tdm_mode, tdm_mode, int, 0444);
> 
> And this can be runtime controllable by setting permissions as 0644, we
> will change and send next version patch.

kernel parameters are difficult to manage for distributions using a
single-build. Either all platforms use the kernel parameter or none of
them do. That would not allow a per-platform choice of parameters.
Using DMI quirks or ACPI identifiers would be a lot less problematic, no?
