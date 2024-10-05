Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7F9917E5
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2024 17:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCF5852;
	Sat,  5 Oct 2024 17:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCF5852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728142903;
	bh=AA1s0Ci9ozC3WMvOPZhiXoxjx8/13qajUfnk+TtR2Dw=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E4NUMFOF1gbQp/BuSVHvmS6hqjPpHmCiRxp8sFLP6fLpeqZUmPuErjSR8s0IhDQ1o
	 Xwu3qYZaHDIoxtUHgCyPvcUrLP8moQpl7xHLsMTNQTDv56aM3/GGEhn8DRz/j9hMCb
	 IbvZ+T2JOmfrZt1BnsxKpEO7uYPHKt4MQBh6XPIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2CD0F805BA; Sat,  5 Oct 2024 17:41:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A62F8001E;
	Sat,  5 Oct 2024 17:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A613AF80517; Sat,  5 Oct 2024 17:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC1D4F800C9
	for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2024 17:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC1D4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=FVAI0//E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728142854; x=1728747654; i=markus.elfring@web.de;
	bh=Oix7kgCYIxahefd/lUj+gnr1RHpaKFan/VSKFUUttN8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FVAI0//ER12gz1M7bLVJ/lh4FsxIyFag9DguyOlhqNQ+fwfW1OUcCfcGv2ZnhiaF
	 UHppkjlpbFDYfwNl4f1u+hODZsjpquibgzXWkxtqnr08fLzpv7jBEgNkMdUMdK2HP
	 zOL1pcwU06YBNtSCUSOzAB0bY6s7NV91EFB4Hxgag4uh+SSm5zY2RSkN/5TBBAZ0T
	 DQTc/tKcuoYJvZ8OhfryRkq2RH5GbSgAbRa42dPoxg1IXcIau286GhocJoA1Ok10W
	 nMcRRs6t2bLUNHokMxsBe5ch2MP1bpOU0TkzM2LBeGaKna6ASqgf6FCZujl+22SfB
	 P2OXGaueW441TC7AFA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nii-1t4mPS0pQ4-007G3r; Sat, 05
 Oct 2024 17:40:54 +0200
Message-ID: <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
Date: Sat, 5 Oct 2024 17:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241003152739.9650-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FT4PekDjmBCyGrkec/hi9y9+Vtd7tCvznDoAvaVISprcWUYWco5
 dJbyXoyXbt2zGk67OyaHeIwv/Xb144QRPihS/t4Yl9apcFWPRdSKd/+93kPyVXvSYx3XhS4
 a6sk+QiMEFj2cKaa9jgLqGnQJev9X2aPIOZx8vO/D6eEWZtvG9XkN/RJeWXfWqS0Acz8g4o
 c/TG5MdrUGOBS7nSQ4dBw==
UI-OutboundReport: notjunk:1;M01:P0:bfneBKFioX0=;dvCX7e3cyPK+wwLkUpKtVO0gFQ0
 siD6L3fS2j0Zb3oimAznmc/nfvTKyk/4/0mzI7hUAIynBqh3QQLuxquVN0W5YumtrYP97/xSu
 Lz2Rd1igxLGRhyCdU36y/SWMpzQGy1pfctepFpQ+LL9mFRAyu/PnspTfc1u18QtJc8aaSwbpf
 t6SpJpn5bxHcG7I8ZUKdPlCDOhKzNBVtUMWLVLPAPyw/PdflZ4cwX2lmdGY9Vi3QhCJq7blqk
 Hbaj3XFWTEa2MgVlSKNx4GUDgqLDseRSQvGz0ZlZpQgDIVE5NS9o6Ow4J85QRt1V2Yimo6H//
 4OLJrzyCNRiKHakvbhYjTBtnB3MpD5FnvigR+3o8bd2ynR3kL/2/CfjSbuedwFpGs1+wfRYWM
 owVEEN33midnIq39gsQu40dJI2CNVwDjAcx8Hp+7NuXF7aNyDYSAI5/WwTFLfA5yRLnrH3/im
 1cjC1OG+tDRRwClImt/X9XbMQ8LeXwWF/KYjPdNe0wC3mVIATOqQLtDNH841Mh9+yhvUy+VI8
 QWUkSf79DAyBxYAyyzPur42txXj6dV1JbKmQZEUa1p9dJ+rjimhB5lt+nMmpgXMkZUrsp+9Cg
 gg39e7mO07RCcdy3IaQbfhnkZdrnNpsm1TLoHGKTMCjkpGHciFlO9b1v9bdC2dS36k9IGw9nI
 p7C/Xgtp4mFPwj43gUcpag2bl6m8SLqjLk+7Sd8wqL9LcgBF2Ps4GeEM8Viq3/FixODrwOO9h
 JXhiKZqhf41YjWYzXUutiW3aIJLzXeh2qNM+Nwsyy9nvv1pwgFLVCl1mrCNGDTs6lqkW49CE3
 VpYU9fC6mRGcd18rfJBTz92Cymf58hJwsnr2Nnxuv+/DU=
Message-ID-Hash: U7G337KDZ6C7U4IZJ35ZKDXFV3TDOWEB
X-Message-ID-Hash: U7G337KDZ6C7U4IZJ35ZKDXFV3TDOWEB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7G337KDZ6C7U4IZJ35ZKDXFV3TDOWEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could

                   call?


> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
=E2=80=A6

* How do you think about to use the term =E2=80=9Cnull pointer dereference=
=E2=80=9D
  for the final commit message (including the summary phrase)?

* Would you like to avoid any typos here?


=E2=80=A6
> ---
>  sound/soc/qcom/lpass-cpu.c | 2 ++

Did you overlook to add a version description behind the marker line?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n723

Regards,
Markus
