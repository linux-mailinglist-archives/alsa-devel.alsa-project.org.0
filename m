Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211FD880E62
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 10:14:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A8CC1926;
	Wed, 20 Mar 2024 10:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A8CC1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710926067;
	bh=1b7UUVqZhSlBq9mJniOZ3VNSayqiZODVLYG4tG/MnPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q5sXI4mPqVfO4jLblxecpklyVUZp7hCZp7Uto/814JD5jYueixkD9xKncSk37qSWO
	 cCoyfW+O5mg+QK8Wp5Bww8X7RC6ee+VgjRa5+hC6+7KeZfuE71wvsvyJ+mM20uSZjw
	 64yOfyk+PCLTR4hiN3qV5V5OU5/LrjFibLhbdRdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3232F80580; Wed, 20 Mar 2024 10:13:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 940E1F8059F;
	Wed, 20 Mar 2024 10:13:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0C83F804E7; Wed, 20 Mar 2024 10:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39AF9F80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 10:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39AF9F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=YhKisc5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710925582;
	bh=1b7UUVqZhSlBq9mJniOZ3VNSayqiZODVLYG4tG/MnPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YhKisc5COUh8pVMqFr3PQ/ZSXO6/2wVCZrtESl/hZAf2/1QOMbnQO7Q/p+5ID19Gj
	 yaBzRidGhB15incFy1i6V+sXMWgIZVWdfKz9UAj9KJwm2/3PDDCIO4mqgki8/fjyVu
	 I9gxvagMlRm+T8l8FpVwztWEBmNEJVsFbm8GWNybZRAxlmDolc86jhZe5y3VlXd9bh
	 cN8tQDwiln2aI4C5QZTWXsG7K9r19bLqXRhvURbE8Mh882IeF+Tevei4hjpMkyFP91
	 vg2XER/kL9bVO3n6PBkHBRgWsjp2cA4VUwp6/vRHbqisWqLDeQg1QuYQ0oOqeaRvUa
	 G44qG4toMIBTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D272337813C4;
	Wed, 20 Mar 2024 09:06:20 +0000 (UTC)
Message-ID: <6273f41a-1ab7-40d8-a9ae-262b7cab2981@collabora.com>
Date: Wed, 20 Mar 2024 10:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Remove libraries from topology lookups
To: Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
 Wojciech Macek <wmacek@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rander Wang <rander.wang@intel.com>, Trevor Wu <trevor.wu@mediatek.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20240318183004.3976923-1-cujomalainey@chromium.org>
 <b1cc3856-fd06-4f3a-b7ff-4dabf249b68c@collabora.com>
 <CAOReqxgt5HFDFmW=mB0=hq04278McFVCeGuz08_G=v5Fs0NWHQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: 
 <CAOReqxgt5HFDFmW=mB0=hq04278McFVCeGuz08_G=v5Fs0NWHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I2O6XNIGHE3NV5HGLJTSMF3ILZ6LDVXJ
X-Message-ID-Hash: I2O6XNIGHE3NV5HGLJTSMF3ILZ6LDVXJ
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 19/03/24 16:51, Curtis Malainey ha scritto:
> On Tue, Mar 19, 2024 at 4:07 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 18/03/24 19:29, cujomalainey@chromium.org ha scritto:
>>> From: Curtis Malainey <cujomalainey@chromium.org>
>>>
>>> Default firmware shipped in open source are not licensed for 3P
>>> libraries, therefore topologies should not reference them.
>>>
>>> If a OS wants to use 3P (that they have licensed) then they should use
>>> the appropriate topology override mechanisms.
>>
>> That's ok, but still needs the sof-mt8195-mt6359-rt1019-rt5682.tplg firmware
>> in linux-firmware, or this change breaks sound.
>>
>> Regards,
>> Angelo
>>
> 
> Got any docs I can refer to? I have never contributed to
> linux-firmware. If you are willing to send the update on my behalf
> that would be fine by me as well.

There you go:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/README.md

Anyway, can you please also describe what is the appropriate topology
override mechanism in the description of this commit?

Thanks,
Angelo
