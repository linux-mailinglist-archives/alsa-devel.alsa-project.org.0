Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B1894C18
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89CA92C5D;
	Tue,  2 Apr 2024 09:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89CA92C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041442;
	bh=v8mIn4wI6Nk8yWeAoiTyvSclm6AdbmqShOByjQ1EiZc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IS6utURt4Tt5hFYP0D3GEzvEBjfBjSD4VP1d2LypL1zPgtyZ7WlJmdZM76/dp3s5d
	 xIHpqmnrLiRH8nqRCc4/1P1ae85c6wtGgrwhPl6YYF5X1eMd50oyW9au3NCmohSrAp
	 JT/36V+akYyrwdQhps39CA0sEvwGdmArF7GnaFRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34926F89931; Tue,  2 Apr 2024 08:54:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB52F89943;
	Tue,  2 Apr 2024 08:54:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 322B6F8025F; Fri, 29 Mar 2024 14:24:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F12EF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 14:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F12EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N8cvRHyP
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE1FE0008;
	Fri, 29 Mar 2024 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711718648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8zwe634gu5wQNCVCxvtpKe0aX4n7o17eGhcQXcT/N4=;
	b=N8cvRHyPJgw5j5LKkih7d26o4xz2NIuPQNXKFj8uupd470/nXWH0scfZaHHEl3j9CKrBex
	Pbskzy//s8gOQPW0Q9RyQ6c6e6pf+5HxiHLme7pdkxLnOW5BEkSDlSNai8dTMispVpfws/
	hLchxIIMJdRL9lZzAYWvm3+M0LJCFePBNb3hgl4yEe6YKKbSw+vwZuovy5Yywy4bpJw4mb
	KIdJHjIhBxrWkPrLV2Q9PnSYK7cgJP063BauaJRtBMkA4rsytPkNKxJG5OQUu7EsZeBmQ5
	XyV61Cs61Per8cmpSkvlDdInL17uL9nbTK8mu1ED+Jqje3CvdwTG/6T7JXVqIA==
Message-ID: <106a9957-cf7f-4789-8edc-fdc641cd854a@bootlin.com>
Date: Fri, 29 Mar 2024 14:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] ASoC: ti: davinci-i2s: Opitonally drive DX pin
 during capture streams
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-14-bastien.curutchet@bootlin.com>
 <00182d1d-ef29-457f-9e3e-6e9b57592118@gmail.com>
 <0bb26153-8bcb-475f-8892-5eb925fec538@bootlin.com>
 <7925bbe5-17e8-42cb-a5f0-4f3e06810a90@gmail.com>
 <d20dc37c-13fa-43d1-af52-dce8d8dcdd75@gmail.com>
 <5467add6-0099-4e54-a4f7-12aa149d03c7@bootlin.com>
 <e6994ff1-6c32-4dac-846a-5f4f18b2f996@gmail.com>
 <16e6cded-33c1-408c-9bfc-b0b9a8da4cbf@bootlin.com>
Content-Language: en-US
In-Reply-To: <16e6cded-33c1-408c-9bfc-b0b9a8da4cbf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QSDUH2GPMGIMTYIKQ2SBFHHBUQEN474U
X-Message-ID-Hash: QSDUH2GPMGIMTYIKQ2SBFHHBUQEN474U
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSDUH2GPMGIMTYIKQ2SBFHHBUQEN474U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Péter,

>> Can you use aplay /dev/zero and a DT property to select T1 framing for
>> the playback? Or that would be too coarse for timing the start of
>> playback and capture?
>>
> 
> That's a good idea, thank you. I'll try this and come back to you.
> 
>

I tried it and it works fine, thank you.

We still need to run some performance tests before fully adopting it but
anyway I'll send a new iteration of the patch series that drops the
drive-dx part and just keeps a DT property to select T1 framing.

Best regards,
Bastien
