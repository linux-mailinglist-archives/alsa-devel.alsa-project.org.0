Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EA634EA5A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C15F1675;
	Tue, 30 Mar 2021 16:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C15F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617114286;
	bh=NnCum90pkLS1pu7IJkBeqGpOeLG9KZZIAG594J90RFs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jK1Qs0vssAvu29Piv2neCkmKKHfz4EUK3dxJZP6MMWcOsuy8m2tONq0KOIjkhg/1b
	 Lfg8SthkMyj3/BZ5FMt2kDZwAAS9kYPOUAsQARNdMQVo3TtKBxN5Nkp3fEgm4hVydF
	 Ut77cgZPddvFsKoAq494TJybwYpGbGVE4HnYcEDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 788B1F800B9;
	Tue, 30 Mar 2021 16:23:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93B83F80240; Tue, 30 Mar 2021 16:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76D06F8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D06F8014E
IronPort-SDR: UaWHHUnR6DD0faa7rAfFd73vCwVBj1QGcCR9S2P3m6699t9/eRslmxPbC6zVi7N/uGhtf3E4hl
 yU0JhZ8CnyKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="171797203"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="171797203"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 07:23:00 -0700
IronPort-SDR: ghwn0ifiJw8J7fxvJoWtadsdpQs8QxU/11b4VnX/XZukEvV1bDWcHn9gPakWimqSBwy6MTEMIl
 2J8X0rYuD8Cw==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="393626944"
Received: from feifeich-mobl1.amr.corp.intel.com (HELO [10.212.41.240])
 ([10.212.41.240])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 07:22:58 -0700
Subject: Re: [PATCH] ASoC: amd: Add support for ALC1015P codec in acp3x
 machine driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <82817878-a30d-2b0c-07f8-48bcca3ebc80@linux.intel.com>
Date: Tue, 30 Mar 2021 09:22:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: jack.yu@realtek.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Tzung-Bi Shih <tzungbi@google.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander.Deucher@amd.com, shumingf@realtek.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 flove@realtek.com, Akshu Agrawal <akshu.agrawal@amd.com>
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


>   static const struct acpi_device_id acp3x_audio_acpi_match[] = {
>   	{ "AMDI5682", (unsigned long)&acp3x_5682},
>   	{ "AMDI1015", (unsigned long)&acp3x_1015},
> +	{ "AMDP1015", (unsigned long)&acp3x_1015p},

This isn't a valid ACPI ID. AMDP does not exist in
https://uefi.org/acpi_id_list

There was a similar issue with Intel platforms using this part, we had 
to use a different HID.


