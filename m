Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D349A32994
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2025 16:11:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEDF60275;
	Wed, 12 Feb 2025 16:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEDF60275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739373110;
	bh=99arZH731iDZzfa8ZZPAfBQWn0acSMZBM8u1cuqUXuo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gf6ltNl21xFpBMlVgDO4aI1NE56XT7jNXetl3x5he53wwBZKYgd9UvTmz1huE4YOa
	 VvXh/ydz/2IXoNQFZ0VqaZ53K7zdiENk5YKOGjv1GziKFogej8x0UvF7nkvG4mY5HP
	 /bbazXHGJR4A+AXUt+OX7lhdgEUikhG3cl78+nJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1AFCF805AF; Wed, 12 Feb 2025 16:11:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 831C4F805B6;
	Wed, 12 Feb 2025 16:11:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32B2CF8049C; Wed, 12 Feb 2025 16:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9546EF800E4
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 16:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9546EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=imuTfGHs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 51C6u2Y2016943;
	Wed, 12 Feb 2025 09:10:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gaOUuX7MQMuia9McaDE2MM2EVmIcLDAQ3K7abX1j5EI=; b=
	imuTfGHsfbgtQ94PMHcxX8dKsZW+Oc0j6LC0gyMYNSvSxqzXnaTaNlWMlRasdXb8
	Nvpn0HrIn7DtIobeHILQes4oMoaNlG73Y8wm7zusuXTIV6LoUIk3ST5faNQWzKj7
	2XJD6A9hHaGH09OdY5nTy3QSOpzWbQYodSyX3CAwKuhjM2+KS9YZc3YNNmmV8m25
	D9i01azVLWhpnnkJTPvSjBepXblKH+VJ8YY/c8ZMwcYO3NAnwIbcl3MiiiWby1mp
	TT9kYkZsv9tR2sHEUE1gVttwJMs81xJPVCfBthzNAaJGreCY6mhx/w0flyThJr4r
	+d2ehwWTAzHOVJUxjx+Tfw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44rpsv8nss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 09:10:58 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 12 Feb
 2025 15:10:56 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 15:10:51 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1F10582025A;
	Wed, 12 Feb 2025 15:10:51 +0000 (UTC)
Message-ID: <c92f8f5b-e6f4-41bb-86c1-dc45b80cd49b@opensource.cirrus.com>
Date: Wed, 12 Feb 2025 15:10:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
To: Fred Treven <ftreven@opensource.cirrus.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
 <4e5f0194-22bc-4e17-85f4-6dbc145a936b@kernel.org>
 <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O73DvA9W c=1 sm=1 tr=0 ts=67acba02 cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=_SCIqTSYrM5XDuVbtgUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dGfg_TWu3AP67jc1rHjLAyjt-XIXdm3d
X-Proofpoint-GUID: dGfg_TWu3AP67jc1rHjLAyjt-XIXdm3d
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WTT4JZX5TPJYE2N4DDWHXFOKQEI7DNZN
X-Message-ID-Hash: WTT4JZX5TPJYE2N4DDWHXFOKQEI7DNZN
X-MailFrom: prvs=11387f7191=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTT4JZX5TPJYE2N4DDWHXFOKQEI7DNZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/02/2025 9:16 pm, Fred Treven wrote:
> On 2/5/25 04:34, Krzysztof Kozlowski wrote:
>> On 05/02/2025 00:18, Fred Treven wrote:
>>> Introduce support for Cirrus Logic Device CS40L26:
>>> A boosted haptic driver with integrated DSP and
>>> waveform memory with advanced closed loop algorithms
>>> and LRA protection.
>>>

<SNIP>

>>> +static const struct spi_device_id cs40l26_id_spi[] = {
>>> +    { "cs40l26a", 0 },
>>> +    { "cs40l27b", 1 },
>>
>> What are these 0 and 1?
> 
> I will make it clear that these are enumerating the different possible
> device variants.
> 
> 
>>
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(spi, cs40l26_id_spi);
>>> +
>>> +static const struct of_device_id cs40l26_of_match[] = {
>>> +    { .compatible = "cirrus,cs40l26a" },
>>> +    { .compatible = "cirrus,cs40l27b" },
>>
>> So devices are compatible? Or rather this is unsynced with other ID 
>> table.
> I'm not sure what you mean by this.
> 

cs40l26_id_spi[] has the 0/1 cookie values to indicate which part
variant is being instantiated. But cs40l26_of_match[] doesn't have
these cookie values to indicate which part ID was matched.


