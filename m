Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B458267EACC
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:24:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C575E1F9;
	Fri, 27 Jan 2023 17:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C575E1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674836668;
	bh=gXy/xR/RWrIwWTaFez8LQGm0uEA3oxpX+WfkelmO6lA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GZ/2vnQZT6fdsHcRbwQo/IUTXu6Lm0KfCqxuAaVxITOcSQEUSGG4fH1MUnnd+avQM
	 YGBFetUkrayC3KdfNH2Dhy9KD9V+KOVJZWBhF9i4w6do6hNfhNrc2yHvCFYkJOdZPf
	 DFJZLgLNtzBb4diK8diL++OQ7i32cLKHEvraymjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11088F8007C;
	Fri, 27 Jan 2023 17:23:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56DCF80272; Fri, 27 Jan 2023 17:23:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B622F8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B622F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=IpC8aex1
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6988C11E3;
 Fri, 27 Jan 2023 17:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6988C11E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1674836603; bh=HFtCjUzVv6apt9RAMKC5bQL3yGHddvmCJcNQXNjbmQU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IpC8aex1xztHx+vCdN0KLrBAcTaNmNf9+t55wIPsjBft/8Dj2aTSmRnjbIZv8mSWn
 MgEgtwAolFaCoOlGbC+Oc2896R9XuSL+GB6UPqx++Q/RzfvhK5yQ9LtcSujkgEavdI
 bZJUUE/f7hyBi2ldl2GT2iFOewfmI0iaqOTwFiFY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Jan 2023 17:23:13 +0100 (CET)
Message-ID: <2e9f4301-0211-04f5-5b38-caf2be9f4fd1@perex.cz>
Date: Fri, 27 Jan 2023 17:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/6] ASoC: amd: yc: Add a module parameter to influence
 pdm_gain
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mukunda Vijendar <Vijendar.Mukunda@amd.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>, linux-kernel@vger.kernel.org
References: <20230127160134.2658-1-mario.limonciello@amd.com>
 <20230127160134.2658-3-mario.limonciello@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230127160134.2658-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27. 01. 23 17:01, Mario Limonciello wrote:
> In case of regressions for any users that the new pdm_gain value is
> too high and for additional debugging, introduce a module parameter
> that would let them configure it.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-pdm-dma.c | 7 ++++++-
>   sound/soc/amd/yc/acp6x.h         | 2 +-
>   2 files changed, 7 insertions(+), 2 deletions(-)

...

>   	pdm_ctrl = acp6x_readl(acp_base + ACP_WOV_MISC_CTRL);
> -	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
> +	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, pdm_gain);

The bits should be zeroed (AND - &) before OR to make sure that the correct 
value is written to the register. More related patches are affected.

>   	acp6x_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

