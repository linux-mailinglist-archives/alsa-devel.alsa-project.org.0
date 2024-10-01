Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F498B3A6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 07:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C016293A;
	Tue,  1 Oct 2024 07:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C016293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727760700;
	bh=pYLmbx+FZ19JAmCuhauZhS8caR5bjElCrRyacFRuTZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HGO8iLl5g+9OJSFobqlERkqv7qNh70vgIP+ONAFvTSD0m3tJ4yoGs8TilJ7QPpISE
	 exiIgXGaG5+/rNWx0+iqBgwSQf8wDNFFMKeinoUZ+NkmpRyhyEHf55w0SeFhBV8XzV
	 0LLarrAkaNLkdJT03b7T2b1Ifhn4tgRLT7a5cl/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A021BF805AF; Tue,  1 Oct 2024 07:31:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB4DF805AC;
	Tue,  1 Oct 2024 07:31:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C318F80517; Tue,  1 Oct 2024 07:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3166F80104
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 07:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3166F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=F8oVzqD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727760651; x=1728365451; i=markus.elfring@web.de;
	bh=5SVpNw6LD0acUoexvZiZsitCIQP0KLv0wyMBSNr47Fg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F8oVzqD7EfCUMrB7dkey47zVAIqMss5Ejxdq/sGN5jd74ZF0v+MnFj+IYu6pAfnZ
	 46nqZSwG0SBTzYGKPQiiavPouZ79xHLzFMN5iF0v05kd5kqyB+2TzjxfBnvhtw5y4
	 euMQEfjzF/olmxDKFTZeJwAiczDDmEQh3/opvdx+EFDxZSEgJwwaEOIq2kgPyFwml
	 rnjX4w7I4q6Fyf1pfJ18pbJpU0ggcapxX+LEKh/YBlQnZjkwDa0xWIK1TdEaOKQup
	 tNyfsi2mzwTNbigwmoADVPrjwK0spvUo8ihIvK6j7a61APiFxYLwEGbz3yync8xJu
	 bvcoEZ/C1qhB4UduXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLifk-1sdycV0qh6-00JJN4; Tue, 01
 Oct 2024 07:30:51 +0200
Message-ID: <7f11f983-236d-4d7c-bc69-87301ac0b2a3@web.de>
Date: Tue, 1 Oct 2024 07:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
To: Mark Brown <broonie@kernel.org>, Zichen Xie <zichenxie0106@gmail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar
 <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Zijie Zhao <zzjas98@gmail.com>, Chenyuan Yang <chenyuan0y@gmail.com>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
 <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
 <75ec53cc-ffd7-484a-8c98-d02fdc6aa847@sirena.org.uk>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <75ec53cc-ffd7-484a-8c98-d02fdc6aa847@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OaubN+eYUNjylaKQ/D2otwSvuV/kB4bgjSB+K3vAi7RoNvezolV
 0du0+nHRqpEmTgtKi7jz3UISoSmgipkn5JkMDrCsWZrv3uvKiDwFQfPVkRae24QksUc+cb3
 J97ngquscjf05f4LdLR6LgSvnGNIubqCmxitJ5TrWKnsReF1ufo2ss6rrl7nlbojJyfGzGZ
 gURtLpgA/VGuZdWsXqTKQ==
UI-OutboundReport: notjunk:1;M01:P0:D2gBaV02g3E=;ERENqldbR/mx9bAa1rmUkNOi9Bv
 Zhq/l7zmANIeF0+hts0OLKfQtfUiQB+wEKugsNMTdeanuTCUjNu587LmPH0JLDGSDJbD8e4Dx
 OIuFI3o1ipjrp9d2/Jb7LpIKHrXpo6KgxlXrbC1wN31JA1K/w+a8oUlVp5fFqkcZNM0PEthjW
 wjUEYULz91vLroamqITINv9P7u+D0AdtK0b9jj8Nnjr9+SR+gtwDiKbnHtyet8qhY1ZcNqYBX
 D7JOywUlGZ7iP3DKkd3+j39dJAuHlE6VdtZHjGF7+uwiHUyymB0u9Tj5zc+mwA4owWyCCCNpS
 N7o053kO0L4FtScR97ZL84M+loIq/8cIs0yL8Ze7mnb3GZhjj6639vhjIPzXFUnqpt+7Ekjqk
 1gwCZJPYjmu6GjcQIWJch+gHp0/yIY9tAxMQxtTiIamH7tgRgR34KnGwA6KqmZuPfNnDQPvfs
 9lb3xGcy6jjHXl9qECgbTr1TrYT9vApccKA2+hsiaquO9yzzIDZ4ObqdIVyXiURtlvANgxhM+
 yiQg57q8I8R8LQWboZmNxoP8MCbQ4plDNGfC9uTjeI0DBoMIKjJMTqheh6cskIONG+vgCXmzg
 zrPauJvoJonT7m9CtC0Q8vdNzi2EWK8F87oLFmOtTuj+jaxDwxooywXRM9Yv82xlJuB0Ltjrm
 52N5ZWvSK8F8BJ3LFOj7QJuPYOOUJxK4aRxw+BZLL7UREEi35SZ6dkIfHPsIyuBShWt4GW1oM
 Jcp3GTRaoW7aZmOlDWCsYUDLB0hE+BU56i3qsuDmOLxm/3iavNh3tNPAh42PEWZhFfH5EMlyJ
 6PGfIHn7/nFPUAGp4YuPBfSQ==
Message-ID-Hash: TH3QNO32N2QITGPU3SWCIX2UR3CNOSNX
X-Message-ID-Hash: TH3QNO32N2QITGPU3SWCIX2UR3CNOSNX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TH3QNO32N2QITGPU3SWCIX2UR3CNOSNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> How do you think about a wording variant like the following?
>
>>   The result from a call of the function =E2=80=9Cdevm_kzalloc=E2=80=9D=
 was passed to
>>   a subsequent function call without checking for a null pointer before
>>   (according to a memory allocation failure).
>>   Thus return directly after a failed devm_kzalloc() call.
>
> Feel free to ignore Markus, he has a long history of sending
> unhelpful review comments and continues to ignore repeated requests
> to stop.

30 non-merge commits were published with related subjects so far.
Can you get a more constructive view from parts of public software develop=
ment history?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?h=
=3Dv6.12-rc1&qt=3Dgrep&q=3DReturn+directly+after+a+failed

Regards,
Markus
