Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D452A933A0A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D7641F1;
	Wed, 17 Jul 2024 11:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D7641F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721209019;
	bh=wIZrglgYO769FiWXo1dTFFsEPXihHFxfIcMy8tkZCfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=shfjow0+ERjGzyOBA9iHYJVL6aYFQHUUkF9LQHasM2uF7V5wpVjJ0VTuTwWdvnKxj
	 XqDb27Y2+JDC78KQvMtLPMzcvpBPl2UgeDxHEyzKLfbyGH03gwahpx4SCQ298oOUi/
	 bZzYN8Yg5B8iDHBo8FamzHfXsAXSW8+MJ4iZn/S4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12A9F8061C; Wed, 17 Jul 2024 11:35:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B32F8061B;
	Wed, 17 Jul 2024 11:35:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F540F8026D; Tue, 16 Jul 2024 05:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A0C8F800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 05:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A0C8F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=manjaro.org header.i=@manjaro.org header.a=rsa-sha256
 header.s=2021 header.b=lxuNgjXh
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1721098862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rswZVR3IzZAW4VDWUHfqlBwWT/NMTNi3QeFCfqZztcA=;
	b=lxuNgjXhtThjdVjaTyB7CTsdTVTkjfUE9RDuu8hlmnVLhQQqRpFmd0OLVyoDrSZy+yWYkZ
	dATGbyxVxVsR+OInDlBIzVeCe7qzZnZmJFVMYOkrB3k2wt/8IugXdMZqYgpJKon4O0scLl
	H+k5sQJ9w+kiBhOtOuOGGd75F4U1Z58hN8EF9PL/Fb0Ao7620HF9sv0N3jja+daz0nYX8p
	vttaTk1jdramm55qdAykKHzixGmZPDfu4kbQhRtz0CKwGXiHcpCQ5XDEEEIotIgsFJBLdY
	fBB9R7iOi0/WCvtdwEohs7uZO8+iFoSCzNut4auLRwdLCw92z3grtk/v6qDSHA==
Date: Tue, 16 Jul 2024 05:01:01 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, sbinding@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42l42: Convert comma to semicolon
In-Reply-To: <20240716025307.400156-1-nichen@iscas.ac.cn>
References: <20240716025307.400156-1-nichen@iscas.ac.cn>
Message-ID: <32852e06f72e570de3da00f4ded84211@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-MailFrom: dsimic@manjaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FLSQKPV7WRX37GSXAWWOQ7MWXK4SRDRD
X-Message-ID-Hash: FLSQKPV7WRX37GSXAWWOQ7MWXK4SRDRD
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:35:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLSQKPV7WRX37GSXAWWOQ7MWXK4SRDRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-07-16 04:53, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: 90f6a2a20bd2 ("ASoC: cs42l42: Add SoundWire support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Nice catch, thanks!

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  sound/soc/codecs/cs42l42-sdw.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l42-sdw.c 
> b/sound/soc/codecs/cs42l42-sdw.c
> index 94a66a325303..29891c1f6bec 100644
> --- a/sound/soc/codecs/cs42l42-sdw.c
> +++ b/sound/soc/codecs/cs42l42-sdw.c
> @@ -323,15 +323,15 @@ static int cs42l42_sdw_read_prop(struct
> sdw_slave *peripheral)
>  	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> 
>  	/* DP1 - capture */
> -	ports[0].num = CS42L42_SDW_CAPTURE_PORT,
> -	ports[0].type = SDW_DPN_FULL,
> -	ports[0].ch_prep_timeout = 10,
> +	ports[0].num = CS42L42_SDW_CAPTURE_PORT;
> +	ports[0].type = SDW_DPN_FULL;
> +	ports[0].ch_prep_timeout = 10;
>  	prop->src_dpn_prop = &ports[0];
> 
>  	/* DP2 - playback */
> -	ports[1].num = CS42L42_SDW_PLAYBACK_PORT,
> -	ports[1].type = SDW_DPN_FULL,
> -	ports[1].ch_prep_timeout = 10,
> +	ports[1].num = CS42L42_SDW_PLAYBACK_PORT;
> +	ports[1].type = SDW_DPN_FULL;
> +	ports[1].ch_prep_timeout = 10;
>  	prop->sink_dpn_prop = &ports[1];
> 
>  	return 0;
