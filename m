Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2673D0C7
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 14:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D95B822;
	Sun, 25 Jun 2023 14:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D95B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687695095;
	bh=+E/WpeEtiwyMCGbEoIpPk1ipO8KzxtaT2ie0cXC6Aog=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F6lRXHxU0NZ6QrNW9H3sFfDLp1yhwfx5OvnMM1jkxuihPqCH9/jcH4lSkVL29wj9K
	 ppKIimFeQ8NNQDe8KM0k236maptznBEmOPHS8OcWi3d5XplUzKGpxgvoe61zHPz3S7
	 qoSShAPpdnEb8nSm9IFbZfhRmNuwsSFynJx8nxDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D9C0F8053B; Sun, 25 Jun 2023 14:10:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F22F80212;
	Sun, 25 Jun 2023 14:10:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18A08F80246; Sun, 25 Jun 2023 14:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B602F80169
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 14:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B602F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=I32WeJIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687695022; x=1688299822; i=markus.elfring@web.de;
 bh=+E/WpeEtiwyMCGbEoIpPk1ipO8KzxtaT2ie0cXC6Aog=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=I32WeJISVqRzSDD3SGc1UjBv76sxx5GrhA5B87b/v46s/i94GR3pr2lcSsoijDPlkIJxJA7
 t7M4Sa/n0X6ewMVBExO5r+fNhEQMuDaalvw2nUUPj02dOVd8c3WzRjzjt6Aa2UWMAJ81EJlLB
 ZJ5LrRpQ1+tt7wP8tzWWFuBuncuOwvEqrAFTQ+TuKz+kPNepsgB5uQWKT4rHm2hU8GwiomraH
 nnhFw/McrBPH5qjTndNZLRDh8QcD8T0FBY29PiMIL6lqrhglR+rq6AoBZNBCH8eTSLhY6LgCR
 cn8KO0P0ZI9lD6QVNtKWJDZiZUMAdhgoJOCicPlOgX+mvk8XNzWQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFs1z-1qHUMj28sR-00HOXw; Sun, 25
 Jun 2023 14:10:22 +0200
Message-ID: <08b8fa18-9520-2959-a6c9-6ea6132d9b46@web.de>
Date: Sun, 25 Jun 2023 14:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230624165216.5719-1-hias@horus.com>
Subject: Re: [PATCH] ALSA: pcm: fix ELD constraints for (E)AC3, DTS(-HD) and
 MLP formats
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230624165216.5719-1-hias@horus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n13YvkZw4aOBSv0xgKI8GxUEzU+T64zkzP2fZzEbgtADvkBZVB8
 fBtqP133CpnY+qDqIIIaJFZISm1Y2hk0yO1Lseh80XB6Oi5rcoECxCFq9vHfffmBgd73Ks9
 2H0J3zirR3jq7w20/+90evlSzqpPM8IFqI9hrbKEyWkx+9nJoYvrRfwc9+WRb9VD6GyMM4N
 ZvNV4a10iMLWuFFUXiBUA==
UI-OutboundReport: notjunk:1;M01:P0:dtX7aGFcfRY=;Uhd7GAHWhFsxK8dXPmVD6K2krnf
 GoS0VXYQzzqOo5vId7KipWc2SPqZTBkOv/I3np3ZWeQpRxJj8v4ORz6eixi8VQq6MkO0rpY10
 Z5JsnuZ6Kwgn/DML4JiTaWLvawf06OIhA0hYHl+0JB1CT+wKQr9FgYp4kNTEho/GKEr4IIUpC
 tCcoVF0JqaaWJcmpPbCMhjkUOPe2aqNbQVK/iS5EZUA2la4E1tZq1gUAwH/eMu+BB6vSxwMAm
 nOqizzufWj9BN0oF27tikA02EnlosZ0tb9Zt3zp03tr8ilfpJQuuqpUblO5ReOgDcr4gtYegv
 tUtgXODE219AX5H7H4qz35aLw49XKv001CZBSgVGrZeyq6tYwYgF+DhbbDDUSASVo5ICRXF35
 B+Wh5IWTxv30pD6wbONuy98E6fCfTbmzrjnLoF9aWmED8dyNsCzYuvllP2+xADGBukCSneV6n
 IpdzRGbxZ1rUqFNeL8KqyG6oFr31iXqhENoMIm2vp1fSzu0a0PUQN+Poz+Q9tpeiE14/1B9dQ
 x027nL+lvevjVq0gYWwZ2ktmTb96euZ4t8pGM0E/LtUgkp6Ma7CxteBtTDp0FbkeUD0NakZRZ
 DKV4UVAE5JSxj5Rl3R+HsJMOasFBRXnROZdiucr7MF4j4fqUk4k+xw5RKMmquOZFOJEGwkz5E
 evjBjYrUqLS/M5RikK8nUwOq66ob3LQ9dgyqwZGdsfrAtVoASEIP8qY8dJB8hq5S/9OWXY+x6
 ZptSyeuQicHySWav1wRv7bqCdNUx/Cv+voyPgb4rc8pFqIIFYwmlL1VxQopASCEgjyqo/6Tmz
 3+gsTKtQ8Tgi8Gqh4DaaPubKS8LmsQfb0Zy/Cw1WZFpb54wI8fp7tvJN3/3/brQ1tW0PXum1e
 3lsCqjNlkSdHxCVyUApuypcldXAsZ2p+QTdzz/yJ2AfRRww87Ybu3h3GOw+mvH4b2DUoi2skV
 dtdyKQ==
Message-ID-Hash: O3HXOWFCKDZKJKYYI3GSXZJBXPCO63ZJ
X-Message-ID-Hash: O3HXOWFCKDZKJKYYI3GSXZJBXPCO63ZJ
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3HXOWFCKDZKJKYYI3GSXZJBXPCO63ZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> This patch fixes the constraints for the common AC3 and DTS formats,
=E2=80=A6

Please add an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4-rc7#n94


How do you think about to add the tag =E2=80=9CFixes=E2=80=9D?

Regards,
Markus
