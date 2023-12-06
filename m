Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C777C807278
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9C782B;
	Wed,  6 Dec 2023 15:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9C782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701873204;
	bh=qdPNMTqvycX05WJrpwXBuQBqD3LcOZ9tw4YPU2IGd+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDljnHAhdTqELBLlBofGwkvsA+dENUo1wG01MUdSadfObCP2+2D5bwKfxDyBJ/9KC
	 Z7rXUJ6AUFFrDVPpT2IUF84wYwLIYb8L56SEUAbCFbGRYLqzLm2Zdn5heS5XcpPrD4
	 MRzXARPWZuGICVbGOg4bjftVRvkHgp+2Kr9ODQM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B17D5F800AC; Wed,  6 Dec 2023 15:33:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF331F80578;
	Wed,  6 Dec 2023 15:33:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0ED6F8024E; Wed,  6 Dec 2023 15:33:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39492F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39492F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Q6fLpv9t
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA2E0660734D;
	Wed,  6 Dec 2023 14:32:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701873152;
	bh=qdPNMTqvycX05WJrpwXBuQBqD3LcOZ9tw4YPU2IGd+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q6fLpv9tqetHcFEuFtAmq3xa0+MGkIDm+0+DkxdHG+6G0zOVJhYLqihNyYX2yd19G
	 1cLd/Zwuk7xISfEoEDnzwMFpMAVRCau+EgEQG64eODmPpYzx1Kr3FSjQJcvPXS5ogs
	 RoFtjXTaWICSGEsX/yIKwumo3Tq/JEzD4gCX28tEkjBSDi0D23VvTBn57i13Y41gbD
	 tunB8XibnxSUu1ELMKtFf7syGd5MlaLXVjtKiWcRLz5mIFWScdnKIEN2dK0evIeRxr
	 vkFdofoD4B+D//c7s0sgsx2ma6Vz+RSnoQ1Yxo0iZvt7/ZeKMvyOsObTHpCf/xP3c2
	 iqouGPyUze9pA==
Message-ID: <b441c416-91aa-4723-a605-a58974dcc444@collabora.com>
Date: Wed, 6 Dec 2023 15:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix
 topology compatible
Content-Language: en-US
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>
References: <20231205220131.2585913-1-cujomalainey@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231205220131.2585913-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HQ64OL7DTMXBKHIVDB67YPY4DRN7Q763
X-Message-ID-Hash: HQ64OL7DTMXBKHIVDB67YPY4DRN7Q763
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQ64OL7DTMXBKHIVDB67YPY4DRN7Q763/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 05/12/23 23:01, cujomalainey@chromium.org ha scritto:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> This reverts commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2.
> 
> This is not an official topology from the SOF project. Topologies are
> named based on the card configuration and are NOT board specific.
> 

While I can totally agree with that, can you please explain how should the correct
topology file name be selected instead of machine compatibles?

Thanks,
Angelo

