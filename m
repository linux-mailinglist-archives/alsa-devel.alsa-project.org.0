Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8795797A0F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8994A93A;
	Thu,  7 Sep 2023 19:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8994A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694107723;
	bh=MFE5K+P4IhknlSmSkjj7+xOGLPAgQT1claj8SyoDnFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VF8qXltMx6F3BT2FX9ABYTpbC2A/kWnwNG39uh3RgopXsqrSmLXkQaPOUt9zy0Wrz
	 bpbELEjf59uDVRChOCnvWJEKOnDdVUjLAGKQbq18nnI2ZtMursw78v6a5s0fFDRBz9
	 zXxstwxOcOv4BcaCaTh36bwOgSqoP+mI1aUqAbdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAC78F8047D; Thu,  7 Sep 2023 19:27:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD00F8047D;
	Thu,  7 Sep 2023 19:27:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D996F80494; Thu,  7 Sep 2023 19:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18F9CF800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F9CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=GOKaypOV
Received: from [192.168.1.90] (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5383166072AC;
	Thu,  7 Sep 2023 18:27:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694107666;
	bh=MFE5K+P4IhknlSmSkjj7+xOGLPAgQT1claj8SyoDnFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GOKaypOV/j/n+/0toUVJ/SHi05O7Axsa/ErPuOJuml3iQIVLqxC3imWHX6u36G9RI
	 fUio+fpPws58e4/yzuC/wAsBWrzmAwI4MSD9pLAePjvYLeihPf8eu6JUJYfprUruWM
	 UKWzk2k6GTR5cW8ishITcNKzcXXZZOqxmX4nt/sUw++Blx9+lEiAfp54sAdQPMLKQH
	 NuiDHId92y0rAL85mc6xH+cKzSLl4pUAr5jlhRRtFs59E0x4JwpguC/Z0awwo8n/7m
	 tTOphWqf9hOBSvXovokeLDgrqNlyQM7xaY8ON05zFOe0MMUy6/9eVLkEK++dM+eY+i
	 LZOu6eHEt4/IQ==
Message-ID: <2b7a8897-05dc-4856-bb1a-a38b1e41b447@collabora.com>
Date: Thu, 7 Sep 2023 20:27:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Improve CS35l41-based audio codec drivers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
 <4a658238-b5cf-44fc-802b-f09f8d5e0ad1@sirena.org.uk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4a658238-b5cf-44fc-802b-f09f8d5e0ad1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6XNFL4XRGBTDDVOXGI7YFD364QCIKQEO
X-Message-ID-Hash: 6XNFL4XRGBTDDVOXGI7YFD364QCIKQEO
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XNFL4XRGBTDDVOXGI7YFD364QCIKQEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/7/23 20:21, Mark Brown wrote:
> On Thu, Sep 07, 2023 at 08:09:59PM +0300, Cristian Ciocaltea wrote:
> 
>>  - Added 3 new patches providing some HDA related fixes
> 
> Do these have any interaction with the rest of the series?

Yes, PATCH v2 04/11 changed the signature of cs35l41_global_enable()
function which is also used by HDA - this is how I noticed the
additional issues.
