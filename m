Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B37227EE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E997839;
	Mon,  5 Jun 2023 15:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E997839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973317;
	bh=Xfy1ZFQ0QE1wDshzrRpdeGSVpnkt6+xgJkDN7uwdJDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iRw+KBLIWw3al7Xt+l2uCGBcavHVEiQCxB6vji+PLKfjD/ycu6zJt5qrLzT5dkg91
	 gUL8oQnaxu1lwaCOzEQgyGGqO4Zo6l09yA8SZs5tsTSpe3RpoxUNY+YrsFxF776ei5
	 YhJbsaDWITngq9GOm8eOOXBcFaDEqsxzLQ7BwpRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26072F805AD; Mon,  5 Jun 2023 15:52:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE1FF805AB;
	Mon,  5 Jun 2023 15:52:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C12F8016B; Fri,  2 Jun 2023 11:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B286BF800ED
	for <sound-open-firmware@alsa-project.org>;
 Fri,  2 Jun 2023 11:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B286BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P+KNl/Nx
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe934so17467385e9.2
        for <sound-open-firmware@alsa-project.org>;
 Fri, 02 Jun 2023 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685699490; x=1688291490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGtSPD/KSvWTuHa/AA+uczmQU/ENOiQMfRsZQeajJ5I=;
        b=P+KNl/NxHb1htEUlM/JYGx6KvK0eHnRM1/FNkMDOULUzpQN5tQYzbSeWXp3UJz/mpr
         EQm1ZN77g2419QZCiDqctQYEzlaus5armw/606j9Rrxu4M3n3btbrexCK7Rp6QGfj6gS
         mOHrDofQiL181qUvzVK7sItn/sbDLHtqL/QX/EVic5HLWHr1NCYlK0G131KduHfxRcjH
         SMqnAgmXBnVv3L6y+jnIOWVk1CPIHPa6gre93EgFakek5vS8YyOlLQSjA2+1z39qZU+X
         SYVslyW20kz2S1z75HvMLjKPMk64OoPwK+hJPy2UchNMx70/lB+0qvlOVmraGe3QZIGF
         DM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685699490; x=1688291490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGtSPD/KSvWTuHa/AA+uczmQU/ENOiQMfRsZQeajJ5I=;
        b=P+pNjDZB8XyJ6GsQZF2ssg9a5rPSBZ4WQvcsLzrxDdJ5xld2U69i4MoEGByvy7EuDc
         Y4htYC8+xi8O4UGWHzMv0nITakrVEKKBZGG1TNpT0iaJqu+SKeaHwjTUpwaWyoWYxaYH
         eX0wln217GSR/YiVPs15yJwtkT5wncdk0JUHly+D4xkVbVz3yL8beUI5GGsKYoHRhtql
         dNeRWuDP0Y36zdEJ63iJ4wJsygb8VxleneWQM1Gf+18B+EgEHX2jCNuWqYg+vLJt4wzZ
         QwKGciZrQwiGeyI8G5maybU69Y6AozIX92qwyhH3prKwUqCawu353vb+SWI4eT1TgBsC
         5udw==
X-Gm-Message-State: AC+VfDwSLM3o2F6Drc6ilcz3wGYkm5k+A24RC+ln8lmmkicMPfGLCWIr
	0jONZGebZpeMfehCeNnnBlFv0w==
X-Google-Smtp-Source: 
 ACHHUZ6A1brfLCWWqQzljL7Mxmx2fPEHJx0/q/zn0bbgPiI4NqAwmYm0kU04EGZGKPiNYZHBwKX3cw==
X-Received: by 2002:adf:e988:0:b0:307:95d1:d7d0 with SMTP id
 h8-20020adfe988000000b0030795d1d7d0mr4253499wrm.39.1685699489831;
        Fri, 02 Jun 2023 02:51:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4585000000b003078354f774sm1185082wrq.36.2023.06.02.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:51:28 -0700 (PDT)
Date: Fri, 2 Jun 2023 12:51:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use size_t for variable passed
 to kzalloc()
Message-ID: <311dd225-9d30-4100-a779-bd0a9499535f@kadam.mountain>
References: 
 <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-sound-open-firmware.alsa-project.org-0;
 header-match-sound-open-firmware.alsa-project.org-1
Message-ID-Hash: FTNOYDJCHG4FVOVUVGJZXNMG2BSWMURK
X-Message-ID-Hash: FTNOYDJCHG4FVOVUVGJZXNMG2BSWMURK
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:52:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTNOYDJCHG4FVOVUVGJZXNMG2BSWMURK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 01, 2023 at 07:30:12PM +0200, Christophe JAILLET wrote:
> struct_size() checks for overflow, but assigning its result to just a u32
> may still overflow after a successful check.
> 
> Use a size_t instead in order to be cleaner.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Based on analysis from Dan Carpenter on another patch (see [1]).
> 
> [1]: https://lore.kernel.org/all/00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain/
> ---
>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index db64e0cb8663..50faa4c88b97 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -881,7 +881,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
>  	/* allocate memory for base config extension if needed */
>  	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
>  		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
> -		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
> +		size_t ext_size = struct_size(base_cfg_ext, pin_formats,
>  						swidget->num_input_pins + swidget->num_output_pins);

The temptation would be to change the addition as well:

	size_t ext_size = struct_size(base_cfg_ext, pin_formats,
				      size_add(swidget->num_input_pins, swidget->num_output_pins);

These values can only be in the 0-8 range so it's not a real bug.

Smatch cannot parse this data correctly to verify that it is safe.
Maybe in two years Smatch will be able to.  Probably a human who is
unfamiliar with this code can figure out that it is safe within 15
minutes?

I think the change to size_t doesn't hurt anyone and there isn't any
downside to it.  The size_add() change is slightly less readable than
just adding the numbers but I think eventually people will just get used
to it.

regards,
dan carpenter
