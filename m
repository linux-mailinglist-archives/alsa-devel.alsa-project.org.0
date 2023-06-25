Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A373D21E
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 18:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826B4822;
	Sun, 25 Jun 2023 18:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826B4822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687710409;
	bh=XMGPWGfAXVPp9QDx8/eawGAMr+xXe1slvlcA5R2DO4w=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mMlFJKHIx7tDKb8I0uH7FCaonxImIlubJvdzj1Iuag7ONJtMRibxvXw7sbJQkQBMc
	 Yzgq84iaPLUJdWLH9sGdCKkdbDBPd3CGBYKzkU8NmlEUKUwAaUGljcdkQFyb254UzC
	 dv7+U1tYlvXMWDdIgn9DZg58VrieTRd+DWQFdylU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D8CF80431; Sun, 25 Jun 2023 18:25:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02348F80169;
	Sun, 25 Jun 2023 18:25:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65863F80246; Sun, 25 Jun 2023 18:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11A33F80124
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 18:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A33F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=vPqjBnQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687710348; x=1688315148; i=markus.elfring@web.de;
 bh=XMGPWGfAXVPp9QDx8/eawGAMr+xXe1slvlcA5R2DO4w=;
 h=X-UI-Sender-Class:Date:Subject:To:References:Cc:From:In-Reply-To;
 b=vPqjBnQM+8l5PMlRKi83l94Znpa1gWmsC3bn85BP/PzhXULQb/w6rgjGV9mYVHe8vwub+ka
 Fk5zxauPwYxBBkgaFmgHvim1L/1XeTziHozS1JmCHPOMFh3U5/OtDVzUg11jNX+JWD4HT0oUq
 Q+8xc9IW7JJ136sRS1POR+9af7LsNqoJSjuX0ivz31VKS+aAFdQTAvqpICCFUnQ1fRQEcHKdG
 tkzTwUToyBegQOryxyyTK6Vp1tMk6OmY6eblp8nUdDWNpaIEbHnJWHpz3bAR2MLDoet9sgPG5
 Qk1x4sQHfVXnwTXpk/fObgkmkGvUWf7mgSuZZ3XZgNiRNpHP09Ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79N8-1pzCwJ3Shw-017fop; Sun, 25
 Jun 2023 18:25:47 +0200
Message-ID: <e488321d-8b20-ef15-d15a-0e6d9b21f9b0@web.de>
Date: Sun, 25 Jun 2023 18:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: ALSA: pcm: fix ELD constraints for (E)AC3, DTS(-HD) and MLP
 formats
Content-Language: en-GB
To: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230624165216.5719-1-hias@horus.com>
 <08b8fa18-9520-2959-a6c9-6ea6132d9b46@web.de> <ZJhLdE7oXAvIi1Yi@camel3.lan>
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZJhLdE7oXAvIi1Yi@camel3.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aIBcAyshdyH4jfRNm3tXusgkkR9ERTrrtP+d8x/zrgMd5jE42+I
 rg4hGU0Dlx9SgFyjfjhQcrGjk3F4tF+LtcbFjsCiUPwyZ0stk5V4WTbpalE5uPbw15EeckZ
 h9FN3GeA1Wx/sBAxTeBe/aEXXY4EOosgitc5cM0ylb61TRHNmuPLmVgw5/HHi0bJbF0+cuO
 8hGzl4/VPmszePma2pOqA==
UI-OutboundReport: notjunk:1;M01:P0:npjtNBJPKTU=;LVCl9T7SzXE0Decg12v1/HIhQO/
 AP3Q1WDteJqrcIZPzKGJMgWtoA8uvsJX98BZnNJJaYY31wHVbQPKwl7nzQcJQZ937v/j7E4CP
 7YL5fodqrlcu4z34uut7hnVJvjcMbCT460thc/WyDUQeV5YAZ8yxFoBBbzMdmqSTXOmDcWGVd
 7ftEiH/X3OVKTFE29bHYv92AlAZEAvuzMj0buBRDTTU5nPXxVuLCPY8ICc/7q6Vnubz5tCgK4
 f1yy3iaHnrNpg8Yw9kdqE953O2KELHXCM8jTWQpSlW6x8aLjz7fGdNTMBZ64UwVrDWZJUBDFL
 ZYuR5UTeFZOy/Wgq4rLo4UCHCQMGmyOZKD0EjbHM5OG/gpEaLd0hMWm6bScvioZNyhY4gPTBi
 uOvtRuERPuX33XA37oQF1TacKjWDMEkNris91/HfHbFlRE/VBwEj8HjuaUq0Xmxu34h/b7Q8S
 f6ECT5OpdE83zPx3eKh3JiuMVdtbCgDgjXA0rTbUjlVoqnwGJ9cfXPW1oK4fWFQwwIwUYUOKW
 nKZixfpWZW+JHrvwlZN1BqHoXoAoVSKYlpvtWg45lkwKC+Z0pJGSNFFIAiDuu1ajVam9rgD7J
 6ybWwTVUYlj5R2e3NobZ6ybkXJp5RJi1Nzld1/pq0IwL5JSdBqMw9ie8uTAGw2Z6kV6z7kynD
 4cCW6o5wFfWu7WFkFe38WdpVCMHlWlL3/KQYZiAxPkngwlhavwnMJjYaDnoWpdndJeu8sVWKa
 /W0MBpTcsA0t+UJHACZC9RtXF/qoE4D09nnnJ26ToFlWjns7qU89//bnfEJJZ0hRP6x+judyU
 rO+XSHrO37xY1o9i/OxpZ+lI1AW21Pg7ilyb7BHe3311UpDIaajqh5MB+iobaoDnDAmB8bYcm
 s9DnBQ4JHXAMMOX0MhSIWPau02Q1WC9vTKKenq4oR4D/fFuXxgHUCqLZ3EKn7CIxEVu2DojLV
 LD1wPg==
Message-ID-Hash: CLDI3GQMMVMUDSMF74MNTZZKQSGY76LE
X-Message-ID-Hash: CLDI3GQMMVMUDSMF74MNTZZKQSGY76LE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLDI3GQMMVMUDSMF74MNTZZKQSGY76LE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> Please add an imperative change suggestion.
>
> I assumed the motivation was pretty clear from the paragraph above which=
 you
> snipped off:

How good does this view fit to a desire for another imperative change desc=
ription?

Regards,
Markus
