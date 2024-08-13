Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A494FFEC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 10:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7E9231A;
	Tue, 13 Aug 2024 10:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7E9231A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723538004;
	bh=/zxWuCigAOZMa0LHvT4UlSCvmrge5aJPUb3FQT6fhjM=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZkW7IDOctg9GulFlYyr4yE+3q89h550CnNFL5CcSI3gLVtLco6c2D0RuGGLM5vNye
	 nacG0uOeGmZGX4q+2eTYTqpx68lKJxAz2xO2tSm6ZgIrtNIQEI+yWGp1gXpPtNmI2G
	 y5UALc2rxcIgK4g9aOa64tT83FqYCEClJt4KzFy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD4B5F805B2; Tue, 13 Aug 2024 10:32:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 882F4F805AE;
	Tue, 13 Aug 2024 10:32:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7678CF80301; Tue, 13 Aug 2024 10:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01D82F80301;
	Tue, 13 Aug 2024 10:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D82F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=KbZ95oi5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723536931; x=1724141731; i=markus.elfring@web.de;
	bh=/zxWuCigAOZMa0LHvT4UlSCvmrge5aJPUb3FQT6fhjM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KbZ95oi5zQG+BEt4Al/BIyrjDyS+mW3MIxWhrd53KhucphEn2quFAQbJ71B+gNck
	 GeKPGFJnADM2r+J+RUnHAyl5kee0kCVwR+tG1Tiu3CadE9BU+g0O9lu5rv7g5RBqY
	 Mrz7l4zUtq8QDF23Y0G3C2tgMLXytq6uV/6wDQUoAtDFHg+GAGV4rhTARncdQMcwq
	 PGlflzhlzmtkXdU7cUzCo7Y5aJfimIG8iTwm4aNgbVipeaQ51Pb5HIHS60fkPi9+l
	 MYy7pVLCgdEEI90yZy9/AxVKdZ3tHfTNpO/RRvNmThu9Re40H3CZSSw2spZYjs9pQ
	 rLxrNECMiPrXHqMO/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl4x-1rqAn80BMz-00kGT3; Tue, 13
 Aug 2024 10:15:31 +0200
Message-ID: <f76c7f8e-f4e7-4ac6-87e1-1ba9b2b19a82@web.de>
Date: Tue, 13 Aug 2024 10:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lUao99FJ79AR1pxh0fzixQ8WA+l8YYMafn5UJK5SH+jP6dAO6Qo
 Lhx0M9Fe9VdZyoi9l65alY5QDWT5IR8CdQDXvHiLXRW91QUW016V0T4QVzt/Avku+YjQTWE
 VEjCs/dBu86eyHCg0M5DFcqKSPCAIe8QMeajhSF9zycA5LmgzQLPXkuo5bBKnHccQh79sDR
 C0LwzlQLcY0O8CILuixew==
UI-OutboundReport: notjunk:1;M01:P0:E2WEPVwt3I4=;/6gahyzGle8erfIcztp3D5k2zK1
 lh+tV01IULZDinl3X2IgKB9KyknTBgWOPuCtLNKLwGbOp0M0JVLGagqkxnmiyrG/PzyuHfXHZ
 4CwngsX28EXBQflnh4IxOIcO8eh6OsQEWyiu2KzQWxXjIfEI3CeE0f9PCm2Bbvq6ruFU1YDmz
 3Of6acoPouIvdctXDLfjpz0IvEBaVHkTXdRakjFxtte0pJkr2EGYBuHd0tj20QOkPKaigdbqO
 4cltT3krRrx5dqsPE2x1ZHFJ3q6jYB3qFfl5OlMlr2QsBcxv9Sk1SrKLUgWy4iZ6bYkDwKULJ
 RAkgGg3FL0KFPs6WQB1MetG6S0VQnfz2CS5qEvf26/3339JBSDJpNydolKsuYeNKQPInXykWY
 qEphtrjadSwXKzTjhAieJfPvGfjP81TX7HmQg8ToP4rdeNB6WNCf+BTnTbjAU31zL1vEEjpIB
 mOEMed0JHMeC24LwkKC2B7tKSt7Wrqu3GMhsTUe2RbeKUTUWhYQoWWaPsyYe41FcYHa4hf4dN
 gKdP+tpjfimEam5RLR1WUyITEJpy2IzKIjGZm4YX+JzNm/cJPWxBeio8cBDa3PDO6s8zl/cMn
 CtsLOt1hP37hNKIL96oL8Q6GjChkprgL4Vps4HxeU5omWOBhYYgnde+zUk3p2NU0CXOYR5/BO
 FEREBC9Ol9DO2naPg0vuhkzvM7/FBZFXyfhB2YKliUcvkcAVSa5Ht0T/i2jaIb1Myoq1AGP9A
 46WSOtRRIeS/5kjIlhY6ILy3V019iGHhHQeBpCS5ASPjkdVoedILkqvGd0JiEEWGgJ/60EAkf
 7/zKGbqIkT4L6/DXC9KmJ1wg==
Message-ID-Hash: WSB5EWKLHR4RVSKR2D5JKE364LDEPSLC
X-Message-ID-Hash: WSB5EWKLHR4RVSKR2D5JKE364LDEPSLC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSB5EWKLHR4RVSKR2D5JKE364LDEPSLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> before triggering SHA dma. This ensures that IRAM size will programmed
> correctly before initiaing SHA dma.

Please improve such a change description with an imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc2#n94

Please avoid typos accordingly.

Regards,
Markus
