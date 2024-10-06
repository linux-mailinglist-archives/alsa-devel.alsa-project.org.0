Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF2991E08
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 13:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7683825;
	Sun,  6 Oct 2024 13:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7683825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728213207;
	bh=2M+3ugLDADABIISUhE1rjXIToJMZ9lQU9ApRZODMpQs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o4xBEPHF6UVU8w9D+ei5JqjB31QkK+TPf2JSgXrMfz0FmqYAePLOv1QZAog7nq0Ov
	 uCvEtYKT3zhda9zTqsNEc6geXWLcFqE2D4xc3KWT4n9nPu1Qq9WgE/7wMnot78E0is
	 u1+4nlzzSpJ6jj8ATA+Ezrzxdbi/gH5ARZLE6NGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B1F1F805B5; Sun,  6 Oct 2024 13:12:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49241F805AB;
	Sun,  6 Oct 2024 13:12:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2539EF80528; Sun,  6 Oct 2024 13:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E5C3F80496
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 13:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E5C3F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=S50nD9Rp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728213154; x=1728817954; i=markus.elfring@web.de;
	bh=Tb+T09tvkffYYzsIjM2Eq9r0VO5GwmF24AJDTdB3JCQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S50nD9Rpr63Z+S/pAis+bydyXCrJxgPX9WKKQ7w5UFIR8V7bzYjXpVGgAiZJldni
	 LBtOJgLd7jGwcNKLazvpI3Ox23XnbPFbmY9ynSFXIILxaJQM+QdJarP/DRLx5IwWM
	 VUavB/EJTFBPK9fRbaEkLvdI6AsaNfzlbPVgAr9avMRQg7EiAu7XATNwR49P0GYBi
	 Sg53L2EaCfcyEN4/Ro2T2OR7p66BHbwS5jNLZYshL/pEADpVaUcjsg16DMIGpc50j
	 dPdWGlut0zZBDQT/cimxR+7mCmdPtTXkbPbgtGDkkjgxoqfG7zcK5kieYfujHfWcC
	 15Pkl57VEEhfYrnMqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N14tM-1tyhD60k94-01029J; Sun, 06
 Oct 2024 13:12:34 +0200
Message-ID: <8e4fe108-cfde-40c0-83f5-c1ce60b0940f@web.de>
Date: Sun, 6 Oct 2024 13:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang <chenyuan0y@gmail.com>,
 Zijie Zhao <zzjas98@gmail.com>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
 <2024100620-decency-discuss-df6e@gregkh>
 <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
 <2024100608-chomp-undiluted-c3e2@gregkh>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2024100608-chomp-undiluted-c3e2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yRTbD6sd3+21UNILTwyen9xGDcqeDXPJVM2pwF9pSM2QeHcmLjP
 1yVdgSeocfPe/3sQBJC6vnkeAelYEq3Tw4q3vbHmFDEC1XMAUn3QPw6kssQVq8RQhuMMNux
 zpTVqPDM2AS1Z06J0FrFoQAMvEBlICCMrhaNJq3je+qlH/B4U8zG85LUUfaxmaB1bJlMMC2
 26xXZJD3MigttCtcRL9RA==
UI-OutboundReport: notjunk:1;M01:P0:RSBHA8Qa5SQ=;/s/d7cD8oOtzcIkiGSlmatb5uuU
 cKJixBxA/JdU6u04XbR9kF24yaTTgv62j2NuR+lGXYAtDYP3QL1jvY+N3TJZGuFpXKE3U2Gxn
 ESDcbRqyxeO9ZfDEigmrhiz1KhLM3+5BzjuK73nytqYZnyN+4A/1BAmJylgq8GqRDJaCSjlRq
 Uf52NPZSzEFVCLqYvOYPsfIxoQhlV70O6EXtcQSXoABBj0TTR/gHze1XudE5mMaDDqDhrffls
 EcDn9Lp04gBN+kEq+0Ema75iBhXiRRfDf7jFAbIUjxo9+EbA4iYTQjOp2uvDDRsIyUF/dx0ii
 sJsaP99NxOthe715M6I0Hp5OZdPLrXcb+WT71Vv0WXyHOJSFvmbJe+9/5YE7HHobavlc1NU0r
 Q3tFi54IWrKp2fwmMZ+uhsQPJH5oJsT97GrwZ1HutnMcwIdprCyWG+xkA/KRzvYPzO1sSdL0U
 Y//Ihhfi2w531qQNSby9ZAauyCEnNXC3ynAG4Ar6VQwoWC5poasYwu+96PsNu6Wwd90mhZKn5
 ICA8kZ0gT2J+/mpkP2Ei9if1L55VWq+IRaFBeXCBG1Fm8Ssx8qtHQQQYNFuCHvFyQpOXQaN86
 L4pf69gh3F12sEZov8rzQN1vfw1nQpGW4KdYRLgtBPGcgnf5+rwLfKTj8H3CX5eBfFdtVrNhC
 LTYBeqt2ZaXEUaDZiT5FRBmzzI+vSYRIjVBD74Lo0KDqRNJZAXHV/hyeNPyZWTXcL3gdViPX+
 5wB2XiUua3FCv67f7BZTi/uZWLbU760sSJExHWnfIr3MkA/TXLEKKym94g37Up6/vmDyVEdu/
 IPRseMHC2ZngLkfHfgxnEgkw==
Message-ID-Hash: WHO5G6TVNISQSF32GQLYJ3YRHEKVJJUU
X-Message-ID-Hash: WHO5G6TVNISQSF32GQLYJ3YRHEKVJJUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHO5G6TVNISQSF32GQLYJ3YRHEKVJJUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>>>> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
>>>>
>>>>                    call?
>>>>
>>>>
>>>>> possibly return NULL pointer. NULL Pointer Dereference may be
>>>>> triggerred without addtional check.
>>>> =E2=80=A6
>>>>
>>>> * How do you think about to use the term =E2=80=9Cnull pointer derefe=
rence=E2=80=9D
>>>>   for the final commit message (including the summary phrase)?
>>>>
>>>> * Would you like to avoid any typos here?
>>>>
>>>>
>>>> =E2=80=A6
>>>>> ---
>>>>>  sound/soc/qcom/lpass-cpu.c | 2 ++
>>>>
>>>> Did you overlook to add a version description behind the marker line?
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n723
>> =E2=80=A6
>>> This is the semi-friendly patch-bot of Greg Kroah-Hartman.
=E2=80=A6
>> * Do you care for any spell checking?
>
> No.

I find such a feedback surprising.
Does it indicate any recurring communication difficulties?


>> * Do you find any related advice (from other automated responses) helpf=
ul?
>
> No.

I wonder how this answer fits to reminders for the Linux patch review proc=
ess
(which were also automatically sent) according to your inbox filter rules.

Regards,
Markus
