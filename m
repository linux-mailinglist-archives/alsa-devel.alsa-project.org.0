Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B269503F6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 13:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C972357;
	Tue, 13 Aug 2024 13:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C972357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723549425;
	bh=m0IRIH3EcHV+TrlopED/cgfzuE9mKP8Dk1cqfwP22DI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O1yvbeMzJ6aH+YWCnJcd+6uLqZTmDGI802Ph7q6hhtujNxWKz6KhReqOSPkD5NiDC
	 rzWgCSR/ThErFwI4tDG4PMIdDi0fgXguglo8ot5aNtTl6BTjtU9lCc6sA6EeofNeik
	 yI6SAA0735THRiQ02hPhsk2xijqD7hF4vhZCbGwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 922C9F805C9; Tue, 13 Aug 2024 13:43:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D020F805C5;
	Tue, 13 Aug 2024 13:43:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56478F800BF; Tue, 13 Aug 2024 13:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02BF9F800BF;
	Tue, 13 Aug 2024 13:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BF9F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=f7OWM8Of
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723548958; x=1724153758; i=markus.elfring@web.de;
	bh=7ipYMxPYpOpnW1gNYkqI1PmfHkw0HS0KWT1PkmtvSwo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f7OWM8Of+xF6FVyJpYuyCeMxI/59mdOFOzAIm920XKpojmgLqVyhhPXdNruVkjCM
	 czoreeYUNWtPfMTScgjOC7IPYCpBPgMucDOekzE1c6rQeMV4I6XoGmCp1fA4XkaMb
	 CasImxN2ZNbJBBfKL48/EmISnKFfvEYFuy35k16rlE20sLzAuPBzL7ipfqbAbdtK4
	 yJ0ABWOKh1UbL1YTPgkwUaQYmK04aZVW4DSoMbEq2OBD0j36MOjagExn+r8Iq/TZH
	 zJSndhrzttT67QvpWIFTjaxzsgf201H5/mS5Je+iYJAlfaEpedFPOeSw2v/jIAeDe
	 9+n8wyZHrHDX1rGYOw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHEbq-1sQgfe0hZA-00GRu0; Tue, 13
 Aug 2024 13:35:58 +0200
Message-ID: <ac7efdcd-cc79-4984-8b36-50898243afa5@web.de>
Date: Tue, 13 Aug 2024 13:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:szcAT5i8Xj0bcGbc849dlKmiLBUMBuWPDXT4XBTxmCtSxx/JcGM
 28ppT0+5oNUnrvkidj84Gy1Z41vVjn9s9QxjU+uL4m4B1OKpyJT/yECkIV0Oc6m7lyQ9gVW
 +iu9AGuUD6MOJdPeJ4bgWxzpXCt31CQ0u2/u9wayD5mckgWnnwqFTi2lfa25P4zKzJ00O5u
 a1J5UaAJJS9Dl7VjeQG0w==
UI-OutboundReport: notjunk:1;M01:P0:l/qmwRXuIKA=;fd1eSuvXq/XoLU2WIflqWfTlHop
 +qFsCVvb3Ug0rgCmpuEYpNl69wRLghI7eqG3tEZVPUmxafWEL41MNMpO6rzSUVRnsH2oZGNov
 U5vuZuVqVc4tlvN5lnQmMDK2O/9FiQP3A9dpcFwETiRgea6feKH/SSCD9Oaa7VNMQYsmzOw/w
 U0Bji2Z+gXD5iN65YJqJufbPHKDkBn9MfwIZpWpg5ddh2yL8IfIrC9hnECCoLUwwzFX3guIbj
 aHM7dxAYl7MV9NvXUBf3ayUfv2llox0hGZbZ+J1qdOwto1hJac9oktVRpSawsCeTyGDVwFvQV
 40CEdXirF/ecyn+olP/e4mHkegGdSKP8HO+Cg/LgiGDyPpvDXyhZB6imBgpxsvXxEIhcRDBI6
 JDqpKLb871i5gm/FOeV+IUIG4b7TPbRJZ31eglPGCKVsyk6h1BoWIAJwLRTw37XM3qg5/2sdJ
 RUTTpFZjpxG8E0ZicSuObzKCMHnPaCvX3J0+aKfARdtTgCm96mJhN8MmCfO/GWaa3Wcz5/Ezt
 ZjPZ3wnf0HzK7/yauizTYXOsZ/wu96xy1TNm2KzKJ4dGdBOHANdnDUOROeMhxXb2QytBqotrK
 Peyi4D80uRENXhAFeitGHbZK7W0AHh0IVvzudmPiRLrYZiTEhdAt5+QD9F+Mosj3Y+DVFYJNl
 gLqcV4A2lNKHKHeesmBagkg0+hIEKz01aRH21yPgmT+oyYBJpS3NOb/zD9qh/r8BRQ2UZcs+e
 XffgE0GTuf9905UeVWAVktvbyiSLmKnwUZfpEW2ywhUVuhC9xa8WQvbNlkmKP8dBMWLcZcuAN
 7vfkAk9kJazY/FmSus+XVuYA==
Message-ID-Hash: FAAPFWLBRGP7QRN75YC77KRS6SYFFDO5
X-Message-ID-Hash: FAAPFWLBRGP7QRN75YC77KRS6SYFFDO5
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAAPFWLBRGP7QRN75YC77KRS6SYFFDO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> The existing code modifies IRAM and DRAM size after sha dma start =E2=80=
=A6

                                                      SHA DMA?


=E2=80=A6
> sha dma failure =E2=80=A6

  SHA DMA?


> IRAM size. To fix this issue, Move the iram-dram fence register sequence


             Thus move the IRAM-DRAM =E2=80=A6?


How do you think about to offer cover letters for patch series?

Regards,
Markus
