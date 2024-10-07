Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C6992CEF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 15:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8819686F;
	Mon,  7 Oct 2024 15:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8819686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728307035;
	bh=FNqFbT+e3g5173pqoULGRwQfOV5dySeZGQTKTolzwsg=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j5vWM5Pw6UaAq0AY74/p14UMC+Sy20gDpfZflo96o9PDOt7CjuYUVbbSFsqqQWTAW
	 +ge10YP0KLLwJ/0PnzA+5w9Aj2ynFeiHv6AzKpyBIxmdllIQisOX9fmdXqvMlT9Djg
	 +CPzZQB468LP5ztJG5IfZsnMuGyoYxQPdjuWPtXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 978C1F805B6; Mon,  7 Oct 2024 15:16:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 986EBF8001E;
	Mon,  7 Oct 2024 15:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DC56F80528; Mon,  7 Oct 2024 15:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48AA2F800ED
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 15:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48AA2F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=DxLrCZaH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728306989; x=1728911789; i=markus.elfring@web.de;
	bh=mQy4pPjNTV885xcZQDMYohl8lP4cbtjvUxvu3rApYuA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DxLrCZaHDeGLYEOiK8c2Vk30Mb4LR41XlVeZPpFEZNEm2BQyq/N64dm11+A5gPwm
	 ILaBAZbKjUvPDj64PYZScrz/AXWHAAmiTefvgvro69jQxDNx+a2IW5RvIASdjkEYQ
	 9k9JJ/nZpJcveaDSUQSrCQDSZ5X5j9W/f2aZvYCJUS3O1QpWP0H4j17wG6gsXMltR
	 nxYW3ZzHfEypI2PfEXvI+dUnInU/7797UKTBlOrmvpenTnW3QlMgLNskyGO9ZAROK
	 z/G1CP5tDWZ7rF3GqGkL1ucBy6WNNHom5QGtvThYaVFEVPGpN81RGMgtOzdbWGcld
	 pLpQ10E6xgv/zFsBAQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPdr-1tJR5Y1CwT-00QCqm; Mon, 07
 Oct 2024 15:16:29 +0200
Message-ID: <9be6b874-0c4d-4100-887f-0aa693985715@web.de>
Date: Mon, 7 Oct 2024 15:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241006205737.8829-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WzU7w3XWp2SXhsmOcZlwNr9fvxw31LHhoiTmrXcKpjBjfriuBTH
 5DdRFP+RsFEHaM5xcmf4Gi9u/S9FSD1+MgOY8Ed6IQYUMMhIHuCeeKirIcvboDzOB8v8IdP
 nrqKGMVB6z6jT9WFby3ak1nYQ579QC2d/4ogrHjn5B0Z6ve3FEI2OJTlW5zZfpQ7keBjUD2
 /HcSsvvEUJGC9Mbe/gX7Q==
UI-OutboundReport: notjunk:1;M01:P0:Y2fzS37A3z4=;s4W91ovM4BXEgiIKlmPKd8AZ6cI
 e0qes1dg4h+z2fEe8D1jWmbzYEEgzUMQBYVmuHyo2+g18qqnBzdVL/VINWQAcHvIYiiTIGAR7
 YHB+VFjC0ULlXE5lwB+ry0wfBcpZBs7b5GGtNc6hTIttu5ml4E5OvYdkEhpWpZratfvOgBDAC
 edTGLcynkIzLF2HQQfSNew5A8cduGpHFb2SZSQfwLnzgBf8OVHqViD2YTVphYCseq2zcxg9dl
 eUCMFE2gg72hvz8NNdsDAAldFhAyxXO5EhRMHvnnIiFMq2VNeDJ6vrbZjjdQxV06BgmF9pUBk
 DTCYdiFxt8PzfwT48LBTcmlkFveEGaSm0SWSdqwY3uf8SSnki0sdpV4CAIYb3urkwLPyLw5ML
 Vd3an7N9zngKJnncoXYh6EL9yUX6xcPxxpGPKNtU8wFmU43C66B2HGrs/4F8ZlD8TYwsHfiBv
 oOV04fq1uZJl+HSLNyoBaYIxLvU+koRPCfu4TW+oN/xhOzDGXYKRB85mb8CvFNV064YA8XlZq
 XxrdohwVRVW1BAD/GR51P/xKK9enRixRpWkTkFJYQAqRDr/cU1XDGsaSsFRhkZ3uCUYiTiFdj
 20Rh1iOOXvQqjtvqNCRO8GkXmx5W8wPhF6XtzFecw9MPBAYCVlcvqeJibox3MAPvFSRTMSvx0
 c4HOJwweQRLEYUTm3YUFW9j4DMRDMUk3JfUt2ghoP/mgL3B39jsDG2hwT6BpulLkWrh/yRlol
 5PT+xn3iq/dL+xjFIX911fLkipiwqffhySHcxAdfUYQytkFF+s4DA8RaIxRNwEn4F+0FyFq32
 KxXS3g9/8TLWiJ2Nl78beDGA==
Message-ID-Hash: 77M5N377IQGRSPJ7GD7CFKGPXV67KWR5
X-Message-ID-Hash: 77M5N377IQGRSPJ7GD7CFKGPXV67KWR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77M5N377IQGRSPJ7GD7CFKGPXV67KWR5/>
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

Can the term =E2=80=9Cnull pointer dereference=E2=80=9D be applied for
the final commit message (including the summary phrase)?


> triggerred without addtional check.

  triggered?         additional?


Regards,
Markus
