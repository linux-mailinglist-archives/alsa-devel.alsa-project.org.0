Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09B697F21
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 16:08:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE2B828;
	Wed, 15 Feb 2023 16:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE2B828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676473711;
	bh=KTPFBnoyRnHfUK2VFcUPfWiPaILRCFPZqJiHcvoKHKk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aJqspsItN01gJG7nqbQJMpPtQtqFW+DWkrd+G31iI0NuNE8WN7JCRfWetESr5Ec9l
	 q/rF1FAnQ/L7R+wbkBSipYXxPXRq+7/Rfr7HyjUSCq1GsoWKDpDWDRKnyJ/zM0m4qQ
	 csCHKlJPEqBRRppsUYU//wrz34HhB9whDyr2q9ig=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACC4CF801C0;
	Wed, 15 Feb 2023 16:07:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AF96F8047C; Wed, 15 Feb 2023 16:07:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA14AF800E4
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 16:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA14AF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=EaWB6Lx1
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ECC8F6602160;
	Wed, 15 Feb 2023 15:07:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676473647;
	bh=KTPFBnoyRnHfUK2VFcUPfWiPaILRCFPZqJiHcvoKHKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EaWB6Lx1rezf8HJn3U/YC93m6pmk+GckaT8t4JiGFU//hFUeftfzhlWLQvYRzoe3x
	 MxO7Jplknd8Wa/4eNG8C8EFXc/nNzS1Ce1mMuBoRYH88kWGD6WZC4qRrBuL706rF+z
	 nBS2bh7UCjHIZo3c9kBl8wnksIP+ypKVB83sPfh2+HMIHJLRQ4IE9xvciNGsfY2Tu5
	 78u8LCyu6KMil30KSo5bLeei88/9b/PCtmz2tUnJpISSedy+s5H0/XfnCRmXpbAVxV
	 5rIqEhvvdql1uVV4XR3C69XYlo/hIDpueJsP2V4SBXEdjhzfhSooRZnyqOpfScyrC1
	 0ZxMxfhZ7UPIA==
Message-ID: <aa953275-8d93-9acd-70cf-a108c154947f@collabora.com>
Date: Wed, 15 Feb 2023 16:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] ASoC: soc-dapm.h: fixup warning struct
 snd_pcm_substream not declared
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230215132851.1626881-1-lucas.tanure@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215132851.1626881-1-lucas.tanure@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LP6ME7WOCXZRDR6M7RPIHP277OM2PSVN
X-Message-ID-Hash: LP6ME7WOCXZRDR6M7RPIHP277OM2PSVN
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LP6ME7WOCXZRDR6M7RPIHP277OM2PSVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 15/02/23 14:28, Lucas Tanure ha scritto:
> Add struct snd_pcm_substream forward declaration
> 
> Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>

Effectively, a forward declaration is a better fit for this case.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
