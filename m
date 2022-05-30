Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 844DF5379F2
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 13:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D62F1A6A;
	Mon, 30 May 2022 13:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D62F1A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653910393;
	bh=BCA9GHDRuUdk9xWK3DLQKtUv2RXOVskzfwKOMXN5Oa8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZ11f9UILVP/qVxxlfVDW6OrnFLIqeBswykpJyXIi+WmpoUW2zkocH5yP9j/bn/K5
	 ThH02unsqh1gYFKKnLtDitS3vzuIwC99bFFJqWNnudG5BI287hVe4bab/hSvgFBV21
	 oG0ZwD8Z1rsIeKHqSy4yxX+C2nnXHstE1fvJuDW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4E9F801F5;
	Mon, 30 May 2022 13:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FAF1F8019D; Mon, 30 May 2022 13:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D43F80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 13:32:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3ABDBA0047;
 Mon, 30 May 2022 13:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3ABDBA0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1653910326; bh=zjOHNt523dbFOX2xDzHhluv4/0kMV+wexiBuakxIphQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZJHLT1qARbd3f64k2TMFvhtn40n0feo6CMHuh2hvI+YggpDXWOsuPKN2+X79dbEt2
 xheVPxLuXhBZj8PQfCENcoXrDVozMqKt6dYFncRRVDZGt94BglqOqAQnl+Pp5/9rCJ
 7xc4sC62joPZ/9Pb00HUqKy9kaQR1HpGdSklKrZU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 30 May 2022 13:31:59 +0200 (CEST)
Message-ID: <dd0817a9-16f9-a08f-fcde-97788de445d3@perex.cz>
Date: Mon, 30 May 2022 13:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 16/17] ALSA: hda: cs35l41: Support Firmware switching
 and reloading
Content-Language: en-US
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <20220525131638.5512-17-vitalyr@opensource.cirrus.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220525131638.5512-17-vitalyr@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

On 25. 05. 22 15:16, Vitaly Rodionov wrote:

> This patch adds 2 ALSA Controls for each amp:
> "DSP1 Firmware Load"
> "DSP1 Firmware Type"

...

> +	struct snd_kcontrol_new fw_type_ctl = {
> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.info = cs35l41_fw_type_ctl_info,
> +		.get = cs35l41_fw_type_ctl_get,
> +		.put = cs35l41_fw_type_ctl_put,
> +	};
> +	struct snd_kcontrol_new fw_load_ctl = {
> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.info = snd_ctl_boolean_mono_info,
> +		.get = cs35l41_fw_load_ctl_get,
> +		.put = cs35l41_fw_load_ctl_put,
> +	};

I don't think that those controls should be SNDRV_CTL_ELEM_IFACE_MIXER type. 
The SNDRV_CTL_ELEM_IFACE_CARD seems more appropriate (service controls for the 
sound card).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
