Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66F8AE48C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 13:45:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B88815FA;
	Tue, 23 Apr 2024 13:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B88815FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713872715;
	bh=qpvfUNzdiSw3PwDeKZ/yg/FJx0XxI/U3wt8Hpfs5xQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OnjAyzONJx00j6uVKU5Lctf5H/7aNYHRM4ccfw2YdFv3ITzg4OG9tALx5Oy3pMN5H
	 rGhc05bRmKQoPjx4jcjCCF68pwK/5zxJeQcjti4z9Q5owpMPSKfc5R5tNqPlghlhqc
	 OA0VJqhAoLrN3D/yYDxLmxVWayJd34iVj2wEL0FU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 918CAF8057B; Tue, 23 Apr 2024 13:44:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F235AF8057D;
	Tue, 23 Apr 2024 13:44:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B210F80423; Tue, 23 Apr 2024 13:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED441F801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 13:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED441F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QpNvhbis
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD060611DB;
	Tue, 23 Apr 2024 11:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6064DC116B1;
	Tue, 23 Apr 2024 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713872664;
	bh=qpvfUNzdiSw3PwDeKZ/yg/FJx0XxI/U3wt8Hpfs5xQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpNvhbisLI4AoWrmVir/ATpl7NxglXF6cVVihy0Fwq2p6ViLz1O72IOi0y8A5UKzC
	 0ZsIUWwx/hw+GEad/HA5JMn8rkJ2Iky0yY66yNjrNaNMvip09Yl+JerBVv7NUbCK2F
	 Z7UgJT+sZJKuX0qcEFxkcNO8kNONb9OXPlFAjV10kBLBUtW5yNcaJDDFDRIjBOZ8Vl
	 rI8OHCJy0svv4Nx0swjE1iKlqkJNkl6X5+9W6PX2+Q6zNW5kjCtXCZUTnvz6rLmLYG
	 VKgSnPLI92xy7fRt2bUP/EzEQhYYgt5H5siEfbWY+MFE7E2tIAKGMeDKaOwCqETxUu
	 BIdKDbas+unWw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rzEZS-0000000058y-12fi;
	Tue, 23 Apr 2024 13:44:22 +0200
Date: Tue, 23 Apr 2024 13:44:22 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
Message-ID: <ZiefFkFOh8xoI5Bf@hovoldconsulting.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
Message-ID-Hash: 6THUEXFSPI44AOVC52Q2CUQUQRTHWNXC
X-Message-ID-Hash: 6THUEXFSPI44AOVC52Q2CUQUQRTHWNXC
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6THUEXFSPI44AOVC52Q2CUQUQRTHWNXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 02:43:52PM +0100, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Add a common function to add Display port jack, this can be used by
> multiple board files and avoid any code duplication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/common.c | 29 +++++++++++++++++++++++++++++
>  sound/soc/qcom/common.h |  3 +++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 747041fa7866..3bfe618e7bd7 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -7,10 +7,14 @@
>  #include <sound/jack.h>
>  #include <linux/input-event-codes.h>
>  #include "common.h"

Missing newline.

> +#define NAME_SIZE	32
>  
>  static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
>  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>  	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
> +	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
> +	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),
>  };
>  
>  int qcom_snd_parse_of(struct snd_soc_card *card)
> @@ -239,4 +243,29 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
> +
> +int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
> +			   struct snd_soc_jack *hdmi_jack, int hdmi_pcm_id)

The function is called dp_jack_setup() so shouldn't the parameters
reflect that and be called dp_jack etc. for consistency (i.e. even if
you plan on using this interface also for hdmi)?

Johan
