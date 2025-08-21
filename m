Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBABB4C75F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D542260218;
	Tue,  9 Sep 2025 14:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D542260218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419703;
	bh=gRwq2s/V2iE6bhB3OOT7BCHt4ZxoyBZq2/8tIc8uFrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aNyj6Rir6aI4/kU2afmsZ++32kIUTk43RNEBoR8+KqWd4/hP6NHkfFno7ZeRzgn0D
	 l4hTuh0NN/MmhD7k8l+kQURspNOs7CGGMvD1miYzDepZY9XuJXrDXVlgtQrKiz09B6
	 KIA5HBiHA3gegF2Ri0/OomPVCxL4PUpxgJIfcOiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1BEF805EB; Tue,  9 Sep 2025 14:07:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F67F805EB;
	Tue,  9 Sep 2025 14:07:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5021FF80518; Thu, 21 Aug 2025 15:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D5BAF80152
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 15:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D5BAF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o8eGLnw6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FC16A57E1D;
	Thu, 21 Aug 2025 13:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55E9C4CEEB;
	Thu, 21 Aug 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755781571;
	bh=gRwq2s/V2iE6bhB3OOT7BCHt4ZxoyBZq2/8tIc8uFrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o8eGLnw6hM3k1j8cqMWWe/72qKOeiA/0/SKtmpr6s9mTYjmanUScwq/pyEjyb6biF
	 V61CCyvLJRZzLAclm7QvWElEwcvtB6redG/PFTKx3FMTmrJh6Rgv5QzvFTNnp3aTJh
	 aw0l9rTm0cUL1IBvbzF/OSgLy8oRQEpyonnYd+tJkSVttqj+VcE4RrzgIBv1ZQ0Tef
	 i9Jq7ETN0LyMIbJy/6oBwF8NSkknsWPWz74Z7ltIY6ZZANIa4R+uMdyXaAm4sZkMci
	 RBR/L0EbidrqxO2+rfK2HJOF/DbwfK00wmlsai+915ro7hL3io27ThbojBIG7Y4utH
	 PpoBKjVdfv1Zg==
Message-ID: <86ca694c-a034-4291-a2ce-303895522156@kernel.org>
Date: Thu, 21 Aug 2025 08:06:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: amd: acp: Adjust pdm gain value
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250821054606.1279178-1-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250821054606.1279178-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GQZYXSWGQA6ZM6F5OXFEYGT72LMP335V
X-Message-ID-Hash: GQZYXSWGQA6ZM6F5OXFEYGT72LMP335V
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:07:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQZYXSWGQA6ZM6F5OXFEYGT72LMP335V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/21/2025 12:45 AM, Venkata Prasad Potturu wrote:
> Set pdm gain value by setting PDM_MISC_CTRL_MASK value.
> To avoid low pdm gain value.
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ---
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> Changes since v1:
> 	- remove pdm gain adjustment using module parameter.
> 
>   sound/soc/amd/acp/amd.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
> index cb8d97122f95..73a028e67246 100644
> --- a/sound/soc/amd/acp/amd.h
> +++ b/sound/soc/amd/acp/amd.h
> @@ -130,7 +130,7 @@
>   #define PDM_DMA_INTR_MASK       0x10000
>   #define PDM_DEC_64              0x2
>   #define PDM_CLK_FREQ_MASK       0x07
> -#define PDM_MISC_CTRL_MASK      0x10
> +#define PDM_MISC_CTRL_MASK      0x18
>   #define PDM_ENABLE              0x01
>   #define PDM_DISABLE             0x00
>   #define DMA_EN_MASK             0x02

