Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3AD98A9E0
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 18:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7067420C4;
	Mon, 30 Sep 2024 18:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7067420C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727714070;
	bh=Qf8w32+ianb/P6mmXXQkfYYDksr3EPluaIRN2UzchLU=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KVzsuJ+PwrvvntMxqhhzC7RQgLkQhv251PWPmZ1StpdNRvw2gokeQXc/TF4rh7KoX
	 fizTomMSBsjo9BjTjpm6D0lXtu1IIl3own831hogjVRBrnYbQ1F5OxAGCd26j7jnIj
	 3tl8vsHnwGI3xO+gMBm3SCTABgavBb86iieXGg1U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD31F805A0; Mon, 30 Sep 2024 18:34:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1E0F805AE;
	Mon, 30 Sep 2024 18:34:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2983DF80517; Mon, 30 Sep 2024 18:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EB06F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 18:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EB06F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=AL0vjq+X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727714031; x=1728318831; i=markus.elfring@web.de;
	bh=Elp8feHwzLHEvNgI9yMIUjekemWT/zzJtyACfJwiUIQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AL0vjq+XrUYRdIJT+vEufYJR9dYtYtRZlbH5uqFxSWi0lw7kVHlmzquoYI24nrUc
	 0tEbu+Rtsa1kp8WXhB5iVN9Gc4MIZNu1X7Y62Mwu57QTdvGZ8KnQxDJC/+Jn0zI6f
	 bUwis5dxTBV9jwYCT2zshkxzn0xz+3YR1eUwU0LZYn4NbG1sYbjWtqz4uqR4r9ham
	 5VM0N8+WPjTHxivXyv60d274xnLXyyb+M5K+9m+5r/d96qZxZk5LK2ivgLwSzKhTx
	 PKyoa9UGsJ3SFrZNRAAtuBqzw7zdkNE6hz75SAL3n0ght8O5y0+WNv3A7U7AjGs8Y
	 VRJd8EbUmdIJes8ngg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK574-1sc0Iq3iiE-00QFXj; Mon, 30
 Sep 2024 18:33:50 +0200
Message-ID: <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
Date: Mon, 30 Sep 2024 18:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Zijie Zhao <zzjas98@gmail.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240930011521.26283-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wWPrxVgNAW89ZtYL7yCE9yBsQPQ1CEh6dTzMElmw1CIQYjlLjDi
 ymQyan+7h+OEOJdXyAPBfl2phLYm2KCFUzaFzczAomXzFIp3KGtBDMx771osuQmjqEYJytv
 G9WUQXWTgqahgur6IolnNTAUmBCQcHVduPyRX1blabpKy8+UQxZUgcajxym9t/Yqnw5ZMar
 wpa8ptkxJxxV+iHzQQD6A==
UI-OutboundReport: notjunk:1;M01:P0:X4rV4JRbJeA=;IsqwtxPmorxf/jI/87t0I20eQn9
 KC2pSZVTtF3/v8Kx2qyOpJQC4H/WrXQKfe2pPvygbpBBdsF8jHLeRdIcPkvGpVje7bCCKNEqm
 NsIMp3qcdGQWYY4Li5H9sD2au6WT4whXrB8yppJWKFZJxJbE+FFq1y6vINs2zQZ6kZBcfVERd
 5kthtfAO6YG2Myyx4suCKzZFiZZBOFG2Xz1ud0D38xF6/9Au0q0jDhRGY5b+gBnofK6lDuGN8
 /Ef1FJ0JRvIK8lwV68PYYpLRx/zOZLX+2oxGQzaHOHQcwpviqy0uTC8FyHtlrYw0yNvyLtWP0
 dnHXDn4dqiutTmgYCRPW1kr0tAH/fmRadfh80ak/Pjmq9z5n3SdjlydpVUJ8GHY05AeDQiN5b
 TZBttdld9R4Frz7nIkGJN3+W4+Il8Z7sUF5B+l8eE3YsvDfjIxUl7sLMgkOl6/KP8haMDX2HE
 7fS4zVk+b9GEw/UGMIVGu5E241GW5K/ycsvrxvyvybFlBp5tAAfVzBQ6odUg4CXTIr8V1RhL2
 8Nm3/agphLLjDRDQfTuBQGPEUxT2G4EFp3sjuFi58lPFA+NmhXyRITWuf4e+IccVyt+V7gDDX
 9AbKqY6cOopzkdv8bdF0s+I3xYvQuCI8XlAa7s5PxzUnwbQYVA4xUr7GVJtKViVcVFlxRvTZI
 ycg2K2hxZmUOCGwFK6GnNRJp0phAF+KjNrYR2Mg2R7Iv8Yyg9qdBhALLpYtsdZFKIf+bABoTx
 qP/plC1DTegxmOKesvo8lCfiLXx01e7Fetspzv/imT/ufgR6H9EEBbjudbtDVTRcBcVfG6pOj
 vWjUakkgumCEpbCz3XlYbwJw==
Message-ID-Hash: EFLICPU7RBBJXTZ32OXUKI3AHQH6VTZ3
X-Message-ID-Hash: EFLICPU7RBBJXTZ32OXUKI3AHQH6VTZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFLICPU7RBBJXTZ32OXUKI3AHQH6VTZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibly =
return NULL pointer.
> NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_platf=
orm_probe' without addtional check.
> Add a null check for the returned pointer.

How do you think about a wording variant like the following?

  The result from a call of the function =E2=80=9Cdevm_kzalloc=E2=80=9D wa=
s passed to
  a subsequent function call without checking for a null pointer before
  (according to a memory allocation failure).
  Thus return directly after a failed devm_kzalloc() call.


=E2=80=A6
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Reported-by: Zichen Xie <zichenxie0106@gmail.com>
=E2=80=A6

How good does such a tag combination fit together for the same person?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n525


Can a subject like =E2=80=9C[PATCH] ASoC: qcom: lpass-cpu: Return directly=
 after a failed devm_kzalloc() call
in asoc_qcom_lpass_cpu_platform_probe()=E2=80=9D be more appropriate?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n613


=E2=80=A6
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1243,6 +1243,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct plat=
form_device *pdev)
>  	drvdata->i2sctl =3D devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sct=
l),
>  					GFP_KERNEL);
>
> +	if (!drvdata->i2sctl)
> +		return -ENOMEM;
=E2=80=A6

I suggest to omit a blank line here.


By the way:
Would you become interested to omit the label =E2=80=9Cerr=E2=80=9D from t=
his function implementation finally?

Regards,
Markus
