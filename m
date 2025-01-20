Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE82A1791C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 09:14:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7575603DD;
	Tue, 21 Jan 2025 09:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7575603DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737447297;
	bh=TQpgB6KgvkARcWwudNBk86Uba6eC7LA4GwfNP28VwQE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c2IZq60wi4Y6hHcid9MZO8uWwSxE83kQC9CNRJBl6XWfgXkb+75Q4AYb+W/f/RrOd
	 bVugNnJUkGo1zcxrS5dr2e2Ymmz0vkA42faLdiK03Dbl5InVKDqrvU70CFBsb7z+Nb
	 ImIMtCr4b6DD1dd1OW/ItYCixdVjybOjzTrWbzVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B876F8061C; Tue, 21 Jan 2025 09:13:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35237F8060E;
	Tue, 21 Jan 2025 09:13:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A1EFF80517; Mon, 20 Jan 2025 16:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [IPv6:2001:41d0:203:375::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2BABF80424
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 16:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2BABF80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=ecEJ7gU8
Message-ID: <7e363634-b80f-4ae7-8d09-1bb07225eecd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737387063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2inTmLpoXCKi4QKCx6CF5haUkYgl9RHPMRrCAqx/1js=;
	b=ecEJ7gU8Q7q28GfUcgsiTNB14c+CzC12RxBMB3EuwN5zka+ntyZEPoy57i3eclQ7rEKPLJ
	z7mb1sJP5X9XagtnpFu+9is+YnxElytKNg6OSWQlSPelskVbLEPdYuou3kjaqvMpzC4IYv
	BTKemIshNN+Kc2/q5eFIgp90BMfTBIg=
Date: Mon, 20 Jan 2025 09:30:30 -0600
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH V2 3/7] soundwire: amd: add conditional for check for
 device resume
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
 <20250120101329.3713017-4-Vijendar.Mukunda@amd.com>
Content-Language: en-US
In-Reply-To: <20250120101329.3713017-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: pierre-louis.bossart@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5F3OQIS4ECRRUNU6OI73QFAWX5CRJBFQ
X-Message-ID-Hash: 5F3OQIS4ECRRUNU6OI73QFAWX5CRJBFQ
X-Mailman-Approved-At: Tue, 21 Jan 2025 08:13:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5F3OQIS4ECRRUNU6OI73QFAWX5CRJBFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 1/20/25 4:13 AM, Vijendar Mukunda wrote:
> Add a conditional check to resume SoundWire manager device, when the
> SoundWire manager instance is in the suspended state.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 60be5805715e..6831b3729db5 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -850,7 +850,10 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
>  static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
>  {
>  	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
> -	pm_request_resume(amd_manager->dev);
> +	if (pm_runtime_suspended(amd_manager->dev)) {
> +		dev_dbg(amd_manager->dev, "Device is in suspend state\n");
> +		pm_request_resume(amd_manager->dev);
> +	}

Is this test actually doing something useful?

If the device is already active, presumably doing a pm_request_resume() is a no-op. If it's already suspended it does something.
Testing the device state is risky with all the asynchronous behavior in SoundWire, best to leave the state checks to be handled inside the pm_runtime core, no?

IIRC the only time when such a test in needed is in the system suspend callbacks where specific action needs to be taken if the device is in pm_runtime suspended mode with the clock_stop mode engaged.
