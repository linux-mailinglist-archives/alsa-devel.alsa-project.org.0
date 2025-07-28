Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD50B13953
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jul 2025 12:55:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76500601E5;
	Mon, 28 Jul 2025 12:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76500601E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753700139;
	bh=5xhS0LgHPXnMNMu7zQCvjpXnRD5j9EtWrqFbAN3k2r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b7YwQqUo3hrP37JtVtiv7J9sS7QJk6or2KYZWxX/yqbyrKqzrHU33xX/9T1Dfq4K3
	 e6aRvULZHx5xKre4NuNPjMnB/a15vGd9uXB/J4wAlKpvKc2q4vACLIyhcB1QHPkMYn
	 M8mO3wPKhpTC7BtarjY3Ef1v+qCxCXHdqffTlsKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AF35F805D3; Mon, 28 Jul 2025 12:55:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8D8F80552;
	Mon, 28 Jul 2025 12:55:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1282BF8026A; Mon, 28 Jul 2025 12:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3858F80152
	for <alsa-devel@alsa-project.org>; Mon, 28 Jul 2025 12:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3858F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=hYYvaVnw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF8C05C436B;
	Mon, 28 Jul 2025 10:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26C0C4CEE7;
	Mon, 28 Jul 2025 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753699927;
	bh=5xhS0LgHPXnMNMu7zQCvjpXnRD5j9EtWrqFbAN3k2r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYYvaVnw4+raQUimNXSJFUZKhQwO2aCBoJjZvCo7LhOivn7qRo0OXO0PyU9d/Bt2E
	 OT/JJLVvMYyhKFzkjB7oK1EPkPWdu3uQn9ufqK2+aSteVooWHiaq1xO5vBUF62iX5M
	 1IgaBC9oM7nBL4RWDNmSRMdAplhFbo7BwC/e7n7w=
Date: Mon, 28 Jul 2025 12:52:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Adjust pdm dmic gain using module
 parameter
Message-ID: <2025072814-stardom-anointer-0a62@gregkh>
References: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
Message-ID-Hash: DATDXXLUWS7IRYWTEGNNHQ5QZXKCQSWH
X-Message-ID-Hash: DATDXXLUWS7IRYWTEGNNHQ5QZXKCQSWH
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DATDXXLUWS7IRYWTEGNNHQ5QZXKCQSWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 28, 2025 at 03:12:27PM +0530, Venkata Prasad Potturu wrote:
> Adjust pdm dimc gain value using module param.
> In case of regressions for any users that the new pdm_gain value is
> too high and for additional debugging, introduce a module parameter
> that would let them configure it.
> 
> This parameter should be removed in the future:
>  * If it's determined that the parameter is not needed, just hardcode
>    the correct value as before
>  * If users do end up using it to debug and report different values
>    we should introduce a config knob that can have policy set by ucm.
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ---
>  sound/soc/amd/acp/acp-legacy-common.c | 3 ++-
>  sound/soc/amd/acp/acp-pdm.c           | 3 ++-
>  sound/soc/amd/acp/amd.h               | 6 +++++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
> index 57982d057c3a..dd804fb95790 100644
> --- a/sound/soc/amd/acp/acp-legacy-common.c
> +++ b/sound/soc/amd/acp/acp-legacy-common.c
> @@ -173,7 +173,8 @@ static void set_acp_pdm_clk(struct snd_pcm_substream *substream,
>  	/* Enable default ACP PDM clk */
>  	writel(PDM_CLK_FREQ_MASK, chip->base + ACP_WOV_CLK_CTRL);
>  	pdm_ctrl = readl(chip->base + ACP_WOV_MISC_CTRL);
> -	pdm_ctrl |= PDM_MISC_CTRL_MASK;
> +	pdm_ctrl &= ~ACP_WOV_GAIN_CONTROL;
> +	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, clamp(pdm_gain, 0, 3));
>  	writel(pdm_ctrl, chip->base + ACP_WOV_MISC_CTRL);
>  	set_acp_pdm_ring_buffer(substream, dai);
>  }
> diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
> index 1bfc34c2aa53..ffb622a7a69a 100644
> --- a/sound/soc/amd/acp/acp-pdm.c
> +++ b/sound/soc/amd/acp/acp-pdm.c
> @@ -38,7 +38,8 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
>  	/* Enable default DMIC clk */
>  	writel(PDM_CLK_FREQ_MASK, chip->base + ACP_WOV_CLK_CTRL);
>  	dmic_ctrl = readl(chip->base + ACP_WOV_MISC_CTRL);
> -	dmic_ctrl |= PDM_MISC_CTRL_MASK;
> +	dmic_ctrl &= ~ACP_WOV_GAIN_CONTROL;
> +	dmic_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, clamp(pdm_gain, 0, 3));
>  	writel(dmic_ctrl, chip->base + ACP_WOV_MISC_CTRL);
>  
>  	period_bytes = frames_to_bytes(substream->runtime,
> diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
> index cb8d97122f95..f2567e06ccd3 100644
> --- a/sound/soc/amd/acp/amd.h
> +++ b/sound/soc/amd/acp/amd.h
> @@ -130,7 +130,7 @@
>  #define PDM_DMA_INTR_MASK       0x10000
>  #define PDM_DEC_64              0x2
>  #define PDM_CLK_FREQ_MASK       0x07
> -#define PDM_MISC_CTRL_MASK      0x10
> +#define ACP_WOV_GAIN_CONTROL	GENMASK(4, 3)
>  #define PDM_ENABLE              0x01
>  #define PDM_DISABLE             0x00
>  #define DMA_EN_MASK             0x02
> @@ -138,6 +138,10 @@
>  #define PDM_TIMEOUT             1000
>  #define ACP_REGION2_OFFSET      0x02000000
>  
> +static int pdm_gain = 3;
> +module_param(pdm_gain, int, 0644);
> +MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");

This is not the 1990's, please do not add new module parameters, it will
not work for modern systems and is a horrible thing to attempt to
support over time :(

Please do this properly, with a per-device setting.

thanks,

greg k-h
