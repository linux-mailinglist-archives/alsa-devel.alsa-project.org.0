Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918B992D92
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 15:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8DC851;
	Mon,  7 Oct 2024 15:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8DC851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728308471;
	bh=jLz84yx57rMUyMrYweXyVDvuBOPGOAyZYEzz4GQzM78=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ut1yr/qMPrS+R8t6cNyBmrlmpNKyWldtP2pLZHqa1u1xxLYWoRyzST7ysrlDLPCz+
	 goCad/+6ZDjZIxhUipg0gkCFHNf6UZu3hUmZryngXg7NQwoLvGfaqW1NHzwEmpsL/T
	 8S9GNKGNol9ZQxTACpvw6dEg1N/UaFATew1CgKBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4A60F805B2; Mon,  7 Oct 2024 15:40:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B975DF80536;
	Mon,  7 Oct 2024 15:40:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C8D9F80528; Mon,  7 Oct 2024 15:40:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 15131F80496
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 15:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15131F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=NlJ4r+5T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728308423; x=1728913223; i=markus.elfring@web.de;
	bh=uNDbyTC+VvTw4II8s+8j3WlwWTsyRMvrYvyOAIO6/gw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NlJ4r+5TwqjWaDr3b8lv54NXLE12M75yY1PuGqve8EHk6iukf3rAo7Xo8mBLERo0
	 ex02+qHeivWGi+xVsQULamO2TxMekqdJsQJL7W18qZEplbJL3j7iXn6rFMvIH+l03
	 2MqWR1Df4vZh2yCOz2SNzE/J3eW+7JRIOBq0UfjJGxkdMJBoAyb2KUetJLkMVNrMb
	 jgDfCZKtpPoe5x7nXaQhF8/LfVb25V4v+j8GuLDOSlaVnFCo5I40MC/AGFVJjuejC
	 TO2ug7+xr+bBIT8+HrHxFds9TKhTASA03iszzEBaEMeJZ/D2ApFX7lseUC/FXN9S9
	 5rcZ36Qzy/C6qOW7VQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsJSy-1tq3UC3Rta-00rGtP; Mon, 07
 Oct 2024 15:40:22 +0200
Message-ID: <bc2f9291-c91d-4e46-bfa9-573eea6a67c2@web.de>
Date: Mon, 7 Oct 2024 15:40:21 +0200
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
Subject: Re: [v3?] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241006205737.8829-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:riV0L5mlmEIR4dXPGagU2I773oUqWQtoY5KYJxgB1uVUBjxO5Om
 zNswnhL7l5jeECauaAHGaRj1UYfNM1QSxOxpcZVrl1iz+JOtnI1L2vA/K7P9hjZSUAlztn6
 TOAfvKXIOIr1sy8jMQeOKp1MjBJWh9umA4anhUJJXMqRebm6rMIatMkIheT8/WP0UNw1c0B
 azqb0PrQC1FSw4sOmBamA==
UI-OutboundReport: notjunk:1;M01:P0:Fn7znV4Vg3o=;us8pt03XPhEI8ToSvd3lelJu9IA
 1QhsJ66wVxBBvXjxnYLIANg3kXp25Y2n9wRMf9QcTDe3Hbf9xrC9WLvHlnV1GpvADdLlINUIw
 X96hgxF+6+RztwsX5+OfAEXfQ1+PBA4+vmMJ5xOG53pke6meywwyxRYGhsEwalrKpD0C7041T
 J/G7t0hy3r+1hZe9wgD270F/qXfGOrGtk6OhJ3V2jhKzL+TIzeN5neff17HFZqxBKe6LVVAyZ
 SDUqxwJX6yTf5LCJyT8C6Znx7N5dHYp7mBWO9pr/PvCNuwQMhgZHSbut4IXEigmgGprF7D1lA
 D/kjjelWVblWcmVd/wiggfIQtVhLZNtcSWzfXAftX1UkcX7j+EyDaqnc6PP14Yl49EIXMunns
 0JYHUoLBF/2F9lq2BTTbWAb9UhC2RztLr2rcffe+3XY/EwNeHpvZyUH8KD6QkFxMsO6uerA0t
 VEfycSmES0Oz7ZBI6r0kVTqFz8qQleqVJKzj3DnQi3Ao4+TifpQGXNssa7MN7LeUvBJSIB8cg
 y8+2mdBxOWkGWo2TRJruEDQ0iPtVzl7LAZT4se1it7a9KiN4iWOZ6RSfuCmsrheGRTfWOgDle
 u0Mo3fNtEe3um2qdon8JTuyruancO66xZdMuNX7d660PeVExQlJxRKVDcLaFb5sWHRuryzPok
 v3rVK6qf26O5Dw7noQQfbwQ/JYSb/WjxgH8RhTmBoA2I6zJuQPm2AAZ9lrPDYGW5Q23gmEyjf
 CEjZ0djXbtPMgiNDH3BXxFztmmSsy1bfX1GIRjFXv2Jtca2y/LVpr1hcTKufslr6rELfEspwR
 ozDEeofaUVNr7am4mget4yvw==
Message-ID-Hash: AUB4G2IUMJXE3D7WHUVZ7DLFROQLSKMO
X-Message-ID-Hash: AUB4G2IUMJXE3D7WHUVZ7DLFROQLSKMO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUB4G2IUMJXE3D7WHUVZ7DLFROQLSKMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> ---
> v2: Fix "From" tag.
> v3: Format tags to Fixes/Cc/Signed-off-by.
> ---
=E2=80=A6

* How do you think about to reconsider the version numbers
  a bit more?

* Would you like to mention the repeated adjustment of
  the patch subject?

* Can a duplicate marker line be replaced by a blank line?


See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n231

Is the email address =E2=80=9Clinux-kernel@vger.kernel.org=E2=80=9D still =
relevant here?

Regards,
Markus
