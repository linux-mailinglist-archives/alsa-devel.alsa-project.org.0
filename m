Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C1D98BCA2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD65852;
	Tue,  1 Oct 2024 14:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD65852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786980;
	bh=C1GxrTMdMgyH4i6ibDNBr8CN76TltxJajy1u/h2xRrY=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amr909SeFacUKVtboed5MuF0L0a0ncqKyp1riyDIo3Lyu4nB6K56I+b52a6OBssRy
	 mXAAVQetG2mS2k+jfMkaoi7pRS/q/+VJqTFPb6ffb9Z/JvLrZOSicvJIX1AWleYk2h
	 1tl2rRvTi5w/R4ZeDthPjSYZJcYet/zCdvk3cg+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF5ABF80527; Tue,  1 Oct 2024 14:49:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1631BF805B0;
	Tue,  1 Oct 2024 14:49:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB0FF80517; Tue,  1 Oct 2024 14:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 594D1F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 14:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594D1F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=CoqBzj7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727786937; x=1728391737; i=markus.elfring@web.de;
	bh=C1GxrTMdMgyH4i6ibDNBr8CN76TltxJajy1u/h2xRrY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CoqBzj7RF2VoyGhF6Is3MZfuwKV/+wjuNAm/NjFvX/Ef6jB75sJSXPTgi7h8ETtY
	 ggPK6+l/QLd1/333YQUzowyndXa1y3NT59nzeYFKvAR+0uiMxcPKDcDZAiU7HP7ZT
	 L9hgyNM4EjsURo84UO3dayUxqRLocP1qJlbnh0n/g6Bc3n7KP3rzQpXJmMDAjMzDQ
	 Z+yAqnUWNfHHG1jibSSjgK+zwbg3W47EWCB/iNulGDTPbAjfvUaL20XWlbbUev0ZP
	 bbCIwxi/2/9dHC/jyo9yp1w5nI/C0k6SXpUKnMdl0soqUNPE+eXVwAue2v7PBfG7r
	 STuZD94yY1B34zXuLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzCEB-1rzP353xnX-00wkp6; Tue, 01
 Oct 2024 14:48:57 +0200
Message-ID: <cf8e2da5-818d-4783-a3c4-bb6aa62088f2@web.de>
Date: Tue, 1 Oct 2024 14:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <quic_bjorande@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang
 <chenyuan0y@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Zichen Xie <zichenxie0106@gmail.com>,
 Zijie Zhao <zzjas98@gmail.com>
References: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6RS/61IPs8STPgbSd4NjVx+ZRebW5ZZ6w3gCMtCC36jAYYYQHPy
 WGJRJ7dHAdyvt1qYKNY4G0Vgz2c1/H/wapvItuVoPECFxGVc52jjTtSEfemdRAXiJuZUcS9
 X8eiLN9QIKE3x0Zgq/USLFN89rhQNZ7eWY0POtD/DGGzKY8UP70KwEShxFhIqMRbyABqxiA
 1Zu43/cXWb07oPLWqeslA==
UI-OutboundReport: notjunk:1;M01:P0:fSEJ+7CUxLE=;V8oHVkOVUPLueYJUsJA7ZHqDo6S
 iKmS2pGNWbNJ7JpV3XBzizhkYiDL531mqEZg7ZjqSH5Um6H9sGvNlgk9K7Lf4vIL1YvP7l9cd
 CYbHGlKJRdpmYmKuApz/UIk9d38yh9wUJdCMstv3B7CreVuMjpEoC18Q+Gyv2N/JSouXbRLSD
 wXoSBTZLsun90IMvnoJm/K3iEpRxuNhKYdcPXMKC7Z+JU8NNNrweXJRkBBxV1iVU4tUHUGlsI
 HCqVxjSOghRkEhwO9JXXA/AYMfn/25pbkO8HGSV4AtHmj7g4W57ZvJbF9DhLTt9iGZmQyGzwx
 rnV8iBeevxn+2bdR1sxyqIlTnes8BHCVUoVK7lEzDppMLwRB00eVv2Eud5CUPtB1ZItFK40N1
 w1f5ngQHugyDmFL0t2ZvGQGNjtQ9rqrac2uxmHHBQYJlmVGOCHrIY7+SsARwWKxAlFeirX22u
 1y8k18RtkGQ9kQcA8DPsBjWLhTIc44zpPgbUbAkOOANp6/n+ILJaAVbrFFPaQDdiCkf0BZJq6
 bvAxpICYvX2Qmvcq6xpG1vDl40L56qVwDmOf+hAOBJGaTKJmAEli/AVYIIjqxUMuSBGu+DCRj
 oJkjurh9W4HHptU1cFpSBC41GIij9jEG4jZgE1Ct2+Sba5nXK8HBwFAtKks04COjb8nOcdg94
 KFge43tXotWB952giYgEWPqKVUSslZW656qqPEDEZVSvmvIvTydbBcGrPAv+cUpEzwaTyHQ3C
 UEiRaGSiE1XyzMtRH7s0wJZj2+tJyFocXWFFuNmc8NveLvhMnwaqqLmfVrkkqnFBqa3Iyfpwt
 RPzdRyFhYUQk+B+SR0pu6Zxw==
Message-ID-Hash: 46OYBRIBLUOBY7XWBV7FCRHCTK4BF2XM
X-Message-ID-Hash: 46OYBRIBLUOBY7XWBV7FCRHCTK4BF2XM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46OYBRIBLUOBY7XWBV7FCRHCTK4BF2XM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibl=
y return NULL pointer.
> > NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_pla=
tform_probe' without addtional check.
> > Add a null check for the returned pointer.
>
> Your description and patch looks good to me.

Interesting =E2=80=9Cview=E2=80=9D =E2=80=A6


> But please run git log on the changed file and add a prefix to your
> subject to match other changes to this file, and please wrap your commit
> message at 75 characters.

* How does your initial information fit to this patch review advice?

* Would you like to =E2=80=9Ctolerate=E2=80=9D any typos (at the first gla=
nce)?


Regards,
Markus
