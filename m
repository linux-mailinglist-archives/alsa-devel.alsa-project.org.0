Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A79FAA30
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 07:09:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A604601B2;
	Mon, 23 Dec 2024 07:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A604601B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734934149;
	bh=nrc+SD0Pj5qDjajWk+2G/s3HKYE8BMI6C86R4ElicOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zh5vZ7pu5Q0s+GvolVPabS49ojys7G/voIFPxg0Q/d/UWZD8HAFo/6zF5F8X81/pA
	 fsw8rlCcAAnGXe3d/2B2bCcXLWeT1w3U+58jujkSUWB/vgR5r/Wz+wSMNgah5XDKaP
	 vxZqi+BU8mz0lVEpnJzs+BzOE4QtFUaRIFKXdYkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB811F805BF; Mon, 23 Dec 2024 07:08:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1DAF805C0;
	Mon, 23 Dec 2024 07:08:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF081F80254; Mon, 23 Dec 2024 07:08:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5471F800B0
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 07:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5471F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dnC5SB/i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 526EEA40BC6;
	Mon, 23 Dec 2024 06:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CC9C4CED4;
	Mon, 23 Dec 2024 06:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734934104;
	bh=nrc+SD0Pj5qDjajWk+2G/s3HKYE8BMI6C86R4ElicOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnC5SB/iZFWwSOqNZbSJFTPwaMrVuVcgAkI3PdGL5v4KrbvqcYfKJo9BedLt2xyhl
	 upxOhx/JG5tlbb5r5/EqF8r0ZvDbEIWmqioAmARydlGZ7+yDH5MGWTSHYq+JUI8FDe
	 R7c7askD710cGKs0/tFWaeNarzi+jZOglcwLmQgERM/UuN0XN2/c14Ipau0Ui81/5C
	 Lzx1UuKHg7biPYQ4OGsMz/1l/9P9oj27OtE9dKGm2VXobubnLH6F2+gnUtEJZGVYTx
	 X0eoOiYMRpRiwhs8Ji8uMcfPT9uzuQWJIRSHvh7DS6QbNccEiNi4jUGU1+MZ4AVuIh
	 iXgTcznbRMy6A==
Date: Mon, 23 Dec 2024 11:38:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
Message-ID: <Z2j+VQ4BPjr3HXsX@vaman>
References: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
Message-ID-Hash: ITM5YDHCYTMXRZDNCI4BK6VSH2JFGSQP
X-Message-ID-Hash: ITM5YDHCYTMXRZDNCI4BK6VSH2JFGSQP
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITM5YDHCYTMXRZDNCI4BK6VSH2JFGSQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03-12-24, 14:40, Vijendar Mukunda wrote:

for...? Pls write the full subject

> As per design for power off mode, clear the wake enable register during
> resume sequence.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5a4bfaef65fb..96a3aa6da711 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>  		return amd_sdw_clock_stop_exit(amd_manager);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));

no need for 0x for a zero value

>  		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>  		if (val) {
>  			val |= AMD_SDW_CLK_RESUME_REQ;
> -- 
> 2.34.1

-- 
~Vinod
