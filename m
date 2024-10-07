Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA9992B8B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 14:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF0884C;
	Mon,  7 Oct 2024 14:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF0884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728303687;
	bh=/GmggK7t18GXzw5zOZycQRz+IDt5txZjeSYlbdPeeY4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tVUI+ioWJf7XIYbguB92CcapNf4Z/xEUxjGWhAUVQZTGzpFdU2JOc1gYCuHNBeJiw
	 T+h/MaHBF1Z1zfjRX/qCZH4YPttPw3sYSmxCihslg9RvOqo+e1+zGrdPmMRe2xfW+w
	 vsw//6hLoum6Cyls/jghBKadeBgCjm5n5hj8o9D0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D822F805AB; Mon,  7 Oct 2024 14:20:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18969F80527;
	Mon,  7 Oct 2024 14:20:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2925F80528; Mon,  7 Oct 2024 14:20:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90B88F8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 14:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B88F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=bHLM+SVZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728303634; x=1728908434; i=markus.elfring@web.de;
	bh=/GmggK7t18GXzw5zOZycQRz+IDt5txZjeSYlbdPeeY4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bHLM+SVZWlGSCFlphG9GUsIP7D8znN7Rdsr4oAww3t1c/KttrgRLnXh4cN4WJt4u
	 mEz1P95u8o5h50Ut7gRb59Es1KeIbA8w9PRWd91yiXXepiGYhHTgdXl9IG9d9YJtx
	 GpL3c418aEO7XEVXYl8uL7g7cmL0tw49AyJ/hGQo87q0sceUY6lJcbd34d0u9FuE1
	 YzzcB2t3R3hWK7zFnYdz7S3wNDOzl+i2MYQRQLJf63bca01kDZTC+I2lBRMT/qstw
	 AdX8sQwBdKy+ob+YXbU1SYkfVE+F9hGnipVi+2B38F9l2anx+jsVwFfBn8/s15aIY
	 ziZe2Qy33Djq5Oa8Yw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuF8x-1trPmp0v7t-00se2x; Mon, 07
 Oct 2024 14:20:34 +0200
Message-ID: <78ce32f1-0037-4caf-98fd-1e73216e3778@web.de>
Date: Mon, 7 Oct 2024 14:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
From: Markus Elfring <Markus.Elfring@web.de>
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
 <8e4fe108-cfde-40c0-83f5-c1ce60b0940f@web.de>
Content-Language: en-GB
In-Reply-To: <8e4fe108-cfde-40c0-83f5-c1ce60b0940f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0/I9nLZtNHJn+8QIWefoO9WcBYmjaQQoCt5aoy4FevRamxm7P0Q
 Q9foGI8xfnQEOl8gd8qHaI4rbnwqgXDrPSvIVNBZxHpmO2S/51vo9R1PidVJ9ShIAjYGEe/
 I3y1XsZLH0yNLQpanCWT2Px+hVrkD9sQQa85Gk+gFp9Xmhsmm1G1GTBdw3jPWVwkIsmkPLo
 O6RGxdOCvKk9XmGiTLNXQ==
UI-OutboundReport: notjunk:1;M01:P0:9C7O/4L1sAY=;q/IaW97ObEBUXcpA1ESM21aujM2
 aPpH6dgfr8LrKuNnoKkSuHYPMaIKQkVpFDQ/j87UpMeh1FNFOXCeR9RBnKPRPs4NZ/Fip6EXj
 79Gks+a3lZFWS60vXOEO1ZOwugvU/Or1rbLX7A8O7lIIyJfDjfwpUHGFXNv374M8WgyaaGR6J
 0nAyGEpiVwAJWPlc2Q36PaJB4OLFwwCt+Q6Ez9Q2Fm5ssFW7Rk70VoSIfEj77+kKacfBDO33B
 BZyi97p/a4Frs9xo4J9kupmxpbmP7ci9/pGwowMd8BbMWQ4W0vv3Qwrt6oYNqt82lhE3SVsn6
 H6eRC4hZAeCbEsSaSvylUUzcop9RWafF3C+4tiNa5Mih/TVQ82JZypApr3sNbSWuAJQcbr2p9
 rofnZQIwjUu+ET5YuGdqmM9fbf2DXfeyIOFxkL0/sDz0rRxbi/kVwPDeSbR+K2gUXFvg9eJob
 7lj4PHRb/6Biok0jzutVZI/mGQMi9d8d8JmIrljoRB9Q+6sWde7ah8Ci9fdZCKtmQd7t1Gcvf
 Y1TCwznjPMXgev6J7br+fN48lmXMctT7OJ63GL/jxMbC9aqvJoALKxSsZk7IE28ID7mLJoWzp
 sYMfNYkiBGRMrCsk1cbPSCXs9pJHGhQCkeA2tVyVX0V/nRshIG260EjfJbNdaPcnaY1fdpcB4
 ZGgc4mPVr9j5RGetnKskUyA9ps0yaVu91Dx8g3ltsu+3FXNwc0RivmhzO5H7En1psa6Rl/FBJ
 JdePx+nHyophij3lhiA77rqHfVSb1ORcHa8172Il21JH64Tu+2KhgbOuaOBV9+LmHDJPDVFXs
 TJ0FwmNsv0RKyJly8dQz1Wbw==
Message-ID-Hash: SVGEZ35QV72DNMOBZHNWUIRXSWVVFY22
X-Message-ID-Hash: SVGEZ35QV72DNMOBZHNWUIRXSWVVFY22
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVGEZ35QV72DNMOBZHNWUIRXSWVVFY22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>> * Do you find any related advice (from other automated responses) help=
ful?
>>
>> No.
>
> I wonder how this answer fits to reminders for the Linux patch review pr=
ocess
> (which were also automatically sent) according to your inbox filter rule=
s.

See also:
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22

Regards,
Markus
